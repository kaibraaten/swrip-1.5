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

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( " leader number1 number2 subclan enlist1 jail\r\n", ch );
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
      clan->enlistroom1 = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "enlistroom2" ) )
    {
      clan->enlistroom2 = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "leader" ) )
    {
      FreeMemory( clan->leadership.leader );
      clan->leadership.leader = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "subclan" ) )
    {
      Clan *subclan = GetClan( argument );

      if ( !subclan )
        {
          SendToCharacter( "Subclan is not a clan.\r\n", ch );
          return;
        }

      if ( subclan->clan_type == CLAN_SUBCLAN || subclan->mainclan )
        {
          SendToCharacter( "Subclan is already part of another organization.\r\n", ch );
          return;
        }

      if ( subclan->first_subclan )
        {
          SendToCharacter( "Subclan has subclans of its own that need removing first.\r\n", ch );
          return;
        }

      subclan->clan_type = CLAN_SUBCLAN;
      subclan->mainclan = clan;
      LINK(subclan, clan->first_subclan, clan->last_subclan, next_subclan, prev_subclan );
      SaveClan( clan );
      SaveClan( subclan );
      return;
    }

  if ( !StrCmp( arg2, "number1" ) )
    {
      FreeMemory( clan->leadership.number1 );
      clan->leadership.number1 = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "number2" ) )
    {
      FreeMemory( clan->leadership.number2 );
      clan->leadership.number2 = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "board" ) )
    {
      clan->board = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "funds" ) )
    {
      clan->funds = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "storage" ) )
    {
      clan->storeroom = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "jail" ) )
    {
      clan->jail = atoi( argument );
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
      if ( clan->mainclan )
        {
          UNLINK ( clan, clan->mainclan->first_subclan, clan->mainclan->last_subclan,
                   next_subclan, prev_subclan );
          clan->mainclan = NULL;
        }

      if ( !StrCmp( argument, "crime" ) || !StrCmp( argument, "crime family" ) )
        {
          clan->clan_type = CLAN_CRIME;
        }
      else if ( !StrCmp( argument, "guild" ) )
        {
          clan->clan_type = CLAN_GUILD;
        }
      else
        {
          clan->clan_type = 0;
        }

      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( clan->Name );
      clan->Name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( clan->description );
      clan->description = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SaveClan( clan );
      return;
    }

  do_setclan( ch, "" );
}
