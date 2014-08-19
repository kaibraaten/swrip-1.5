#include "character.h"
#include "mud.h"

void do_clanfunds( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      SendToCharacter("You don't seem to belong to an organization.\r\n",ch);
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

  if ( clan->funds == 0 )
    {
      ChPrintf(ch,"%s has no funds at its disposal.",clan->name);
      return;
    }

  ChPrintf(ch,"%s has %ld credits at its disposal.\r\n",clan->name,clan->funds);
}
