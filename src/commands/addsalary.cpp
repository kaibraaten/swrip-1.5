#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_addsalary( std::shared_ptr<Character> ch, std::string argument )
{
  std::string arg;
  std::string arg2;

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

  if ( (!ch->PCData->Bestowments.empty()
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

  if ( arg.empty() )
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

  int salary = atoi(arg2.c_str());
  
  if ( salary < 0 )
    {
      ch->Echo( "Salary must be positive!\r\n" );
      return;
    }

  victim->PCData->ClanInfo.Salary = salary;
  ch->Echo( "%s has been assigned %d credits for a salary.\r\n", victim->Name.c_str(), salary );
  victim->Echo( "%s has given you a %d credit salary.\r\n", ch->Name.c_str(), salary );
}
