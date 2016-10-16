#include "character.h"
#include "mud.h"

void do_quaff( Character *ch, char *argument )
{
  Object *obj;
  ch_ret retcode;

  if ( IsNullOrEmpty( argument ) || !StrCmp(argument, "") )
    {
      SendToCharacter( "Quaff what?\r\n", ch );
      return;
    }

  if ( (obj = FindObject(ch, argument, true)) == NULL )
    return;

  if ( obj->ItemType != ITEM_POTION )
    {
      if ( obj->ItemType == ITEM_DRINK_CON )
        do_drink( ch, obj->Name );
      else
        {
          Act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      return;
    }

  /*
   * Fullness checking                                  -Thoric
   */
  if ( !IsNpc(ch)
       && ( ch->PCData->Condition[COND_FULL] >= 48
            ||   ch->PCData->Condition[COND_THIRST] >= 48 ) )
    {
      SendToCharacter( "Your stomach cannot contain any more.\r\n", ch );
      return;
    }

  SeparateOneObjectFromGroup( obj );
  if ( obj->InObject )
    {
      Act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->InObject, TO_CHAR );
      Act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->InObject, TO_ROOM );
    }

  /*
   * If fighting, chance of dropping potion                     -Thoric
   */
  if ( ch->Fighting && GetRandomPercent() > (GetCurrentDexterity(ch) * 2 + 48) )
    {
      Act( AT_MAGIC, "$n accidentally drops $p and it smashes into a thousand fragments.", ch, obj, NULL, TO_ROOM );
      Act( AT_MAGIC, "Oops... $p gets knocked from your hands and smashes into pieces!", ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
        {
          Act( AT_ACTION, "$n quaffs $p.",  ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You quaff $p.", ch, obj, NULL, TO_CHAR );
        }

      SetWaitState( ch, PULSE_PER_SECOND/4 );

      GainCondition( ch, COND_THIRST, 1 );
      retcode = CastSpellWithObject( obj->Value[1], obj->Value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = CastSpellWithObject( obj->Value[2], obj->Value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = CastSpellWithObject( obj->Value[3], obj->Value[0], ch, ch, NULL );
    }

  if ( cur_obj == obj->Serial )
    global_objcode = rOBJ_QUAFFED;

  ExtractObject( obj );
}
