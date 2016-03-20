#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_tractorbeam(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
        {
          SendToCharacter("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->sclass > SHIP_PLATFORM )
        {
          SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
          return;
        }
      if ( !ship->tractorbeam )
        {
          SendToCharacter("&RThis craft does not have a tractorbeam!\r\n",ch);
          return;
	}

      if ( IsShipInHyperspace( ship ) || !ship->spaceobject )
        {
          SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if (ship->docking != SHIP_READY )
        {
          SendToCharacter("&RThe ship structure can not tolerate pressure from both tractorbeam and docking port.\r\n",ch);
          return;
        }
      if (ship->shipstate == SHIP_TRACTORED)
        {
          SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
          return;
        }

      if ( IsShipAutoflying(ship) )
        {
          SendToCharacter("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
          return;
        }

      if (arg[0] == '\0')
        {
          SendToCharacter("&RYou need to specify a target!\r\n",ch);
          return;
        }

      if ( !StrCmp( arg, "none") )
        {
          SendToCharacter("&GTractorbeam set to no target.\r\n",ch);
          if( ship->tractored && ship->tractored->tractoredby == ship )
            {
              ship->tractored->tractoredby = NULL;
              if( ship->tractored->location )
                ship->tractored->shipstate = SHIP_LANDED;
              else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                        !IsShipDisabled( ship->tractored ) )
                ship->tractored->shipstate = SHIP_READY;
	    }
          ship->tractored = NULL;
          return;
        }

      if( ship->tractored )
        {
          SendToCharacter("&RReleasing previous target.\r\n",ch);
          ship->tractored->tractoredby = NULL;
          if( ship->tractored->location )
            ship->tractored->shipstate = SHIP_LANDED;
          else if ( ship->tractored->shipstate != SHIP_DOCKED ||
                    !IsShipDisabled( ship->tractored ) )
            ship->tractored->shipstate = SHIP_READY;
        }


      target = GetShipInRange( arg, ship );


      if (  target == NULL )
        {
          SendToCharacter("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if (  target == ship )
        {
          SendToCharacter("&RYou can't tractor your own ship!\r\n",ch);
          return;
        }

      if ( !StrCmp(ship->owner, "Trainer") && StrCmp(target->owner, "Trainer") )
        {
          SendToCharacter("&RTrainers can only target other trainers!\r\n",ch);
          return;
        }
      if ( StrCmp(ship->owner, "Trainer") && !StrCmp(target->owner, "Trainer") )
        {
          SendToCharacter("&ROnly trainers can target other trainers!\r\n",ch);
          return;
        }

      if ( ship->energy < (25 + 25 * ((int)target->sclass) ) )
        {
	  SendToCharacter("&RTheres not enough fuel!\r\n",ch);
          return;
        }

      if( ship->sclass <= SHIP_PLATFORM)
        {
          if ( GetShipDistanceToShip( ship, target ) > 100+ship->tractorbeam )
            {
              SendToCharacter("&RThat ship is too far away to tractor.\r\n",ch);
              return;
            }
        }

      the_chance = IsNpc(ch) ? ch->top_level
        : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

      if ( GetRandomPercent() < the_chance )
        {
          SendToCharacter( "&GTracking target.\r\n", ch);
          Act( AT_PLAIN, "$n makes some adjustments on the targeting computer.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_tractorbeam , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_tractorbeams );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      FreeMemory( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->substate = SUB_NONE;
      if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
        return;
      SendToCharacter("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( (ship = GetShipFromCoSeat(ch->in_room->vnum)) == NULL )
    {
      return;
    }
  target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      SendToCharacter("&RThe ship has left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_tractorbeams]) ;

  the_chance += target->sclass - ship->sclass;
  the_chance += ship->currspeed - target->currspeed;
  the_chance += ship->manuever - target->manuever;
  the_chance -= GetShipDistanceToShip( ship, target ) /(10*(target->sclass+1));
  the_chance /= 2;
  the_chance = urange( 1 , the_chance , 99 );

  if ( GetRandomPercent() >= the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_tractorbeams );
      return;
    }

  ship->tractored = target;
  target->tractoredby = ship;
  target->shipstate = SHIP_TRACTORED;
  ship->energy -= 25 + 25*target->sclass;

  if ( target->sclass <= ship->sclass )
    {
      target->currspeed = ship->tractorbeam/2;
      SetShipCourseTowardsShip( target, ship );
    }

  if ( target->sclass > ship->sclass )
    {
      ship->currspeed = ship->tractorbeam/2;
      SetShipCourseTowardsShip( ship, target );
    }

  SendToCharacter( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You have been locked in a tractor beam by %s." , ship->name);
  EchoToCockpit( AT_BLOOD , target , buf );

  LearnFromSuccess( ch, gsn_tractorbeams );

  if ( IsShipAutoflying(target) && !target->target0 && StrCmp( target->owner, ship->owner ) )
    {
      sprintf( buf , "You are being targetted by %s." , target->name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->target0 = ship;
    }
}
