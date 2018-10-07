#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"
#include "room.hpp"

void do_arena(Character *ch, std::string argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (IsNpc(ch))
    {
      ch->Echo("Mobs cant play in the arena.\r\n");
      return;
    }

  if(!arena.InStartArena)
    {
      ch->Echo("The killing fields are closed right now.\r\n");
      return;
    }

  if(ch->TopLevel < arena.MinLevel)
    {
      ch->Echo("Sorry but you must be at least level %d to enter this arena.\r\n",
               arena.MinLevel);
      return;
    }

  if( ch->TopLevel > arena.MaxLevel)
    {
      ch->Echo("This arena is for lower level characters.\r\n");
      return;
    }

  if( IsInArena( ch ) )
    {
      ch->Echo("You are in the arena already\r\n");
    }
  else
    {
      Act(AT_RED, "$n has been whisked away to the killing fields.", ch, NULL, NULL, TO_ROOM);
      ch->ReTran = ch->InRoom->Vnum;
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(PREP_START));
      Act(AT_WHITE,"$n is dropped from the sky.", ch, NULL, NULL, TO_ROOM);
      ch->Echo("You have been taken to the killing fields\r\n");
      do_look(ch, "auto");
      sprintf(buf, "%s has joined the blood bath.", ch->Name.c_str());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->Echo( "%s", buf );
      ch->HitPoints.Current = ch->HitPoints.Max;
      ch->Mana.Current = ch->Mana.Max;
      ch->Fatigue.Current = ch->Fatigue.Max;
    }
}

