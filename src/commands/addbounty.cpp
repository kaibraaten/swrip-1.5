#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_addbounty( Character *ch, char *argument )
{
  const long MINIMUM_BOUNTY = 5000;
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
      ch->Echo( "Usage: Addbounty <target> <amount>\r\n" );
      return;
    }

  if ( IsClanned( ch )
       && IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name))
    {
      ch->Echo( "Your job is to collect bounties not post them." );
      return;
    }

  if ( !ch->InRoom || ch->InRoom->Vnum != ROOM_VNUM_PLACE_BOUNTY )
    {
      ch->Echo( "You will have to go to the Guild on Tatooine to add a new bounty." );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    amount = 0;
  else
    amount = atoi (argument);

  if ( amount < MINIMUM_BOUNTY )
    {
      ch->Echo("A bounty should be at least %ld credits.\r\n", MINIMUM_BOUNTY);
      return;
    }

  if ( !(victim = GetCharacterAnywhere( ch, arg )) )
    {
      ch->Echo( "They don't appear to be here... wait til they log in.\r\n" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "You can only set bounties on other players .. not mobs!\r\n" );
      return;
    }
  if ( IsClanned( victim )
       && !StrCmp(victim->PCData->ClanInfo.Clan->Name, "the hunters guild"))
    {
      ch->Echo( "&RYou can not post bounties on bounty.hppunters!\r\n" );
      return;
    }

  if (amount <= 0)
    {
      ch->Echo( "Nice try! How about 1 or more credits instead...\r\n" );
      return;
    }

  if (ch->Gold < amount)
    {
      ch->Echo( "You don't have that many credits!\r\n" );
      return;
    }

  ch->Gold = ch->Gold - amount;

  AddBounty( ch, victim, amount);
}

