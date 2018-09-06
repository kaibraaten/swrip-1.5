#include <string.h>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "area.hpp"
#include "room.hpp"

void do_hail( Character *ch , std::string argument )
{
  vnum_t vnum = INVALID_VNUM;
  long gold = 1;
  bool steal = false;
  Room *room = nullptr;
  std::string arg;
  std::string arg2;
  char buf[MAX_STRING_LENGTH];
  Ship *ship = nullptr;
  Ship *target = nullptr;

  argument = OneArgument( argument, arg );
  arg2 = argument;

  if ( !arg.empty() )
    {
      if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
        {
          ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
          return;
        }

      if ( arg2.empty() )
        {
          ch->Echo( "&RUsage: Hail <ship> <message>\r\n&w");
          return;
        }

      if ( !ship->Spaceobject )
        {
          ch->Echo( "&RYou need to launch first!\r\n&w");
          return;
        }

      target = GetShipInRange( arg,ship );

      if ( target == NULL )
        {
          ch->Echo("&RThat ship isn't here!\r\n");
          return;
        }

      if ( target == ship )
        {
          ch->Echo("&RWhy don't you just say it?\r\n");
          return;
        }

      if ( GetShipDistanceToShip( target, ship ) > 100*(ship->Instruments.Sensor + 10)*((target->Class)+1 )
           && GetShipDistanceToShip( target, ship ) > 100*((ship->Instruments.Comm)+(target->Instruments.Comm)+20 ) )
        {
          ch->Echo("&RThat ship is out of the range of your comm system.\r\n&w");
          return;
        }

      strcpy( buf, "You hail the " );
      strcat( buf, target->Name.c_str() );
      strcat( buf, ": &C" );
      strcat( buf, arg2.c_str() );
      strcat( buf, "&w\r\n" );

      EchoToShip( AT_WHITE , ship , buf);

      strcpy( buf, ship->Name.c_str() );
      strcat( buf, " hails you: &C" );
      strcat( buf, arg2.c_str() );
      strcat( buf, "&w\r\n" );

      EchoToShip( AT_WHITE , target , buf);

      return;
    }


  if ( !ch->InRoom )
    return;

  if ( ch->Position < POS_FIGHTING )
    {
      ch->Echo( "You might want to stop fighting first!\r\n" );
      return;
    }

  if ( ch->Position < POS_STANDING )
    {
      ch->Echo( "You might want to stand up first!\r\n" );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags , ROOM_INDOORS ) )
    {
      ch->Echo( "You'll have to go outside to do that!\r\n" );
      return;
    }

  if ( ch->InRoom->Sector != SECT_CITY )
    {
      ch->Echo( "There does not seem to be any speeders out here.\r\n" );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags , ROOM_SPACECRAFT ) )
    {
      ch->Echo( "You can't do that on spacecraft!\r\n" );
      return;
    }

  if( ch->TopLevel < 6 )
    gold = 0;

  if ( gold )
    gold = 500*ch->TopLevel/50;

  if ( ch->Gold < gold )
    {
      ch->Echo( "You don't have enough credits!\r\n" );
      return;
    }

  if ( gold && GetRandomNumberFromRange( 1, 10 ) == 1 )
    steal = true;

  vnum = ch->InRoom->Vnum;

  for ( vnum = ch->InRoom->Area->VnumRanges.Room.First;
        vnum <= ch->InRoom->Area->VnumRanges.Room.Last;
        vnum++ )
    {
      room = GetRoom ( vnum );

      if ( room != NULL )
        {
          if ( IsBitSet(room->Flags , ROOM_HOTEL ) )
            break;
          else
            room = NULL;
        }
    }

  if ( room == NULL )
    {
      ch->Echo( "There doesn't seem to be any taxis nearby!\r\n" );
      return;
    }

  ch->Gold -= umax( gold, 0);

  if( ch->InRoom && ch->InRoom->Area )
    BoostEconomy( ch->InRoom->Area, gold );

  Act( AT_ACTION, "$n hails a speederbike, and drives off to seek shelter.",
       ch, NULL, NULL,  TO_ROOM );

  CharacterFromRoom( ch );
  CharacterToRoom( ch, room );

  ch->Echo( "A speederbike picks you up and drives you to a safe location.\r\nYou pay the driver %d credits.\r\n", gold );

  Act( AT_ACTION, "$n $T", ch, NULL, "arrives on a speederbike, gets off and pays the driver before it leaves.",  TO_ROOM );

  if( steal )
    {
      ch->Echo( "You realize after the taxi drives off that you are missing a good amount of your credits! Thief!\r\n" );
      gold = ch->Gold/10;
      ch->Gold -= gold;
      
      if( ch->InRoom && ch->InRoom->Area )
        BoostEconomy( ch->InRoom->Area, gold );

      return;
    }

  do_look( ch, "auto" );
}
