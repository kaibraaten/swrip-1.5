#include "character.h"
#include "mud.h"

bool spec_customs_alcohol( Character *ch )
{
  Character *victim;
  Character *v_next;
  Object  *obj;
  char       buf[MAX_STRING_LENGTH];
  int        liquid;
  long       ch_exp;

  if ( !IsAwake(ch) || ch->position == POS_FIGHTING )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IsNpc(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->Prototype->item_type == ITEM_DRINK_CON)
            {
              if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
                liquid = obj->value[2] = 0;

              if ( LiquidTable[ liquid ].liq_affect[COND_DRUNK] > 0 )
                {
                  if ( victim != ch && CanSeeCharacter( ch, victim ) && CanSeeObject( ch,obj ) )
                    {
                      sprintf( buf , "%s is illegal contraband. I'm going to have to confiscate that.", obj->short_descr );
		      do_say( ch , buf );

                      if ( obj->wear_loc != WEAR_NONE )
                        RemoveObject( victim, obj->wear_loc, true );

                      separate_obj( obj );
                      obj_from_char( obj );
                      act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                      obj = obj_to_char( obj, ch );
                      SetBit( obj->extra_flags , ITEM_CONTRABAND);
                      ch_exp = umin( obj->cost*10 , ( exp_level( GetAbilityLevel(victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ChPrintf( victim, "You lose %ld experience. \r\n" , ch_exp );
                      gain_exp( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                      return true;
                    }
                  else if ( CanSeeCharacter( ch, victim ) && !IsBitSet( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      ch_exp = umin( obj->cost*10 , ( exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ChPrintf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                      act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                      SetBit( obj->extra_flags , ITEM_CONTRABAND);
                      return true;
                    }
                  else if ( !IsBitSet( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      ch_exp = umin( obj->cost*10 , ( exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ChPrintf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );

                      SetBit( obj->extra_flags , ITEM_CONTRABAND);
                      return true;
                    }
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              Object *content;
              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->Prototype->item_type == ITEM_DRINK_CON
		      && !IsBitSet( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
                        liquid = obj->value[2] = 0;
                      if ( LiquidTable[ liquid ].liq_affect[COND_DRUNK] <= 0 )
                        continue;
                      ch_exp = umin( content->cost*10 , ( exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - exp_level( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      ChPrintf( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp , content->short_descr);
                      gain_exp( victim, SMUGGLING_ABILITY, ch_exp );
                      SetBit( content->extra_flags , ITEM_CONTRABAND);
                      return true;
                    }
                }
            }
        }

    }

  return false;
}
