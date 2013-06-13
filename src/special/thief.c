#include "character.h"
#include "mud.h"

static bool IsPotentialVictim( void *element, void *userData )
{
  const Character *victim = (Character*) element;
  const Character *thief = (Character*) userData;

  if ( IsImmortal( victim )
       || number_bits( 2 ) != 0
       || !can_see( thief, victim ) )
    {
      return FALSE;
    }

  return TRUE;
}

static Character *GetVictimInRoom( Character *thief )
{
  CerisList *potentialVictims = List_CopyIf( thief->in_room->People, IsPotentialVictim, thief );
  Character *victim = NULL;

  if( List_Count( potentialVictims ) > 0 )
    {
      CerisListIterator *iter = CreateListIterator( potentialVictims, ForwardsIterator );
      victim = (Character*) ListIterator_GetData( iter );
      DestroyListIterator( iter );
    }

  DestroyList( potentialVictims );

  return victim;
}

static void StealMoney( Character *thief, Character *victim )
{
  int maxgold = 1000;
  int gold = victim->gold * number_range( 1, URANGE(2, thief->top_level/4, 10) ) / 100;
  thief->gold += 9 * gold / 10;
  victim->gold -= gold;

  if ( thief->gold > maxgold )
    {
      boost_economy( thief->in_room->area, thief->gold - maxgold/2 );
      thief->gold = maxgold/2;
    }
}

static void GetDiscovered( Character *thief, Character *victim )
{
  act( AT_ACTION, "You discover $n's hands in your wallet!",
       thief, NULL, victim, TO_VICT );
  act( AT_ACTION, "$N discovers $n's hands in $S wallet!",
       thief, NULL, victim, TO_NOTVICT );
}

bool spec_thief( Character *thief )
{
  Character *victim = NULL;
 
  if ( thief->position != POS_STANDING )
    {
      return FALSE;
    }

  victim = GetVictimInRoom( thief );

  if( victim )
    {
      if ( is_awake(victim) && number_range( 0, thief->top_level ) == 0 )
        {
	  GetDiscovered( thief, victim );
        }
      else
        {
	  StealMoney( thief, victim );
        }

      return TRUE;
    }

  return FALSE;
}
