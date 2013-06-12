#include "character.h"
#include "mud.h"

static bool IsPotentialVictim( void *element, void *userData )
{
  Character *victim = (Character*) element;
  Character *jedi = (Character*) userData;

  return victim != jedi && can_see( jedi, victim ) && number_bits( 1 ) == 0;  
}

static Character *GetVictim( Character *jedi )
{
  return (Character*) List_FindIf( jedi->in_room->People, IsPotentialVictim, jedi );
}

bool spec_jedi( Character *ch )
{
  Character *victim;

  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  victim = GetVictim( ch );

  if ( !victim )
    return FALSE;

  switch ( number_bits( 3 ) )
    {
    case 0:
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return TRUE;

    case 1:
      spell_smaug( skill_lookup( "alertness" ), ch->top_level, ch, victim );
      return TRUE;

    case 2:
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return TRUE;

    case 3:
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return TRUE;

    case 4:
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return TRUE;

    case 5:
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return TRUE;

    case 6:
      spell_smaug( skill_lookup( "cure serious" ), ch->top_level, ch, victim );
      return TRUE;

    case 7:
      spell_smaug( skill_lookup( "beauty" ), ch->top_level, ch, victim );
      return TRUE;
    }

  return FALSE;
}
