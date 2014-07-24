#include "character.h"
#include "mud.h"

void do_drink( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int amount;
  int liquid;

  argument = one_argument( argument, arg );
  /* munch optional words */
  if ( !str_cmp( arg, "from" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
        if ( (obj->item_type == ITEM_FOUNTAIN)
             ||   (obj->item_type == ITEM_BLOOD) )
          break;

      if ( !obj )
        {
          send_to_char( "Drink what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = get_obj_here( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find it.\r\n", ch );
          return;
        }
    }

  if ( obj->count > 1 && obj->item_type != ITEM_FOUNTAIN )
    separate_obj(obj);

  if ( !is_npc(ch) && ch->pcdata->condition[COND_DRUNK] > 40 )
    {
      send_to_char( "You fail to reach your mouth.  *Hic*\r\n", ch );
      return;
    }

  switch ( obj->item_type )
    {
    default:
      if ( obj->carried_by == ch )
        {
          act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      else
        {
          act( AT_ACTION, "$n gets down and tries to drink from $p... (Is $e feeling ok?)", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You get down on the ground and try to drink from $p...", ch, obj, NULL, TO_CHAR );
        }
      break;

    case ITEM_POTION:
      if ( obj->carried_by == ch )
        do_quaff( ch, obj->name );
      else
        send_to_char( "You're not carrying that.\r\n", ch );
      break;

    case ITEM_FOUNTAIN:
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n drinks from the fountain.", ch, NULL, NULL, TO_ROOM );
	  send_to_char( "You take a long thirst quenching drink.\r\n", ch );
        }

      if ( !is_npc(ch) )
        ch->pcdata->condition[COND_THIRST] = 40;
      break;

    case ITEM_DRINK_CON:
      if ( obj->value[1] <= 0 )
        {
          send_to_char( "It is already empty.\r\n", ch );
          return;
        }

      if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
        {
          bug( "Do_drink: bad liquid number %d.", liquid );
          liquid = obj->value[2] = 0;
        }

      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n drinks $T from $p.",
               ch, obj, liq_table[liquid].liq_name, TO_ROOM );
          act( AT_ACTION, "You drink $T from $p.",
               ch, obj, liq_table[liquid].liq_name, TO_CHAR );
        }

      amount = 1; /* UMIN(amount, obj->value[1]); */
      /* what was this? concentrated drinks?  concentrated water
         too I suppose... sheesh! */

      gain_condition( ch, COND_DRUNK,
                      amount * liq_table[liquid].liq_affect[COND_DRUNK  ] );
      gain_condition( ch, COND_FULL,
                      amount * liq_table[liquid].liq_affect[COND_FULL   ] );
      gain_condition( ch, COND_THIRST,
                      amount * liq_table[liquid].liq_affect[COND_THIRST ] );

      if ( !is_npc(ch) )
        {
          if ( ch->pcdata->condition[COND_DRUNK]  > 24 )
            send_to_char( "You feel quite sloshed.\r\n", ch );
          else if ( ch->pcdata->condition[COND_DRUNK]  > 18 )
	    send_to_char( "You feel very drunk.\r\n", ch );
	  else if ( ch->pcdata->condition[COND_DRUNK]  > 12 )
	    send_to_char( "You feel drunk.\r\n", ch );
	  else if ( ch->pcdata->condition[COND_DRUNK]  > 8 )
	    send_to_char( "You feel a little drunk.\r\n", ch );
	  else if ( ch->pcdata->condition[COND_DRUNK]  > 5 )
	    send_to_char( "You feel light headed.\r\n", ch );

          if ( ch->pcdata->condition[COND_FULL]   > 40 )
            send_to_char( "You are full.\r\n", ch );

          if ( ch->pcdata->condition[COND_THIRST] > 40 )
            send_to_char( "You feel bloated.\r\n", ch );
          else if ( ch->pcdata->condition[COND_THIRST] > 36 )
	    send_to_char( "Your stomach is sloshing around.\r\n", ch );
	  else if ( ch->pcdata->condition[COND_THIRST] > 30 )
	    send_to_char( "You do not feel thirsty.\r\n", ch );
        }

      if ( obj->value[3] )
        {
          /* The drink was poisoned! */
          Affect af;

          act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          act( AT_POISON, "You sputter and gag.", ch, NULL, NULL, TO_CHAR );
          ch->mental_state = URANGE( 20, ch->mental_state + 5, 100 );
          af.type      = gsn_poison;
          af.duration  = 3 * obj->value[3];
          af.location  = APPLY_NONE;
          af.modifier  = 0;
          af.bitvector = AFF_POISON;
          affect_join( ch, &af );
        }

      obj->value[1] -= amount;
      break;
    }

  set_wait_state(ch, PULSE_PER_SECOND );
}

