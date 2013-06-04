#include "character.h"
#include "mud.h"
#include "clan.h"

void do_roster( Character *ch, char *argument )
{
  if( is_npc( ch ) || !is_clanned( ch )
      || ( str_cmp(ch->name, ch->pcdata->clan->leadership.leader )
           && str_cmp(ch->name, ch->pcdata->clan->leadership.number1 )
           && str_cmp(ch->name, ch->pcdata->clan->leadership.number2 )
           && (!ch->pcdata || !ch->pcdata->bestowments
               || !is_name("roster", ch->pcdata->bestowments)) ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  ShowMembers( ch, ch->pcdata->clan->name, argument );
}
