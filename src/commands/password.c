#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "character.h"

void do_password( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char *pArg;
  char *pwdnew;
  char *p;
  char cEnd;

  if ( IsNpc(ch) )
    return;

  /*
   * Can't use OneArgument here because it smashes case.
   * So we just steal all its code.  Bleagh.
   */
  pArg = arg1;
  while ( isspace(*argument) )
    argument++;

  cEnd = ' ';
  if ( *argument == '\'' || *argument == '"' )
    cEnd = *argument++;

  while ( *argument != '\0' )
    {
      if ( *argument == cEnd )
        {
          argument++;
          break;
        }
      *pArg++ = *argument++;
    }
  *pArg = '\0';
  pArg = arg2;
  while ( isspace(*argument) )
    argument++;

  cEnd = ' ';
  if ( *argument == '\'' || *argument == '"' )
    cEnd = *argument++;

  while ( *argument != '\0' )
    {
      if ( *argument == cEnd )
        {
          argument++;
          break;
        }
      *pArg++ = *argument++;
    }
  *pArg = '\0';

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Syntax: password <old> <new>.\r\n", ch );
      return;
    }

  if ( StrCmp( EncodeString( arg1 ), ch->pcdata->pwd ) )
    {
      SetWaitState( ch, 40 );
      SendToCharacter( "Wrong password.  Wait 10 seconds.\r\n", ch );
      return;
    }

  if ( strlen(arg2) < 5 )
    {
      SendToCharacter(
                   "New password must be at least five characters long.\r\n", ch );
      return;
    }

  /*
   * No tilde allowed because of player file format.
   */
  pwdnew = EncodeString( arg2 );
  for ( p = pwdnew; *p != '\0'; p++ )
    {
      if ( *p == '~' )
        {
          SendToCharacter(
                       "New password not acceptable, try again.\r\n", ch );
          return;
        }
    }

  FreeMemory( ch->pcdata->pwd );
  ch->pcdata->pwd = CopyString( pwdnew );
  if ( IsBitSet(sysdata.save_flags, SV_PASSCHG) )
    SaveCharacter( ch );
  SendToCharacter( "Ok.\r\n", ch );
  return;
}
