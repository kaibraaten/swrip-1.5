#include "character.h"
#include "track.h"
#include "mud.h"

void do_track( Character *ch, char *argument )
{
  Character *vict;
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int dir, maxdist;

  if ( !IsNpc(ch) && !ch->pcdata->learned[gsn_track] )
    {
      send_to_char("You do not know of this skill yet.\r\n", ch );
      return;
    }

  OneArgument(argument, arg);
  if ( arg[0]=='\0' ) {
    send_to_char("Whom are you trying to track?\r\n", ch);
    return;
  }

  SetWaitState( ch, skill_table[gsn_track]->beats );

  if (!(vict = get_char_world(ch, arg))) {
    send_to_char("You can't sense a trail from here.\r\n", ch);
    return;
  }

  maxdist = 100 + ch->top_level * 30;

  if ( !IsNpc(ch) )
    maxdist = (maxdist * ch->pcdata->learned[gsn_track]) / 100;

  dir = FindFirstStep(ch->in_room, vict->in_room, maxdist);
  switch(dir) {
  case BFS_ERROR:
    send_to_char("Hmm... something seems to be wrong.\r\n", ch);
    break;
  case BFS_ALREADY_THERE:
    send_to_char("You're already in the same room!\r\n", ch);
    break;
  case BFS_NO_PATH:
    sprintf(buf, "You can't sense a trail from here.\r\n" );
    send_to_char(buf, ch);
    learn_from_failure( ch, gsn_track );
    break;
  default:
    ch_printf(ch, "You sense a trail %s from here...\r\n",
	      get_dir_name(dir));
    learn_from_success( ch, gsn_track );
    break;
  }
}
