#include <string.h>
#include "vector3_aux.h"
#include "ship.h"
#include "mud.h"
#include "character.h"
#include "turret.h"
#include "skill.h"

void do_target(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target, *dship;
  char buf[MAX_STRING_LENGTH];
  bool is_turret = false;
  size_t turret_num = 0;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if (  (ship = GetShipFromTurret(ch->InRoom->Vnum))  == NULL )
        {
          SendToCharacter("&RYou must be in the gunners seat or turret of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->room.gunseat != ch->InRoom->Vnum )
        is_turret = true;

      if ( IsShipInHyperspace( ship ) && ship->sclass <= SHIP_PLATFORM)
        {
	  SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
          return;
        }
      if (! ship->spaceobject && ship->sclass <= SHIP_PLATFORM)
        {
          SendToCharacter("&RYou can't do that until you've finished launching!\r\n",ch);
          return;
        }

      if ( IsShipAutoflying(ship) && ( !is_turret || !CheckPilot( ch, ship ) ) )
        {
          SendToCharacter("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
          return;
        }

      if ( IsNullOrEmpty( arg ) )
        {
          SendToCharacter("&RYou need to specify a target!\r\n",ch);
          return;
        }

      if ( !StrCmp( arg, "none") )
        {
          SendToCharacter("&GTarget set to none.\r\n",ch);

          if ( ch->InRoom->Vnum == ship->room.gunseat )
            ship->target0 = NULL;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      Turret *turret = ship->turret[turret_num];

	      if( ch->InRoom->Vnum == GetTurretRoom( turret ) )
		{
		  ClearTurretTarget( turret );
		}
	    }

          return;
        }

      if (ship->sclass > SHIP_PLATFORM)
        target = GetShipInRoom( ship->InRoom , arg );
      else
        target = GetShipInRange( arg, ship );

      if (  target == NULL )
        {
          SendToCharacter("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          SendToCharacter("&RYou can't target your own ship!\r\n",ch);
          return;
        }

      if ( !StrCmp(ship->owner, "Trainer") && StrCmp(target->owner, "Trainer") )
        {
          SendToCharacter("&RTrainers can only target other trainers!!\r\n",ch);
          return;
        }
      if ( StrCmp(ship->owner, "Trainer") && !StrCmp(target->owner, "Trainer") )
        {
          SendToCharacter("&ROnly trainers can target other trainers!!\r\n",ch);
          return;
        }

      if( ship->sclass <= SHIP_PLATFORM)
        {
          if ( GetShipDistanceToShip( ship, target ) > 5000 )
            {
              SendToCharacter("&RThat ship is too far away to target.\r\n",ch);
              return;
            }
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)  (ch->PCData->learned[gsn_weaponsystems]) ;
      if ( GetRandomPercent() < the_chance )
        {
	  SendToCharacter( "&GTracking target.\r\n", ch);
          Act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_target , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_weaponsystems );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      FreeMemory( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
        return;
      SendToCharacter("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->SubState = SUB_NONE;

  if ( (ship = GetShipFromTurret(ch->InRoom->Vnum)) == NULL )
    {
      return;
    }
  if (ship->sclass > SHIP_PLATFORM)
    target = GetShipInRoom( ship->InRoom , arg );
  else
    target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      SendToCharacter("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  if ( ch->InRoom->Vnum == ship->room.gunseat )
    ship->target0 = target;

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      Turret *turret = ship->turret[turret_num];

      if( ch->InRoom->Vnum == GetTurretRoom( turret ) )
	{
	  SetTurretTarget( turret, target );
	}
    }

  SendToCharacter( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You are being targetted by %s." , ship->Name);
  EchoToCockpit( AT_BLOOD , target , buf );
  EchoToDockedShip( AT_YELLOW , ship, "The ship's computer receives targetting data through the docking port link." );

  if ( ch->InRoom->Vnum == ship->room.gunseat )
    for( dship = first_ship; dship; dship = dship->next )
      if( dship->docked && dship->docked == ship )
        dship->target0 = target;

  LearnFromSuccess( ch, gsn_weaponsystems );

  if ( IsShipAutoflying(target) && !target->target0)
    {
      sprintf( buf , "You are being targetted by %s." , target->Name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}
