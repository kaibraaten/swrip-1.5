#include "ships.h"
#include "mud.h"

void do_pick( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *gch;
  OBJ_DATA *obj;
  EXIT_DATA *pexit;
  SHIP_DATA *ship;

  if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Pick what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  WAIT_STATE( ch, skill_table[gsn_pick_lock]->beats );

  /* look for guards */
  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( IS_NPC(gch) && IS_AWAKE(gch) && get_level( ch, SMUGGLING_ABILITY ) < gch->top_level )
        {
          act( AT_PLAIN, "$N is standing too close to the lock.",
               ch, NULL, gch, TO_CHAR );
          return;
        }
    }


  if ( ( pexit = find_door( ch, arg, TRUE ) ) != NULL )
    {
      /* 'pick door' */
      /*        ROOM_INDEX_DATA *to_room; */ /* Unused */
      EXIT_DATA *pexit_rev;

      if ( !IS_SET(pexit->exit_info, EX_CLOSED) )
        { send_to_char( "It's not closed.\r\n",        ch ); return; }
      if ( pexit->key < 0 )
        { send_to_char( "It can't be picked.\r\n",     ch ); return; }
      if ( !IS_SET(pexit->exit_info, EX_LOCKED) )
        { send_to_char( "It's already unlocked.\r\n",  ch ); return; }
      if ( IS_SET(pexit->exit_info, EX_PICKPROOF) )
        {
          send_to_char( "You failed.\r\n", ch );
          learn_from_failure( ch, gsn_pick_lock );
          check_room_for_traps( ch, TRAP_PICK | trap_door[pexit->vdir] );
          return;
        }

      if ( !IS_NPC(ch) && number_percent( ) > ch->pcdata->learned[gsn_pick_lock] )
        {
          send_to_char( "You failed.\r\n", ch);
          learn_from_failure( ch, gsn_pick_lock );
	  return;
        }

      REMOVE_BIT(pexit->exit_info, EX_LOCKED);
      send_to_char( "*Click*\r\n", ch );
      act( AT_ACTION, "$n picks the $d.", ch, NULL, pexit->keyword, TO_ROOM );
      learn_from_success( ch, gsn_pick_lock );
      /* pick the other side */
      if ( ( pexit_rev = pexit->rexit ) != NULL
           &&   pexit_rev->to_room == ch->in_room )
        {
          REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
        }
      check_room_for_traps( ch, TRAP_PICK | trap_door[pexit->vdir] );
      return;
    }

  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        { send_to_char( "You can't pick that.\r\n", ch ); return; }
      if ( !IS_SET(obj->value[1], CONT_CLOSED) )
        { send_to_char( "It's not closed.\r\n",        ch ); return; }
      if ( obj->value[2] < 0 )
        { send_to_char( "It can't be unlocked.\r\n",   ch ); return; }
      if ( !IS_SET(obj->value[1], CONT_LOCKED) )
        { send_to_char( "It's already unlocked.\r\n",  ch ); return; }
      if ( IS_SET(obj->value[1], CONT_PICKPROOF) )
        {
          send_to_char( "You failed.\r\n", ch );
          learn_from_failure( ch, gsn_pick_lock );
          check_for_trap( ch, obj, TRAP_PICK );
          return;
        }

      if ( !IS_NPC(ch) && number_percent( ) > ch->pcdata->learned[gsn_pick_lock] )
        {
          send_to_char( "You failed.\r\n", ch);
          learn_from_failure( ch, gsn_pick_lock );
          return;
        }

      separate_obj( obj );
      REMOVE_BIT(obj->value[1], CONT_LOCKED);
      send_to_char( "*Click*\r\n", ch );
      act( AT_ACTION, "$n picks $p.", ch, obj, NULL, TO_ROOM );
      learn_from_success( ch, gsn_pick_lock );
      check_for_trap( ch, obj, TRAP_PICK );
      return;
    }

  if ( ( ship = ship_in_room(ch->in_room, arg ) ) != NULL )
    {
      DESCRIPTOR_DATA *d;

      if ( check_pilot( ch , ship ) )
        {
          send_to_char("&RWhat would be the point of that!\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
        {
          send_to_char( "&RThat ship has already started to launch",ch);
          return;
        }

      WAIT_STATE( ch, skill_table[gsn_pickshiplock]->beats );

      if ( IS_NPC(ch) || !ch->pcdata || number_percent( ) > ch->pcdata->learned[gsn_pickshiplock] )
        {
          send_to_char( "You failed.\r\n", ch);
          learn_from_failure( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !str_cmp("Public",ship->owner) )
            return;
          for ( d = first_descriptor; d; d = d->next )
            {
              CHAR_DATA *victim = d->original ? d->original : d->character;

              if ( d->connected != CON_PLAYING )
                continue;

              if ( !check_pilot(victim,ship) )
                continue;

              if ( !has_comlink( victim ) )
                continue;

	      if ( !IS_NPC( victim ) && victim->switched
                   && !IS_SET(victim->switched->act, ACT_POLYMORPHED)
                   && !IS_AFFECTED(victim->switched, AFF_POSSESS) )
                continue;
              else if ( !IS_NPC( victim ) && victim->switched
                        && (IS_SET(victim->switched->act, ACT_POLYMORPHED)
                            || IS_AFFECTED(victim->switched, AFF_POSSESS) ) )
                victim = victim->switched;

              if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
                continue;

              if ( d->connected == CON_EDITING )
                continue;

              ch_printf(victim,"&R[alarm] Attempt to pick %s.\r\n",ship->name);
            }
          return;
        }

      if ( !ship->hatchopen)
        {
          ship->hatchopen = TRUE;
          act( AT_PLAIN, "You pick the lock and open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
          act( AT_PLAIN, "$n picks open the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
          echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch opens from the outside." );
          learn_from_success( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !str_cmp("Public",ship->owner) )
            return;
          for ( d = first_descriptor; d; d = d->next )
            {
              CHAR_DATA *victim = d->original ? d->original : d->character;

              if ( d->connected != CON_PLAYING )
                continue;

              if ( !check_pilot(victim,ship) )
                continue;

              if ( !has_comlink( victim ) )
                continue;

              if ( !IS_NPC( victim ) && victim->switched
		   && !IS_SET(victim->switched->act, ACT_POLYMORPHED)
                   && !IS_AFFECTED(victim->switched, AFF_POSSESS) )
                continue;
              else if ( !IS_NPC( victim ) && victim->switched
                        && (IS_SET(victim->switched->act, ACT_POLYMORPHED)
                            || IS_AFFECTED(victim->switched, AFF_POSSESS) ) )
                victim = victim->switched;

              if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
                continue;

              if ( d->connected == CON_EDITING )
                continue;

              ch_printf(victim,"&R[alarm] %s has been picked!\r\n",ship->name);
            }
        }
      return;
    }

  ch_printf( ch, "You see no %s here.\r\n", arg );
}
