#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_prompt( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    {
      SendToCharacter( "NPC's can't change their prompt..\r\n", ch );
      return;
    }

  SmashTilde( argument );
  OneArgument( argument, arg );

  if ( !*arg )
    {
      SendToCharacter( "Set prompt to what? (try help prompt)\r\n", ch );
      return;
    }

  if (ch->PCData->Prompt)
    FreeMemory(ch->PCData->Prompt);

  if ( strlen(argument) > 128 )
    argument[128] = '\0';

  /* Can add a list of pre-set prompts here if wanted.. perhaps
     'prompt 1' brings up a different, pre-set prompt */
  if ( !StrCmp(arg, "default") )
    ch->PCData->Prompt = CopyString("");
  else
    ch->PCData->Prompt = CopyString(argument);

  SendToCharacter( "Ok.\r\n", ch );
}
