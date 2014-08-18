#include "character.h"
#include "mud.h"

ch_ret spell_dispel_magic( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int affected_by, cnt;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->affected_by && ch == victim )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You pass your hands around your body...\r\n", ch );
      while ( victim->first_affect )
        affect_remove( victim, victim->first_affect );
      victim->affected_by = RaceTable[victim->race].affected;
      return rNONE;
    }
  else
    if ( victim->affected_by == RaceTable[victim->race].affected
         ||   level < victim->top_level
         ||   saves_spell_staff( level, victim ) )
      {
        failed_casting( skill, ch, victim, NULL );
        return rSPELL_FAILED;
      }

  if ( !IsNpc(victim) )
    {
      send_to_char( "You can't do that... yet.\r\n", ch );
      return rSPELL_FAILED;
    }

  cnt = 0;

  for ( ;; )
    {
      affected_by = 1 << NumberBits( 5 );
      if ( IsBitSet(victim->affected_by, affected_by) )
        break;
      if ( cnt++ > 30 )
        {
          failed_casting( skill, ch, victim, NULL );
          return rNONE;
        }
    }

  RemoveBit(victim->affected_by, affected_by);
  successful_casting( skill, ch, victim, NULL );

  return rNONE;
}
