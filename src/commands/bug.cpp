#include "mud.hpp"
#include "character.hpp"

void do_bug( Character *ch, char *argument )
{
  if(!IsNullOrEmpty(argument))
    {
      AppendFile( ch, BUG_FILE, argument );
      ch->Echo( "Ok. Thanks.\r\n" );
    }
  else
    {
      ch->Echo("Report what bug?\r\n");
    }
}

