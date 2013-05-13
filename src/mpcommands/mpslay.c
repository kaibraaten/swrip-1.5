#include "mud.h"

/*
 * syntax: mpslay (character)
 */
void do_mp_slay( CHAR_DATA *ch, char *argument )
{
  if( ch->top_level >= 103 )
    do_slay( ch, argument );

  return;
}
