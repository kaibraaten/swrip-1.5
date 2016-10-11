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

  CharacterFromRoom(ch->desc->original);

  if(ch->desc->character)
    {
      mob = ch->desc->character;
      CharacterToRoom(ch->desc->original, ch->desc->character->in_room); /*WORKS!!*/
      ch->desc->character       = ch->desc->original;
      ch->desc->original        = NULL;
      ch->desc->character->desc = ch->desc;
      ch->desc->character->switched = NULL;
      ch->desc                  = NULL;
      ExtractCharacter(mob, true);
      return;
    }

  ch->desc->character       = ch->desc->original;
  ch->desc->original        = NULL;
  ch->desc->character->desc = ch->desc;
  ch->desc->character->switched = NULL;
  ch->desc                  = NULL;
}
