#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"

void do_value( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *keeper;
  Object *obj;
  int cost;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Value what?\r\n", ch );
      return;
    }

  if ( ( keeper = FindKeeper( ch ) ) == NULL )
    return;

  if ( ( obj = GetCarriedObject( ch, argument ) ) == NULL )
    {
      Act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->Reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      SendToCharacter( "You can't let go of it!\r\n", ch );
      return;
    }

  if ( ( cost = GetObjectCost( ch, keeper, obj, false ) ) <= 0 )
    {
      Act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf, "$n tells you 'I'll give you %d credits for $p.'", cost );
  Act( AT_TELL, buf, keeper, obj, ch, TO_VICT );
  ch->Reply = keeper;
}
