#include "mud.h"
#include "character.h"

void do_zap( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *wand;
  OBJ_DATA *obj;
  ch_ret retcode;

  one_argument( argument, arg );
  if ( arg[0] == '\0' && !ch->fighting )
    {
      send_to_char( "Zap whom or what?\r\n", ch );
      return;
    }

  if ( ( wand = get_eq_char( ch, WEAR_HOLD ) ) == NULL )
    {
      send_to_char( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( wand->item_type != ITEM_WAND )
    {
      send_to_char( "You can zap only with a wand.\r\n", ch );
      return;
    }

  obj = NULL;

  if ( arg[0] == '\0' )
    {
      if ( ch->fighting )
        {
          victim = who_fighting( ch );
        }
      else
        {
          send_to_char( "Zap whom or what?\r\n", ch );
          return;
	}
    }
  else
    {
      if ( ( victim = get_char_room ( ch, arg ) ) == NULL
           && ( obj = get_obj_here  ( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find it.\r\n", ch );
          return;
        }
    }

  set_wait_state( ch, 1 * PULSE_VIOLENCE );

  if ( wand->value[2] > 0 )
    {
      if ( victim )
        {
          if ( !oprog_use_trigger( ch, wand, victim, NULL, NULL ) )
            {
              act( AT_MAGIC, "$n aims $p at $N.", ch, wand, victim, TO_ROOM );
              act( AT_MAGIC, "You aim $p at $N.", ch, wand, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !oprog_use_trigger( ch, wand, NULL, obj, NULL ) )
            {
              act( AT_MAGIC, "$n aims $p at $P.", ch, wand, obj, TO_ROOM );
              act( AT_MAGIC, "You aim $p at $P.", ch, wand, obj, TO_CHAR );
            }
        }

      retcode = obj_cast_spell( wand->value[3], wand->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          bug( "do_zap: char died", 0 );
          return;
        }
    }

  if ( --wand->value[2] <= 0 )
    {
      act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_ROOM );
      act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_CHAR );
      if ( wand->serial == cur_obj )
        global_objcode = rOBJ_USED;
      extract_obj( wand );
    }
}
