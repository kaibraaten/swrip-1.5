#include "mud.hpp"
#include "character.hpp"

void do_idea( Character *ch, char *argument )
{
   if(!IsNullOrEmpty(argument))
    {
      AppendFile( ch, IDEA_FILE, argument );
      ch->Echo("Ok. Thanks.\r\n");
    }
  else
    {
      ch->Echo("Present which idea?\r\n");
    }
}


