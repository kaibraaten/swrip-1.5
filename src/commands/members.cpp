#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"
#include "repos/clanrepository.hpp"

void do_members( std::shared_ptr<Character> ch, std::string argument )
{
  if( argument.empty() )
    {
      ch->Echo("Usage: members <clan name>\r\n" );
      return;
    }

  if( !StrCmp( argument, "all" ) )
    {
      for(const auto &clan : Clans)
	{
	  ShowClanMembers( ch, clan );
	}

      return;
    }

  std::shared_ptr<Clan> clan = GetClan(argument);

  if(clan != nullptr)
    {
      ShowClanMembers( ch, clan );
    }
  else
    {
      ch->Echo("&RNo such member list.\r\n" );
    }
}
