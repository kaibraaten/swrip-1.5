#include <string.h>
#include "mud.h"
#include "character.h"

static void set_target( Character *ch, const char *target );

void do_focusalias( Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH], buf[MAX_STRING_LENGTH];

  smash_tilde(argument);
  one_argument( argument, arg );

  if ( IsNpc(ch) )
    {
      send_to_char("Alias focuses are for players!\r\n", ch);
      return;
    }

  if ( arg[0] == '\0' )
    {

      if ( ch->pcdata->target && ch->pcdata->target[0] != '\0' )
        {
          sprintf( buf, "Your current alias focus is : %s\r\n", ch->pcdata->target);
          send_to_char(buf,ch);
          return;
        }

      send_to_char("You have no current alias focus.\r\n",ch);
      return;

    }
  else
    {
      set_target( ch, arg );
      sprintf( buf, "Your new alias focus is : %s\r\n", ch->pcdata->target);
      send_to_char( buf, ch );
      return;
    }
}

static void set_target( Character *ch, const char *target )
{
  char buf[MAX_STRING_LENGTH];

  strcpy( buf, target );

  if (ch->pcdata->target && ch->pcdata->target[0] != '\0')
    DISPOSE( ch->pcdata->target );

  ch->pcdata->target = str_dup( buf );
}
