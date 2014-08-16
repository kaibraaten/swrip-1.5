#include <time.h>
#include "mud.h"
#include "character.h"

void do_ban( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Ban *pban;
  int bnum;

  if ( IsNpc(ch) )
    return;

  argument = one_argument( argument, arg );

  set_pager_color( AT_PLAIN, ch );
  if ( arg[0] == '\0' )
    {
      send_to_pager( "Banned sites:\r\n", ch );
      send_to_pager( "[ #] (Lv) Time                     Site\r\n", ch );
      send_to_pager( "---- ---- ------------------------ ---------------\r\n", ch );
      for ( pban = first_ban, bnum = 1; pban; pban = pban->next, bnum++ )
        pager_printf(ch, "[%2d] (%2d) %-24s %s\r\n", bnum,
                     pban->level, pban->ban_time, pban->name);
      return;
    }

  /* People are gonna need .# instead of just # to ban by just last
     number in the site ip.                               -- Altrag */
  if ( is_number(arg) )
    {
      for ( pban = first_ban, bnum = 1; pban; pban = pban->next, bnum++ )
        if ( bnum == atoi(arg) )
          break;
      if ( !pban )
        {
          do_ban(ch, "");
          return;
        }
      argument = one_argument(argument, arg);
      if ( arg[0] == '\0' )
        {
          do_ban( ch, "help" );
          return;
        }
      if ( !str_cmp(arg, "level") )
        {
          argument = one_argument(argument, arg);
          if ( arg[0] == '\0' || !is_number(arg) )
            {
              do_ban( ch, "help" );
              return;
            }
          if ( atoi(arg) < 1 || atoi(arg) > LEVEL_IMPLEMENTOR )
            {
              ch_printf(ch, "Level range: 1 - %d.\r\n", LEVEL_IMPLEMENTOR);
              return;
            }
          pban->level = atoi(arg);
          send_to_char( "Ban level set.\r\n", ch );
        }
      else if ( !str_cmp(arg, "newban") )
        {
          pban->level = 1;
          send_to_char( "New characters banned.\r\n", ch );
        }
      else if ( !str_cmp(arg, "mortal") )
        {
          pban->level = LEVEL_AVATAR;
          send_to_char( "All mortals banned.\r\n", ch );
        }
      else if ( !str_cmp(arg, "total") )
        {
          pban->level = LEVEL_IMPLEMENTOR;
          send_to_char( "Everyone banned.\r\n", ch );
        }
      else
        {
          do_ban(ch, "help");
          return;
        }
      save_banlist( );
      return;
    }

  if ( !str_cmp(arg, "help") )
    {
      send_to_char( "Syntax: ban <site address>\r\n", ch );
      send_to_char( "Syntax: ban <ban number> <level <lev>|newban|mortal|"
                    "total>\r\n", ch );
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( !str_cmp( arg, pban->name ) )
        {
          send_to_char( "That site is already banned!\r\n", ch );
          return;
        }
    }

  CREATE( pban, Ban, 1 );
  LINK( pban, first_ban, last_ban, next, prev );
  pban->name    = str_dup( arg );
  pban->level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->ban_time = str_dup( buf );
  save_banlist( );
  send_to_char( "Ban created.  Mortals banned from site.\r\n", ch );
}
