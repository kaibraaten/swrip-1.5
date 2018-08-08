#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_repairship(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0, change = 0;
  Ship *ship = NULL;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if (  (ship = GetShipFromEngine(ch->InRoom->Vnum))  == NULL )
        {
          ch->Echo("&RYou must be in the engine room of a ship to do that!\r\n");
          return;
        }

      if ( StrCmp( argument , "hull" )
	   && StrCmp( argument , "drive" )
           && StrCmp( argument , "launcher" )
	   && StrCmp( argument , "laser" )
           && StringPrefix( "turret ", argument )
           && StrCmp( argument , "docking" )
	   && StrCmp( argument , "tractor" ) )
        {
          ch->Echo("&RYou need to spceify something to repair:\r\n");
          ch->Echo("&rTry: hull, drive, launcher, laser, docking, tractor or turret <1 - %d>\r\n", MAX_NUMBER_OF_TURRETS_IN_SHIP);
	  return;
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int) (ch->PCData->Learned[gsn_shipmaintenance]);
      if ( GetRandomPercent() < the_chance )
        {
          ch->Echo("&GYou begin your repairs\r\n");
          Act( AT_PLAIN, "$n begins repairing the ships $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !StrCmp(arg,"hull") )
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 15 , do_repairship , SUB_PAUSE );
          else
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 5 , do_repairship , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      ch->Echo("&RYou fail to locate the source of the problem.\r\n");
      LearnFromFailure( ch, gsn_shipmaintenance );
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
      ch->Echo("&RYou are distracted and fail to finish your repairs.\r\n");
      return;
    }

  ch->SubState = SUB_NONE;

  if ( (ship = GetShipFromEngine(ch->InRoom->Vnum)) == NULL )
    {
      return;
    }

  if ( !StrCmp(arg,"hull") )
    {
      change = urange( 0 ,
                       GetRandomNumberFromRange( (int) ( ch->PCData->Learned[gsn_shipmaintenance] / 2 ) , (int) (ch->PCData->Learned[gsn_shipmaintenance]) ),
                       ( ship->Defenses.Hull.Max - ship->Defenses.Hull.Current ) );
      ship->Defenses.Hull.Current += change;
      ch->Echo("&GRepair complete. Hull strength inreased by %d points.\r\n", change );
    }

  if ( !StrCmp(arg,"drive") )
    {
      if (ship->Location == ship->LastDock)
        ship->State = SHIP_LANDED;
      else if ( IsShipInHyperspace( ship ) )
        ch->Echo("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n");
      else
        ship->State = SHIP_READY;
      ch->Echo("&GShips drive repaired.\r\n");
    }

  if ( !StrCmp(arg,"docking") )
    {
      ship->DockingState = SHIP_READY;
      ch->Echo("&GDocking bay repaired.\r\n");
    }
  if ( !StrCmp(arg,"tractor") )
    {
      ship->WeaponSystems.TractorBeam.State = SHIP_READY;
      ch->Echo("&GTractorbeam repaired.\r\n");
    }
  if ( !StrCmp(arg,"launcher") )
    {
      ship->WeaponSystems.Tube.State = MISSILE_READY;
      ch->Echo("&GMissile launcher repaired.\r\n");
    }

  if ( !StrCmp(arg,"laser") )
    {
      ship->WeaponSystems.Laser.State = LASER_READY;
      ch->Echo("&GMain laser repaired.\r\n");
    }

  if( !StringPrefix( "turret ", arg ) )
    {
      char number_string[MAX_INPUT_LENGTH];
      long turret_number = 0;
      Turret *turret = NULL;

      argument = OneArgument( arg, number_string );
      turret_number = strtol( number_string, 0, 10 );

      if( turret_number < 1 || turret_number > MAX_NUMBER_OF_TURRETS_IN_SHIP )
	{
   ch->Echo("Turret range is 1 - %d.\r\n", MAX_NUMBER_OF_TURRETS_IN_SHIP );
	  return;
	}

      turret = ship->WeaponSystems.Turrets[turret_number - 1];

      if( !IsTurretInstalled( turret ) )
	{
   ch->Echo("This ship doesn't have that many turrets installed.\r\n" );
	  return;
	}

      ResetTurret( turret );
      ch->Echo("&GLaser Turret %d repaired.\r\n", turret_number );
    }

  Act( AT_PLAIN, "$n finishes the repairs.", ch,
       NULL, argument , TO_ROOM );

  LearnFromSuccess( ch, gsn_shipmaintenance );
}

