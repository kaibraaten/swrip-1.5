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

#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#endif

#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include "mud.h"
#include "shuttle.h"
#include "ship.h"
#include "script.h"

Shuttle *FirstShuttle = NULL;
Shuttle *LastShuttle = NULL;

ShuttleStop *AllocateShuttleStop( void )
{
  ShuttleStop *stop = NULL;

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

Shuttle *MakeShuttle( const char *name )
{
  Shuttle *shuttle   = AllocateShuttle();
  shuttle->Name      = CopyString( name );

  if (SaveShuttle( shuttle, 0 ))
    {
      LINK( shuttle, FirstShuttle, LastShuttle, Next, Previous );
    }
  else
    {
      FreeMemory(shuttle->Name);
      FreeMemory(shuttle);
      shuttle = NULL;
    }

  return shuttle;
}

Shuttle *GetShuttle(const char *name)
{
  Shuttle *shuttle = NULL;

  for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
    {
      if ( !StrCmp( name, shuttle->Name ) )
	{
	  return shuttle;
	}
    }

  for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
    {
      if ( NiftyIsNamePrefix( name, shuttle->Name ) )
	{
	  return shuttle;
	}
    }

  return NULL;
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

bool SaveShuttle( const Shuttle * shuttle, char dummy )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ) );
  LuaSaveDataFile( fullPath, PushShuttle, "shuttle", shuttle );
  return true;
#if 0
  FILE *fp = NULL;
  char filename[256];
  const ShuttleStop *stop = NULL;

  if ( !shuttle )
    {
      Bug( "SaveShuttle: null shuttle pointer!" );
      return false;
    }

  if ( IsNullOrEmpty( shuttle->Filename ) )
    {
      Bug( "SaveShuttle: %s has no filename", shuttle->Name );
      return false;
    }

  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttle->Filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "SaveShuttle: fopen" );
      perror( "SaveShuttle: fopen" );
      return false;
    }

  fprintf( fp, "#SHUTTLE\n" );
  fprintf( fp, "Name         %s~\n",    shuttle->Name);
  fprintf( fp, "Filename     %s~\n",    shuttle->Filename);
  fprintf( fp, "Delay        %d\n",     shuttle->Delay);
  fprintf( fp, "CurrentDelay %d\n",     shuttle->CurrentDelay);

  if (shuttle->CurrentStop)
    {
      fprintf(fp, "Current      %d\n", shuttle->CurrentNumber);
    }

  fprintf( fp, "Type         %d\n",     shuttle->Type);
  fprintf( fp, "State        %d\n",     shuttle->State);
  fprintf( fp, "StartRoom    %ld\n",     shuttle->Rooms.First);
  fprintf( fp, "EndRoom      %ld\n",     shuttle->Rooms.Last);
  fprintf( fp, "Entrance     %ld\n",    shuttle->Rooms.Entrance);

  fprintf( fp, "End\n\n");

  for (stop = shuttle->FirstStop; stop; stop = stop->Next)
    {
      fprintf( fp, "#STOP\n");
      fprintf( fp, "StopName       %s~\n", stop->Name);
      fprintf( fp, "Room           %ld\n",  stop->RoomVnum);
      fprintf( fp, "End\n\n");
    }

  fprintf( fp, "#END\n");
  fclose( fp );
  return true;
#endif
}

void ShuttleUpdate( void )
{
  char buf[MSL];
  Shuttle *shuttle = NULL;

  for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
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
		  snprintf( buf, MSL,
			    "An electronic voice says, 'Preparing for departure.'\r\n"
			    "It continues, 'Next stop, %s'",
			    shuttle->CurrentStop->Name);
		}
              else
		{
		  snprintf( buf, MSL,
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
		  snprintf(buf, MSL, "The hatch on %s closes and it begins to launch..", shuttle->Name );
		}
              else
		{
		  snprintf(buf, MSL, "%s speeds out of the station.", shuttle->Name );
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
		  Bug("Shuttle '%s' is an unknown type", shuttle->Name);
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
              snprintf( buf, MSL,
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
		  snprintf(buf, MSL, "%s lands on the platform.", shuttle->Name );
		}
              else
		{
		  snprintf(buf, MSL, "%s arrives at the station.", shuttle->Name );
		}

              EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );

              if (shuttle->Type != SHUTTLE_TURBOCAR)
                {
                  snprintf(buf, MSL, "The hatch on %s opens.", shuttle->Name );
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
              Bug("Shuttle '%s' has invalid state of %d",
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
      Echo( ch , "%-35s", shuttle->Name );

      if ( shuttle->NextInRoom )
	{
	  shuttle = shuttle->NextInRoom;
	  Echo( ch , "%-35s", shuttle->Name );
	}

      shuttle = shuttle->NextInRoom;
      SendToCharacter("\r\n&w", ch);
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
  if (room == NULL)
    {
      Bug("Insert_shuttle: %s Room: %ld", shuttle->Name, room->Vnum);
      return false;
    }

  if (shuttle->InRoom)
    {
      ExtractShuttle(shuttle);
    }

  shuttle->InRoom = room;
  LINK( shuttle, room->FirstShuttle, room->LastShuttle, NextInRoom, PreviousInRoom );
  return true;
}

/*
 * Load in all the ship files.
 */
void LoadShuttles( void )
{
  FILE *fpList = NULL;
  char shuttlelist[256];

  snprintf( shuttlelist, 256, "%s%s", SHUTTLE_DIR, SHUTTLE_LIST );

  if ( ( fpList = fopen( shuttlelist, "r" ) ) == NULL )
    {
      perror( shuttlelist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !LoadShuttleFile( (char*)filename ) )
	{
	  Bug( "Cannot load shuttle file: %s", filename );
	}
    }

  fclose( fpList );
  LogPrintf("Done shuttles" );
}

/*
 * Load a ship file
 */

bool LoadShuttleFile( const char * shuttlefile )
{
  char filename[256];
  Shuttle *shuttle = AllocateShuttle();
  FILE *fp = NULL;
  bool found = false;

  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttlefile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;

      for ( ; ; )
        {
	  const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_shuttle_file: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SHUTTLE") )
            {
              ReadShuttle( shuttle, fp );

              if (shuttle->Rooms.Entrance == INVALID_VNUM)
		{
		  shuttle->Rooms.Entrance = shuttle->Rooms.First;
		}

              shuttle->InRoom = NULL;
              continue;
            }
          else if ( !StrCmp( word, "STOP") )
            {
              ShuttleStop * stop = AllocateShuttleStop();
              ReadShuttleStop( stop, fp );
              LINK( stop, shuttle->FirstStop, shuttle->LastStop, Next, Previous );
              continue;
            }
          else if ( !StrCmp( word, "END" ) )
            {
              break;
            }
          else
            {
              Bug(  "Load_shuttle_file: bad section: %s.", word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !(found) )
    {
      FreeMemory( shuttle );
    }
  else
    {
      LINK( shuttle, FirstShuttle, LastShuttle, Next, Previous );

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
    }

  return found;
}

void ReadShuttle( Shuttle *shuttle, FILE *fp )
{
  shuttle->Delay = 2;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'C':
          KEY( "Current", shuttle->CurrentNumber, ReadInt(fp));
          KEY( "CurrentDelay", shuttle->CurrentDelay, ReadInt(fp));
          break;

        case 'D':
          KEY( "Delay", shuttle->Delay, ReadInt(fp));
          break;

        case 'E':
          KEY( "EndRoom", shuttle->Rooms.Last, ReadInt(fp));
          KEY( "Entrance", shuttle->Rooms.Entrance, ReadInt(fp));

          if ( !StrCmp( word, "End" ) )
            {
              shuttle->CurrentDelay = shuttle->Delay;
              return;
            }
          break;

        case 'F':
          KEY( "Filename", shuttle->Filename, ReadStringToTilde(fp));
          break;

        case 'N':
          KEY( "Name",  shuttle->Name, ReadStringToTilde(fp));
          break;

        case 'S':
          KEY( "StartRoom", shuttle->Rooms.First, ReadInt(fp));
          KEY( "State", shuttle->State, ReadInt(fp));
          break;

        case 'T':
          KEY( "Type", shuttle->Type, (SHUTTLE_CLASS) ReadInt(fp));
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_shuttle: no match: %s", word );
        }
    }
}

void ReadShuttleStop( ShuttleStop * stop, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              return;
            }
          break;

        case 'R':
          KEY( "Room",  stop->RoomVnum, ReadInt(fp));
          break;

        case 'S':
          KEY( "StopName", stop->Name, ReadStringToTilde(fp));
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_shuttle: no match: %s", word );
        }
    }
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

void DestroyShuttle(Shuttle *shuttle)
{
  char buf[MAX_STRING_LENGTH];
  UNLINK( shuttle, FirstShuttle, LastShuttle, Next, Previous );
  snprintf(buf, MSL, "%s/%s", SHUTTLE_DIR, ConvertToLuaFilename( shuttle->Name ) );
  unlink(buf);
  FreeShuttle( shuttle );
}

Shuttle *GetShuttleInRoom( const Room *room, const char *name )
{
  Shuttle *shuttle = NULL;

  if ( !room )
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

  return NULL;
}

Shuttle *GetShuttleFromEntrance( vnum_t vnum )
{
  Shuttle *shuttle = NULL;

  for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
    {
      if ( vnum == shuttle->Rooms.Entrance )
	{
	  return shuttle;
	}
    }

  return NULL;
}
