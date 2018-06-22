#include <time.h>
#include "mud.h"
#include "character.h"
#include "ban.h"

void do_ban( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Ban *pban;
  int bnum;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  SetPagerColor( AT_PLAIN, ch );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToPager( "Banned sites:\r\n", ch );
      SendToPager( "[ #] (Lv) Time                     Site\r\n", ch );
      SendToPager( "---- ---- ------------------------ ---------------\r\n", ch );

      for ( pban = FirstBan, bnum = 1; pban; pban = pban->Next, bnum++ )
        PagerPrintf(ch, "[%2d] (%2d) %-24s %s\r\n", bnum,
                     pban->Level, pban->BanTime, pban->Site);
      return;
    }

  /* People are gonna need .# instead of just # to ban by just last
     number in the site ip.                               -- Altrag */
  if ( IsNumber(arg) )
    {
      for ( pban = FirstBan, bnum = 1; pban; pban = pban->Next, bnum++ )
        if ( bnum == atoi(arg) )
          break;

      if ( !pban )
        {
          do_ban(ch, "");
          return;
        }

      argument = OneArgument(argument, arg);

      if ( IsNullOrEmpty( arg ) )
        {
          do_ban( ch, "help" );
          return;
        }
      
      if ( !StrCmp(arg, "level") )
        {
          argument = OneArgument(argument, arg);

	  if ( IsNullOrEmpty( arg ) || !IsNumber(arg) )
            {
              do_ban( ch, "help" );
              return;
            }

          if ( atoi(arg) < 1 || atoi(arg) > LEVEL_IMPLEMENTOR )
            {
              Echo(ch, "Level range: 1 - %d.\r\n", LEVEL_IMPLEMENTOR);
              return;
            }

	  pban->Level = atoi(arg);
          SendToCharacter( "Ban level set.\r\n", ch );
        }
      else if ( !StrCmp(arg, "newban") )
        {
          pban->Level = 1;
          SendToCharacter( "New characters banned.\r\n", ch );
        }
      else if ( !StrCmp(arg, "mortal") )
        {
          pban->Level = LEVEL_AVATAR;
          SendToCharacter( "All mortals banned.\r\n", ch );
        }
      else if ( !StrCmp(arg, "total") )
        {
          pban->Level = LEVEL_IMPLEMENTOR;
          SendToCharacter( "Everyone banned.\r\n", ch );
        }
      else
        {
          do_ban(ch, "help");
          return;
        }

      SaveBans();
      return;
    }

  if ( !StrCmp(arg, "help") )
    {
      SendToCharacter( "Syntax: ban <site address>\r\n", ch );
      SendToCharacter( "Syntax: ban <ban number> <level <lev>|newban|mortal|total>\r\n", ch );
      return;
    }

  for ( pban = FirstBan; pban; pban = pban->Next )
    {
      if ( !StrCmp( arg, pban->Site ) )
        {
          SendToCharacter( "That site is already banned!\r\n", ch );
          return;
        }
    }

  AllocateMemory( pban, Ban, 1 );
  LINK( pban, FirstBan, LastBan, Next, Previous );
  pban->Site = CopyString( arg );
  pban->Level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->BanTime = CopyString( buf );
  SaveBans();
  SendToCharacter( "Ban created. Mortals banned from site.\r\n", ch );
}
