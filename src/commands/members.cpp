#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"

void do_members( Character *ch, std::string argument )
{
  if( argument.empty() )
    {
      ch->Echo("Usage: members <clan name>\r\n" );
      return;
    }

  if( !StrCmp( argument, "all" ) )
    {
      for(const Clan *clan : Clans->Entities())
	{
	  ShowClanMembers( ch, clan );
	}

      return;
    }

  const Clan *clan = GetClan(argument);

  if(clan != nullptr)
    {
      ShowClanMembers( ch, clan );
    }
  else
    {
      ch->Echo("&RNo such member list.\r\n" );
    }
}
