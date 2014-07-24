#include "character.h"
#include "mud.h"

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

  argument = one_argument(argument, arg);

  if (argument[0] == '\0' )
    {
      send_to_char( "Usage: Addbounty <target> <amount>\r\n", ch );
      return;
    }

  if ( ch->pcdata && ch->pcdata->clan
       && ( !str_cmp(ch->pcdata->clan->name, "the hunters guild")
            || !str_cmp(ch->pcdata->clan->name, "the assassins guild") ) )
    {
      send_to_char( "Your job is to collect bounties not post them.", ch );
      return;
    }

  if ( !ch->in_room || ch->in_room->vnum != 6604 )
    {
      send_to_char( "You will have to go to the Guild on Tatooine to add a new bounty.", ch );
      return;
    }

  if (argument[0] == '\0' )
    amount = 0;
  else
    amount = atoi (argument);

  if ( amount < 5000 )
    {
      send_to_char( "A bounty should be at least 5000 credits.\r\n", ch );
      return;
    }

  if ( !(victim = get_char_world( ch, arg )) )
    {
      send_to_char( "They don't appear to be here .. wait til they log in.\r\n", ch );
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "You can only set bounties on other players .. not mobs!\r\n", ch );
      return;
    }
  if ( victim->pcdata && victim->pcdata->clan
       && !str_cmp(victim->pcdata->clan->name, "the hunters guild"))
    {
      send_to_char( "&RYou can not post bounties on bounty hunters!\r\n", ch);
      return;
    }

  if (amount <= 0)
    {
      send_to_char( "Nice try! How about 1 or more credits instead...\r\n", ch );
      return;
    }

  if (ch->gold < amount)
    {
      send_to_char( "You don't have that many credits!\r\n", ch );
      return;
    }
  ch->gold = ch->gold - amount;

  disintegration( ch, victim, amount);
}
