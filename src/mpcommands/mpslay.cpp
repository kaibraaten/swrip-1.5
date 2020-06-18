#include "character.hpp"
#include "mud.hpp"

/*
 * syntax: mpslay (character)
 */
void do_mp_slay( std::shared_ptr<Character> ch, std::string argument )
{
  if( ch->TopLevel >= LEVEL_GREATER )
    {
      do_slay( ch, argument );
    }
}
