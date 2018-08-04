#include "mud.hpp"
#include "help.hpp"
#include "log.hpp"

void do_hset( Character *ch, char *argument )
{
  HelpFile *pHelp = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Syntax: hset <field> [value] [help page]\r\n",     ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Field being one of:\r\n",                  ch );
      SendToCharacter( "  level keyword remove save\r\n",          ch );
      return;
    }

  if ( !StrCmp( arg1, "save" ) )
    {
      Log->LogStringPlus( "Saving help files.", LOG_NORMAL, LEVEL_GREATER );
      HelpFiles->Save();
      SendToCharacter( "Saved.\r\n", ch );
      return;
    }

  if ( StrCmp( arg1, "remove" ) )
    {
      argument = OneArgument( argument, arg2 );
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp )
    {
      SendToCharacter( "Cannot find help on that subject.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg1, "remove" ) )
    {
      HelpFiles->Remove(pHelp);
      FreeHelpFile( pHelp );
      SendToCharacter( "Removed.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg1, "level" ) )
    {
      SetHelpFileLevel( pHelp, atoi( arg2 ) );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg1, "keyword" ) )
    {
      SetHelpFileKeyword( pHelp, arg2 );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  do_hset( ch, "" );
}
