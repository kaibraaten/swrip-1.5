#include "turret.h"
#include "ship.h"
#include "mud.h"
#include "character.h"
#include "clan.h"
#include "skill.h"

void do_launch( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  int the_chance;
  long price = 0;
  Ship *ship;
  char buf[MAX_STRING_LENGTH];
  Room *room;

  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->ShipClass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL )
    {
      SendToCharacter("&RYou don't seem to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      SendToCharacter("&RThe ship is set on autopilot, you'll have to turn it off first.\r\n",ch);
      return;
    }

  if  ( ship->ShipClass == SHIP_PLATFORM )
    {
      SendToCharacter( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( !CheckPilot( ch , ship ) )
    {
      SendToCharacter("&RHey, thats not your ship! Try renting a public one.\r\n",ch);
      return;
    }

  if ( ship->LastDock != ship->Location )
    {
      SendToCharacter("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->TractoredBy )
    {
      SendToCharacter("&rYou are still locked in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->Docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->ShipState != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      SendToCharacter("The ship is not docked right now.\r\n",ch);
      return;
    }

  if (ship->Energy == 0)
    {
      SendToCharacter("&RThis ship has no fuel.\r\n",ch);
      return;
    }

  if ( ship->ShipClass <= FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;
  if ( ship->ShipClass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;
  if ( ship->ShipClass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int) (ch->PCData->Learned[gsn_capitalships]);
  if ( GetRandomPercent() < the_chance )
    {
      if ( IsShipRental(ch,ship) )
        if( !RentShip(ch,ship) )
          return;

      if ( !IsShipRental(ch,ship) )
        {
	  int turret_num = 0;

          if ( ship->ShipClass == FIGHTER_SHIP )
            price=2000;

          if ( ship->ShipClass == MIDSIZE_SHIP )
            price=5000;

          if ( ship->ShipClass == CAPITAL_SHIP )
            price=50000;

          price += ( ship->MaxHull - ship->Hull );

          if (IsShipDisabled( ship ) )
            price += 10000;

          if ( ship->WeaponSystems.Tube.State == MISSILE_DAMAGED )
	    price += 5000;

          if ( ship->WeaponSystems.Laser.State == LASER_DAMAGED )
            price += 2500;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      const Turret *turret = ship->WeaponSystems.Turret[turret_num];

	      if ( IsTurretDamaged( turret ) )
		{
		  price += 2500;
		}
	    }
        }

      if( IsBitSet( ch->Flags, PLR_DONTAUTOFUEL ) )
        {
          if( IsShipDisabled( ship ) )
            {
              Echo(ch, "Your ship is disabled. You must repair it.\r\n");
              return;
            }

          price = 100;
        }

      if ( IsClanned( ch )
	   && !StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->Owner) )
        {
          if ( ch->PCData->ClanInfo.Clan->Funds < price )
            {
              Echo(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->PCData->ClanInfo.Clan->Name );
              return;
            }

          ch->PCData->ClanInfo.Clan->Funds -= price;
          room = GetRoom( ship->Location );
          if( room != NULL && room->Area )
            BoostEconomy( room->Area, price );
          Echo(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->PCData->ClanInfo.Clan->Name, price );
        }
      else if ( StrCmp( ship->Owner , "Public" ) )
        {
          if ( ch->Gold < price )
            {
              Echo(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
              return;
            }

          ch->Gold -= price;
          room = GetRoom( ship->Location );

          if( room != NULL && room->Area )
	    BoostEconomy( room->Area, price );

	  Echo(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
        }

      if( !IsBitSet( ch->Flags, PLR_DONTAUTOFUEL ) )
        {
	  int turret_num = 0;

          if( GetShipFromHangar(ship->InRoom->Vnum) == NULL || ship->ShipClass == SHIP_PLATFORM )
            ship->Energy = ship->MaxEnergy;

          ship->Shield = 0;
          ship->AutoRecharge = false;
          ship->AutoTrack = false;
          ship->AutoSpeed = false;
          ship->Hull = ship->MaxHull;

          ship->WeaponSystems.Tube.State = MISSILE_READY;
          ship->WeaponSystems.Laser.State = LASER_READY;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      Turret *turret = ship->WeaponSystems.Turret[turret_num];
	      SetTurretReady( turret );
	    }

          ship->ShipState = SHIP_LANDED;
        }

      if (ship->HatchOpen)
        {
          ship->HatchOpen = false;
          sprintf( buf , "The hatch on %s closes." , ship->Name);
          EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
          EchoToRoom( AT_YELLOW , GetRoom(ship->Room.Entrance) , "The hatch slides shut." );
        }

      SetCharacterColor( AT_GREEN, ch );
      SendToCharacter( "Launch sequence initiated.\r\n", ch);
      Act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      EchoToShip( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->Name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
      EchoToDockedShip( AT_YELLOW , ship, "The ship shudders as it lifts off the ground." );
      ship->ShipState = SHIP_LAUNCH;
      ship->CurrentSpeed = ship->RealSpeed;

      if ( ship->ShipClass == FIGHTER_SHIP )
        LearnFromSuccess( ch, gsn_starfighters );

      if ( ship->ShipClass == MIDSIZE_SHIP )
        LearnFromSuccess( ch, gsn_midships );

      if ( ship->ShipClass == CAPITAL_SHIP )
        LearnFromSuccess( ch, gsn_capitalships );

      return;
    }

  SetCharacterColor( AT_RED, ch );
  SendToCharacter("You fail to work the controls properly!\r\n",ch);

  if ( ship->ShipClass == FIGHTER_SHIP )
    LearnFromFailure( ch, gsn_starfighters );

  if ( ship->ShipClass == MIDSIZE_SHIP )
    LearnFromFailure( ch, gsn_midships );

  if ( ship->ShipClass == CAPITAL_SHIP )
    LearnFromFailure( ch, gsn_capitalships );
}
