#include "character.h"
#include "mud.h"
#include "clan.h"

void do_addbounty( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  long amount = 0;
  Character *victim = NULL;

  if ( !argument || argument[0] == '\0' )
    {
      do_bounties( ch , argument );
      return;
    }

  argument = OneArgument(argument, arg);

  if (argument[0] == '\0' )
    {
      SendToCharacter( "Usage: Addbounty <target> <amount>\r\n", ch );
      return;
    }

  if ( IsClanned( ch )
       && ( !StrCmp(ch->pcdata->ClanInfo.Clan->name, "the hunters guild")
            || !StrCmp(ch->pcdata->ClanInfo.Clan->name, "the assassins guild") ) )
    {
      SendToCharacter( "Your job is to collect bounties not post them.", ch );
      return;
    }

  if ( !ch->in_room || ch->in_room->vnum != 6604 )
    {
      SendToCharacter( "You will have to go to the Guild on Tatooine to add a new bounty.", ch );
      return;
    }

  if (argument[0] == '\0' )
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
       && !StrCmp(victim->pcdata->ClanInfo.Clan->name, "the hunters guild"))
    {
      SendToCharacter( "&RYou can not post bounties on bounty hunters!\r\n", ch);
      return;
    }

  if (amount <= 0)
    {
      SendToCharacter( "Nice try! How about 1 or more credits instead...\r\n", ch );
      return;
    }

  if (ch->gold < amount)
    {
      SendToCharacter( "You don't have that many credits!\r\n", ch );
      return;
    }
  ch->gold = ch->gold - amount;

  AddBounty( ch, victim, amount);
}
