#include <string>
#include "mud.hpp"
#include "types.hpp"

void do_pickshiplock( std::shared_ptr<Character> ch, std::string argument )
{
  do_pick( ch, argument );
}
