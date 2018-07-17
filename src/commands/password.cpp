#include <ctype.h>
#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_password( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char *pArg = NULL;
  char *pwdnew = NULL;
  char *p = NULL;
  char cEnd = 0;

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

  while ( !IsNullOrEmpty( argument ) )
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

  while ( !IsNullOrEmpty( argument ) )
    {
      if ( *argument == cEnd )
        {
          argument++;
          break;
        }
      *pArg++ = *argument++;
    }
  *pArg = '\0';

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Syntax: password <old> <new>.\r\n", ch );
      return;
    }

  if ( StrCmp( EncodeString( arg1 ), ch->PCData->Password ) )
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
  
  for ( p = pwdnew; !IsNullOrEmpty( p ); p++ )
    {
      if ( *p == '~' )
        {
          SendToCharacter(
                       "New password not acceptable, try again.\r\n", ch );
          return;
        }
    }

  FreeMemory( ch->PCData->Password );
  ch->PCData->Password = CopyString( pwdnew );

  if ( IsBitSet(SysData.SaveFlags, SV_PASSCHG) )
    SaveCharacter( ch );

  SendToCharacter( "Ok.\r\n", ch );
}
