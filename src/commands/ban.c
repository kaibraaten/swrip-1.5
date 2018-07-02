#include <time.h>
#include "mud.h"
#include "character.h"
#include "ban.h"

static bool SiteIsBanned(const Ban *ban, const char *arg)
{
  return !StrCmp( arg, ban->Site );
}

void do_ban( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  char arg[MAX_INPUT_LENGTH] = { '\0' };
  int bnum = 0;
  Ban *pban = NULL;
  const List *bans = GetEntities(BanRepository);

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  SetPagerColor( AT_PLAIN, ch );

  if ( IsNullOrEmpty( arg ) )
    {
      ListIterator *iterator = AllocateListIterator(bans);

      SendToPager( "Banned sites:\r\n", ch );
      SendToPager( "[ #] (Lv) Time                     Site\r\n", ch );
      SendToPager( "---- ---- ------------------------ ---------------\r\n", ch );
      bnum = 1;
      
      while(ListHasMoreElements(iterator))
        {
          pban = (Ban*)GetListData(iterator);
          MoveToNextListElement(iterator);
          PagerPrintf(ch, "[%2d] (%2d) %-24s %s\r\n", bnum,
                      pban->Level, pban->BanTime, pban->Site);
          ++bnum;
        }

      FreeListIterator(iterator);
      return;
    }

  /* People are gonna need .# instead of just # to ban by just last
     number in the site ip.                               -- Altrag */
  if ( IsNumber(arg) )
    {
      ListIterator *iterator = AllocateListIterator(bans);
      bool found = false;
      bnum = 1;

      while(ListHasMoreElements(iterator))
        {
          pban = (Ban*)GetListData(iterator);
          MoveToNextListElement(iterator);

          if ( bnum == atoi(arg) )
            {
              found = true;
              break;
            }

          ++bnum;
        }

      FreeListIterator(iterator);

      if (!found)
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

  pban = (Ban*)FindIfInList(bans, (Predicate*)SiteIsBanned, arg);

  if (pban != NULL)
    {
      SendToCharacter( "That site is already banned!\r\n", ch );
      return;
    }

  AllocateMemory( pban, Ban, 1 );
  AddBan(pban);
  pban->Site = CopyString( arg );
  pban->Level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->BanTime = CopyString( buf );
  SaveBans();
  SendToCharacter( "Ban created. Mortals banned from site.\r\n", ch );
}
