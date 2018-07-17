#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_clanfunds( Character *ch, char *argument )
{
  if ( !IsClanned( ch ) )
    {
      SendToCharacter("You don't seem to belong to an organization.\r\n",ch);
      return;
    }

  if ( !HasComlink( ch ) )
    {
      if (!ch->InRoom || !IsBitSet(ch->InRoom->Flags, ROOM_BANK) )
        {
          SendToCharacter( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  const Clan *clan = ch->PCData->ClanInfo.Clan;

  if ( clan->Funds == 0 )
    {
      Echo(ch,"%s has no funds at its disposal.",clan->Name);
      return;
    }

  Echo(ch,"%s has %ld credits at its disposal.\r\n",clan->Name, clan->Funds);
}
