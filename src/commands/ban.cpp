#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "ban.hpp"

void do_ban( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  std::string arg;
  int bnum = 0;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  SetCharacterColor( AT_PLAIN, ch );

  if ( arg.empty() )
    {
      ch->Echo( "Banned sites:\r\n" );
      ch->Echo( "[ #] (Lv) Time                     Site\r\n" );
      ch->Echo( "---- ---- ------------------------ ---------------\r\n" );
      bnum = 1;
      
      for(auto ban : Bans->Entities())
        {
          ch->Echo( "[%2d] (%2d) %-24s %s\r\n", bnum,
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

      for(auto b : Bans->Entities())
        {
          if ( bnum == std::stoi(arg) )
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

      if ( arg.empty() )
        {
          do_ban( ch, "help" );
          return;
        }
      
      if ( !StrCmp(arg, "level") )
        {
          argument = OneArgument(argument, arg);

	  if ( arg.empty() || !IsNumber(arg) )
            {
              do_ban( ch, "help" );
              return;
            }

          if ( std::stoi(arg) < 1 || std::stoi(arg) > LEVEL_IMPLEMENTOR )
            {
              ch->Echo("Level range: 1 - %d.\r\n", LEVEL_IMPLEMENTOR);
              return;
            }

	  pban->Level = std::stoi(arg);
          ch->Echo( "Ban level set.\r\n" );
        }
      else if ( !StrCmp(arg, "newban") )
        {
          pban->Level = 1;
          ch->Echo( "New characters banned.\r\n" );
        }
      else if ( !StrCmp(arg, "mortal") )
        {
          pban->Level = LEVEL_AVATAR;
          ch->Echo( "All mortals banned.\r\n" );
        }
      else if ( !StrCmp(arg, "total") )
        {
          pban->Level = LEVEL_IMPLEMENTOR;
          ch->Echo( "Everyone banned.\r\n" );
        }
      else
        {
          do_ban(ch, "help");
          return;
        }

      Bans->Save();
      return;
    }

  if ( !StrCmp(arg, "help") )
    {
      ch->Echo( "Syntax: ban <site address>\r\n" );
      ch->Echo( "Syntax: ban <ban number> <level <lev>|newban|mortal|total>\r\n" );
      return;
    }
  
  if (Bans->Contains(arg))
    {
      ch->Echo( "That site is already banned!\r\n" );
      return;
    }

  std::shared_ptr<Ban> pban = std::make_shared<Ban>();
  Bans->Add(pban);
  pban->Site = arg;
  pban->Level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->BanTime = buf;
  Bans->Save();
  ch->Echo( "Ban created. Mortals banned from site.\r\n" );
}

