#include "mud.h"

bool spec_dark_jedi( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  char *spell;
  int sn;

  if ( ch->position != POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( who_fighting( victim ) && number_bits( 2 ) == 0 )
        break;
    }

  if ( !victim || victim == ch )
    return FALSE;

  for ( ;; )
    {
      int min_level;

      switch ( number_bits( 4 ) )
        {
        case  0: min_level =  5; spell = "blindness";      break;
        case  1: min_level =  5; spell = "fingers of the force";    break;
        case  2: min_level =  9; spell = "choke";         break;
        case  3: min_level =  8; spell = "invade essence";       break;
        case  4: min_level = 11; spell = "force projectile";   break;
        case  6: min_level = 13; spell = "drain essence";   break;
        case  7: min_level =  4; spell = "force whip";   break;
        case  8: min_level = 13; spell = "harm";          break;
        case  9: min_level = 9; spell = "force bolt";       break;
        case 10: min_level = 1; spell = "force spray";     break;
        default: return FALSE;
        }

      if ( ch->top_level >= min_level )
        break;
    }

  if ( ( sn = skill_lookup( spell ) ) < 0 )
    return FALSE;

  (*skill_table[sn]->spell_fun) ( sn, ch->top_level, ch, victim );

  return TRUE;
}
