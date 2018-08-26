#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"

void do_revert(Character *ch, char *argument)
{
  Character *mob = nullptr;

  if ( !IsNpc(ch) || !IsBitSet(ch->Flags, ACT_POLYMORPHED) )
    {
      ch->Echo("You are not polymorphed.\r\n");
      return;
    }

  RemoveBit(ch->Flags, ACT_POLYMORPHED);

  CharacterFromRoom(ch->Desc->Original);

  if(ch->Desc->Character)
    {
      mob = ch->Desc->Character;
      CharacterToRoom(ch->Desc->Original, ch->Desc->Character->InRoom); /*WORKS!!*/
      ch->Desc->Character       = ch->Desc->Original;
      ch->Desc->Original        = NULL;
      ch->Desc->Character->Desc = ch->Desc;
      ch->Desc->Character->Switched = NULL;
      ch->Desc                  = NULL;
      ExtractCharacter(mob, true);
      return;
    }

  ch->Desc->Character       = ch->Desc->Original;
  ch->Desc->Original        = NULL;
  ch->Desc->Character->Desc = ch->Desc;
  ch->Desc->Character->Switched = NULL;
  ch->Desc                  = NULL;
}

