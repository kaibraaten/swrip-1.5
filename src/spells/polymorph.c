#include "mud.h"

ch_ret spell_polymorph( int sn, int level, CHAR_DATA *ch, void *vo )
{
  int poly_vnum;
  CHAR_DATA *poly_mob;

  if (IS_NPC(ch))
    {
      send_to_char("Mobs can't polymorph!\r\n", ch);
      return rSPELL_FAILED;
    }

  if (ch->desc->original)
    {
      send_to_char("You are not in your original state.\r\n", ch);
      return rSPELL_FAILED;
    }

  if (!str_cmp (spell_target_name, "wolf"))
    poly_vnum = MOB_VNUM_POLY_WOLF;

  else
    {
      set_char_color(AT_MAGIC, ch);
      send_to_char("You can't polymorph into that!\r\n", ch);
      return rSPELL_FAILED;
    }

  poly_mob = make_poly_mob(ch, poly_vnum);
  if(!poly_mob)
    {
      bug("Spell_polymorph: null polymob!", 0);
      return rSPELL_FAILED;
    }

  char_to_room(poly_mob, ch->in_room);
  char_from_room(ch);
  char_to_room(ch, get_room_index(ROOM_VNUM_POLY));
  ch->desc->character = poly_mob;
  ch->desc->original  = ch;
  poly_mob->desc      = ch->desc;
  ch->desc            = NULL;
  ch->switched        = poly_mob;

  return rNONE;
}
