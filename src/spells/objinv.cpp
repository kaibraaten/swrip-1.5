#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

/*
 * Generic inventory object spell                               -Thoric
 */
ch_ret spell_obj_inv( int sn, int level, Character *ch, void *vo )
{
  Object *obj = (Object *) vo;
  Skill *skill = GetSkill(sn);

  if ( !obj )
    {
      FailedCasting( skill, ch, NULL, NULL );
      return rNONE;
    }

  switch( SPELL_ACTION(skill) )
    {
    default:
    case SA_NONE:
      return rNONE;

    case SA_CREATE:
      if ( SPELL_FLAG(skill, SF_WATER) )        /* create water */
        {
          int water;

          if ( obj->ItemType != ITEM_DRINK_CON )
            {
              SendToCharacter( "It is unable to hold water.\r\n", ch );
              return rSPELL_FAILED;
	    }

          if ( obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] != LIQ_WATER
	       && obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] != 0 )
            {
              SendToCharacter( "It contains some other liquid.\r\n", ch );
              return rSPELL_FAILED;
            }

          water = umin( (skill->Dice ? ParseDice(ch, level, skill->Dice) : level)
                        * (weather_info.Sky >= SKY_RAINING ? 2 : 1),
                        obj->Value[OVAL_DRINK_CON_CAPACITY] - obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] );

          if ( water > 0 )
            {
              SeparateOneObjectFromGroup(obj);
              obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = LIQ_WATER;
              obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] += water;

              if ( !IsName( "water", obj->Name ) )
                {
                  char buf[MAX_STRING_LENGTH];

                  sprintf( buf, "%s water", obj->Name );
                  FreeMemory( obj->Name );
                  obj->Name = CopyString( buf );
                }
            }
          SuccessfulCasting( skill, ch, NULL, obj );
          return rNONE;
        }
      if ( SPELL_DAMAGE(skill) == SD_FIRE )     /* burn object */
        {
          /* return rNONE; */
        }
      if ( SPELL_DAMAGE(skill) == SD_POISON     /* poison object */
           ||   SPELL_CLASS(skill)  == SC_DEATH )
        {
          switch( obj->ItemType )
            {
            default:
              FailedCasting( skill, ch, NULL, obj );
              break;
            case ITEM_FOOD:
            case ITEM_DRINK_CON:
              SeparateOneObjectFromGroup(obj);
              obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] = 1;
	      SuccessfulCasting( skill, ch, NULL, obj );
              break;
            }
          return rNONE;
        }
      if ( SPELL_CLASS(skill) == SC_LIFE        /* purify food/water */
           &&  (obj->ItemType == ITEM_FOOD || obj->ItemType == ITEM_DRINK_CON) )
        {
          switch( obj->ItemType )
            {
            default:
              FailedCasting( skill, ch, NULL, obj );
              break;
            case ITEM_FOOD:
            case ITEM_DRINK_CON:
              SeparateOneObjectFromGroup(obj);
              obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] = 0;
              SuccessfulCasting( skill, ch, NULL, obj );
              break;
            }
          return rNONE;
        }

      if ( SPELL_CLASS(skill) != SC_NONE )
        {
          FailedCasting( skill, ch, NULL, obj );
          return rNONE;
        }
      switch( SPELL_POWER(skill) )              /* clone object */
        {
          Object *clone;

        default:
        case SP_NONE:
          if ( obj->Cost > GetAbilityLevel( ch, FORCE_ABILITY ) * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              FailedCasting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
        case SP_MINOR:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->Level < 20
               || obj->Cost > GetAbilityLevel( ch, FORCE_ABILITY ) * GetCurrentIntelligence(ch) / 5 )
            {
              FailedCasting( skill, ch, NULL, obj );
	      return rNONE;
            }
          break;
        case SP_GREATER:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->Level < 5
               || obj->Cost > GetAbilityLevel( ch, FORCE_ABILITY ) * 10 * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              FailedCasting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
        case SP_MAJOR:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->Level < 0
               || obj->Cost > GetAbilityLevel( ch, FORCE_ABILITY ) * 50 * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              FailedCasting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
          clone = CopyObject(obj);
          clone->Timer = skill->Dice ? ParseDice(ch, level, skill->Dice) : 0;
          ObjectToCharacter( clone, ch );
          SuccessfulCasting( skill, ch, NULL, obj );
        }
      return rNONE;

    case SA_DESTROY:
    case SA_RESIST:
    case SA_SUSCEPT:
    case SA_DIVINATE:
      if ( SPELL_DAMAGE(skill) == SD_POISON ) /* detect poison */
        {
          if ( obj->ItemType == ITEM_DRINK_CON
               ||   obj->ItemType == ITEM_FOOD )
            {
              if ( obj->Value[OVAL_DRINK_CON_POISON_STRENGTH] != 0 )
                SendToCharacter( "You smell poisonous fumes.\r\n", ch );
              else
                SendToCharacter( "It looks very delicious.\r\n", ch );
            }
          else
            SendToCharacter( "It doesn't look poisoned.\r\n", ch );
          return rNONE;
        }
      return rNONE;
    case SA_OBSCURE:                    /* make obj invis */
      if ( IS_OBJ_STAT(obj, ITEM_INVIS)
           ||   Chance(ch, skill->Dice ? ParseDice(ch, level, skill->Dice) : 20))
        {
          FailedCasting( skill, ch, NULL, NULL );
          return rSPELL_FAILED;
        }
      SuccessfulCasting( skill, ch, NULL, obj );
      SetBit(obj->Flags, ITEM_INVIS);
      return rNONE;

    case SA_CHANGE:
      return rNONE;
    }
  return rNONE;
}
