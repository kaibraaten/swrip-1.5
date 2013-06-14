#include "character.h"
#include "mud.h"

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

static int CalculateDamage( const Character *caster, const Character *victim, int level )
{
  int hpch = UMAX( 10, caster->hit );
  int dam = number_range( hpch/14+1, hpch/7 );

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

ch_ret spell_spiral_blast( int sn, int level, Character *caster, void *vo )
{
  bool ch_died = FALSE;
  CerisList *victims = NULL;
  CerisListIterator *victimIterator = NULL;

  if ( IS_SET( caster->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, caster );
      send_to_char( "You fail to breathe.\r\n", caster );
      return rNONE;
    }


  send_to_char("You feel the hatred grow within you!\r\n", caster);
  caster->alignment -= 100;
  caster->alignment = URANGE( -1000, caster->alignment, 1000 );
  sith_penalty( caster );

  victims = List_CopyIf( caster->in_room->People, IsEligibleVictim, NULL );
  victimIterator = CreateListIterator( victims, ForwardsIterator );

  for( ; !ListIterator_IsDone( victimIterator ); ListIterator_Next( victimIterator ) )
    {
      Character *victim = (Character*) ListIterator_GetData( victimIterator );

      if ( IsNpc(caster) ? !IsNpc(victim) : IsNpc(victim) )
        {
	  int dam = CalculateDamage( caster, victim, level );

          act( AT_MAGIC, "Swirling colours radiate from $n, encompassing $N.",
               caster, caster, victim, TO_ROOM );
          act( AT_MAGIC, "Swirling colours radiate from you, encompassing $N",
               caster, caster, victim , TO_CHAR );

          if ( damage( caster, victim, dam, sn ) == rCHAR_DIED || char_died(caster) )
	    {
	      ch_died = TRUE;
	    }
        }
    }

  DestroyListIterator( victimIterator );
  DestroyList( victims );

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
