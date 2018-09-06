#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

/*
 * Apply a salve/ointment                                       -Thoric
 */
void do_apply( Character *ch, std::string argument )
{
  Object *obj = nullptr;
  ch_ret retcode = rNONE;

  if ( argument.empty() )
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

  --obj->Value[OVAL_SALVE_DOSES];

  if ( !ObjProgUseTrigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( obj->ActionDescription.empty() )
        {
          Act( AT_ACTION, "$n rubs $p onto $s body.",  ch, obj, NULL, TO_ROOM );

          if ( obj->Value[OVAL_SALVE_MAX_DOSES] <= 0 )
            Act( AT_ACTION, "You apply the last of $p onto your body.", ch, obj, NULL, TO_CHAR );
          else
            Act( AT_ACTION, "You apply $p onto your body.", ch, obj, NULL, TO_CHAR );
        }
      else
        ActionDescription( ch, obj, NULL );
    }

  SetWaitState( ch, obj->Value[OVAL_SALVE_DELAY] );
  retcode = CastSpellWithObject( obj->Value[OVAL_SALVE_SPELL1],
                                 obj->Value[OVAL_SALVE_LEVEL], ch, ch, NULL );

  if ( retcode == rNONE )
    retcode = CastSpellWithObject( obj->Value[OVAL_SALVE_SPELL2],
                                   obj->Value[OVAL_SALVE_LEVEL], ch, ch, NULL );

  if ( !IsObjectExtracted(obj) && obj->Value[OVAL_SALVE_DOSES] <= 0 )
    ExtractObject( obj );
}

