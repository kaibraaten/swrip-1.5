#include <time.h>
#include "mud.hpp"
#include "character.hpp"
#include "ban.hpp"

void do_ban( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  char arg[MAX_INPUT_LENGTH] = { '\0' };
  int bnum = 0;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  SetPagerColor( AT_PLAIN, ch );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToPager( "Banned sites:\r\n", ch );
      SendToPager( "[ #] (Lv) Time                     Site\r\n", ch );
      SendToPager( "---- ---- ------------------------ ---------------\r\n", ch );
      bnum = 1;
      
      for(auto ban : BanRepos->Entities())
        {
          PagerPrintf(ch, "[%2d] (%2d) %-24s %s\r\n", bnum,
                      ban->Level, ban->BanTime.c_str(), ban->Site.c_str());
          ++bnum;
        }

      return;
    }

  /* People are gonna need .# instead of just # to ban by just last
     number in the site ip.                               -- Altrag */
  if ( IsNumber(arg) )
    {
      std::shared_ptr<Ban> pban;
      bool found = false;
      bnum = 1;

      for(auto b : BanRepos->Entities())
        {
          if ( bnum == atoi(arg) )
            {
              pban = b;
              found = true;
              break;
            }

          ++bnum;
        }

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

      BanRepos->Save();
      return;
    }

  if ( !StrCmp(arg, "help") )
    {
      SendToCharacter( "Syntax: ban <site address>\r\n", ch );
      SendToCharacter( "Syntax: ban <ban number> <level <lev>|newban|mortal|total>\r\n", ch );
      return;
    }

  
  if (BanRepos->Contains(arg))
    {
      SendToCharacter( "That site is already banned!\r\n", ch );
      return;
    }

  std::shared_ptr<Ban> pban = std::make_shared<Ban>();
  BanRepos->Add(pban);
  pban->Site = arg;
  pban->Level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->BanTime = buf;
  BanRepos->Save();
  SendToCharacter( "Ban created. Mortals banned from site.\r\n", ch );
}
