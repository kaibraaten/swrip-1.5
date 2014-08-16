#include "mud.h"
#include "character.h"

void do_eat( Character *ch, char *argument )
{
  OBJ_DATA *obj;
  ch_ret retcode;
  int foodcond;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Eat what?\r\n", ch );
      return;
    }

  if ( IsNpc(ch) || ch->pcdata->condition[COND_FULL] > 5 )
    if ( ms_find_obj(ch) )
      return;

  if ( (obj = find_obj(ch, argument, true)) == NULL )
    return;

  if ( !IsImmortal(ch) )
    {
      if ( obj->item_type != ITEM_FOOD && obj->item_type != ITEM_PILL )
        {
          act( AT_ACTION, "$n starts to nibble on $p... ($e must really be hungry)",  ch, obj, NULL, TO_ROOM );
	  act( AT_ACTION, "You try to nibble on $p...", ch, obj, NULL, TO_CHAR );
          return;
        }

      if ( !IsNpc(ch) && ch->pcdata->condition[COND_FULL] > 40 )
        {
          send_to_char( "You are too full to eat more.\r\n", ch );
          return;
        }
    }

  /* required due to object grouping */
  separate_obj( obj );

  SetWaitState( ch, PULSE_PER_SECOND/2 );

  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }
  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( !obj->action_desc || obj->action_desc[0]=='\0' )
        {
          act( AT_ACTION, "$n eats $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You eat $p.", ch, obj, NULL, TO_CHAR );
        }
      else
        actiondesc( ch, obj, NULL );
    }

  switch ( obj->item_type )
    {

    case ITEM_FOOD:
      if ( obj->timer > 0 && obj->value[1] > 0 )
        foodcond = (obj->timer * 10) / obj->value[1];
      else
        foodcond = 10;

      if ( !IsNpc(ch) )
        {
          int condition = ch->pcdata->condition[COND_FULL];

          gain_condition( ch, COND_FULL, (obj->value[0] * foodcond) / 10 );

          if ( condition <= 1 && ch->pcdata->condition[COND_FULL] > 1 )
            send_to_char( "You are no longer hungry.\r\n", ch );
          else if ( ch->pcdata->condition[COND_FULL] > 40 )
            send_to_char( "You are full.\r\n", ch );
        }

      if (  obj->value[3] != 0
            ||   (foodcond < 4 && number_range( 0, foodcond + 1 ) == 0) )
        {
          /* The food was poisoned! */
          Affect af;

          if ( obj->value[3] != 0 )
            {
              act( AT_POISON, "$n chokes and gags.", ch, NULL, NULL, TO_ROOM );
              act( AT_POISON, "You choke and gag.", ch, NULL, NULL, TO_CHAR );
              ch->mental_state = urange( 20, ch->mental_state + 5, 100 );
            }
          else
            {
              act( AT_POISON, "$n gags on $p.", ch, obj, NULL, TO_ROOM );
              act( AT_POISON, "You gag on $p.", ch, obj, NULL, TO_CHAR );
              ch->mental_state = urange( 15, ch->mental_state + 5, 100 );
            }

          af.type      = gsn_poison;
          af.duration  = 2 * obj->value[0]
            * (obj->value[3] > 0 ? obj->value[3] : 1);
          af.location  = APPLY_NONE;
          af.modifier  = 0;
          af.bitvector = AFF_POISON;
          affect_join( ch, &af );
        }
      break;

    case ITEM_PILL:
      /* allow pills to fill you, if so desired */
      if ( !IsNpc(ch) && obj->value[4] )
        {
          int condition;

          condition = ch->pcdata->condition[COND_FULL];
          gain_condition( ch, COND_FULL, obj->value[4] );
	  if ( condition <= 1 && ch->pcdata->condition[COND_FULL] > 1 )
            send_to_char( "You are no longer hungry.\r\n", ch );
          else if ( ch->pcdata->condition[COND_FULL] > 40 )
            send_to_char( "You are full.\r\n", ch );
        }
      retcode = obj_cast_spell( obj->value[1], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[2], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[3], obj->value[0], ch, ch, NULL );
      break;
    }

  if ( obj->serial == cur_obj )
    global_objcode = rOBJ_EATEN;

  extract_obj( obj );
}
