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
   * Can't use one_argument here because it smashes case.
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
      send_to_char( "Syntax: password <old> <new>.\r\n", ch );
      return;
    }

  if ( str_cmp( encode_string( arg1 ), ch->pcdata->pwd ) )
    {
      SetWaitState( ch, 40 );
      send_to_char( "Wrong password.  Wait 10 seconds.\r\n", ch );
      return;
    }

  if ( strlen(arg2) < 5 )
    {
      send_to_char(
                   "New password must be at least five characters long.\r\n", ch );
      return;
    }

  /*
   * No tilde allowed because of player file format.
   */
  pwdnew = encode_string( arg2 );
  for ( p = pwdnew; *p != '\0'; p++ )
    {
      if ( *p == '~' )
        {
          send_to_char(
                       "New password not acceptable, try again.\r\n", ch );
          return;
        }
    }

  DISPOSE( ch->pcdata->pwd );
  ch->pcdata->pwd = str_dup( pwdnew );
  if ( IsBitSet(sysdata.save_flags, SV_PASSCHG) )
    save_char_obj( ch );
  send_to_char( "Ok.\r\n", ch );
  return;
}
