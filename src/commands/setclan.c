#include "character.h"
#include "mud.h"

void do_setclan( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Clan *clan;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( " leader number1 number2 subclan enlist1\r\n", ch );
      send_to_char( " enlist2 members board recall storage\r\n", ch );
      send_to_char( " funds trooper1 trooper2 jail", ch );
      send_to_char( " guard1 guard2 patrol1 patrol2\r\n", ch );

      if ( GetTrustLevel( ch ) >= LEVEL_SUB_IMPLEM )
        {
          send_to_char( " name filename desc\r\n", ch );
        }

      return;
    }

  clan = get_clan( arg1 );

  if ( !clan )
    {
      send_to_char( "No such clan.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "enlistroom1" ) )
    {
      clan->enlistroom1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "enlistroom2" ) )
    {
      clan->enlistroom2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "leader" ) )
    {
      FreeMemory( clan->leadership.leader );
      clan->leadership.leader = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "subclan" ) )
    {
      Clan *subclan = get_clan( argument );

      if ( !subclan )
        {
          send_to_char( "Subclan is not a clan.\r\n", ch );
          return;
        }

      if ( subclan->clan_type == CLAN_SUBCLAN || subclan->mainclan )
        {
          send_to_char( "Subclan is already part of another organization.\r\n", ch );
          return;
        }

      if ( subclan->first_subclan )
        {
          send_to_char( "Subclan has subclans of its own that need removing first.\r\n", ch );
          return;
        }

      subclan->clan_type = CLAN_SUBCLAN;
      subclan->mainclan = clan;
      LINK(subclan, clan->first_subclan, clan->last_subclan, next_subclan, prev_subclan );
      save_clan( clan );
      save_clan( subclan );
      return;
    }

  if ( !StrCmp( arg2, "number1" ) )
    {
      FreeMemory( clan->leadership.number1 );
      clan->leadership.number1 = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "number2" ) )
    {
      FreeMemory( clan->leadership.number2 );
      clan->leadership.number2 = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "board" ) )
    {
      clan->board = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "members" ) )
    {
      clan->members = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "funds" ) )
    {
      clan->funds = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "storage" ) )
    {
      clan->storeroom = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "guard1" ) )
    {
      clan->guard1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "jail" ) )
    {
      clan->jail = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "guard2" ) )
    {
      clan->guard2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "trooper1" ) )
    {
      clan->trooper1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "trooper2" ) )
    {
      clan->trooper2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }
  if ( !StrCmp( arg2, "patrol1" ) )
    {
      clan->patrol1 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "patrol2" ) )
    {
      clan->patrol2 = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
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

      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( clan->name );
      clan->name = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( clan->filename );
      clan->filename = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      write_clan_list();
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( clan->description );
      clan->description = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      save_clan( clan );
      return;
    }

  do_setclan( ch, "" );
}
