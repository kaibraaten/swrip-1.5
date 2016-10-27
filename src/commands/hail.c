#include <string.h>
#include "mud.h"
#include "vector3_aux.h"
#include "ship.h"
#include "character.h"

void do_hail( Character *ch , char *argument )
{
  int vnum;
  long gold = 1;
  bool steal = false;
  Room *room;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Ship *ship;
  Ship *target = NULL;

  argument = OneArgument( argument, arg );
  strcpy ( arg2, argument);

  if ( !IsNullOrEmpty( arg ) )
    {
      if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )

        {
          SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
          return;
        }

      if ( IsNullOrEmpty( arg2 ) )
        {
          SendToCharacter( "&RUsage: hail <ship> <message>\r\n&w", ch);
          return;
        }

      if ( !ship->Spaceobject )
        {
          SendToCharacter( "&RYou need to launch first!\r\n&w", ch);
          return;
        }

      target = GetShipInRange( arg,ship );


      if (  target == NULL )

        {
          SendToCharacter("&RThat ship isn't here!\r\n",ch);
          return;
        }
      if (  target == ship )
        {
          SendToCharacter("&RWhy don't you just say it?\r\n",ch);
          return;
        }

      if ( GetShipDistanceToShip( target, ship ) > 100*(ship->Instruments.Sensor + 10)*((target->Class)+1 )
           && GetShipDistanceToShip( target, ship ) > 100*((ship->Instruments.Comm)+(target->Instruments.Comm)+20 ) )
        {
          SendToCharacter("&RThat ship is out of the range of your comm system.\r\n&w", ch);
          return;
        }

      strcpy( buf , "You hail the " );
      strcat( buf , target->Name );
      strcat( buf , ": &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      EchoToShip( AT_WHITE , ship , buf);

      strcpy( buf , ship->Name );
      strcat( buf , " hails you: &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      EchoToShip( AT_WHITE , target , buf);

      return;
    }


  if ( !ch->InRoom )
    return;

  if ( ch->Position < POS_FIGHTING )
    {
      SendToCharacter( "You might want to stop fighting first!\r\n", ch );
      return;
    }

  if ( ch->Position < POS_STANDING )
    {
      SendToCharacter( "You might want to stand up first!\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags , ROOM_INDOORS ) )
    {
      SendToCharacter( "You'll have to go outside to do that!\r\n", ch );
      return;
    }

  if ( ch->InRoom->Sector != SECT_CITY )
    {
      SendToCharacter( "There does not seem to be any speeders out here.\r\n", ch );
      return;
    }


  if ( IsBitSet( ch->InRoom->Flags , ROOM_SPACECRAFT ) )
    {
      SendToCharacter( "You can't do that on spacecraft!\r\n", ch );
      return;
    }

  if( ch->TopLevel < 6 )
    gold = 0;

  if ( gold )
    gold = 500*ch->TopLevel/50;

  if ( ch->Gold < gold )
    {
      SendToCharacter( "You don't have enough credits!\r\n", ch );
      return;
    }

  if ( gold && GetRandomNumberFromRange( 1, 10 ) == 1 )
    steal = true;

  vnum = ch->InRoom->Vnum;

  for ( vnum = ch->InRoom->Area->VnumRanges.Room.First  ;  vnum <= ch->InRoom->Area->VnumRanges.Room.Last  ;  vnum++ )
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
      SendToCharacter( "There doesn't seem to be any taxis nearby!\r\n", ch );
      return;
    }

  ch->Gold -= umax( gold, 0);
  if( ch->InRoom && ch->InRoom->Area )
    BoostEconomy( ch->InRoom->Area, gold );

  Act( AT_ACTION, "$n hails a speederbike, and drives off to seek shelter.", ch, NULL, NULL,  TO_ROOM );

  CharacterFromRoom( ch );
  CharacterToRoom( ch, room );

  Echo( ch, "A speederbike picks you up and drives you to a safe location.\r\nYou pay the driver %d credits.\r\n", gold );

  Act( AT_ACTION, "$n $T", ch, NULL, "arrives on a speederbike, gets off and pays the driver before it leaves.",  TO_ROOM );

  if( steal )
    {
      SendToCharacter( "You realize after the taxi drives off that you are missing a good amount of your credits! Thief!\r\n", ch );
      gold = ch->Gold/10;
      ch->Gold -= gold;
      if( ch->InRoom && ch->InRoom->Area )
        BoostEconomy( ch->InRoom->Area, gold );
      return;
    }

  do_look( ch, "auto" );
}
