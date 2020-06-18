#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "repos/clanrepository.hpp"

void do_appoint( std::shared_ptr<Character> ch , std::string argument )
{
  std::string arg;

  argument = OneArgument( argument, arg );

  if ( IsNpc( ch ) || !ch->PCData )
    return;

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  if ( StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader  )  )
    {
      ch->Echo( "Only your leader can do that!\r\n" );
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Usage: appoint <name> <first|second>\r\n" );
      return;
    }

  if ( !StrCmp( argument, "first" )  )
    {
      if ( !ch->PCData->ClanInfo.Clan->Leadership.Number1.empty() )
        {
          ch->Echo( "You already have someone in that position... demote them first.\r\n" );
          return;
        }

      ch->PCData->ClanInfo.Clan->Leadership.Number1 = arg;
    }
  else if ( !StrCmp( argument , "second" )  )
    {
      if ( !ch->PCData->ClanInfo.Clan->Leadership.Number2.empty() )
        {
          ch->Echo( "You already have someone in that position... demote them first.\r\n" );
          return;
        }

      ch->PCData->ClanInfo.Clan->Leadership.Number2 = arg;
    }
  else
    {
      do_appoint( ch , "" );
    }
  
  Clans->Save( ch->PCData->ClanInfo.Clan );
}

