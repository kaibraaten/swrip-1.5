#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/shiprepository.hpp"

void do_addpilot(Character *ch, std::string argument )
{
  int the_chance = 0;
  Ship *ship = GetShipFromCockpit(ch->InRoom->Vnum);
  
  if ( ship == nullptr )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  the_chance = GetRandomPercent();

  if ( IsNpc(ch) || the_chance >= ch->PCData->Learned[gsn_slicing] )
    {
      if ( !CheckPilot( ch , ship ) )
        {
          ch->Echo( "&RThis isn't your ship!" );
          return;
        }
    }

  if ( argument.empty() )
    {
      ch->Echo( "&RAdd which pilot?\r\n" );
      return;
    }

  if ( the_chance < ch->PCData->Learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( ship->Pilot.empty() )
    {
      ship->Pilot = argument;
      ch->Echo( "Pilot Added.\r\n" );
    }
  else
    {
      if ( !ship->CoPilot.empty() )
        {
          ch->Echo( "&RYou already have a pilot and copilot.\r\n" );
          ch->Echo( "&RTry rempilot first.\r\n" );
          return;
        }

      ship->CoPilot = argument;
      ch->Echo( "Copilot Added.\r\n" );
    }

  Ships->Save(ship);
}

