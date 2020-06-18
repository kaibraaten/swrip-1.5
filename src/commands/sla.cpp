#include "mud.hpp"
#include "character.hpp"

void do_sla( std::shared_ptr<Character> ch, std::string argument )
{
  ch->Echo("If you want to SLAY, spell it out.\r\n");
}

