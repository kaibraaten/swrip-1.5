#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

bool spec_dark_jedi( Character *ch )
{
  Character *victim = nullptr;
  const char *spell = nullptr;
  int sn = 0;

  if ( ch->Position != POS_FIGHTING )
    return false;

  for(Character *fighter : ch->InRoom->Characters())
    {
      if ( GetFightingOpponent( fighter ) && NumberBits( 2 ) == 0 )
        {
          victim = fighter;
          break;
        }
    }

  if ( !victim || victim == ch )
    return false;

  for ( ;; )
    {
      int min_level = 0;

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

