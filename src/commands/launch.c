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

  if ( (ship = GetShipFromCockpit(ch->in_room->Vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->in_room->Vnum)) == NULL )
    {
      SendToCharacter("&RYou don't seem to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      SendToCharacter("&RThe ship is set on autopilot, you'll have to turn it off first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( !CheckPilot( ch , ship ) )
    {
      SendToCharacter("&RHey, thats not your ship! Try renting a public one.\r\n",ch);
      return;
    }

  if ( ship->lastdoc != ship->location )
    {
      SendToCharacter("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->tractoredby )
    {
      SendToCharacter("&rYou are still locked in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      SendToCharacter("The ship is not docked right now.\r\n",ch);
      return;
    }

  if (ship->energy == 0)
    {
      SendToCharacter("&RThis ship has no fuel.\r\n",ch);
      return;
    }

  if ( ship->sclass <= FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( GetRandomPercent() < the_chance )
    {
      if ( IsShipRental(ch,ship) )
        if( !RentShip(ch,ship) )
          return;

      if ( !IsShipRental(ch,ship) )
        {
	  int turret_num = 0;

          if ( ship->sclass == FIGHTER_SHIP )
            price=2000;

          if ( ship->sclass == MIDSIZE_SHIP )
            price=5000;

          if ( ship->sclass == CAPITAL_SHIP )
            price=50000;

          price += ( ship->maxhull-ship->hull );

          if (IsShipDisabled( ship ) )
            price += 10000;

          if ( ship->missilestate == MISSILE_DAMAGED )
	    price += 5000;

          if ( ship->statet0 == LASER_DAMAGED )
            price += 2500;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      const Turret *turret = ship->turret[turret_num];

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
	   && !StrCmp(ch->pcdata->ClanInfo.Clan->Name, ship->owner) )
        {
          if ( ch->pcdata->ClanInfo.Clan->Funds < price )
            {
              Echo(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->pcdata->ClanInfo.Clan->Name );
              return;
            }

          ch->pcdata->ClanInfo.Clan->Funds -= price;
          room = GetRoom( ship->location );
          if( room != NULL && room->Area )
            BoostEconomy( room->Area, price );
          Echo(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->ClanInfo.Clan->Name, price );
        }
      else if ( StrCmp( ship->owner , "Public" ) )
        {
          if ( ch->gold < price )
            {
              Echo(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
              return;
            }

          ch->gold -= price;
          room = GetRoom( ship->location );

          if( room != NULL && room->Area )
	    BoostEconomy( room->Area, price );

	  Echo(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );
        }

      if( !IsBitSet( ch->Flags, PLR_DONTAUTOFUEL ) )
        {
	  int turret_num = 0;

          if( GetShipFromHangar(ship->in_room->Vnum) == NULL || ship->sclass == SHIP_PLATFORM )
            ship->energy = ship->maxenergy;

          ship->shield = 0;
          ship->autorecharge = false;
          ship->autotrack = false;
          ship->autospeed = false;
          ship->hull = ship->maxhull;

          ship->missilestate = MISSILE_READY;
          ship->statet0 = LASER_READY;

	  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
	    {
	      Turret *turret = ship->turret[turret_num];
	      SetTurretReady( turret );
	    }

          ship->shipstate = SHIP_LANDED;
        }

      if (ship->hatchopen)
        {
          ship->hatchopen = false;
          sprintf( buf , "The hatch on %s closes." , ship->name);
          EchoToRoom( AT_YELLOW , GetRoom(ship->location) , buf );
          EchoToRoom( AT_YELLOW , GetRoom(ship->room.entrance) , "The hatch slides shut." );
        }

      SetCharacterColor( AT_GREEN, ch );
      SendToCharacter( "Launch sequence initiated.\r\n", ch);
      Act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      EchoToShip( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->location) , buf );
      EchoToDockedShip( AT_YELLOW , ship, "The ship shudders as it lifts off the ground." );
      ship->shipstate = SHIP_LAUNCH;
      ship->currspeed = ship->realspeed;

      if ( ship->sclass == FIGHTER_SHIP )
        LearnFromSuccess( ch, gsn_starfighters );

      if ( ship->sclass == MIDSIZE_SHIP )
        LearnFromSuccess( ch, gsn_midships );

      if ( ship->sclass == CAPITAL_SHIP )
        LearnFromSuccess( ch, gsn_capitalships );

      return;
    }

  SetCharacterColor( AT_RED, ch );
  SendToCharacter("You fail to work the controls properly!\r\n",ch);

  if ( ship->sclass == FIGHTER_SHIP )
    LearnFromFailure( ch, gsn_starfighters );

  if ( ship->sclass == MIDSIZE_SHIP )
    LearnFromFailure( ch, gsn_midships );

  if ( ship->sclass == CAPITAL_SHIP )
    LearnFromFailure( ch, gsn_capitalships );
}
