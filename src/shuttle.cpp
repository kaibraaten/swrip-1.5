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

#include <cstdio>
#include <cctype>
#include <cassert>
#include "mud.hpp"
#include "shuttle.hpp"
#include "ship.hpp"
#include "log.hpp"
#include "character.hpp"
#include "room.hpp"
#include "repos/shuttlerepository.hpp"

///////////////////////////////////////////////////////////
struct Shuttle::Impl
{
  std::vector<ShuttleStop*> Stops;
};

///////////////////////////////////////////////////////////
Shuttle::Shuttle()
  : pImpl(new Impl())
{

}

Shuttle::~Shuttle()
{
  for(ShuttleStop *stop : Stops())
    {
      delete stop;
    }
  
  delete pImpl;
}

void Shuttle::Add(ShuttleStop *stop)
{
  pImpl->Stops.push_back(stop);
}

void Shuttle::Remove(ShuttleStop *stop)
{
  auto pos = find(std::begin(pImpl->Stops), std::end(pImpl->Stops), stop);

  if(pos != std::end(pImpl->Stops))
    {
      pImpl->Stops.erase(pos);
    }
}

const std::vector<ShuttleStop*> &Shuttle::Stops() const
{
  return pImpl->Stops;
}

ShuttleStop *Shuttle::CurrentStop() const
{
  ShuttleStop *stop = nullptr;
  
  if(CurrentNumber >= 0)
    {
      assert(!pImpl->Stops.empty());
      assert(CurrentNumber < static_cast<int>(pImpl->Stops.size()));
      stop = pImpl->Stops[CurrentNumber];
    }

  return stop;
}

///////////////////////////////////////////////////////////

ShuttleStop *AllocateShuttleStop( void )
{
  ShuttleStop *stop = new ShuttleStop();
  return stop;
}

static Shuttle *AllocateShuttle( void )
{
  Shuttle *shuttle = new Shuttle();
  return shuttle;
}

Shuttle *NewShuttle(const std::string &name)
{
  Shuttle *shuttle   = AllocateShuttle();
  shuttle->Name      = name;

  Shuttles->Add(shuttle);
  Shuttles->Save(shuttle);

  return shuttle;
}

void ShuttleUpdate( void )
{
  char buf[MSL];

  for(Shuttle *shuttle : Shuttles->Entities())
    {
      /* No Stops? Make sure we ignore */
      if (shuttle->Stops().empty())
	{
	  continue;
	}

      if (shuttle->CurrentStop() == nullptr)
	{
	  shuttle->CurrentNumber = 0;
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
              //if (shuttle->CurrentNumber == static_cast<int>(shuttle->Stops().size()) - 1)
              if(shuttle->CurrentStop() == shuttle->Stops().back())
                {
                  shuttle->CurrentNumber = 0;
                }
              else
                {
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
                           shuttle->CurrentStop()->Name.c_str());
		}
              else
		{
		  sprintf( buf,
                           "An electronic voice says, 'Preparing for launch.'\r\n"
                           "It continues, 'Next stop, %s'",
                           shuttle->CurrentStop()->Name.c_str());
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
		  sprintf(buf, "The hatch on %s closes and it begins to launch.",
                          shuttle->Name.c_str() );
		}
              else
		{
		  sprintf(buf, "%s speeds out of the station.",
                          shuttle->Name.c_str() );
		}

              if(shuttle->InRoom != nullptr)
                {
                  EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );
                }
              else
                {
                  Log->Bug("%s, %s, %d: '%s' shuttle->InRoom == nullptr, shuttle->CurrentStop == vnum %ld",
                           __FILE__, __FUNCTION__, __LINE__, shuttle->Name.c_str(), shuttle->CurrentStop()->RoomVnum);
                }
              
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
		  Log->Bug("Shuttle '%s' is an unknown type", shuttle->Name.c_str());
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
                       shuttle->CurrentStop()->Name.c_str(),
                       shuttle->Type == SHUTTLE_TURBOCAR ? "doors" : "main ramp" );

              InsertShuttle(shuttle, GetRoom(shuttle->CurrentStop()->RoomVnum));

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
		  sprintf(buf, "%s lands on the platform.", shuttle->Name.c_str() );
		}
              else
		{
		  sprintf(buf, "%s arrives at the station.", shuttle->Name.c_str() );
		}

              EchoToRoom( AT_YELLOW , shuttle->InRoom , buf );

              if (shuttle->Type != SHUTTLE_TURBOCAR)
                {
                  sprintf(buf, "The hatch on %s opens.", shuttle->Name.c_str() );
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
                       shuttle->Name.c_str(), shuttle->State);
              continue;
            }
        }
    }
}

void ShowShuttlesToCharacter( const std::list<Shuttle*> &shuttles, Character *ch )
{
  const int NUMBER_OF_COLUMNS = 2;
  int column = 0;
  
  for(const Shuttle *shuttle : shuttles)
    {
      SetCharacterColor( AT_SHIP, ch );
      ch->Echo( "%-35s", shuttle->Name.c_str() );

      if(++column % NUMBER_OF_COLUMNS == 0)
        {
          ch->Echo("\r\n&w");
        }
      else
        {
          ch ->Echo("     ");
        }
    }

  if(++column % NUMBER_OF_COLUMNS == 0)
    {
      ch->Echo("\r\n&w");
    }
}

bool ExtractShuttle( Shuttle * shuttle )
{
  Room *room = NULL;

  if ( ( room = shuttle->InRoom ) != NULL )
    {
      room->Remove(shuttle);
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

  room->Add(shuttle);
  return true;
}

Shuttle *GetShuttleInRoom( const Room *room, const std::string &name )
{
  if (room == nullptr)
    {
      return NULL;
    }

  for(Shuttle *shuttle : room->Shuttles())
    {
      if ( !StrCmp( name, shuttle->Name ) )
	{
	  return shuttle;
	}
    }

  for(Shuttle *shuttle : room->Shuttles())
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
