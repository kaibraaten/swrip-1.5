#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"

void do_arena(Character *ch, std::string argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (IsNpc(ch))
    {
      SendToCharacter("Mobs cant play in the arena.\r\n",ch);
      return;
    }

  if(!arena.InStartArena)
    {
      SendToCharacter("The killing fields are closed right now.\r\n", ch);
      return;
    }

  if(ch->TopLevel < arena.MinLevel)
    {
      sprintf(buf, "Sorry but you must be at least level %d to enter this arena.\r\n",
	      arena.MinLevel);
      SendToCharacter(buf, ch);
      return;
    }

  if( ch->TopLevel > arena.MaxLevel)
    {
      SendToCharacter("This arena is for lower level characters.\r\n", ch);
      return;
    }

  if(IsBitSet(ch->InRoom->Flags, ROOM_ARENA))
    {
      SendToCharacter("You are in the arena already\r\n",ch);
      return;
    }
  else
    {
      Act(AT_RED, "$n has been whisked away to the killing fields.", ch, NULL, NULL, TO_ROOM);
      ch->ReTran = ch->InRoom->Vnum;
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(PREP_START));
      Act(AT_WHITE,"$n is dropped from the sky.", ch, NULL, NULL, TO_ROOM);
      SendToCharacter("You have been taken to the killing fields\r\n",ch);
      do_look(ch, "auto");
      sprintf(buf, "%s has joined the blood bath.", ch->Name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      SendToCharacter(buf, ch);
      ch->Hit = ch->MaxHit;
      ch->Mana = ch->MaxMana;
      ch->Move = ch->MaxMove;
      return;
    }
}
