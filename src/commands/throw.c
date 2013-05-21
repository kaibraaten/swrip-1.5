#include "mud.h"

void do_throw( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA        * obj;
  OBJ_DATA        * tmpobj;
  char              arg[MAX_INPUT_LENGTH];
  char              arg2[MAX_INPUT_LENGTH];
  char              arg3[MAX_INPUT_LENGTH];
  short            dir;
  EXIT_DATA       * pexit;
  ROOM_INDEX_DATA * was_in_room;
  ROOM_INDEX_DATA * to_room;
  CHAR_DATA       * victim;
  char              buf[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  was_in_room = ch->in_room;

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: throw <object> [direction] [target]\r\n", ch );
      return;
    }

  obj = get_eq_char( ch, WEAR_MISSILE_WIELD );

  if ( !obj || !nifty_is_name( arg, obj->name ) )
    obj = get_eq_char( ch, WEAR_HOLD );
  if ( !obj || !nifty_is_name( arg, obj->name ) )
    obj = get_eq_char( ch, WEAR_WIELD );
  if ( !obj || !nifty_is_name( arg, obj->name ) )
    obj = get_eq_char( ch, WEAR_DUAL_WIELD );
  if ( !obj || !nifty_is_name( arg, obj->name ) )
    if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
      obj = get_eq_char( ch, WEAR_HOLD );
  if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
    obj = get_eq_char( ch, WEAR_WIELD );
  if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
    obj = get_eq_char( ch, WEAR_DUAL_WIELD );
  if ( !obj || !nifty_is_name_prefix( arg, obj->name ) )
    {
      ch_printf( ch, "You don't seem to be holding or wielding %s.\r\n", arg );
      return;
    }

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      act( AT_PLAIN, "You can't throw $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      victim = who_fighting( ch );
      if ( char_died ( victim ) )
        return;
      act( AT_ACTION, "You throw $p at $N.", ch, obj, victim, TO_CHAR );
      act( AT_ACTION, "$n throws $p at $N.", ch, obj, victim, TO_NOTVICT );
      act( AT_ACTION, "$n throw $p at you.", ch, obj, victim, TO_VICT );
    }
  else if ( arg2[0] == '\0' )
    {
      sprintf( buf, "$n throws %s at the floor." , obj->short_descr );
      act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
      ch_printf( ch, "You throw %s at the floor.\r\n", obj->short_descr );

      victim = NULL;
    }
  else  if ( ( dir = get_dir( arg2 ) ) != -1 )
    {
      if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
	{
          send_to_char( "Are you expecting to throw it through a wall!?\r\n", ch );
          return;
        }


      if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
        {
          send_to_char( "Are you expecting to throw it  through a door!?\r\n", ch );
          return;
        }


      switch ( dir )
        {
        case 0:
        case 1:
          dir += 2;
          break;
        case 2:
        case 3:
          dir -= 2;
          break;
        case 4:
        case 7:
          dir += 1;
          break;
        case 5:
        case 8:
          dir -= 1;
          break;
        case 6:
          dir += 3;
          break;
        case 9:
          dir -=3;
          break;
        }

      to_room = NULL;
      if ( pexit->distance > 1 )
        to_room = generate_exit( ch->in_room , &pexit );

      if ( to_room == NULL )
        to_room = pexit->to_room;

      char_from_room( ch );
      char_to_room( ch, to_room );

      victim = get_char_room( ch, arg3 );

      if ( victim )
        {
          if ( is_safe( ch, victim ) )
            return;

          if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
            {
              act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
              return;
            }

          if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
            {
              send_to_char( "You feel too nice to do that!\r\n", ch );
              return;
            }

          char_from_room( ch );
          char_to_room( ch, was_in_room );


          if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
            {
              set_char_color( AT_MAGIC, ch );
              send_to_char( "You'll have to do that elswhere.\r\n", ch );
              return;
            }

          to_room = NULL;
          if ( pexit->distance > 1 )
            to_room = generate_exit( ch->in_room , &pexit );

          if ( to_room == NULL )
            to_room = pexit->to_room;

          char_from_room( ch );
          char_to_room( ch, to_room );

	  sprintf( buf , "Someone throws %s at you from the %s." , obj->short_descr , get_dir_name(dir) );
          act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
          act( AT_ACTION, "You throw %p at $N.", ch, obj, victim, TO_CHAR );
          sprintf( buf, "%s is thrown at $N from the %s." , obj->short_descr , get_dir_name(dir) );
          act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );


        }
      else
        {
          ch_printf( ch, "You throw %s %s.\r\n", obj->short_descr , get_dir_name(get_dir( arg2 ) ) );
          sprintf( buf, "%s is thrown from the %s." , obj->short_descr , get_dir_name(dir) );
          act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );

        }
    }
  else if ( ( victim = get_char_room( ch, arg2 ) ) != NULL )
    {
      if ( is_safe( ch, victim ) )
        return;

      if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( !IS_NPC( victim ) && IS_SET( ch->act, PLR_NICE ) )
        {
          send_to_char( "You feel too nice to do that!\r\n", ch );
          return;
        }

    }
  else
    {
      ch_printf( ch, "They don't seem to be here!\r\n");
      return;
    }


  if ( obj == get_eq_char( ch, WEAR_WIELD )
       && ( tmpobj = get_eq_char( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->wear_loc = WEAR_WIELD;

  unequip_char( ch, obj );
  separate_obj( obj );
  obj_from_char( obj );
  obj = obj_to_room( obj, ch->in_room );

  if ( obj->item_type != ITEM_GRENADE )
    damage_obj ( obj );

  /* NOT NEEDED UNLESS REFERING TO OBJECT AGAIN

     if( obj_extracted(obj) )
     return;
  */
  if ( ch->in_room !=  was_in_room )
    {
      char_from_room( ch );
      char_to_room( ch, was_in_room );
    }

  if ( !victim || char_died( victim ) )
    learn_from_failure( ch, gsn_throw );
  else
    {

      WAIT_STATE( ch, skill_table[gsn_throw]->beats );
      if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_throw] )
        {
          learn_from_success( ch, gsn_throw );
          global_retcode = damage( ch, victim, number_range( obj->weight*2 , (obj->weight*2 + ch->perm_str) ), TYPE_HIT );
        }
      else
        {
          learn_from_failure( ch, gsn_throw );
          global_retcode = damage( ch, victim, 0, TYPE_HIT );
        }

      if ( IS_NPC( victim ) && !char_died ( victim) )
        {
          if ( IS_SET( victim->act , ACT_SENTINEL ) )
            {
              victim->was_sentinel = victim->in_room;
              REMOVE_BIT( victim->act, ACT_SENTINEL );
            }

	  start_hating( victim , ch );
          start_hunting( victim, ch );
	}
    }
}
