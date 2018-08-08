#include "mud.hpp"
#include "character.hpp"

/*
 * Apply a salve/ointment                                       -Thoric
 */
void do_apply( Character *ch, char *argument )
{
  Object *obj = nullptr;
  ch_ret retcode = rNONE;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Apply what?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( obj = GetCarriedObject( ch, argument ) ) == NULL )
    {
      ch->Echo( "You do not have that.\r\n" );
      return;
    }

  if ( obj->ItemType != ITEM_SALVE )
    {
      Act( AT_ACTION, "$n starts to rub $p on $mself...",  ch, obj, NULL, TO_ROOM );
      Act( AT_ACTION, "You try to rub $p on yourself...", ch, obj, NULL, TO_CHAR );
      return;
    }

  SeparateOneObjectFromGroup( obj );

  --obj->Value[1];
  if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( IsNullOrEmpty( obj->ActionDescription ) )
        {
          Act( AT_ACTION, "$n rubs $p onto $s body.",  ch, obj, NULL, TO_ROOM );
          if ( obj->Value[1] <= 0 )
            Act( AT_ACTION, "You apply the last of $p onto your body.", ch, obj, NULL, TO_CHAR );
          else
            Act( AT_ACTION, "You apply $p onto your body.", ch, obj, NULL, TO_CHAR );
        }
      else
        ActionDescription( ch, obj, NULL );
    }

  SetWaitState( ch, obj->Value[2] );
  retcode = CastSpellWithObject( obj->Value[4], obj->Value[0], ch, ch, NULL );

  if ( retcode == rNONE )
    retcode = CastSpellWithObject( obj->Value[5], obj->Value[0], ch, ch, NULL );

  if ( !IsObjectExtracted(obj) && obj->Value[1] <= 0 )
    ExtractObject( obj );
}

