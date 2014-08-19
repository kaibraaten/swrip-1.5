#include "character.h"
#include "mud.h"

/*
 * Generic inventory object spell                               -Thoric
 */
ch_ret spell_obj_inv( int sn, int level, Character *ch, void *vo )
{
  Object *obj = (Object *) vo;
  Skill *skill = get_skilltype(sn);

  if ( !obj )
    {
      failed_casting( skill, ch, NULL, NULL );
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

          if ( obj->item_type != ITEM_DRINK_CON )
            {
              SendToCharacter( "It is unable to hold water.\r\n", ch );
              return rSPELL_FAILED;
	    }

          if ( obj->value[2] != LIQ_WATER && obj->value[1] != 0 )
            {
              SendToCharacter( "It contains some other liquid.\r\n", ch );
              return rSPELL_FAILED;
            }

          water = umin( (skill->dice ? dice_parse(ch, level, skill->dice) : level)
                        * (weather_info.sky >= SKY_RAINING ? 2 : 1),
                        obj->value[0] - obj->value[1] );

          if ( water > 0 )
            {
              separate_obj(obj);
              obj->value[2] = LIQ_WATER;
              obj->value[1] += water;
              if ( !IsName( "water", obj->name ) )
                {
                  char buf[MAX_STRING_LENGTH];

                  sprintf( buf, "%s water", obj->name );
                  FreeMemory( obj->name );
                  obj->name = CopyString( buf );
                }
            }
          successful_casting( skill, ch, NULL, obj );
          return rNONE;
        }
      if ( SPELL_DAMAGE(skill) == SD_FIRE )     /* burn object */
        {
          /* return rNONE; */
        }
      if ( SPELL_DAMAGE(skill) == SD_POISON     /* poison object */
           ||   SPELL_CLASS(skill)  == SC_DEATH )
        {
          switch( obj->item_type )
            {
            default:
              failed_casting( skill, ch, NULL, obj );
              break;
            case ITEM_FOOD:
            case ITEM_DRINK_CON:
              separate_obj(obj);
              obj->value[3] = 1;
	      successful_casting( skill, ch, NULL, obj );
              break;
            }
          return rNONE;
        }
      if ( SPELL_CLASS(skill) == SC_LIFE        /* purify food/water */
           &&  (obj->item_type == ITEM_FOOD || obj->item_type == ITEM_DRINK_CON) )
        {
          switch( obj->item_type )
            {
            default:
              failed_casting( skill, ch, NULL, obj );
              break;
            case ITEM_FOOD:
            case ITEM_DRINK_CON:
              separate_obj(obj);
              obj->value[3] = 0;
              successful_casting( skill, ch, NULL, obj );
              break;
            }
          return rNONE;
        }

      if ( SPELL_CLASS(skill) != SC_NONE )
        {
          failed_casting( skill, ch, NULL, obj );
          return rNONE;
        }
      switch( SPELL_POWER(skill) )              /* clone object */
        {
          Object *clone;

        default:
        case SP_NONE:
          if ( obj->cost > GetAbilityLevel( ch, FORCE_ABILITY ) * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              failed_casting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
        case SP_MINOR:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->level < 20
               || obj->cost > GetAbilityLevel( ch, FORCE_ABILITY ) * GetCurrentIntelligence(ch) / 5 )
            {
              failed_casting( skill, ch, NULL, obj );
	      return rNONE;
            }
          break;
        case SP_GREATER:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->level < 5
               || obj->cost > GetAbilityLevel( ch, FORCE_ABILITY ) * 10 * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              failed_casting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
        case SP_MAJOR:
          if ( GetAbilityLevel( ch, FORCE_ABILITY ) - obj->level < 0
               || obj->cost > GetAbilityLevel( ch, FORCE_ABILITY ) * 50 * GetCurrentIntelligence(ch) * GetCurrentWisdom(ch) )
            {
              failed_casting( skill, ch, NULL, obj );
              return rNONE;
            }
          break;
          clone = clone_object(obj);
          clone->timer = skill->dice ? dice_parse(ch, level, skill->dice) : 0;
          ObjectToCharacter( clone, ch );
          successful_casting( skill, ch, NULL, obj );
        }
      return rNONE;

    case SA_DESTROY:
    case SA_RESIST:
    case SA_SUSCEPT:
    case SA_DIVINATE:
      if ( SPELL_DAMAGE(skill) == SD_POISON ) /* detect poison */
        {
          if ( obj->item_type == ITEM_DRINK_CON
               ||   obj->item_type == ITEM_FOOD )
            {
              if ( obj->value[3] != 0 )
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
           ||   chance(ch, skill->dice ? dice_parse(ch, level, skill->dice) : 20))
        {
          failed_casting( skill, ch, NULL, NULL );
          return rSPELL_FAILED;
        }
      successful_casting( skill, ch, NULL, obj );
      SetBit(obj->extra_flags, ITEM_INVIS);
      return rNONE;

    case SA_CHANGE:
      return rNONE;
    }
  return rNONE;
}
