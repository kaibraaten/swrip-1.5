#include "mud.hpp"
#include "help.hpp"
#include "log.hpp"
#include "character.hpp"

void do_hset( Character *ch, char *argument )
{
  HelpFile *pHelp = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Syntax: hset <field> [value] [help page]\r\n");
      ch->Echo("\r\n");
      ch->Echo("Field being one of:\r\n");
      ch->Echo("  level keyword remove save\r\n");
      return;
    }

  if ( !StrCmp( arg1, "save" ) )
    {
      Log->LogStringPlus( "Saving help files.", LOG_NORMAL, LEVEL_GREATER );
      HelpFiles->Save();
      ch->Echo("Saved.\r\n");
      return;
    }

  if ( StrCmp( arg1, "remove" ) )
    {
      argument = OneArgument( argument, arg2 );
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp )
    {
      ch->Echo("Cannot find help on that subject.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "remove" ) )
    {
      HelpFiles->Remove(pHelp);
      FreeHelpFile( pHelp );
      ch->Echo("Removed.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "level" ) )
    {
      SetHelpFileLevel( pHelp, atoi( arg2 ) );
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg1, "keyword" ) )
    {
      SetHelpFileKeyword( pHelp, arg2 );
      ch->Echo("Done.\r\n");
      return;
    }

  do_hset( ch, "" );
}


