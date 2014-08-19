#include "character.h"
#include "mud.h"
#include "arena.h"

void do_arena(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (IsNpc(ch))
    {
      SendToCharacter("Mobs cant play in the arena.\r\n",ch);
      return;
    }

  if(!arena.in_StartArena)
    {
      SendToCharacter("The killing fields are closed right now.\r\n", ch);
      return;
    }

  if(ch->top_level < arena.lo_lim)
    {
      sprintf(buf, "Sorry but you must be at least level %d to enter this arena.\r\n",
	      arena.lo_lim);
      SendToCharacter(buf, ch);
      return;
    }

  if( ch->top_level > arena.hi_lim)
    {
      SendToCharacter("This arena is for lower level characters.\r\n", ch);
      return;
    }

  if(IsBitSet(ch->in_room->room_flags, ROOM_ARENA))
    {
      SendToCharacter("You are in the arena already\r\n",ch);
      return;
    }
  else
    {
      Act(AT_RED, "$n has been whisked away to the killing fields.", ch, NULL, NULL, TO_ROOM);
      ch->retran = ch->in_room->vnum;
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(PREP_START));
      Act(AT_WHITE,"$n is dropped from the sky.", ch, NULL, NULL, TO_ROOM);
      SendToCharacter("You have been taken to the killing fields\r\n",ch);
      do_look(ch, "auto");
      sprintf(buf, "%s has joined the blood bath.", ch->name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      SendToCharacter(buf, ch);
      ch->hit = ch->max_hit;
      ch->mana = ch->max_mana;
      ch->move = ch->max_move;
      return;
    }
}
