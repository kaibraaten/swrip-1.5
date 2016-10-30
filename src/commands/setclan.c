#include "character.h"
#include "mud.h"
#include "clan.h"
#include "ship.h"

void do_setclan( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Clan *clan;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( " leader number1 number2 addguild enlist1 jail\r\n", ch );
      SendToCharacter( " enlist2 board storage funds\r\n", ch );

      if ( GetTrustLevel( ch ) >= LEVEL_SUB_IMPLEM )
        {
          SendToCharacter( " name desc\r\n", ch );
        }

      return;
    }

  clan = GetClan( arg1 );

  if ( !clan )
    {
      SendToCharacter( "No such clan.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "enlistroom1" ) )
    {
      clan->EnlistRoom1 = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "enlistroom2" ) )
    {
      clan->EnlistRoom2 = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "leader" ) )
    {
      FreeMemory( clan->Leadership.Leader );
      clan->Leadership.Leader = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "addguild" ) )
    {
      Clan *guild = GetClan( argument );

      if ( !guild )
        {
          SendToCharacter( "Guild does't exist.\r\n", ch );
          return;
        }

      if ( guild->Type == CLAN_GUILD || guild->MainClan )
        {
          SendToCharacter( "Guild is already part of another faction.\r\n", ch );
          return;
        }

      if ( guild->FirstGuild )
        {
          SendToCharacter( "Guild has guilds of its own that need removing first.\r\n", ch );
          return;
        }

      guild->Type = CLAN_GUILD;
      guild->MainClan = clan;
      LINK( guild, clan->FirstGuild, clan->LastGuild, NextGuild, PreviousGuild );
      SaveClan( clan );
      SaveClan( guild );
      return;
    }

  if ( !StrCmp( arg2, "number1" ) )
    {
      FreeMemory( clan->Leadership.Number1 );
      clan->Leadership.Number1 = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "number2" ) )
    {
      FreeMemory( clan->Leadership.Number2 );
      clan->Leadership.Number2 = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "board" ) )
    {
      clan->Board = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "funds" ) )
    {
      clan->Funds = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "storage" ) )
    {
      clan->Storeroom = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "jail" ) )
    {
      clan->Jail = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
    {
      do_setclan( ch, "" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      ClanMemberList *memberList = GetMemberList( clan );
      char oldFilename[MAX_STRING_LENGTH];
      Ship *ship = NULL;

      for( ship = first_ship; ship; ship = ship->Next )
        {
          if( !StrCmp( ship->Owner, clan->Name ) )
            {
              FreeMemory( ship->Owner );
              ship->Owner = CopyString( argument );
            }
        }

      sprintf( oldFilename, "%s%s", CLAN_DIR, ConvertToLuaFilename( clan->Name ) );
      unlink( oldFilename );

      FreeMemory( memberList->Name );
      FreeMemory( clan->Name );

      clan->Name = CopyString( argument );
      memberList->Name = CopyString( clan->Name );

      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( clan->Description );
      clan->Description = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  do_setclan( ch, "" );
}
