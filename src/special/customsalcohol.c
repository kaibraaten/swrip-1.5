#include "character.h"
#include "mud.h"

bool spec_customs_alcohol( Character *ch )
{
  CerisListIterator *peopleIterator = NULL;

  if ( !is_awake(ch) || ch->position == POS_FIGHTING )
    {
      return FALSE;
    }

  peopleIterator = CreateListIterator( ch->in_room->People, ForwardsIterator );

  for( ; !ListIterator_IsDone( peopleIterator ); ListIterator_Next( peopleIterator ) )
    {
      Character *victim = (Character*) ListIterator_GetData( peopleIterator );
      OBJ_DATA *obj = NULL;

      if ( IsNpc(victim) || victim->position == POS_FIGHTING )
	{
	  continue;
	}

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_DRINK_CON)
            {
	      int liquid = obj->value[2];

              if ( liquid >= LIQ_MAX )
		{
		  liquid = obj->value[2] = 0;
		}

              if ( liq_table[ liquid ].liq_affect[COND_DRUNK] > 0 )
                {
                  if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                    {
		      char buf[MAX_STRING_LENGTH];
		      long ch_exp = 0;

                      sprintf( buf, "%s is illegal contraband. I'm going to have to confiscate that.", obj->short_descr );
		      do_say( ch , buf );

                      if ( obj->wear_loc != WEAR_NONE )
			{
			  remove_obj( victim, obj->wear_loc, TRUE );
			}

                      separate_obj( obj );
                      obj_from_char( obj );
                      act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                      obj = obj_to_char( obj, ch );
                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                      ch_exp = UMIN( obj->cost*10 , ( exp_level( GetLevel(victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ch_printf( victim, "You lose %ld experience. \r\n" , ch_exp );
                      gain_exp( victim, SMUGGLING_ABILITY, 0 - ch_exp );
		      DestroyListIterator( peopleIterator );
                      return TRUE;
                    }
                  else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      long ch_exp = UMIN( obj->cost*10 , ( exp_level( GetLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ch_printf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                      act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
		      DestroyListIterator( peopleIterator );
                      return TRUE;
                    }
                  else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      long ch_exp = UMIN( obj->cost*10 , ( exp_level( GetLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ch_printf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
		      DestroyListIterator( peopleIterator );
                      return TRUE;
                    }
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content = NULL;

              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_DRINK_CON
		      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
		      int liquid = obj->value[2];
		      long ch_exp = 0;

                      if ( liquid >= LIQ_MAX )
			{
			  liquid = obj->value[2] = 0;
			}

                      if ( liq_table[ liquid ].liq_affect[COND_DRUNK] <= 0 )
			{
			  continue;
			}

                      ch_exp = UMIN( content->cost*10 , ( exp_level( GetLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ch_printf( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp , content->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
		      DestroyListIterator( peopleIterator );
                      return TRUE;
                    }
                }
            }
        }
    }

  DestroyListIterator( peopleIterator );
  return FALSE;
}
