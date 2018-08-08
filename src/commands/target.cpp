#include <string.h>
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

static void SynchronizeTargetWithDockedShips(const Ship *ship, Ship *target);

void do_target(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH] = { '\0' };
  int the_chance = 0;
  Ship *ship = NULL;
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH] = { '\0' };
  bool is_turret = false;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if (  (ship = GetShipFromTurret(ch->InRoom->Vnum))  == NULL )
        {
          ch->Echo("&RYou must be in the gunners seat or turret of a ship to do that!\r\n");
          return;
        }

      if ( ship->Rooms.Gunseat != ch->InRoom->Vnum )
        is_turret = true;

      if ( IsShipInHyperspace( ship ) && ship->Class <= SHIP_PLATFORM)
        {
   ch->Echo("&RYou can only do that in realspace!\r\n");
          return;
        }
      
      if (! ship->Spaceobject && ship->Class <= SHIP_PLATFORM)
        {
          ch->Echo("&RYou can't do that until you've finished launching!\r\n");
          return;
        }

      if ( IsShipAutoflying(ship) && ( !is_turret || !CheckPilot( ch, ship ) ) )
        {
          ch->Echo("&RYou'll have to turn off the ships autopilot first....\r\n");
          return;
        }

      if ( IsNullOrEmpty( arg ) )
        {
          ch->Echo("&RYou need to specify a target!\r\n");
          return;
        }

      if ( !StrCmp( arg, "none") )
        {
          ch->Echo("&GTarget set to none.\r\n");

          if ( ch->InRoom->Vnum == ship->Rooms.Gunseat )
            ship->WeaponSystems.Target = NULL;

          for(Turret *turret : ship->WeaponSystems.Turrets)
	    {
	      if( ch->InRoom->Vnum == GetTurretRoom( turret ) )
		{
		  ClearTurretTarget( turret );
		}
	    }

          return;
        }

      if (ship->Class > SHIP_PLATFORM)
        target = GetShipInRoom( ship->InRoom, arg );
      else
        target = GetShipInRange( arg, ship );

      if ( target == NULL )
        {
          ch->Echo("&RThat ship isn't here!\r\n");
          return;
        }

      if ( target == ship )
        {
          ch->Echo("&RYou can't target your own ship!\r\n");
          return;
        }

      if ( !StrCmp(ship->Owner, "Trainer") && StrCmp(target->Owner, "Trainer") )
        {
          ch->Echo("&RTrainers can only target other trainers!!\r\n");
          return;
        }

      if ( StrCmp(ship->Owner, "Trainer") && !StrCmp(target->Owner, "Trainer") )
        {
          ch->Echo("&ROnly trainers can target other trainers!!\r\n");
          return;
        }

      if( ship->Class <= SHIP_PLATFORM)
        {
          if ( GetShipDistanceToShip( ship, target ) > 5000 )
            {
              ch->Echo("&RThat ship is too far away to target.\r\n");
              return;
            }
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)  (ch->PCData->Learned[gsn_weaponsystems]) ;

      if ( GetRandomPercent() < the_chance )
        {
   ch->Echo("&GTracking target.\r\n");
          Act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch, TIMER_CMD_FUN, 1, do_target, SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }

      ch->Echo("&RYou fail to work the controls properly.\r\n");
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

      ch->Echo("&RYour concentration is broken. You fail to lock onto your target.\r\n");
      return;
    }

  ch->SubState = SUB_NONE;

  if ( (ship = GetShipFromTurret(ch->InRoom->Vnum)) == NULL )
    {
      return;
    }

  if (ship->Class > SHIP_PLATFORM)
    target = GetShipInRoom( ship->InRoom , arg );
  else
    target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      ch->Echo("&RThe ship.hppas left the starsytem. Targeting aborted.\r\n");
      return;
    }

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat )
    ship->WeaponSystems.Target = target;

  for(Turret *turret : ship->WeaponSystems.Turrets)
    {
      if( ch->InRoom->Vnum == GetTurretRoom( turret ) )
	{
	  SetTurretTarget( turret, target );
	}
    }

  ch->Echo("&GTarget Locked.\r\n");
  sprintf( buf , "You are being targetted by %s." , ship->Name);
  EchoToCockpit( AT_BLOOD , target , buf );
  EchoToDockedShip( AT_YELLOW , ship, "The ship's computer receives targetting data through the docking port link." );

  if ( ch->InRoom->Vnum == ship->Rooms.Gunseat )
    {
      SynchronizeTargetWithDockedShips(ship, target);
    }
  
  LearnFromSuccess( ch, gsn_weaponsystems );

  if ( IsShipAutoflying(target) && !target->WeaponSystems.Target )
    {
      sprintf( buf , "You are being targetted by %s." , target->Name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->WeaponSystems.Target = ship;
    }
}

struct UserData
{
  const Ship *ship;
  Ship *target;
};

static bool SetSameTargetAsMothership(Ship *dockedShip, void *userData)
{
  struct UserData *data = (struct UserData*)userData;
  const Ship *ship = data->ship;
  Ship *target = data->target;

  if( dockedShip->Docked == ship )
    {
      dockedShip->WeaponSystems.Target = target;
    }

  return true;
}

static void SynchronizeTargetWithDockedShips(const Ship *ship, Ship *target)
{
  struct UserData data;
  data.ship = ship;
  data.target = target;
  ForEachShip(SetSameTargetAsMothership, &data);
}

