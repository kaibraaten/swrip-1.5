#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_appoint( Character *ch , char *argument )
{
  char arg[MAX_STRING_LENGTH];

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

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Usage: appoint <name> < first | second >\r\n" );
      return;
    }

  if ( !StrCmp( argument, "first" )  )
    {
      if ( ch->PCData->ClanInfo.Clan->Leadership.Number1
	   && StrCmp( ch->PCData->ClanInfo.Clan->Leadership.Number1 , "" ) )
        {
          ch->Echo( "You already have someone in that position... demote them first.\r\n" );
          return;
        }

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number1 );
      ch->PCData->ClanInfo.Clan->Leadership.Number1 = CopyString( arg );
    }
  else if ( !StrCmp( argument , "second" )  )
    {
      if ( ch->PCData->ClanInfo.Clan->Leadership.Number2
	   && StrCmp( ch->PCData->ClanInfo.Clan->Leadership.Number2 , "" ))
        {
          ch->Echo( "You already have someone in that position... demote them first.\r\n" );
          return;
        }

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number2 );
      ch->PCData->ClanInfo.Clan->Leadership.Number2 = CopyString( arg );
    }
  else
    {
      do_appoint( ch , "" );
    }
  
  Clans->Save( ch->PCData->ClanInfo.Clan );
}

