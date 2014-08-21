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
      SendToCharacter("You do not know of this skill yet.\r\n", ch );
      return;
    }

  OneArgument(argument, arg);
  if ( arg[0]=='\0' ) {
    SendToCharacter("Whom are you trying to track?\r\n", ch);
    return;
  }

  SetWaitState( ch, skill_table[gsn_track]->beats );

  if (!(vict = GetCharacterAnywhere(ch, arg))) {
    SendToCharacter("You can't sense a trail from here.\r\n", ch);
    return;
  }

  maxdist = 100 + ch->top_level * 30;

  if ( !IsNpc(ch) )
    maxdist = (maxdist * ch->pcdata->learned[gsn_track]) / 100;

  dir = FindFirstStep(ch->in_room, vict->in_room, maxdist);
  switch(dir) {
  case BFS_ERROR:
    SendToCharacter("Hmm... something seems to be wrong.\r\n", ch);
    break;
  case BFS_ALREADY_THERE:
    SendToCharacter("You're already in the same room!\r\n", ch);
    break;
  case BFS_NO_PATH:
    sprintf(buf, "You can't sense a trail from here.\r\n" );
    SendToCharacter(buf, ch);
    LearnFromFailure( ch, gsn_track );
    break;
  default:
    Echo(ch, "You sense a trail %s from here...\r\n",
	      GetDirectionName(dir));
    LearnFromSuccess( ch, gsn_track );
    break;
  }
}
