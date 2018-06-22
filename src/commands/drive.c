#include <string.h>
#include "ship.h"
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_drive( Character *ch, char *argument )
{
  DirectionType dir;
  Ship *ship, *target;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );
  strcpy ( arg2, argument);


  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the drivers seat of a land vehicle to do that!\r\n",ch);
      return;
    }

  if ( ship->Class < LAND_SPEEDER )
    {
      SendToCharacter("&RThis isn't a land vehicle!\r\n",ch);
      return;
    }


  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe drive is disabled.\r\n",ch);
      return;
    }

  if ( ship->Thrusters.Energy.Current < 1 )
    {
      SendToCharacter("&RThere isn't enough fuel!\r\n",ch);
      return;
    }

  if ( !StrCmp( arg, "in" ))
    {
      target = GetShipInRoom( ship->InRoom , arg2 );

      if ( !target )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      if (!target->Rooms.Hangar)
        {
          SendToCharacter("That ship does not have any room.\r\n", ch);
          return;
        }

      if (!target->BayOpen)
        {
          SendToCharacter("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IsBitSet( target->InRoom->Flags, ROOM_INDOORS )
           || target->InRoom->Sector == SECT_INSIDE )
        {
          SendToCharacter( "You can't drive indoors!\r\n", ch );
          return;
        }

      SendToCharacter("You drive the vehicle into the bay.\r\n", ch);
      sprintf( buf, "%s drives into %s.", ship->Name, target->Name);
      EchoToRoom( AT_GREY,  ship->InRoom, buf);

      TransferShip(ship, target->Rooms.Hangar);

      sprintf( buf, "%s drives into the bay", ship->Name);
      EchoToRoom( AT_GREY, ship->InRoom, buf);
      LearnFromSuccess( ch, gsn_speeders );
      return;
    }

  if ( !StrCmp( arg, "out" ))
    {
      target = GetShipFromHangar(ship->InRoom->Vnum);

      if (!target)
	{
          SendToCharacter("You have to be in a ship's hangar to drive out of one.\r\n", ch);
          return;
        }

      if ( target->Spaceobject != NULL )
        {
          SendToCharacter("The ship must be landed before you drive out of its hangar!\r\n", ch);
          return;
        }

      if (!target->BayOpen)
        {
          SendToCharacter("The ship's bay doors must be open.\r\n", ch);
          return;
        }

      if ( IsBitSet( target->InRoom->Flags, ROOM_INDOORS )
           || target->InRoom->Sector == SECT_INSIDE )
        {
          SendToCharacter( "You can't drive indoors!\r\n", ch );
          return;
        }

      SendToCharacter("You drive the vehicle out of the bay.\r\n", ch);
      sprintf( buf, "%s drives out of the ship.", ship->Name);
      EchoToRoom( AT_GREY,  ship->InRoom, buf);

      TransferShip(ship, target->InRoom->Vnum);

      sprintf( buf, "%s drives out of %s", ship->Name, target->Name);
      EchoToRoom( AT_GREY, ship->InRoom, buf);
      LearnFromSuccess( ch, gsn_speeders );
      return;
    }



  if ( ( dir = GetDirection( arg ) ) == -1 )
    {
      SendToCharacter( "Usage: drive <direction>\r\n", ch );
      return;
    }

  DriveShip( ch, ship, GetExit(GetRoom(ship->Location), dir), 0 );
}
