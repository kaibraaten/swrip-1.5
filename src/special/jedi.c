#include "character.h"
#include "mud.h"
#include "skill.h"

bool spec_jedi( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && CanSeeCharacter( ch, victim ) && NumberBits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return false;

  switch ( NumberBits( 3 ) )
    {
    case 0:
      spell_smaug( LookupSkill( "armor" ), ch->top_level, ch, victim );
      return true;

    case 1:
      spell_smaug( LookupSkill( "alertness" ), ch->top_level, ch, victim );
      return true;

    case 2:
      spell_cure_blindness( LookupSkill( "cure blindness" ),
                            ch->top_level, ch, victim );
      return true;

    case 3:
      spell_smaug( LookupSkill( "cure light" ),
                   ch->top_level, ch, victim );
      return true;

    case 4:
      spell_cure_poison( LookupSkill( "cure poison" ),
                         ch->top_level, ch, victim );
      return true;

    case 5:
      spell_smaug( LookupSkill( "refresh" ), ch->top_level, ch, victim );
      return true;

    case 6:
      spell_smaug( LookupSkill( "cure serious" ), ch->top_level, ch, victim );
      return true;

    case 7:
      spell_smaug( LookupSkill( "beauty" ), ch->top_level, ch, victim );
      return true;
    }

  return false;
}
