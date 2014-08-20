#include "ships.h"
#include "mud.h"
#include "character.h"

void do_hijack( Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Character *p, *p_prev, *victim;


  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->in_room->vnum)) == NULL )
    {
      SendToCharacter("&RYou don't seem to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( CheckPilot( ch , ship ) )
    {
      SendToCharacter("&RWhat would be the point of that!\r\n",ch);
      return;
    }

  if ( ship->type == MOB_SHIP && GetTrustLevel(ch) < 102 )
    {
      SendToCharacter("&RThis ship isn't pilotable by mortals at this point in time...\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( ship->lastdoc != ship->location )
    {
      SendToCharacter("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      SendToCharacter("The ship is not docked right now.\r\n",ch);
      return;
    }

  if ( IsShipDisabled( ship ) )
    {
      SendToCharacter("The ship's drive is disabled .\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_hijack]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("You fail to figure out the correct launch code.\r\n",ch);
      LearnFromFailure( ch, gsn_hijack );
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
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
      ship->shipstate = SHIP_LAUNCH;
      ship->currspeed = ship->realspeed;
      if ( ship->sclass == FIGHTER_SHIP )
        LearnFromSuccess( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        LearnFromSuccess( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        LearnFromSuccess( ch, gsn_capitalships );

      LearnFromSuccess( ch, gsn_hijack );

      for (p = last_char; p ; p = p_prev )

        {
          p_prev = p->prev;  /* TRI */
          if (!IsNpc(p) && GetTrustLevel(p) >= LEVEL_GREATER)
            {
              sprintf( buf2, "%s(%s)", ship->name, ship->personalname );
              ChPrintf(p, "&R[alarm] %s has been hijacked by %s!\r\n", buf2, ch->name);
            }
        }

      if ( ship->alarm == 0 )
	return;
      if ( !StrCmp("Public",ship->owner) )
        return;
      for ( victim = first_char; victim; victim = victim->next )
        {
          if ( !CheckPilot(victim,ship) )
            continue;

          if ( !HasComlink( victim ) )
            continue;

          if ( !IsNpc( victim ) && victim->switched )
            continue;

          if ( !IsAwake(victim) || IsBitSet(victim->in_room->room_flags,ROOM_SILENCE) )
            continue;

          ChPrintf(victim,"&R[alarm] %s has been hijacked!\r\n",ship->name);

        }

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
