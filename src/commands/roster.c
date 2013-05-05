#include "mud.h"

void do_roster( CHAR_DATA *ch, char *argument )
{
  if( IS_NPC( ch ) || !ch->pcdata->clan
      || ( str_cmp(ch->name, ch->pcdata->clan->leader )
           && str_cmp(ch->name, ch->pcdata->clan->number1 )
           && str_cmp(ch->name, ch->pcdata->clan->number2 )
           && (!ch->pcdata || !ch->pcdata->bestowments
               || !is_name("roster", ch->pcdata->bestowments)) ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  show_members( ch, ch->pcdata->clan->name, argument );
}
