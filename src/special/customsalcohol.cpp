#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_customs_alcohol( Character *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( !IsAwake(ch) || ch->Position == POS_FIGHTING )
    return false;

  std::list<Character*> charactersToActOn(ch->InRoom->Characters());

  for(Character *victim : charactersToActOn)
    {
      if ( IsNpc(victim) || victim->Position == POS_FIGHTING )
        continue;

      for ( Object *obj = victim->LastCarrying; obj; obj = obj->PreviousContent )
        {
          if (obj->Prototype->ItemType == ITEM_DRINK_CON)
            {
              int liquid = 0;
              
              if ( ( liquid = obj->Value[2] ) >= LIQ_MAX )
                liquid = obj->Value[2] = 0;

              if ( LiquidTable[ liquid ].Affect[COND_DRUNK] > 0 )
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
                      long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel(victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You lose %ld experience. \r\n" , ch_exp );
                      GainXP( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                      return true;
                    }
                  else if ( CanSeeCharacter( ch, victim ) && !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                    {
                      long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->ShortDescr);
                      GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                      Act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                      Act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                      SetBit( obj->Flags , ITEM_CONTRABAND);
                      return true;
                    }
                  else if ( !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                    {
                      long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->ShortDescr);
                      GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                      SetBit( obj->Flags , ITEM_CONTRABAND);
                      return true;
                    }
                }
            }
          else if ( obj->ItemType == ITEM_CONTAINER )
            {
              for ( Object *content = obj->FirstContent; content; content = content->NextContent )
                {
                  if (content->Prototype->ItemType == ITEM_DRINK_CON
		      && !IsBitSet( content->Flags , ITEM_CONTRABAND ) )
                    {
                      int liquid = 0;
                      
                      if ( ( liquid = obj->Value[2] ) >= LIQ_MAX )
                        liquid = obj->Value[2] = 0;

                      if ( LiquidTable[ liquid ].Affect[COND_DRUNK] <= 0 )
                        continue;

                      long ch_exp = umin( content->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You receive %ld experience for smuggling %d.\r\n " , ch_exp , content->ShortDescr);
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
