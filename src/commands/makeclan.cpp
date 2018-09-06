#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"

void do_makeclan( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo("Usage: makeclan <clan name>\r\n");
      return;
    }

  if( GetClan( argument ) )
    {
      ch->Echo("&RThere's already another clan with that name.&d\r\n" );
      return;
    }

  Clan *clan = AllocateClan();
  clan->Name = argument;
  Clans->Add(clan);
  Clans->Save( clan );
}
