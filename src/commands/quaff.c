#include "character.h"
#include "mud.h"

void do_quaff( Character *ch, char *argument )
{
  Object *obj;
  ch_ret retcode;

  if ( argument[0] == '\0' || !StrCmp(argument, "") )
    {
      SendToCharacter( "Quaff what?\r\n", ch );
      return;
    }

  if ( (obj = find_obj(ch, argument, true)) == NULL )
    return;

  if ( obj->item_type != ITEM_POTION )
    {
      if ( obj->item_type == ITEM_DRINK_CON )
        do_drink( ch, obj->name );
      else
        {
          act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      return;
    }

  /*
   * Fullness checking                                  -Thoric
   */
  if ( !IsNpc(ch)
       && ( ch->pcdata->condition[COND_FULL] >= 48
            ||   ch->pcdata->condition[COND_THIRST] >= 48 ) )
    {
      SendToCharacter( "Your stomach cannot contain any more.\r\n", ch );
      return;
    }

  separate_obj( obj );
  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }

  /*
   * If fighting, chance of dropping potion                     -Thoric
   */
  if ( ch->fighting && GetRandomPercent( ) > (GetCurrentDexterity(ch) * 2 + 48) )
    {
      act( AT_MAGIC, "$n accidentally drops $p and it smashes into a thousand fragments.", ch, obj, NULL, TO_ROOM );
      act( AT_MAGIC, "Oops... $p gets knocked from your hands and smashes into pieces!", ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n quaffs $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You quaff $p.", ch, obj, NULL, TO_CHAR );
        }

      SetWaitState( ch, PULSE_PER_SECOND/4 );

      gain_condition( ch, COND_THIRST, 1 );
      retcode = obj_cast_spell( obj->value[1], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[2], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[3], obj->value[0], ch, ch, NULL );
    }

  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_QUAFFED;

  extract_obj( obj );
}
