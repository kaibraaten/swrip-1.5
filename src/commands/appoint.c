#include "character.h"
#include "mud.h"
#include "clan.h"

void do_appoint( Character *ch , char *argument )
{
  char arg[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNpc( ch ) || !ch->PCData )
    return;

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if (  StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader  )  )
    {
      SendToCharacter( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: appoint <name> < first | second >\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , "first" )  )
    {
      if ( ch->PCData->ClanInfo.Clan->Leadership.Number1
	   && StrCmp( ch->PCData->ClanInfo.Clan->Leadership.Number1 , "" ) )
        {
          SendToCharacter( "You already have someone in that position... demote them first.\r\n", ch);
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
          SendToCharacter( "You already have someone in that position... demote them first.\r\n", ch);
          return;
        }

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number2 );
      ch->PCData->ClanInfo.Clan->Leadership.Number2 = CopyString( arg );
    }
  else
    do_appoint( ch , "" );

  SaveClan ( ch->PCData->ClanInfo.Clan );
}
