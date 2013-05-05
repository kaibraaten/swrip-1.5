#include "mud.h"

void do_clan_withdraw( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan = NULL;
  long amount = 0;

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "You don't seem to belong to an organization to withdraw funds from...\r\n",
		    ch );
      return;
    }

  if ( (ch->pcdata && ch->pcdata->bestowments
        && is_name("withdraw", ch->pcdata->bestowments))
       || !str_cmp( ch->name, ch->pcdata->clan->leader  ))
    {
      ;
    }
  else
    {
      send_to_char( "&RYour organization hasn't seen fit to bestow you with that ability." ,ch );
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
  amount = atoi( argument );

  if ( !amount )
    {
      send_to_char( "How much would you like to withdraw?\r\n", ch );
      return;
    }

  if ( amount > clan->funds )
    {
      ch_printf( ch,  "%s doesn't have that much!\r\n", clan->name );
      return;
    }

  if ( amount < 0 )
    {
      ch_printf( ch,  "Nice try...\r\n" );
      return;
    }

  ch_printf( ch,  "You withdraw %ld credits from %s's funds.\r\n", amount, clan->name );

  clan->funds -= amount;
  ch->gold += amount;
  save_clan ( clan );
}
