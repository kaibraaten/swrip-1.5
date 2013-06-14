#include "character.h"
#include "mud.h"

static int CalculateDamage( const Character *caster, const Character *victim, int level )
{
  int hpch = UMAX( 10, caster->hit );
  int dam = number_range( hpch/16+1, hpch/8 );

  if ( saves_breath( level, victim ) )
    {
      dam /= 2;
    }

  if ( is_affected_by(victim, AFF_PROTECT) && is_evil(caster) )
    {
      dam -= (int) (dam / 4);
    }

  return dam;
}


static bool IsEligibleVictim( void *element, void *userData )
{
  const Character *victim = (Character*) element;

  if ( !IsNpc( victim ) && IS_SET( victim->act, PLR_WIZINVIS )
       && victim->pcdata->wizinvis >= LEVEL_IMMORTAL )
    {
      return FALSE;
    }
  else
    {
      return TRUE;
    }
}

ch_ret spell_gas_breath( int sn, int level, Character *caster, void *vo )
{
  bool ch_died = FALSE;
  CerisList *peopleInRoom = NULL;
  CerisListIterator *peopleIterator = NULL;

  if ( IS_SET( caster->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, caster );
      send_to_char( "You fail to breathe.\r\n", caster );
      return rNONE;
    }

  peopleInRoom = List_CopyIf( caster->in_room->People, IsEligibleVictim, NULL );
  peopleIterator = CreateListIterator( peopleInRoom, ForwardsIterator );

  for( ; !ListIterator_IsDone( peopleIterator ); ListIterator_Next( peopleIterator ) )
    {
      Character *victim = (Character*) ListIterator_GetData( peopleIterator );

      if ( IsNpc(caster) ? !IsNpc(victim) : IsNpc(victim) )
        {
          int dam = CalculateDamage( caster, victim, level );

          if ( damage( caster, victim, dam, sn ) == rCHAR_DIED || char_died(caster) )
	    {
	      ch_died = TRUE;
	    }
        }
    }

  DestroyListIterator( peopleIterator );
  DestroyList( peopleInRoom );

  if ( ch_died )
    {
      return rCHAR_DIED;
    }
  else
    {
      return rNONE;
    }
}
