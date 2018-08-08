#include "character.hpp"
#include "mud.hpp"

/*
 * syntax: mpslay (character)
 */
void do_mp_slay( Character *ch, char *argument )
{
  if( ch->TopLevel >= LEVEL_GREATER )
    {
      do_slay( ch, argument );
    }
}

