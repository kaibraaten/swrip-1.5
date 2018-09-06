#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_prompt( Character *ch, std::string argument )
{
  std::string arg;

  if ( IsNpc(ch) )
    {
      ch->Echo("NPC's can't change their prompt..\r\n");
      return;
    }

  SmashTilde( argument );
  OneArgument( argument, arg );

  if ( arg.empty() )
    {
      ch->Echo("Set prompt to what? (try help prompt)\r\n");
      return;
    }

  if ( argument.size() > 128 )
    {
      argument = argument.substr(0, 128);
    }
  
  /* Can add a list of pre-set prompts here if wanted.. perhaps
     'prompt 1' brings up a different, pre-set prompt */
  if ( !StrCmp(arg, "default") )
    {
      ch->PCData->Prompt.erase();
    }
  else
    {
      ch->PCData->Prompt = argument;
    }
  
  ch->Echo("Ok.\r\n");
}
