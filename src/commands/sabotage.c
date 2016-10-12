#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "skill.h"

void do_sabotage(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance, change;
  Ship *ship;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if (  (ship = GetShipFromEngine(ch->InRoom->Vnum))  == NULL )
        {
          SendToCharacter("&RYou must be in the engine room of a ship to do that!\r\n",ch);
          return;
        }

      if ( StrCmp( argument , "hull" ) && StrCmp( argument , "drive" ) &&
           StrCmp( argument , "launcher" ) && StrCmp( argument , "laser" ) &&
           StrCmp( argument , "docking" ) && StrCmp( argument , "tractor" ) )
        {
          SendToCharacter("&RYou need to specify something to sabotage:\r\n",ch);
          SendToCharacter("&rTry: hull, drive, launcher, laser, docking, or tractor.\r\n",ch);
          return;
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int) (ch->PCData->learned[gsn_sabotage]);
      if ( GetRandomPercent() < the_chance )
        {
          SendToCharacter( "&GYou begin your work.\r\n", ch);
          Act( AT_PLAIN, "$n begins working on the ship's $T.", ch,
               NULL, argument , TO_ROOM );
          if ( !StrCmp(arg,"hull") )
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 15 , do_sabotage , SUB_PAUSE );
          else
            AddTimerToCharacter( ch , TIMER_CMD_FUN , 15 , do_sabotage , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
	  return;
        }
      SendToCharacter("&RYou fail to figure out where to start.\r\n",ch);
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
      SendToCharacter("&RYou are distracted and fail to finish your work.\r\n", ch);
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
                       GetRandomNumberFromRange( (int) ( ch->PCData->learned[gsn_sabotage] / 2 ) , (int) (ch->PCData->learned[gsn_sabotage]) ),
                       ( ship->hull ) );
      ship->hull -= change;
      Echo( ch, "&GSabotage complete.. Hull strength decreased by %d points.\r\n", change );
    }

  if ( !StrCmp(arg,"drive") )
    {
      if (ship->location == ship->lastdoc)
        ship->shipstate = SHIP_DISABLED;
      else if ( IsShipInHyperspace( ship ) )
        SendToCharacter("You realize after working that it would be a bad idea to do this while in hyperspace.\r\n", ch);
      else
	ship->shipstate = SHIP_DISABLED;
      SendToCharacter("&GShips drive damaged.\r\n", ch);
    }

  if ( !StrCmp(arg,"docking") )
    {
      ship->statetdocking = SHIP_DISABLED;
      SendToCharacter("&GDocking bay sabotaged.\r\n", ch);
    }
  if ( !StrCmp(arg,"tractor") )
    {
      ship->statettractor = SHIP_DISABLED;
      SendToCharacter("&GTractorbeam sabotaged.\r\n", ch);
    }
  if ( !StrCmp(arg,"launcher") )
    {
      ship->missilestate = MISSILE_DAMAGED;
      SendToCharacter("&GMissile launcher sabotaged.\r\n", ch);
    }

  if ( !StrCmp(arg,"laser") )
    {
      ship->statet0 = LASER_DAMAGED;
      SendToCharacter("&GMain laser sabotaged.\r\n", ch);
    }

  Act( AT_PLAIN, "$n finishes the work.", ch,
       NULL, argument , TO_ROOM );

  sprintf(buf, "%s has sabotaged %s!", ch->Name, ship->Name );
  Bug(buf, 0);

  LearnFromSuccess( ch, gsn_sabotage );
}
