#include "character.h"
#include "mud.h"
#include "arena.h"

void do_arena(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (is_npc(ch))
    {
      send_to_char("Mobs cant play in the arena.\r\n",ch);
      return;
    }

  if(!arena.in_start_arena)
    {
      send_to_char("The killing fields are closed right now.\r\n", ch);
      return;
    }

  if(ch->top_level < arena.lo_lim)
    {
      sprintf(buf, "Sorry but you must be at least level %d to enter this arena.\r\n",
	      arena.lo_lim);
      send_to_char(buf, ch);
      return;
    }

  if( ch->top_level > arena.hi_lim)
    {
      send_to_char("This arena is for lower level characters.\r\n", ch);
      return;
    }

  if(IS_SET(ch->in_room->room_flags, ROOM_ARENA))
    {
      send_to_char("You are in the arena already\r\n",ch);
      return;
    }
  else
    {
      act(AT_RED, "$n has been whisked away to the killing fields.", ch, NULL, NULL, TO_ROOM);
      ch->retran = ch->in_room->vnum;
      char_from_room(ch);
      char_to_room(ch, get_room_index(PREP_START));
      act(AT_WHITE,"$n is dropped from the sky.", ch, NULL, NULL, TO_ROOM);
      send_to_char("You have been taken to the killing fields\r\n",ch);
      do_look(ch, "auto");
      sprintf(buf, "%s has joined the blood bath.", ch->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      send_to_char(buf, ch);
      ch->hit = ch->max_hit;
      ch->mana = ch->max_mana;
      ch->move = ch->max_move;
      return;
    }
}
