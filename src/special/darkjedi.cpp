#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

bool spec_dark_jedi( Character *ch )
{
  Character *victim;
  Character *v_next;
  char *spell;
  int sn;

  if ( ch->Position != POS_FIGHTING )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;

      if ( GetFightingOpponent( victim ) && NumberBits( 2 ) == 0 )
        break;
    }

  if ( !victim || victim == ch )
    return false;

  for ( ;; )
    {
      int min_level;

      switch ( NumberBits( 4 ) )
        {
        case  0:
	  min_level =  5;
	  spell = "blindness";
	  break;

        case  2:
	  min_level =  9;
	  spell = "choke";
	  break;

        case  3:
	  min_level =  8;
	  spell = "invade essence";
	  break;

        case  6:
	  min_level = 13;
	  spell = "drain essence";
	  break;

        case  8:
	  min_level = 13;
	  spell = "harm";
          break;

        case  9:
	  min_level = 9;
	  spell = "force bolt";
	  break;

        case 10:
	  min_level = 1;
	  spell = "force spray";
	  break;

        default:
	  return false;
        }

      if ( ch->TopLevel >= min_level )
	{
	  break;
	}
    }

  if ( ( sn = LookupSkill( spell ) ) < 0 )
    {
      return false;
    }

  SkillTable[sn]->SpellFunction( sn, ch->TopLevel, ch, victim );

  return true;
}
