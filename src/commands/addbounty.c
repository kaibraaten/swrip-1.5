#include "character.h"
#include "mud.h"
#include "clan.h"
#include "bounty.h"

void do_addbounty( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  long amount = 0;
  Character *victim = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      do_bounties( ch , argument );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: Addbounty <target> <amount>\r\n", ch );
      return;
    }

  if ( IsClanned( ch )
       && ( !StrCmp(ch->PCData->ClanInfo.Clan->Name, "the hunters guild")
            || !StrCmp(ch->PCData->ClanInfo.Clan->Name, "the assassins guild") ) )
    {
      SendToCharacter( "Your job is to collect bounties not post them.", ch );
      return;
    }

  if ( !ch->InRoom || ch->InRoom->Vnum != ROOM_VNUM_PLACE_BOUNTY )
    {
      SendToCharacter( "You will have to go to the Guild on Tatooine to add a new bounty.", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    amount = 0;
  else
    amount = atoi (argument);

  if ( amount < 5000 )
    {
      SendToCharacter( "A bounty should be at least 5000 credits.\r\n", ch );
      return;
    }

  if ( !(victim = GetCharacterAnywhere( ch, arg )) )
    {
      SendToCharacter( "They don't appear to be here .. wait til they log in.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "You can only set bounties on other players .. not mobs!\r\n", ch );
      return;
    }
  if ( IsClanned( victim )
       && !StrCmp(victim->PCData->ClanInfo.Clan->Name, "the hunters guild"))
    {
      SendToCharacter( "&RYou can not post bounties on bounty hunters!\r\n", ch);
      return;
    }

  if (amount <= 0)
    {
      SendToCharacter( "Nice try! How about 1 or more credits instead...\r\n", ch );
      return;
    }

  if (ch->Gold < amount)
    {
      SendToCharacter( "You don't have that many credits!\r\n", ch );
      return;
    }
  ch->Gold = ch->Gold - amount;

  AddBounty( ch, victim, amount);
}
