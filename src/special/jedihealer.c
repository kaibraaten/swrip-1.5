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

bool spec_jedi_healer( Character *ch )
{
  Character *victim;

  if ( !is_awake(ch) )
    return FALSE;

  victim = GetVictim( ch );

  if ( !victim )
    return FALSE;

  switch ( number_bits( 12 ) )
    {
    case 0:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return TRUE;

    case 1:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "good fortune" ), ch->top_level, ch, victim );
      return TRUE;

    case 2:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return TRUE;

    case 3:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return TRUE;

    case 4:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return TRUE;

    case 5:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return TRUE;

    }

  return FALSE;
}
