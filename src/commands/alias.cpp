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
          ch->Echo("You have no aliases defined!\r\n");
          return;
        }

      ch->Echo( "%-20s What it does\r\n", "Alias" );

      for(const Alias *alias : ch->PCData->Aliases)
        {
          ch->Echo( "%-20s %s\r\n", alias->Name, alias->Command );
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
          ch->Echo("Deleted Alias.\r\n");
        }
      else
        {
          ch->Echo("That alias does not exist.\r\n");
        }

      return;
    }
  
  Alias *alias = FindAlias(ch, arg);

  if (alias == nullptr)
    {
      alias = AllocateAlias( arg, argument );
      AddAlias( ch, alias );
      ch->Echo("Created Alias.\r\n");
    }
  else
    {
      if (alias->Command != nullptr)
        {
          FreeMemory(alias->Command);
        }

      alias->Command  = CopyString(argument);
      ch->Echo("Modified Alias.\r\n");
    }
}

