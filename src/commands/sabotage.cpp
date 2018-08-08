#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_sabotage(Character *ch, char *argument )
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

      if ( StrCmp( argument , "hull" ) && StrCmp( argument , "drive" ) &&
           StrCmp( argument , "launcher" ) && StrCmp( argument , "laser" ) &&
           StrCmp( argument , "docking" ) && StrCmp( argument , "tractor" ) )
        {
          ch->Echo("&RYou need to specify something to sabotage:\r\n");
          ch->Echo("&rTry: hull, drive, launcher, laser, docking, or tractor.\r\n");
          return;
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int) (ch->PCData->Learned[gsn_sabotage]);
      if ( GetRandomPercent() < the_chance )
        {
          ch->Echo("&GYou begin your work.\r\n");
          Act( AT_PLAIN, "$n begins working on the ship's $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !StrCmp(arg,"hull") )
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 15 , do_sabotage , SUB_PAUSE );
          else
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 15 , do_sabotage , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
	  return;
        }
      ch->Echo("&RYou fail to figure out where to start.\r\n");
      LearnFromFailure( ch, gsn_sabotage );
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
      ch->Echo("&RYou are distracted and fail to finish your work.\r\n");
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
                       GetRandomNumberFromRange( (int) ( ch->PCData->Learned[gsn_sabotage] / 2 ) , (int) (ch->PCData->Learned[gsn_sabotage]) ),
                       ( ship->Defenses.Hull.Current ) );
      ship->Defenses.Hull.Current -= change;
      ch->Echo("&GSabotage complete.. Hull strength decreased by %d points.\r\n", change );
    }

  if ( !StrCmp(arg,"drive") )
    {
      if (ship->Location == ship->LastDock)
        ship->State = SHIP_DISABLED;
      else if ( IsShipInHyperspace( ship ) )
        ch->Echo("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n");
      else
	ship->State = SHIP_DISABLED;
      ch->Echo("&GShips drive damaged.\r\n");
    }

  if ( !StrCmp(arg,"docking") )
    {
      ship->DockingState = SHIP_DISABLED;
      ch->Echo("&GDocking bay sabotaged.\r\n");
    }
  if ( !StrCmp(arg,"tractor") )
    {
      ship->WeaponSystems.TractorBeam.State = SHIP_DISABLED;
      ch->Echo("&GTractorbeam sabotaged.\r\n");
    }
  if ( !StrCmp(arg,"launcher") )
    {
      ship->WeaponSystems.Tube.State = MISSILE_DAMAGED;
      ch->Echo("&GMissile launcher sabotaged.\r\n");
    }

  if ( !StrCmp(arg,"laser") )
    {
      ship->WeaponSystems.Laser.State = LASER_DAMAGED;
      ch->Echo("&GMain laser sabotaged.\r\n");
    }

  Act( AT_PLAIN, "$n finishes the work.", ch,
       NULL, argument , TO_ROOM );

  Log->Info("%s has sabotaged %s!", ch->Name, ship->Name );

  LearnFromSuccess( ch, gsn_sabotage );
}

