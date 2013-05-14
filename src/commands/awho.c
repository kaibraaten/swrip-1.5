#include "mud.h"
#include "arena.h"

void do_awho(CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *tch;
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  int num=num_in_arena();

  if(num==0)
    {
      send_to_char("There is noone in the arena right now.\r\n", ch);
      return;
    }

  sprintf(buf,"&W  Players in the &BRise in Power&W Arena\r\n");
  sprintf(buf,"%s-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-", buf);
  sprintf(buf,"%s&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-\r\n", buf);
  sprintf(buf,"%sGame Length = &R%-3d   &WTime To Start &R%-3d\r\n", buf, arena.game_length, arena.time_to_start);
  sprintf(buf,"%s&WLevel Limits &R%d &Wto &R%d\r\n", buf, arena.lo_lim, arena.hi_lim);
  sprintf(buf,"%s         &WJackpot = &R%d\r\n", buf, arena.arena_pot);
  sprintf(buf,"%s&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B", buf);
  sprintf(buf,"%s-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B\r\n", buf);
  send_to_char(buf, ch);

  for ( tch = first_char; tch; tch = tch->next )
    if (tch->in_room && IS_SET(tch->in_room->room_flags, ROOM_ARENA)
        && (tch->top_level < LEVEL_IMMORTAL))
      {
        sprintf(buf2, "&W%s\r\n", tch->name);
        send_to_char(buf2,ch);
      }
}
