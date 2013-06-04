#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_name( Character *ch, char *argument )
{
  char fname[1024];
  struct stat fst;
  Character *tmp;
  char buf[MAX_STRING_LENGTH];

  if ( !is_not_authed(ch) || ch->pcdata->auth_state != 2)
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  argument[0] = UPPER(argument[0]);

  if (!check_parse_name(argument))
    {
      send_to_char("Illegal name, try another.\r\n", ch);
      return;
    }

  if (!str_cmp(ch->name, argument))
    {
      send_to_char("That's already your name!\r\n", ch);
      return;
    }

  for ( tmp = first_char; tmp; tmp = tmp->next )
    {
      if (!str_cmp(argument, tmp->name))
        break;
    }

  if ( tmp )
    {
      send_to_char("That name is already taken.  Please choose another.\r\n", ch);
      return;
    }

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(argument[0]),
           capitalize( argument ) );
  if ( stat( fname, &fst ) != -1 )
    {
      send_to_char("That name is already taken.  Please choose another.\r\n", ch);
      return;
    }

  STRFREE( ch->name );
  ch->name = STRALLOC( argument );
  sprintf( buf, "%s the %s",ch->name,
           race_table[ch->race].race_name );
  set_title( ch, buf );

  send_to_char("Your name has been changed.  Please apply again.\r\n", ch);
  ch->pcdata->auth_state = 1;
}
