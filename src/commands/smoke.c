#include "character.h"
#include "mud.h"

void do_smoke( Character *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Smoke what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = get_obj_carry( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      act( AT_ACTION, "You try to smoke $p... but it doesn't seem to work.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n tries to smoke $p... (I wonder what $e's been putting his $s pipe_obj?)", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( !IS_SET( pipe_obj->value[3], PIPE_LIT ) )
    {
      act( AT_ACTION, "You try to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n tries to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( pipe_obj->value[1] > 0 )
    {
      if ( !oprog_use_trigger( ch, pipe_obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "You draw thoughtfully from $p.", ch, pipe_obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n draws thoughtfully from $p.", ch, pipe_obj, NULL, TO_ROOM );
        }

      if ( IS_VALID_HERB( pipe_obj->value[2] ) && pipe_obj->value[2] < top_herb )
        {
          int sn                = pipe_obj->value[2] + TYPE_HERB;
          SKILLTYPE *skill      = get_skilltype( sn );

          set_wait_state( ch, skill->beats );
          if ( skill->spell_fun )
            obj_cast_spell( sn, UMIN(skill->min_level, ch->top_level),
                            ch, ch, NULL );
          if ( obj_extracted( pipe_obj ) )
            return;
        }
      else
        bug( "do_smoke: bad herb type %d", pipe_obj->value[2] );

      SET_BIT( pipe_obj->value[3], PIPE_HOT );
      if ( --pipe_obj->value[1] < 1 )
        {
          REMOVE_BIT( pipe_obj->value[3], PIPE_LIT );
          SET_BIT( pipe_obj->value[3], PIPE_DIRTY );
          SET_BIT( pipe_obj->value[3], PIPE_FULLOFASH );
        }
    }
}
