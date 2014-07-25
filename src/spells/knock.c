#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_knock( int sn, int level, Character *ch, void *vo )
{
  Exit *pexit;
  SKILLTYPE *skill = get_skilltype(sn);

  set_char_color(AT_MAGIC, ch);
  /*
   * shouldn't know why it didn't work, and shouldn't work on pickproof
   * exits.  -Thoric
   */
  if ( !(pexit=find_door(ch, spell_target_name, FALSE))
       ||   !IS_SET(pexit->exit_info, EX_CLOSED)
       ||   !IS_SET(pexit->exit_info, EX_LOCKED)
       ||    IS_SET(pexit->exit_info, EX_PICKPROOF) )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  REMOVE_BIT(pexit->exit_info, EX_LOCKED);
  send_to_char( "*Click*\r\n", ch );

  if ( pexit->rexit && pexit->rexit->to_room == ch->in_room )
    REMOVE_BIT( pexit->rexit->exit_info, EX_LOCKED );

  check_room_for_traps( ch, TRAP_UNLOCK | trap_door[pexit->vdir] );
  return rNONE;
}
