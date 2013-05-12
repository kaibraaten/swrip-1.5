#include "mud.h"

void do_revert(CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *mob;

  if ( !IS_NPC(ch) || !IS_SET(ch->act, ACT_POLYMORPHED) )
    {
      send_to_char("You are not polymorphed.\r\n", ch);
      return;
    }

  REMOVE_BIT(ch->act, ACT_POLYMORPHED);

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
      extract_char(mob, TRUE);
      return;
    }

  ch->desc->character       = ch->desc->original;
  ch->desc->original        = NULL;
  ch->desc->character->desc = ch->desc;
  ch->desc->character->switched = NULL;
  ch->desc                  = NULL;
}
