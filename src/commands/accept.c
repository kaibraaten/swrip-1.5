#include "character.h"
#include "mud.h"
#include "arena.h"

void do_accept(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (CharactersInArena()>0)
    {
      SendToCharacter("Please wait until the current arena is closed before you accept.\r\n",ch);
      return;
    }

  if (!(ch->challenged))
    {
      SendToCharacter("You have not been challenged!\r\n",ch);
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
          SendToCharacter("You must be in a different room as your challenger.\r\n",ch);
        }

      if ( dch->in_room == ch->in_room )
        {
          SendToCharacter("You must be in a different room as your challenger.\r\n",ch);
          return;
        }

      sprintf(buf,"%s has accepted %s's challenge!\r\n",ch->name,dch->name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->challenged = NULL;
      ch->retran = ch->in_room->vnum;
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(PREP_END));
      do_look(ch,"auto");
      dch->retran = dch->in_room->vnum;
      CharacterFromRoom(dch);
      CharacterToRoom(dch, GetRoom(PREP_START));
      do_look(dch,"auto");
      arena.ppl_IsInArena = 0;
      arena.ppl_challenged = 1;
      arena.time_to_start = 3;
      arena.time_left_in_game =0;
      arena.arena_pot =0;
      arena.bet_pot = 0;
      StartArena();
      return;
    }
}
