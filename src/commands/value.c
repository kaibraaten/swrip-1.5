#include "shops.h"
#include "mud.h"

void do_value( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *keeper;
  OBJ_DATA *obj;
  int cost;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Value what?\r\n", ch );
      return;
    }

  if ( ( keeper = find_keeper( ch ) ) == NULL )
    return;

  if ( ( obj = get_obj_carry( ch, argument ) ) == NULL )
    {
      act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  if ( !can_drop_obj( ch, obj ) )
    {
      send_to_char( "You can't let go of it!\r\n", ch );
      return;
    }

  if ( ( cost = get_cost( ch, keeper, obj, FALSE ) ) <= 0 )
    {
      act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf, "$n tells you 'I'll give you %d credits for $p.'", cost );
  act( AT_TELL, buf, keeper, obj, ch, TO_VICT );
  ch->reply = keeper;
}
