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
          SendToCharacter("You have no aliases defined!\r\n", ch);
          return;
        }
      PagerPrintf( ch, "%-20s What it does\r\n", "Alias" );
      for (pal=ch->pcdata->first_alias;pal;pal=pal->next)
        PagerPrintf( ch, "%-20s %s\r\n",
                      pal->name, pal->cmd );
      return;
    }

  if ( !*argument)
    {
      if ( (pal = FindAlias(ch, arg)) != NULL )
        {
          FreeMemory(pal->name);
          FreeMemory(pal->cmd);
          UNLINK(pal, ch->pcdata->first_alias, ch->pcdata->last_alias, next, prev);
          FreeMemory(pal);
          SendToCharacter("Deleted Alias.\r\n", ch);
        }
      else
        SendToCharacter("That alias does not exist.\r\n", ch);
      return;
    }

  if ( (pal=FindAlias(ch, arg)) == NULL )
    {
      AllocateMemory(pal, Alias, 1);
      pal->name = CopyString(arg);
      pal->cmd  = CopyString(argument);
      LINK(pal, ch->pcdata->first_alias, ch->pcdata->last_alias, next, prev);
      SendToCharacter("Created Alias.\r\n", ch);
    }
  else
    {
      if (pal->cmd)
        FreeMemory(pal->cmd);

      pal->cmd  = CopyString(argument);
      SendToCharacter("Modified Alias.\r\n", ch);
    }
}
