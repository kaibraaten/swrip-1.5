#include "character.hpp"
#include "mud.hpp"

bool spec_customs_spice( Character *ch )
{
  Character *victim;
  Character *v_next;
  Object  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IsAwake(ch) || ch->Position == POS_FIGHTING )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;

      if ( IsNpc(victim) || victim->Position == POS_FIGHTING )
        continue;

      for ( obj = victim->LastCarrying; obj; obj = obj->PreviousContent )
        {
          if (obj->Prototype->ItemType == ITEM_SPICE || obj->Prototype->ItemType  == ITEM_RAWSPICE)
            {
              if ( victim != ch && CanSeeCharacter( ch, victim ) && CanSeeObject( ch,obj ) )
                {
                  sprintf( buf , "%s is illegal contraband. I'm going to have to confiscate that.", obj->ShortDescr );
		  do_say( ch , buf );
                  if ( obj->WearLoc != WEAR_NONE )
                    RemoveObject( victim, obj->WearLoc, true );
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );
                  Act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = ObjectToCharacter( obj, ch );
                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You lose %ld experience. \r\n" , ch_exp );
                  GainXP( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                  return true;
                }
              else if ( CanSeeCharacter( ch, victim ) && !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You receive %ld experience for smuggling %s. \r\n", ch_exp, obj->ShortDescr);
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  Act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  return true;
                }
              else if ( !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You receive %ld experience for smuggling %s. \r\n" , ch_exp , obj->ShortDescr);
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  return true;
                }
            }
          else if ( obj->ItemType == ITEM_CONTAINER )
            {
              Object *content;
              for ( content = obj->FirstContent; content; content = content->NextContent )
                {
                  if (content->Prototype->ItemType == ITEM_SPICE
                      && !IsBitSet( content->Flags , ITEM_CONTRABAND ) )
		    {
                      ch_exp = umin( content->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You receive %ld experience for smuggling %s.\r\n " , ch_exp , content->ShortDescr);
                      GainXP( victim, SMUGGLING_ABILITY, ch_exp );
                      SetBit( content->Flags , ITEM_CONTRABAND);
                      return true;
                    }
                }
            }
        }

    }

  return false;
}

