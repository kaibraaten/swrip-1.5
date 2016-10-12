#include "character.h"
#include "mud.h"

void do_revert(Character *ch, char *argument)
{
  Character *mob;

  if ( !IsNpc(ch) || !IsBitSet(ch->Flags, ACT_POLYMORPHED) )
    {
      SendToCharacter("You are not polymorphed.\r\n", ch);
      return;
    }

  RemoveBit(ch->Flags, ACT_POLYMORPHED);

  CharacterFromRoom(ch->Desc->original);

  if(ch->Desc->character)
    {
      mob = ch->Desc->character;
      CharacterToRoom(ch->Desc->original, ch->Desc->character->InRoom); /*WORKS!!*/
      ch->Desc->character       = ch->Desc->original;
      ch->Desc->original        = NULL;
      ch->Desc->character->Desc = ch->Desc;
      ch->Desc->character->Switched = NULL;
      ch->Desc                  = NULL;
      ExtractCharacter(mob, true);
      return;
    }

  ch->Desc->character       = ch->Desc->original;
  ch->Desc->original        = NULL;
  ch->Desc->character->Desc = ch->Desc;
  ch->Desc->character->Switched = NULL;
  ch->Desc                  = NULL;
}
