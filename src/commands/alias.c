#include "character.h"
#include "mud.h"
#include "alias.h"

void do_alias( Character *ch, char *argument )
{
  Alias *pal = NULL;
  char arg[MAX_INPUT_LENGTH];

  if (!ch || !ch->pcdata)
    return;

  argument = OneArgument(argument, arg);

  if ( !*arg )
    {
      if (!ch->pcdata->first_alias)
        {
          send_to_char("You have no aliases defined!\r\n", ch);
          return;
        }
      pager_printf( ch, "%-20s What it does\r\n", "Alias" );
      for (pal=ch->pcdata->first_alias;pal;pal=pal->next)
        pager_printf( ch, "%-20s %s\r\n",
                      pal->name, pal->cmd );
      return;
    }

  if ( !*argument)
    {
      if ( (pal = FindAlias(ch, arg)) != NULL )
        {
          DISPOSE(pal->name);
          DISPOSE(pal->cmd);
          UNLINK(pal, ch->pcdata->first_alias, ch->pcdata->last_alias, next, prev);
          DISPOSE(pal);
          send_to_char("Deleted Alias.\r\n", ch);
        }
      else
        send_to_char("That alias does not exist.\r\n", ch);
      return;
    }

  if ( (pal=FindAlias(ch, arg)) == NULL )
    {
      CREATE(pal, Alias, 1);
      pal->name = CopyString(arg);
      pal->cmd  = CopyString(argument);
      LINK(pal, ch->pcdata->first_alias, ch->pcdata->last_alias, next, prev);
      send_to_char("Created Alias.\r\n", ch);
    }
  else
    {
      if (pal->cmd)
        DISPOSE(pal->cmd);

      pal->cmd  = CopyString(argument);
      send_to_char("Modified Alias.\r\n", ch);
    }
}
