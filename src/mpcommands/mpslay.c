#include "character.h"
#include "mud.h"

/*
 * syntax: mpslay (character)
 */
void do_mp_slay( Character *ch, char *argument )
{
  if( ch->top_level >= LEVEL_GOD )
    {
      do_slay( ch, argument );
    }
}
