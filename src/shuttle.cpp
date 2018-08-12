/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <unistd.h>
#include <cstdio>
#include <cctype>
#include <cassert>
#include "mud.hpp"
#include "shuttle.hpp"
#include "ship.hpp"
#include "script.hpp"
#include "log.hpp"
#include "character.hpp"
#include "room.hpp"

ShuttleRepository *Shuttles = nullptr;

ShuttleStop *AllocateShuttleStop( void )
{
  ShuttleStop *stop = nullptr;

  AllocateMemory( stop, ShuttleStop, 1);
  stop->RoomVnum = INVALID_VNUM;

  return stop;
}

static Shuttle *AllocateShuttle( void )
{
  Shuttle *shuttle = NULL;

  AllocateMemory(shuttle, Shuttle, 1);
  shuttle->CurrentNumber = -1;
  shuttle->State          = SHUTTLE_STATE_LANDED;
  shuttle->FirstStop     = shuttle->LastStop = NULL;
  shuttle->Type           = SHUTTLE_TURBOCAR;
  shuttle->Delay          = shuttle->CurrentDelay = 2;
  shuttle->Rooms.First     = shuttle->Rooms.Last = shuttle->Rooms.Entrance = ROOM_VNUM_LIMBO;

  return shuttle;
}

Shuttle *NewShuttle(const std::string &name)
{
  Shuttle *shuttle   = AllocateShuttle();
  shuttle->Name      = CopyString( name );

  Shuttles->Add(shuttle);
  Shuttles->Save(shuttle);

  return shuttle;
}

static void PushStop( lua_State *L, const ShuttleStop *stop, const int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", stop->Name );
  LuaSetfieldNumber( L, "RoomVnum", stop->RoomVnum );
  
  lua_settable( L, -3 );
}

static void PushStops( lua_State *L, const Shuttle *shuttle )
{
  const ShuttleStop *stop = NULL;
  int idx = 0;
  lua_pushstring( L, "Stops" );
  lua_newtable( L );

  for( stop = shuttle->FirstStop; stop; stop = stop->Next )
    {
      PushStop( L, stop, ++idx );
    }

  lua_settable( L, -3 );
}

static void PushRooms( lua_State *L, const Shuttle *shuttle )
{
  lua_pushstring( L, "Rooms" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "First", shuttle->Rooms.First );
  LuaSetfieldNumber( L, "Last", shuttle->Rooms.Last );
  LuaSetfieldNumber( L, "Entrance", shuttle->Rooms.Entrance );
  
  lua_settable( L, -3 );
}

static void PushShuttle( lua_State *L, const void *userData )
{
  const Shuttle *shuttle = (const Shuttle*) userData;
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", shuttle->Name );
  LuaSetfieldNumber( L, "Delay", shuttle->Delay );
  LuaSetfieldNumber( L, "CurrentDelay", shuttle->CurrentDelay );

  if( shuttle->CurrentStop )
    {
      LuaSetfieldNumber( L, "CurrentStop", shuttle->CurrentNumber );
    }

  LuaSetfieldString( L, "Type",
		     shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar"
		     : shuttle->Type == SHUTTLE_SPACE ? "Space"
		     : shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace"
		     : "Unknown" );

  PushRooms( L, shuttle );
  PushStops( L, shuttle );
  lua_setglobal( L, "shuttle" );
}

const char *GetShuttleFilename( const Shuttle *shuttle )
{
  static char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ) );
  return fullPath;
}

void ShuttleUpdate( void )
{
  char buf[MSL];

  for(Shuttle *shuttle : Shuttles->Entities())
    {
      /* No Stops? Make sure we ignore */
      if (shuttle->FirstStop == NULL)
	{
	  continue;
	}

      if (shuttle->CurrentStop == NULL)
	{
	  shuttle->CurrentStop = shuttle->FirstStop;
	  continue;
	}

      if (--shuttle->CurrentDelay <= 0)
        {
          vnum_t room = INVALID_VNUM;
          shuttle->CurrentDelay = shuttle->Delay;

          /* Probably some intermediate Stages in the middle ? */
          if (shuttle->State == SHUTTLE_STATE_TAKINGOFF)
            {
              /* Move to next spot */
              if (shuttle->CurrentStop->Next == NULL)
                {
                  shuttle->CurrentStop = shuttle->FirstStop;
                  shuttle->CurrentNumber = 1;
                }
              else
                {
                  shuttle->CurrentStop = shuttle->CurrentStop->Next;
                  shuttle->CurrentNumber++;
                }

              /*
               * An electronic voice says, 'Preparing for launch.'
               * It continues, 'Next stop, Gamorr'
               *
               * The hatch slides shut.
               * The ship begins to launch.
               * Fix by Greven: have different message for turbocars, they don't launch
               */
              if ( shuttle->Type == SHUTTLE_TURBOCAR )
		{
		  sprintf( buf,
			    "An electronic voice says, 'Preparing for departure.'\r\n"
			    "It continues, 'Next stop, %s'",
			    shuttle->CurrentStop->Name);
		}
              else
		{
		  sprintf( buf,
			    "An electronic voice says, 'Preparing for launch.'\r\n"
			    "It continues, 'Next stop, %s'",
			    shuttle->CurrentStop->Name);
		}

              for (room = shuttle->Rooms.First; room <= shuttle->Rooms.Last; ++room)
                {
                  Room *iRoom = GetRoom(room);
                  EchoToRoom( AT_CYAN, iRoom , buf );

		  if( room == shuttle->Rooms.Entrance )
		    {
		      EchoToRoom( AT_YELLOW, iRoom, "The hatch slides shut." );
		    }

                  if (shuttle->Type != SHUTTLE_TURBOCAR)
                    {
                      EchoToRoom( AT_YELLOW, iRoom, "The ship begins to launch.");
                    }
                }

              if (shuttle->Type != SHUTTLE_TURBOCAR)
		{
		  sprintf(buf, "The hatch on %s closes and it begins to launch..", shuttle->Name );
		}
              else
		{
		  sprintf(buf, "%s speeds out of the station.", shuttle->Name );
		}

              EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );
              ExtractShuttle( shuttle );

              if (shuttle->Type == SHUTTLE_TURBOCAR || shuttle->Type == SHUTTLE_SPACE)
		{
		  shuttle->State = SHUTTLE_STATE_LANDING;
		}
              else if (shuttle->Type == SHUTTLE_HYPERSPACE)
		{
		  shuttle->State = SHUTTLE_STATE_HYPERSPACE_LAUNCH;
		}
              else
		{
		  Log->Bug("Shuttle '%s' is an unknown type", shuttle->Name);
		}
            }
          else if (shuttle->State == SHUTTLE_STATE_HYPERSPACE_LAUNCH)
            {
              for (room = shuttle->Rooms.First; room <= shuttle->Rooms.Last; ++room)
		{
		  EchoToRoom( AT_YELLOW, GetRoom(room),
				"The ship lurches slightly as it makes the jump to lightspeed.");
		}

              shuttle->State = SHUTTLE_STATE_HYPERSPACE_END;
              shuttle->CurrentDelay *= 2;
            }
          else if (shuttle->State == SHUTTLE_STATE_HYPERSPACE_END)
            {
              for (room = shuttle->Rooms.First; room <= shuttle->Rooms.Last; ++room)
		{
		  EchoToRoom( AT_YELLOW, GetRoom(room),
				"The ship lurches slightly as it comes out of hyperspace.");
		}

              shuttle->State = SHUTTLE_STATE_LANDING;
            }
          else if (shuttle->State == SHUTTLE_STATE_LANDING)
            {
              /* An electronic voice says, 'Welcome to Adari'
               * It continues, 'Please exit through the main ramp. Enjoy your stay.'
               *
               * You feel a slight thud as the ship sets down on the ground.
               * The hatch opens.
               */


              /* action_desc */
              sprintf( buf,
                        "An electronic voice says, 'Welcome to %s'\r\n"
                        "It continues, 'Please exit through the %s. Enjoy your stay.'",
                        shuttle->CurrentStop->Name,
                        shuttle->Type == SHUTTLE_TURBOCAR ? "doors" : "main ramp" );

              InsertShuttle(shuttle, GetRoom(shuttle->CurrentStop->RoomVnum));

              for (room = shuttle->Rooms.First; room <= shuttle->Rooms.Last; ++room)
                {
                  Room * iRoom = GetRoom(room);
                  EchoToRoom( AT_CYAN , iRoom , buf );

                  if (shuttle->Type != SHUTTLE_TURBOCAR)
		    {
		      EchoToRoom( AT_YELLOW , iRoom, "You feel a slight thud as the ship sets down on the ground.");
		    }

		  if( room == shuttle->Rooms.Entrance )
		    {
		      EchoToRoom( AT_YELLOW, iRoom, "The hatch opens." );
		    }
                }

              if (shuttle->Type != SHUTTLE_TURBOCAR)
		{
		  sprintf(buf, "%s lands on the platform.", shuttle->Name );
		}
              else
		{
		  sprintf(buf, "%s arrives at the station.", shuttle->Name );
		}

              EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );

              if (shuttle->Type != SHUTTLE_TURBOCAR)
                {
                  sprintf(buf, "The hatch on %s opens.", shuttle->Name );
                  EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );
                }

              shuttle->State = SHUTTLE_STATE_LANDED;
            }
          else if (shuttle->State == SHUTTLE_STATE_LANDED)
            {
              /* Just for a delay between stops ? */
              shuttle->State = SHUTTLE_STATE_TAKINGOFF;
            }
          else
            {
              Log->Bug("Shuttle '%s' has invalid state of %d",
                       shuttle->Name, shuttle->State);
              continue;
            }
        }
    }
}

void ShowShuttlesToCharacter( const Shuttle *shuttle, Character *ch )
{
  while (shuttle)
    {
      SetCharacterColor( AT_SHIP, ch );
      ch->Echo( "%-35s", shuttle->Name );

      if ( shuttle->NextInRoom )
	{
	  shuttle = shuttle->NextInRoom;
	  ch->Echo( "%-35s", shuttle->Name );
	}

      shuttle = shuttle->NextInRoom;
      ch->Echo("\r\n&w");
    }
}

bool ExtractShuttle( Shuttle * shuttle )
{
  Room *room = NULL;

  if ( ( room = shuttle->InRoom ) != NULL )
    {
      UNLINK( shuttle, room->FirstShuttle, room->LastShuttle, NextInRoom, PreviousInRoom );
      shuttle->InRoom = NULL;
    }

  return true;
}

bool InsertShuttle( Shuttle *shuttle, Room *room )
{
  assert(shuttle != nullptr);
  assert(room != nullptr);

  if (shuttle->InRoom)
    {
      ExtractShuttle(shuttle);
    }

  shuttle->InRoom = room;
  LINK( shuttle, room->FirstShuttle, room->LastShuttle, NextInRoom, PreviousInRoom );
  return true;
}

static void LoadRooms( lua_State *L, Shuttle *shuttle )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "First" );
      lua_getfield( L, sub_idx, "Last" );
      lua_getfield( L, sub_idx, "Entrance" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
	{
	  shuttle->Rooms.First = lua_tointeger( L, sub_idx );
	}

      if( !lua_isnil( L, ++sub_idx ) )
        {
          shuttle->Rooms.Last = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          shuttle->Rooms.Entrance = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadStop( lua_State *L, Shuttle *shuttle )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  ShuttleStop *stop = NULL;

  AllocateMemory( stop, ShuttleStop, 1 );
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "RoomVnum" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      stop->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      stop->RoomVnum = lua_tointeger( L, idx );
    }

  lua_pop( L, elementsToPop );
  LINK( stop, shuttle->FirstStop, shuttle->LastStop, Next, Previous );
}

static void LoadStops( lua_State *L, Shuttle *shuttle )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Stops" );

  if( !lua_isnil(L, ++idx))
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
          LoadStop( L, shuttle );
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

static int L_ShuttleEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  Shuttle *shuttle = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  AllocateMemory( shuttle, Shuttle, 1 );
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "Delay" );
  lua_getfield( L, idx, "CurrentDelay" );
  lua_getfield( L, idx, "CurrentStop" );
  lua_getfield( L, idx, "Type" );
  
  elementsToPop = lua_gettop( L ) - topAtStart;
  
  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->Name = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->Delay = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->CurrentDelay = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      shuttle->CurrentNumber = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *shuttleTypeName = lua_tostring( L, idx );
      int shuttleType = SHUTTLE_HYPERSPACE;
      
      if( !StrCmp( shuttleTypeName, "Turbocar" ) )
	{
	  shuttleType = SHUTTLE_TURBOCAR;
	}
      else if( !StrCmp( shuttleTypeName, "Space" ) )
	{
	  shuttleType = SHUTTLE_SPACE;
	}
      else if( !StrCmp( shuttleTypeName, "Hyperspace" ) )
	{
	  shuttleType = SHUTTLE_HYPERSPACE;
	}

      shuttle->Type = shuttleType;
    }
  
  lua_pop( L, elementsToPop );
  LoadRooms( L, shuttle );
  LoadStops( L, shuttle );

  Shuttles->Add(shuttle);

  if (shuttle->Rooms.Entrance == INVALID_VNUM)
    {
      shuttle->Rooms.Entrance = shuttle->Rooms.First;
    }
  
  if (shuttle->CurrentNumber != -1)
    {
      int count = 0;
      ShuttleStop * stop = NULL;

      for (stop = shuttle->FirstStop; stop; stop = stop->Next)
	{
	  count++;
	  
	  if (count == shuttle->CurrentNumber)
	    {
	      shuttle->CurrentStop = stop;
	    }
	}
    }
  else
    {
      shuttle->CurrentNumber = 0;
      shuttle->CurrentStop = shuttle->FirstStop;
    }

  if (shuttle->CurrentStop)
    {
      InsertShuttle(shuttle, GetRoom(shuttle->CurrentStop->RoomVnum));
    }

  return 0;
}

static void ExecuteShuttleFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ShuttleEntry, "ShuttleEntry" );
}

static void FreeShuttle( Shuttle *shuttle )
{
  ShuttleStop *stop = NULL;
  ShuttleStop *stop_next = NULL;

  for ( stop =  shuttle->FirstStop; stop ; stop = stop_next)
    {
      stop_next = stop->Next;

      if (stop->Name)
        {
          FreeMemory(stop->Name);
        }

      FreeMemory(stop);
    }

  if (shuttle->Name)
    {
      FreeMemory(shuttle->Name);
    }

  FreeMemory(shuttle);
}

void PermanentlyDestroyShuttle(Shuttle *shuttle)
{
  char buf[MAX_STRING_LENGTH];
  Shuttles->Remove(shuttle);
  sprintf(buf, "%s/%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ) );
  unlink(buf);
  FreeShuttle( shuttle );
}

Shuttle *GetShuttleInRoom( const Room *room, const std::string &name )
{
  Shuttle *shuttle = nullptr;

  if (room == nullptr)
    {
      return NULL;
    }

  for ( shuttle = room->FirstShuttle ; shuttle ; shuttle = shuttle->NextInRoom )
    {
      if ( !StrCmp( name, shuttle->Name ) )
	{
	  return shuttle;
	}
    }

  for ( shuttle = room->FirstShuttle ; shuttle ; shuttle = shuttle->NextInRoom )
    {
      if ( NiftyIsNamePrefix( name, shuttle->Name ) )
	{
	  return shuttle;
	}
    }

  return nullptr;
}

Shuttle *GetShuttleFromEntrance( vnum_t vnum )
{
  return Shuttles->Find([vnum](const auto &s)
                        {
                          return s->Rooms.Entrance == vnum;
                        });
}

////////////////////////////////////////////////////////////
class LuaShuttleRepository : public ShuttleRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Shuttle *shuttle) const override;
  Shuttle *FindByName(const std::string &name) const override;
};

Shuttle *LuaShuttleRepository::FindByName(const std::string &name) const
{
  Shuttle *shuttle = Find([name](const auto &s)
                          {
                            return StrCmp(name, s->Name) == 0;
                          });

  if(shuttle == nullptr)
    {
      shuttle = Find([name](const auto &s)
                     {
                       return NiftyIsNamePrefix(name, s->Name);
                     });
    }

  return shuttle;
}

void LuaShuttleRepository::Save(const Shuttle *shuttle) const
{
  LuaSaveDataFile( GetShuttleFilename( shuttle ), PushShuttle, "shuttle", shuttle );
}

void LuaShuttleRepository::Save() const
{
  for(const Shuttle *shuttle : Shuttles->Entities())
    {
      Save(shuttle);
    }
}

void LuaShuttleRepository::Load()
{
  ForEachLuaFileInDir( SHUTTLE_DIR, ExecuteShuttleFile, NULL );
}

ShuttleRepository *NewShuttleRepository()
{
  return new LuaShuttleRepository();
}

