#include "mud.h"
#include "character.h"

void do_zap( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Object *wand;
  Object *obj;
  ch_ret retcode;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' && !ch->fighting )
    {
      SendToCharacter( "Zap whom or what?\r\n", ch );
      return;
    }

  if ( ( wand = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL )
    {
      SendToCharacter( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( wand->item_type != ITEM_WAND )
    {
      SendToCharacter( "You can zap only with a wand.\r\n", ch );
      return;
    }

  obj = NULL;

  if ( arg[0] == '\0' )
    {
      if ( ch->fighting )
        {
          victim = GetFightingOpponent( ch );
        }
      else
        {
          SendToCharacter( "Zap whom or what?\r\n", ch );
          return;
	}
    }
  else
    {
      if ( ( victim = GetCharacterInRoom ( ch, arg ) ) == NULL
           && ( obj = GetObjectHere  ( ch, arg ) ) == NULL )
        {
          SendToCharacter( "You can't find it.\r\n", ch );
          return;
        }
    }

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( wand->value[2] > 0 )
    {
      if ( victim )
        {
          if ( !oprog_use_trigger( ch, wand, victim, NULL, NULL ) )
            {
              Act( AT_MAGIC, "$n aims $p at $N.", ch, wand, victim, TO_ROOM );
              Act( AT_MAGIC, "You aim $p at $N.", ch, wand, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !oprog_use_trigger( ch, wand, NULL, obj, NULL ) )
            {
              Act( AT_MAGIC, "$n aims $p at $P.", ch, wand, obj, TO_ROOM );
              Act( AT_MAGIC, "You aim $p at $P.", ch, wand, obj, TO_CHAR );
            }
        }

      retcode = obj_cast_spell( wand->value[3], wand->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          Bug( "do_zap: char died", 0 );
          return;
        }
    }

  if ( --wand->value[2] <= 0 )
    {
      Act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_ROOM );
      Act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_CHAR );
      if ( wand->serial == cur_obj )
        global_objcode = rOBJ_USED;
      ExtractObject( wand );
    }
}
