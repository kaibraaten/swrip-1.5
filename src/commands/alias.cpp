#include "character.hpp"
#include "mud.hpp"
#include "alias.hpp"
#include "pcdata.hpp"

void do_alias( Character *ch, char *argument )
{
  Alias *pal = NULL;
  char arg[MAX_INPUT_LENGTH];

  if (!ch || !ch->PCData)
    return;

  argument = OneArgument(argument, arg);

  if ( !*arg )
    {
      if (!ch->PCData->FirstAlias)
        {
          SendToCharacter("You have no aliases defined!\r\n", ch);
          return;
        }
      PagerPrintf( ch, "%-20s What it does\r\n", "Alias" );
      for (pal=ch->PCData->FirstAlias;pal;pal=pal->Next)
        PagerPrintf( ch, "%-20s %s\r\n",
                      pal->Name, pal->Command );
      return;
    }

  if ( !*argument)
    {
      if ( (pal = FindAlias(ch, arg)) != NULL )
        {
	  UnlinkAlias( ch, pal );
	  FreeAlias( pal );
          SendToCharacter("Deleted Alias.\r\n", ch);
        }
      else
        SendToCharacter("That alias does not exist.\r\n", ch);
      return;
    }

  if ( (pal=FindAlias(ch, arg)) == NULL )
    {
      pal = AllocateAlias( arg, argument );
      AddAlias( ch, pal );
      SendToCharacter("Created Alias.\r\n", ch);
    }
  else
    {
      if (pal->Command)
        FreeMemory(pal->Command);

      pal->Command  = CopyString(argument);
      SendToCharacter("Modified Alias.\r\n", ch);
    }
}
