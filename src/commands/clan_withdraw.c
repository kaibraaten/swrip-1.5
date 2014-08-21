#include "character.h"
#include "mud.h"

void do_clan_withdraw( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long amount = 0;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      SendToCharacter( "You don't seem to belong to an organization to withdraw funds from...\r\n",
		    ch );
      return;
    }

  if ( (ch->pcdata && ch->pcdata->bestowments
        && IsName("withdraw", ch->pcdata->bestowments))
       || !StrCmp( ch->name, ch->pcdata->clan->leadership.leader  ))
    {
      ;
    }
  else
    {
      SendToCharacter( "&RYour organization hasn't seen fit to bestow you with that ability." ,ch );
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
      SendToCharacter( "How much would you like to withdraw?\r\n", ch );
      return;
    }

  if ( amount > clan->funds )
    {
      Echo( ch,  "%s doesn't have that much!\r\n", clan->name );
      return;
    }

  if ( amount < 0 )
    {
      Echo( ch,  "Nice try...\r\n" );
      return;
    }

  Echo( ch,  "You withdraw %ld credits from %s's funds.\r\n", amount, clan->name );

  clan->funds -= amount;
  ch->gold += amount;
  SaveClan ( clan );
}
