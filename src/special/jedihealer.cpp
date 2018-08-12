#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

bool spec_jedi_healer( Character *ch )
{
  Character *victim = nullptr;
  Character *v_next = nullptr;

  if ( !IsAwake(ch) )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;
      if ( victim != ch && CanSeeCharacter( ch, victim ) && NumberBits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return false;

  switch ( NumberBits( 12 ) )
    {
    case 0:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "armor" ), ch->TopLevel, ch, victim );
      return true;

    case 1:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "good fortune" ), ch->TopLevel, ch, victim );
      return true;

    case 2:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( LookupSkill( "cure blindness" ),
                            ch->TopLevel, ch, victim );
      return true;

    case 3:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "cure light" ),
                   ch->TopLevel, ch, victim );
      return true;

    case 4:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( LookupSkill( "cure poison" ),
                         ch->TopLevel, ch, victim );
      return true;

    case 5:
      Act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( LookupSkill( "refresh" ), ch->TopLevel, ch, victim );
      return true;

    }

  return false;
}

