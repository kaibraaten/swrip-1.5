#include "mud.hpp"
#include "character.hpp"

void do_idea( std::shared_ptr<Character> ch, std::string argument )
{
  if( !argument.empty() )
    {
      AppendFile( ch, IDEA_FILE, argument );
      ch->Echo("Ok. Thanks.\r\n");
    }
  else
    {
      ch->Echo("Present which idea?\r\n");
    }
}


