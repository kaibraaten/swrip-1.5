#include "mud.hpp"
#include "character.hpp"

void do_typo( Character *ch, char *argument )
{
  if(!IsNullOrEmpty(argument))
    {
      AppendFile( ch, TYPO_FILE, argument );
      ch->Echo("Ok. Thanks.\r\n");
    }
  else
    {
      ch->Echo("Report what typo?\r\n");
    }
}

