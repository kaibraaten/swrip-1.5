#include "character.hpp"
#include "mud.hpp"
#include "alias.hpp"
#include "pcdata.hpp"

void do_alias( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if(IsNpc(ch))
    {
      return;
    }

  argument = OneArgument(argument, arg);

  if (IsNullOrEmpty(arg))
    {
      if (ch->PCData->Aliases.empty())
        {
          SendToCharacter("You have no aliases defined!\r\n", ch);
          return;
        }

      PagerPrintf( ch, "%-20s What it does\r\n", "Alias" );

      for(const Alias *alias : ch->PCData->Aliases)
        {
          PagerPrintf( ch, "%-20s %s\r\n",
                       alias->Name, alias->Command );
        }

      return;
    }

  if (IsNullOrEmpty(argument))
    {
      Alias *alias = FindAlias(ch, arg);

      if (alias != nullptr)
        {
	  UnlinkAlias( ch, alias );
	  FreeAlias( alias );
          SendToCharacter("Deleted Alias.\r\n", ch);
        }
      else
        {
          SendToCharacter("That alias does not exist.\r\n", ch);
        }

      return;
    }
  
  Alias *alias = FindAlias(ch, arg);

  if (alias == nullptr)
    {
      alias = AllocateAlias( arg, argument );
      AddAlias( ch, alias );
      SendToCharacter("Created Alias.\r\n", ch);
    }
  else
    {
      if (alias->Command != nullptr)
        {
          FreeMemory(alias->Command);
        }

      alias->Command  = CopyString(argument);
      SendToCharacter("Modified Alias.\r\n", ch);
    }
}
