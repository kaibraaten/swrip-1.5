#include "mud.hpp"
#include "character.hpp"

bool spec_guardian( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim;
  Character *v_next;
  Character *ech;
  char *crime;
  int max_evil;

  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  max_evil = 300;
  ech      = NULL;
  crime    = "";

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;

      if ( victim->Fighting
           &&   GetFightingOpponent( victim ) != ch
           &&   victim->Alignment < max_evil )
        {
          max_evil = victim->Alignment;
          ech      = victim;
        }
    }

  if ( victim && IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      sprintf( buf, "%s is a %s! As well as a COWARD!",
               victim->Name, crime );
      do_yell( ch, buf );
      return true;
    }

  if ( victim )
    {
      sprintf( buf, "%s is a %s!  PROTECT THE INNOCENT!!",
               victim->Name, crime );
      do_shout( ch, buf );
      HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
      return true;
    }

  if ( ech )
    {
      Act( AT_YELL, "$n screams 'PROTECT THE INNOCENT!!",
           ch, NULL, NULL, TO_ROOM );
      HitMultipleTimes( ch, ech, TYPE_UNDEFINED );
      return true;
    }

  return false;
}

