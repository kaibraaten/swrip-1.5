#include "character.hpp"
#include "mud.hpp"
#include "alias.hpp"
#include "pcdata.hpp"

void do_alias( Character *ch, std::string argument )
{
  std::string arg;

  if(IsNpc(ch))
    {
      return;
    }

  argument = OneArgument(argument, arg);

  if ( arg.empty() )
    {
      if (ch->PCData->Aliases().empty())
        {
          ch->Echo("You have no aliases defined!\r\n");
          return;
        }

      ch->Echo( "%-20s What it does\r\n", "Alias" );

      for(auto alias : ch->PCData->Aliases())
        {
          ch->Echo( "%-20s %s\r\n", alias->Name.c_str(), alias->Command.c_str() );
        }

      return;
    }

  if (argument.empty())
    {
      auto alias = FindAlias(ch, arg);

      if (alias != nullptr)
        {
	  UnlinkAlias( ch, alias );
          ch->Echo("Deleted Alias.\r\n");
        }
      else
        {
          ch->Echo("That alias does not exist.\r\n");
        }

      return;
    }
  
  auto alias = FindAlias(ch, arg);

  if (alias == nullptr)
    {
      alias = AllocateAlias( arg, argument );
      AddAlias( ch, alias );
      ch->Echo("Created Alias.\r\n");
    }
  else
    {
      alias->Command = argument;
      ch->Echo("Modified Alias.\r\n");
    }
}

