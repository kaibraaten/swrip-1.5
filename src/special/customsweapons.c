#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_customs_weapons( Character *ch )
{
  Character *victim;
  Character *v_next;
  Object  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IsAwake(ch) || ch->position == POS_FIGHTING )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IsNpc(victim) || victim->position == POS_FIGHTING )
        continue;

      if ( IsClanned( victim ) && !StrCmp(victim->pcdata->ClanInfo.Clan->name, ch->mob_clan) )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->Prototype->item_type == ITEM_WEAPON)
	    {
              if ( victim != ch && CanSeeCharacter( ch, victim ) && CanSeeObject( ch,obj ) )
                {
                  sprintf( buf , "Weapons are banned from non-military usage. I'm going to have to confiscate %s.", obj->short_descr );
                  do_say( ch , buf );
                  if ( obj->wear_loc != WEAR_NONE )
                    RemoveObject( victim, obj->wear_loc, true );
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );
                  Act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = ObjectToCharacter( obj, ch );
                  SetBit( obj->extra_flags , ITEM_CONTRABAND);
                  ch_exp = umin( obj->cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  Echo( victim, "You lose %ld experience.\r\n " , ch_exp );
                  GainXP( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                  return true;
                }
              else if ( CanSeeCharacter( ch, victim ) && !IsBitSet( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = umin( obj->cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  Echo( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp, obj->short_descr );
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  Act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SetBit( obj->extra_flags , ITEM_CONTRABAND);
                  return true;
                }
              else if ( !IsBitSet( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = umin( obj->cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  Echo( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , obj->short_descr);
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  SetBit( obj->extra_flags , ITEM_CONTRABAND);
                  return true;
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              Object *content;

	      for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->Prototype->item_type == ITEM_WEAPON
                      && !IsBitSet( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      ch_exp = umin( content->cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      Echo( victim, "You receive %ld experience for smuggling %s.\r\n ",
				 ch_exp, content->short_descr);
                      GainXP( victim, SMUGGLING_ABILITY, ch_exp );
                      SetBit( content->extra_flags , ITEM_CONTRABAND);
                      return true;
                    }
                }
            }
        }

    }

  return false;
}
