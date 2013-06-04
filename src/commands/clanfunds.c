#include "character.h"
#include "mud.h"
#include "clan.h"

void do_clanfunds( CHAR_DATA *ch, char *argument )
{
  Clan *clan;

  if ( is_npc( ch ) || !is_clanned( ch ) )
    {
      send_to_char("You don't seem to belong to an organization.\r\n",ch);
      return;
    }

  if ( !has_comlink( ch ) )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
        {
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  clan = ch->pcdata->clan;

  if ( clan->funds == 0 )
    {
      ch_printf(ch,"%s has no funds at its disposal.",clan->name);
      return;
    }

  ch_printf(ch,"%s has %ld credits at its disposal.\r\n",clan->name,clan->funds);
}
