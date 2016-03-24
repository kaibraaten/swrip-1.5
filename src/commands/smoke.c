#include "character.h"
#include "mud.h"
#include "skill.h"

void do_smoke( Character *ch, char *argument )
{
  Object *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Smoke what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      SendToCharacter( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      Act( AT_ACTION, "You try to smoke $p... but it doesn't seem to work.", ch, pipe_obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n tries to smoke $p... (I wonder what $e's been putting his $s pipe_obj?)", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( !IsBitSet( pipe_obj->value[3], PIPE_LIT ) )
    {
      Act( AT_ACTION, "You try to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n tries to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( pipe_obj->value[1] > 0 )
    {
      if ( !ObjProgUseTrigger( ch, pipe_obj, NULL, NULL, NULL ) )
        {
          Act( AT_ACTION, "You draw thoughtfully from $p.", ch, pipe_obj, NULL, TO_CHAR );
          Act( AT_ACTION, "$n draws thoughtfully from $p.", ch, pipe_obj, NULL, TO_ROOM );
        }

      if ( IS_VALID_HERB( pipe_obj->value[2] ) && pipe_obj->value[2] < TopHerb )
        {
          int sn                = pipe_obj->value[2] + TYPE_HERB;
          Skill *skill      = GetSkill( sn );

          SetWaitState( ch, skill->beats );
          if ( skill->spell_fun )
            CastSpellWithObject( sn, umin(skill->min_level, ch->top_level),
                            ch, ch, NULL );
          if ( IsObjectExtracted( pipe_obj ) )
            return;
        }
      else
        Bug( "do_smoke: bad herb type %d", pipe_obj->value[2] );

      SetBit( pipe_obj->value[3], PIPE_HOT );
      if ( --pipe_obj->value[1] < 1 )
        {
          RemoveBit( pipe_obj->value[3], PIPE_LIT );
          SetBit( pipe_obj->value[3], PIPE_DIRTY );
          SetBit( pipe_obj->value[3], PIPE_FULLOFASH );
        }
    }
}
