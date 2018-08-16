#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_addsalary( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  Clan *clan = ch->PCData->ClanInfo.Clan;

  if ( (ch->PCData && ch->PCData->Bestowments
        && IsName("salary", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  ) )
    ;
  else
    {
      ch->Echo( "You clan hasn't seen fit to bestow that ability to you!\r\n" );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  int salary = atoi(arg2);

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Assign a salary to whom?\r\n" );
      return;
    }

  Character *victim = GetCharacterAnywhere( ch, arg );
  
  if ( victim == nullptr )
    {
      ch->Echo( "That player is not here.\r\n" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "Not on NPC's.\r\n" );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "Nice try.\r\n" );
      return;
    }

  if ( victim->PCData->ClanInfo.Clan != ch->PCData->ClanInfo.Clan )
    {
      ch->Echo( "This player does not belong to your clan!\r\n" );
      return;
    }

  if ( salary < 0 )
    {
      ch->Echo( "Salary must be positive!\r\n" );
      return;
    }

  victim->PCData->ClanInfo.Salary = salary;
  ch->Echo( "%s has been assigned %d credits for a salary.\r\n", victim->Name, salary );
  victim->Echo( "%s has give you a %d credit salary.\r\n", ch->Name, salary );
}
