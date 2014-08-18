#include "character.h"
#include "mud.h"

void do_roster( Character *ch, char *argument )
{
  if( IsNpc( ch ) || !ch->pcdata->clan
      || ( StrCmp(ch->name, ch->pcdata->clan->leadership.leader )
           && StrCmp(ch->name, ch->pcdata->clan->leadership.number1 )
           && StrCmp(ch->name, ch->pcdata->clan->leadership.number2 )
           && (!ch->pcdata || !ch->pcdata->bestowments
               || !IsName("roster", ch->pcdata->bestowments)) ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  ShowClanMembers( ch, ch->pcdata->clan->name, argument );
}
