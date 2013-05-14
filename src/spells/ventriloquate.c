#include <ctype.h>
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_ventriloquate( int sn, int level, CHAR_DATA *ch, void *vo )
{
  char buf1[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char speaker[MAX_INPUT_LENGTH];
  CHAR_DATA *vch;

  spell_target_name = one_argument( spell_target_name, speaker );

  sprintf( buf1, "%s says '%s'.\r\n",              speaker, spell_target_name );
  sprintf( buf2, "Someone makes %s say '%s'.\r\n", speaker, spell_target_name );
  buf1[0] = UPPER(buf1[0]);

  for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
    {
      if ( !is_name( speaker, vch->name ) ) {
        set_char_color( AT_SAY, vch );
        send_to_char( saves_spell_staff( level, vch ) ? buf2 : buf1, vch );
      }
    }

  return rNONE;
}
