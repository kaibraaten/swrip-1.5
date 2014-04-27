#include "character.h"
#include "mud.h"

void do_clan_donate( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan = NULL;
  long amount = 0;

  if ( is_npc( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "You don't seem to belong to an organization to donate to...\r\n", ch );
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
      send_to_char( "How much would you like to donate?\r\n", ch );
      return;
    }

  if ( amount < 0 )
    {
      ch_printf( ch,  "Nice try...\r\n" );
      return;
    }

  if ( amount > ch->gold )
    {
      send_to_char( "You don't have that much!\r\n", ch );
      return;
    }

  ch_printf( ch,  "You donate %ld credits to %s's funds.\r\n", amount, clan->name );

  clan->funds += amount;
  ch->gold -= amount;
  save_char_obj( ch );
}
