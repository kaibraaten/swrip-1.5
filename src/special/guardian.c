#include "mud.h"

bool spec_guardian( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  CHAR_DATA *ech;
  char *crime;
  int max_evil;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  max_evil = 300;
  ech      = NULL;
  crime    = "";

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim->fighting
           &&   who_fighting( victim ) != ch
           &&   victim->alignment < max_evil )
        {
          max_evil = victim->alignment;
          ech      = victim;
        }
    }

  if ( victim && IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      sprintf( buf, "%s is a %s!  As well as a COWARD!",
               victim->name, crime );
      do_yell( ch, buf );
      return TRUE;
    }

  if ( victim )
    {
      sprintf( buf, "%s is a %s!  PROTECT THE INNOCENT!!",
               victim->name, crime );
      do_shout( ch, buf );
      multi_hit( ch, victim, TYPE_UNDEFINED );
      return TRUE;
    }

  if ( ech )
    {
      act( AT_YELL, "$n screams 'PROTECT THE INNOCENT!!",
           ch, NULL, NULL, TO_ROOM );
      multi_hit( ch, ech, TYPE_UNDEFINED );
      return TRUE;
    }

  return FALSE;
}
