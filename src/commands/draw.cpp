#include "mud.hpp"

void do_draw( std::shared_ptr<Character> ch, std::string argument )
{
  DrawMap(ch, argument);
}

