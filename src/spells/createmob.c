#include "character.h"
#include "mud.h"

/*
 * Generic mob creating spell                                   -Thoric
 */
ch_ret spell_create_mob( int sn, int level, Character *ch, void *vo )
{
  Skill *skill = get_skilltype(sn);
  int lvl;
  int vnum = skill->value;
  Character *mob;
  ProtoMobile *mi;
  Affect af;

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

  if ( (mi=GetProtoMobile(vnum)) == NULL
       ||   (mob=CreateMobile(mi)) == NULL )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rNONE;
    }
  mob->top_level   = umin( lvl, skill->dice ? dice_parse(ch, level, skill->dice) : mob->top_level );
  mob->armor     = Interpolate( mob->top_level, 100, -100 );

  mob->max_hit = mob->top_level * 8 + GetRandomNumberFromRange(
                                                   mob->top_level * mob->top_level / 4,
                                                   mob->top_level * mob->top_level );
  mob->hit       = mob->max_hit;
  mob->gold      = 0;
  successful_casting( skill, ch, mob, NULL );
  CharacterToRoom( mob, ch->in_room );
  StartFollowing( mob, ch );
  af.type      = sn;
  af.duration  = (NumberFuzzy( (level + 1) / 3 ) + 1) * DUR_CONV;
  af.location  = 0;
  af.modifier  = 0;
  af.bitvector = AFF_CHARM;
  AffectToCharacter( mob, &af );
  return rNONE;
}
