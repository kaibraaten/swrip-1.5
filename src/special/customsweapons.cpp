#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

bool spec_customs_weapons( Character *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( !IsAwake(ch) || ch->Position == POS_FIGHTING )
    return false;

  std::list<Character*> charactersToActOn(ch->InRoom->Characters());

  for(Character *victim : charactersToActOn)
    {
      if ( IsNpc(victim) || victim->Position == POS_FIGHTING )
        continue;

      if ( IsClanned( victim ) && !StrCmp(victim->PCData->ClanInfo.Clan->Name, ch->MobClan) )
        continue;

      for ( Object *obj : Reverse(victim->Objects()))
        {
          if (obj->Prototype->ItemType == ITEM_WEAPON)
	    {
              if ( victim != ch && CanSeeCharacter( ch, victim ) && CanSeeObject( ch,obj ) )
                {
                  sprintf( buf , "Weapons are banned from non-military usage. I'm going to have to confiscate %s.", obj->ShortDescr );
                  do_say( ch , buf );
                  if ( obj->WearLoc != WEAR_NONE )
                    RemoveObject( victim, obj->WearLoc, true );
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );
                  Act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = ObjectToCharacter( obj, ch );
                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You lose %ld experience.\r\n " , ch_exp );
                  GainXP( victim, SMUGGLING_ABILITY, 0 - ch_exp );
                  return true;
                }
              else if ( CanSeeCharacter( ch, victim ) && !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                {
                  long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You receive %ld experience for smuggling %d.\r\n " , ch_exp, obj->ShortDescr );
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  Act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  Act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  return true;
                }
              else if ( !IsBitSet( obj->Flags , ITEM_CONTRABAND)  )
                {
                  long ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                  victim->Echo("You receive %ld experience for smuggling %s.\r\n " , ch_exp , obj->ShortDescr);
                  GainXP( victim, SMUGGLING_ABILITY, ch_exp );

                  SetBit( obj->Flags , ITEM_CONTRABAND);
                  return true;
                }
            }
          else if ( obj->ItemType == ITEM_CONTAINER )
            {
	      for ( Object *content : obj->Objects() )
                {
                  if (content->Prototype->ItemType == ITEM_WEAPON
                      && !IsBitSet( content->Flags , ITEM_CONTRABAND ) )
                    {
                      long ch_exp = umin( content->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( victim, SMUGGLING_ABILITY ) ) ) );
                      victim->Echo("You receive %ld experience for smuggling %s.\r\n ",
				 ch_exp, content->ShortDescr);
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

