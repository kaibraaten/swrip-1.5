#include "character.h"
#include "mud.h"
#include "arena.h"

void do_accept(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (num_in_arena()>0)
    {
      send_to_char("Please wait until the current arena is closed before you accept.\r\n",ch);
      return;
    }

  if (!(ch->challenged))
    {
      send_to_char("You have not been challenged!\r\n",ch);
      return;
    }
  else
    {
      Character *dch;
      dch = ch->challenged;

      if (!dch || !(dch->in_room) || !(dch->name) || (ch->name[0] == '\0'))
        return;

      if ( dch->in_room == ch->in_room )
        {
          send_to_char("You must be in a different room as your challenger.\r\n",ch);
        }

      if ( dch->in_room == ch->in_room )
        {
          send_to_char("You must be in a different room as your challenger.\r\n",ch);
          return;
        }

      sprintf(buf,"%s has accepted %s's challenge!\r\n",ch->name,dch->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->challenged = NULL;
      ch->retran = ch->in_room->vnum;
      char_from_room(ch);
      char_to_room(ch, get_room_index(PREP_END));
      do_look(ch,"auto");
      dch->retran = dch->in_room->vnum;
      char_from_room(dch);
      char_to_room(dch, get_room_index(PREP_START));
      do_look(dch,"auto");
      arena.ppl_in_arena = 0;
      arena.ppl_challenged = 1;
      arena.time_to_start = 3;
      arena.time_left_in_game =0;
      arena.arena_pot =0;
      arena.bet_pot = 0;
      start_arena();
      return;
    }
}
