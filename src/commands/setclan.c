#include "character.h"
#include "mud.h"
#include "clan.h"

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
      SendToCharacter( " leader number1 number2 addsubclan enlist1 jail\r\n", ch );
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

  if ( !StrCmp( arg2, "addsubclan" ) )
    {
      Clan *subclan = GetClan( argument );

      if ( !subclan )
        {
          SendToCharacter( "Subclan is not a clan.\r\n", ch );
          return;
        }

      if ( subclan->Type == CLAN_SUBCLAN || subclan->MainClan )
        {
          SendToCharacter( "Subclan is already part of another organization.\r\n", ch );
          return;
        }

      if ( subclan->first_subclan )
        {
          SendToCharacter( "Subclan has subclans of its own that need removing first.\r\n", ch );
          return;
        }

      subclan->Type = CLAN_SUBCLAN;
      subclan->MainClan = clan;
      LINK(subclan, clan->first_subclan, clan->last_subclan, next_subclan, prev_subclan );
      SaveClan( clan );
      SaveClan( subclan );
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

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( clan->MainClan )
        {
          UNLINK ( clan, clan->MainClan->first_subclan, clan->MainClan->last_subclan,
                   next_subclan, prev_subclan );
          clan->MainClan = NULL;
        }

      if ( !StrCmp( argument, "crime" ) || !StrCmp( argument, "crime family" ) )
        {
          clan->Type = CLAN_CRIME;
        }
      else if ( !StrCmp( argument, "guild" ) )
        {
          clan->Type = CLAN_GUILD;
        }
      else
        {
          clan->Type = CLAN_PLAIN;
        }

      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      ClanMemberList *memberList = GetMemberList( clan );
      char oldFilename[MAX_STRING_LENGTH];
      Ship *ship = NULL;

      for( ship = first_ship; ship; ship = ship->next )
        {
          if( !StrCmp( ship->owner, clan->Name ) )
            {
              FreeMemory( ship->owner );
              ship->owner = CopyString( argument );
            }
        }

      sprintf( oldFilename, "%s%s.lua", CLAN_DIR, GetClanFilename( clan ) );
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
