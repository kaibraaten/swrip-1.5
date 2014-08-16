#include "character.h"
#include "mud.h"

void do_steal( Character *ch, char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  Character *victim, *mst;
  OBJ_DATA *obj , *obj_next;
  int percent, xp;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Steal what from whom?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "That's pointless.\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  set_wait_state( ch, skill_table[gsn_steal]->beats );
  percent  = number_percent( ) + ( is_awake(victim) ? 10 : -50 )
    - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 13)
    + TimesKilled( ch, victim )*7;

  if ( ( IS_SET( victim->immune, RIS_STEAL ) ) ||
       ( victim->position != POS_STUNNED && (victim->position == POS_FIGHTING
                                             ||   percent > ( IsNpc(ch) ? 90 : ch->pcdata->learned[gsn_steal] ) ) ) )
    {
      /*
       * Failure.
       */
      send_to_char( "Oops...\r\n", ch );
      act( AT_ACTION, "$n tried to steal from you!\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n tried to steal from $N.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if (IsNpc(victim))
	{
          sprintf( buf, "%s is a bloody thief!", ch->name );
          do_yell( victim, buf );
        }

      learn_from_failure( ch, gsn_steal );
      if ( !IsNpc(ch) )
        {
          if ( legal_loot( ch, victim ) )
            {
              if ( IsNpc(victim) )
                global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
            }
          else
            {
              /* log_string( buf ); */
              if ( IsNpc( ch ) )
                {
                  if ( (mst = ch->master) == NULL )
                    return;
                }
              else
                mst = ch;
              if ( IsNpc( mst ) )
                return;

            }
        }

      return;
    }

  if ( IsNpc(victim) )
    AddKill( ch, victim );  /* makes it harder to steal from same char */

  if ( !str_cmp( arg1, "credits"  )
       ||   !str_cmp( arg1, "credit" )
       ||   !str_cmp( arg1, "money"  ) )
    {
      int amount;

      amount = (int) (victim->gold * number_range(1, 10) / 100);
      if ( amount <= 0 )
        {
          send_to_char( "You couldn't get any credits.\r\n", ch );
	  learn_from_failure( ch, gsn_steal );
          return;
        }

      ch->gold     += amount;
      victim->gold -= amount;
      ch_printf( ch, "Aha!  You got %d credits.\r\n", amount );
      if ( !IsNpc(victim) || (ch->pcdata->learned[gsn_steal] < 50 ) )
        learn_from_success( ch, gsn_steal );

      if ( IsNpc( victim ) )
	{
	  xp = UMIN( amount*10 , ( exp_level( GetAbilityLevel(ch, SMUGGLING_ABILITY ) + 1 ) - exp_level( GetAbilityLevel(ch, SMUGGLING_ABILITY))  ) / 35  );
	  xp = UMIN( xp , xp_compute( ch, victim ) );
	  gain_exp( ch, SMUGGLING_ABILITY, xp );
	  ch_printf( ch, "&WYou gain %ld smuggling experience!\r\n", xp );
	}
      return;
    }

  if ( ( obj = GetCarriedItem( victim, arg1 ) ) == NULL )
    {
      if ( victim->position <= POS_SLEEPING )
        {
          if ( ( obj = GetWornItem( victim, arg1 ) ) != NULL )
            {
              if ( (obj_next=GetEquipmentOnCharacter(victim, obj->wear_loc)) != obj )
                {
                  ch_printf( ch, "They are wearing %s on top of %s.\r\n", obj_next->short_descr, obj->short_descr);
                  send_to_char( "You'll have to steal that first.\r\n", ch );
                  learn_from_failure( ch, gsn_steal );
                  return;
                }
              else
                UnequipCharacter( victim, obj );
            }
        }

      send_to_char( "You can't seem to find it.\r\n", ch );
      learn_from_failure( ch, gsn_steal );
      return;
    }

  if ( !can_drop_obj( ch, obj )
       ||   IS_OBJ_STAT(obj, ITEM_INVENTORY)
       ||        IS_OBJ_STAT(obj, ITEM_PROTOTYPE))
    {
      send_to_char( "You can't manage to pry it away.\r\n", ch );
      learn_from_failure( ch, gsn_steal );
      return;
    }

  if ( ch->carry_number + (get_obj_number(obj)/obj->count) > can_carry_n( ch ) )
    {
      send_to_char( "You have your hands full.\r\n", ch );
      learn_from_failure( ch, gsn_steal );
      return;
    }

  if ( ch->carry_weight + (get_obj_weight(obj)/obj->count) > can_carry_w( ch ) )
    {
      send_to_char( "You can't carry that much weight.\r\n", ch );
      learn_from_failure( ch, gsn_steal );
      return;
    }

  send_to_char( "Ok.\r\n", ch );
  if ( IsNpc(victim)  || ch->pcdata->learned[gsn_steal] )
    learn_from_success( ch, gsn_steal );
  if ( IsNpc( victim ) )
    {
      xp = UMIN( obj->cost*10 , ( exp_level( GetAbilityLevel(ch, SMUGGLING_ABILITY) + 1) - exp_level( GetAbilityLevel( ch, SMUGGLING_ABILITY) ) ) / 10  );
      xp = UMIN( xp , xp_compute( ch, victim ) );
      gain_exp( ch, SMUGGLING_ABILITY, xp );
      ch_printf( ch, "&WYou gain %ld smuggling experience!\r\n", xp );
    }
  separate_obj( obj );
  obj_from_char( obj );
  obj_to_char( obj, ch );
}
