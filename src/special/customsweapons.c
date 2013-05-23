#include "character.h"
#include "mud.h"

bool spec_customs_weapons( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  OBJ_DATA  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IS_AWAKE(ch) || ch->position == POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( is_npc(victim) || victim->position == POS_FIGHTING )
        continue;

      if (  victim->pcdata && victim->pcdata->clan && !str_cmp(victim->pcdata->clan->name , ch->mob_clan) )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_WEAPON)
	    {
              if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                {
                  sprintf( buf , "Weapons are banned from non-military usage. I'm going to have to confiscate %s.", obj->short_descr );
                  do_say( ch , buf );
                  if ( obj->wear_loc != WEAR_NONE )
                    remove_obj( victim, obj->wear_loc, TRUE );
                  separate_obj( obj );
                  obj_from_char( obj );
                  act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = obj_to_char( obj, ch );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( get_level( victim, SMUGGLING_ABILITY ) + 1) - exp_level( get_level( victim, SMUGGLING_ABILITY ) ) ) );
                  ch_printf( victim, "You lose %ld experience.\r\n " , ch_exp );
                  gain_exp( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                  return TRUE;
                }
              else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( get_level( victim, SMUGGLING_ABILITY ) + 1) - exp_level( get_level( victim, SMUGGLING_ABILITY ) ) ) );
                  ch_printf( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp, obj->short_descr );
                  gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                  act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
              else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( get_level( victim, SMUGGLING_ABILITY ) + 1) - exp_level( get_level( victim, SMUGGLING_ABILITY ) ) ) );
                  ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , obj->short_descr);
                  gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content;

	      for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_WEAPON
                      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      ch_exp = UMIN( content->cost*10 , ( exp_level( get_level( victim, SMUGGLING_ABILITY ) + 1) - exp_level( get_level( victim, SMUGGLING_ABILITY ) ) ) );
                      ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n ",
				 ch_exp, content->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
        }

    }

  return FALSE;
}