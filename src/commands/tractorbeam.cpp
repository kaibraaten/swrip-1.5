#include <string.h>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_tractorbeam(Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0;
  Ship *ship = NULL;
  Ship *target = NULL;
  char buf[MAX_STRING_LENGTH];

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
        {
          SendToCharacter("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
          return;
        }

      if ( ship->Class > SHIP_PLATFORM )
        {
          SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
          return;
        }
      if ( !ship->WeaponSystems.TractorBeam.Strength )
        {
          SendToCharacter("&RThis craft does not have a tractorbeam!\r\n",ch);
          return;
	}

      if ( IsShipInHyperspace( ship ) || !ship->Spaceobject )
        {
          SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if (ship->Docking != SHIP_READY )
        {
          SendToCharacter("&RThe ship structure can not tolerate pressure from both tractorbeam and docking port.\r\n",ch);
          return;
        }
      if (ship->State == SHIP_TRACTORED)
        {
          SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
          return;
        }

      if ( IsShipAutoflying(ship) )
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
          SendToCharacter("&GTractorbeam set to no target.\r\n",ch);

          if( ship->WeaponSystems.TractorBeam.Tractoring && ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy == ship )
            {
              ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;

              if( ship->WeaponSystems.TractorBeam.Tractoring->Location )
                ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_LANDED;
              else if ( ship->WeaponSystems.TractorBeam.Tractoring->State != SHIP_DOCKED ||
                        !IsShipDisabled( ship->WeaponSystems.TractorBeam.Tractoring ) )
                ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_READY;
	    }
	  
          ship->WeaponSystems.TractorBeam.Tractoring = NULL;
          return;
        }

      if( ship->WeaponSystems.TractorBeam.Tractoring )
        {
          SendToCharacter("&RReleasing previous target.\r\n",ch);
          ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;

	  if( ship->WeaponSystems.TractorBeam.Tractoring->Location )
            ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_LANDED;
          else if ( ship->WeaponSystems.TractorBeam.Tractoring->State != SHIP_DOCKED ||
                    !IsShipDisabled( ship->WeaponSystems.TractorBeam.Tractoring ) )
            ship->WeaponSystems.TractorBeam.Tractoring->State = SHIP_READY;
        }


      target = GetShipInRange( arg, ship );


      if( target == NULL )
        {
          SendToCharacter("&RThat ship isn't here!\r\n",ch);
          return;
        }

      if( target == ship )
        {
          SendToCharacter("&RYou can't tractor your own ship!\r\n",ch);
          return;
        }

      if ( !StrCmp(ship->Owner, "Trainer") && StrCmp(target->Owner, "Trainer") )
        {
          SendToCharacter("&RTrainers can only target other trainers!\r\n",ch);
          return;
        }

      if ( StrCmp(ship->Owner, "Trainer") && !StrCmp(target->Owner, "Trainer") )
        {
          SendToCharacter("&ROnly trainers can target other trainers!\r\n",ch);
          return;
        }

      if ( ship->Thrusters.Energy.Current < (25 + 25 * ((int)target->Class) ) )
        {
	  SendToCharacter("&RTheres not enough fuel!\r\n",ch);
          return;
        }

      if( ship->Class <= SHIP_PLATFORM)
        {
          if ( GetShipDistanceToShip( ship, target ) > 100+ship->WeaponSystems.TractorBeam.Strength )
            {
              SendToCharacter("&RThat ship is too far away to tractor.\r\n",ch);
              return;
            }
        }

      the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)  (ch->PCData->Learned[gsn_tractorbeams]) ;

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
      ch->SubState = SUB_NONE;

      if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
        return;
      SendToCharacter("&RYour concentration is broken. You fail to lock onto your target.\r\n", ch);
      return;
    }

  ch->SubState = SUB_NONE;

  if ( (ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL )
    {
      return;
    }
  
  target = GetShipInRange( arg, ship );

  if (  target == NULL || target == ship)
    {
      SendToCharacter("&RThe ship.hppas left the starsytem. Targeting aborted.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_tractorbeams]) ;

  the_chance += target->Class - ship->Class;
  the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
  the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
  the_chance -= GetShipDistanceToShip( ship, target ) /(10*(target->Class+1));
  the_chance /= 2;
  the_chance = urange( 1 , the_chance , 99 );

  if ( GetRandomPercent() >= the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_tractorbeams );
      return;
    }

  ship->WeaponSystems.TractorBeam.Tractoring = target;
  target->TractoredBy = ship;
  target->State = SHIP_TRACTORED;
  ship->Thrusters.Energy.Current -= 25 + 25*target->Class;

  if ( target->Class <= ship->Class )
    {
      target->Thrusters.Speed.Current = ship->WeaponSystems.TractorBeam.Strength / 2;
      SetShipCourseTowardsShip( target, ship );
    }

  if ( target->Class > ship->Class )
    {
      ship->Thrusters.Speed.Current = ship->WeaponSystems.TractorBeam.Strength / 2;
      SetShipCourseTowardsShip( ship, target );
    }

  SendToCharacter( "&GTarget Locked.\r\n", ch);
  sprintf( buf , "You have been locked in a tractor beam by %s." , ship->Name);
  EchoToCockpit( AT_BLOOD , target , buf );

  LearnFromSuccess( ch, gsn_tractorbeams );

  if ( IsShipAutoflying(target) && !target->WeaponSystems.Target && StrCmp( target->Owner, ship->Owner ) )
    {
      sprintf( buf , "You are being targetted by %s." , target->Name);
      EchoToCockpit( AT_BLOOD , ship , buf );
      target->WeaponSystems.Target = ship;
    }
}
