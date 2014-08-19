#include "character.h"
#include "mud.h"

ch_ret spell_black_lightning( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  int dam;

  dam         = 100;
  if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
    dam -= (int) (dam / 2);

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty(ch);

  Act( AT_BLUE, "Bolts of electricity shoot from the fingers of $n, sending $N into a fit of painful spasms."
       , ch, NULL, victim, TO_NOTVICT );
  Act( AT_BLUE, "Bolts of electricity shoot from your fingertips, sending $N into a fit of painful spasms."
       , ch, NULL, victim, TO_CHAR );
  Act( AT_BLUE, "Intense pain spreads through your body as bolts of electricity from $N assault you."
       , victim, NULL, ch, TO_CHAR );

  if ( saves_poison_death( level, victim ) )
    return InflictDamage( ch, victim, dam, sn );
  else
    {
      InflictDamage( ch, victim, dam, sn );
      if ( char_died(victim) )
        return rCHAR_DIED;
      if ( spell_black_lightning( sn, level, ch, vo ) == rCHAR_DIED )
        return rCHAR_DIED;
      return rNONE;
    }
}
