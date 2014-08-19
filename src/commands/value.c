#include "character.h"
#include "shops.h"
#include "mud.h"

void do_value( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *keeper;
  Object *obj;
  int cost;

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Value what?\r\n", ch );
      return;
    }

  if ( ( keeper = FindKeeper( ch ) ) == NULL )
    return;

  if ( ( obj = GetCarriedObject( ch, argument ) ) == NULL )
    {
      act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      SendToCharacter( "You can't let go of it!\r\n", ch );
      return;
    }

  if ( ( cost = GetObjectCost( ch, keeper, obj, false ) ) <= 0 )
    {
      act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf, "$n tells you 'I'll give you %d credits for $p.'", cost );
  act( AT_TELL, buf, keeper, obj, ch, TO_VICT );
  ch->reply = keeper;
}
