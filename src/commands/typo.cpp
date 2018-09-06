#include "mud.hpp"
#include "character.hpp"

void do_typo( Character *ch, std::string argument )
{
  if( !argument.empty() )
    {
      AppendFile( ch, TYPO_FILE, argument );
      ch->Echo("Ok. Thanks.\r\n");
    }
  else
    {
      ch->Echo("Report what typo?\r\n");
    }
}

