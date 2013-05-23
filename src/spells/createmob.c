#include "mud.h"

/*
 * Generic mob creating spell                                   -Thoric
 */
ch_ret spell_create_mob( int sn, int level, CHAR_DATA *ch, void *vo )
{
  SKILLTYPE *skill = get_skilltype(sn);
  int lvl;
  int vnum = skill->value;
  CHAR_DATA *mob;
  MOB_INDEX_DATA *mi;
  AFFECT_DATA af;

  /* set maximum mob level */
  switch( SPELL_POWER(skill) )
    {
    default:
    case SP_NONE:        lvl = 20;      break;
    case SP_MINOR:       lvl = 5;       break;
    case SP_GREATER: lvl = level/2; break;
    case SP_MAJOR:       lvl = level;   break;
    }

  /*
   * Add predetermined mobiles here
   */
  if ( vnum == 0 )
    {
      return rNONE;
    }

  if ( (mi=get_mob_index(vnum)) == NULL
       ||   (mob=create_mobile(mi)) == NULL )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rNONE;
    }
  mob->top_level   = UMIN( lvl, skill->dice ? dice_parse(ch, level, skill->dice) : mob->top_level );
  mob->armor     = interpolate( mob->top_level, 100, -100 );

  mob->max_hit = mob->top_level * 8 + number_range(
                                                   mob->top_level * mob->top_level / 4,
                                                   mob->top_level * mob->top_level );
  mob->hit       = mob->max_hit;
  mob->gold      = 0;
  successful_casting( skill, ch, mob, NULL );
  char_to_room( mob, ch->in_room );
  add_follower( mob, ch );
  af.type      = sn;
  af.duration  = (number_fuzzy( (level + 1) / 3 ) + 1) * DUR_CONV;
  af.location  = 0;
  af.modifier  = 0;
  af.bitvector = AFF_CHARM;
  affect_to_char( mob, &af );
  return rNONE;
}