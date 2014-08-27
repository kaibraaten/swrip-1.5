#include "ship.h"
#include "mud.h"
#include "character.h"

void do_pick( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *gch;
  Object *obj;
  Exit *pexit;
  Ship *ship;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Pick what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  SetWaitState( ch, skill_table[gsn_pick_lock]->beats );

  /* look for guards */
  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( IsNpc(gch) && IsAwake(gch) && GetAbilityLevel( ch, SMUGGLING_ABILITY ) < gch->top_level )
        {
          Act( AT_PLAIN, "$N is standing too close to the lock.",
               ch, NULL, gch, TO_CHAR );
          return;
        }
    }


  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      /* 'pick door' */
      /*        Room *to_room; */ /* Unused */
      Exit *pexit_rev;

      if ( !IsBitSet(pexit->exit_info, EX_CLOSED) )
        { SendToCharacter( "It's not closed.\r\n",        ch ); return; }
      if ( pexit->key < 0 )
        { SendToCharacter( "It can't be picked.\r\n",     ch ); return; }
      if ( !IsBitSet(pexit->exit_info, EX_LOCKED) )
        { SendToCharacter( "It's already unlocked.\r\n",  ch ); return; }
      if ( IsBitSet(pexit->exit_info, EX_PICKPROOF) )
        {
          SendToCharacter( "You failed.\r\n", ch );
          LearnFromFailure( ch, gsn_pick_lock );
          CheckRoomForTraps( ch, TRAP_PICK | trap_door[pexit->vdir] );
          return;
        }

      if ( !IsNpc(ch) && GetRandomPercent() > ch->pcdata->learned[gsn_pick_lock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pick_lock );
	  return;
        }

      RemoveBit(pexit->exit_info, EX_LOCKED);
      SendToCharacter( "*Click*\r\n", ch );
      Act( AT_ACTION, "$n picks the $d.", ch, NULL, pexit->keyword, TO_ROOM );
      LearnFromSuccess( ch, gsn_pick_lock );
      /* pick the other side */
      if ( ( pexit_rev = pexit->rexit ) != NULL
           &&   pexit_rev->to_room == ch->in_room )
        {
          RemoveBit( pexit_rev->exit_info, EX_LOCKED );
        }
      CheckRoomForTraps( ch, TRAP_PICK | trap_door[pexit->vdir] );
      return;
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        { SendToCharacter( "You can't pick that.\r\n", ch ); return; }
      if ( !IsBitSet(obj->value[1], CONT_CLOSED) )
        { SendToCharacter( "It's not closed.\r\n",        ch ); return; }
      if ( obj->value[2] < 0 )
        { SendToCharacter( "It can't be unlocked.\r\n",   ch ); return; }
      if ( !IsBitSet(obj->value[1], CONT_LOCKED) )
        { SendToCharacter( "It's already unlocked.\r\n",  ch ); return; }
      if ( IsBitSet(obj->value[1], CONT_PICKPROOF) )
        {
          SendToCharacter( "You failed.\r\n", ch );
          LearnFromFailure( ch, gsn_pick_lock );
          CheckObjectForTrap( ch, obj, TRAP_PICK );
          return;
        }

      if ( !IsNpc(ch) && GetRandomPercent() > ch->pcdata->learned[gsn_pick_lock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pick_lock );
          return;
        }

      SeparateOneObjectFromGroup( obj );
      RemoveBit(obj->value[1], CONT_LOCKED);
      SendToCharacter( "*Click*\r\n", ch );
      Act( AT_ACTION, "$n picks $p.", ch, obj, NULL, TO_ROOM );
      LearnFromSuccess( ch, gsn_pick_lock );
      CheckObjectForTrap( ch, obj, TRAP_PICK );
      return;
    }

  if ( ( ship = GetShipInRoom(ch->in_room, arg ) ) != NULL )
    {
      Descriptor *d;

      if ( CheckPilot( ch , ship ) )
        {
          SendToCharacter("&RWhat would be the point of that!\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
        {
          SendToCharacter( "&RThat ship has already started to launch",ch);
          return;
        }

      SetWaitState( ch, skill_table[gsn_pickshiplock]->beats );

      if ( IsNpc(ch) || !ch->pcdata || GetRandomPercent() > ch->pcdata->learned[gsn_pickshiplock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !StrCmp("Public",ship->owner) )
            return;
          for ( d = first_descriptor; d; d = d->next )
            {
              Character *victim = d->original ? d->original : d->character;

              if ( d->connection_state != CON_PLAYING )
                continue;

              if ( !CheckPilot(victim,ship) )
                continue;

              if ( !HasComlink( victim ) )
                continue;

	      if ( !IsNpc( victim ) && victim->switched
                   && !IsBitSet(victim->switched->act, ACT_POLYMORPHED)
                   && !IsAffectedBy(victim->switched, AFF_POSSESS) )
                continue;
              else if ( !IsNpc( victim ) && victim->switched
                        && (IsBitSet(victim->switched->act, ACT_POLYMORPHED)
                            || IsAffectedBy(victim->switched, AFF_POSSESS) ) )
                victim = victim->switched;

              if ( !IsAwake(victim) || IsBitSet(victim->in_room->room_flags,ROOM_SILENCE) )
                continue;

              if ( d->connection_state == CON_EDITING )
                continue;

              Echo(victim,"&R[alarm] Attempt to pick %s.\r\n",ship->name);
            }
          return;
        }

      if ( !ship->hatchopen)
        {
          ship->hatchopen = true;
          Act( AT_PLAIN, "You pick the lock and open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
          Act( AT_PLAIN, "$n picks open the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
          EchoToRoom( AT_YELLOW , GetRoom(ship->room.entrance) , "The hatch opens from the outside." );
          LearnFromSuccess( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !StrCmp("Public",ship->owner) )
            return;
          for ( d = first_descriptor; d; d = d->next )
            {
              Character *victim = d->original ? d->original : d->character;

              if ( d->connection_state != CON_PLAYING )
                continue;

              if ( !CheckPilot(victim,ship) )
                continue;

              if ( !HasComlink( victim ) )
                continue;

              if ( !IsNpc( victim ) && victim->switched
		   && !IsBitSet(victim->switched->act, ACT_POLYMORPHED)
                   && !IsAffectedBy(victim->switched, AFF_POSSESS) )
                continue;
              else if ( !IsNpc( victim ) && victim->switched
                        && (IsBitSet(victim->switched->act, ACT_POLYMORPHED)
                            || IsAffectedBy(victim->switched, AFF_POSSESS) ) )
                victim = victim->switched;

              if ( !IsAwake(victim) || IsBitSet(victim->in_room->room_flags,ROOM_SILENCE) )
                continue;

              if ( d->connection_state == CON_EDITING )
                continue;

              Echo(victim,"&R[alarm] %s has been picked!\r\n",ship->name);
            }
        }
      return;
    }

  Echo( ch, "You see no %s here.\r\n", arg );
}
