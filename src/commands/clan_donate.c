#include "character.h"
#include "mud.h"

void do_clan_donate( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long amount = 0;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      SendToCharacter( "You don't seem to belong to an organization to donate to...\r\n", ch );
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->in_room || !IsBitSet(ch->in_room->room_flags, ROOM_BANK) )
        {
          SendToCharacter( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  clan = ch->pcdata->clan;
  amount = atoi( argument );

  if ( !amount )
    {
      SendToCharacter( "How much would you like to donate?\r\n", ch );
      return;
    }

  if ( amount < 0 )
    {
      ChPrintf( ch,  "Nice try...\r\n" );
      return;
    }

  if ( amount > ch->gold )
    {
      SendToCharacter( "You don't have that much!\r\n", ch );
      return;
    }

  ChPrintf( ch,  "You donate %ld credits to %s's funds.\r\n", amount, clan->name );

  clan->funds += amount;
  ch->gold -= amount;
  save_char_obj( ch );
}
