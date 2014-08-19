#include "character.h"
#include "mud.h"

void do_revert(Character *ch, char *argument)
{
  Character *mob;

  if ( !IsNpc(ch) || !IsBitSet(ch->act, ACT_POLYMORPHED) )
    {
      SendToCharacter("You are not polymorphed.\r\n", ch);
      return;
    }

  RemoveBit(ch->act, ACT_POLYMORPHED);

  char_from_room(ch->desc->original);

  if(ch->desc->character)
    {
      mob = ch->desc->character;
      char_to_room(ch->desc->original, ch->desc->character->in_room); /*WORKS!!*/
      ch->desc->character       = ch->desc->original;
      ch->desc->original        = NULL;
      ch->desc->character->desc = ch->desc;
      ch->desc->character->switched = NULL;
      ch->desc                  = NULL;
      extract_char(mob, true);
      return;
    }

  ch->desc->character       = ch->desc->original;
  ch->desc->original        = NULL;
  ch->desc->character->desc = ch->desc;
  ch->desc->character->switched = NULL;
  ch->desc                  = NULL;
}
