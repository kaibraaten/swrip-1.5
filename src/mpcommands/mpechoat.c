#include "character.h"
#include "mud.h"

/* prints message only to victim */

void do_mpechoat( Character *ch, char *argument )
{
  char       arg[ MAX_INPUT_LENGTH ];
  Character *victim;
  int        actflags;
  short     color;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      progbug( "Mpechoat - No argument", ch );
      return;
    }

  if ( !( victim = get_char_room_mp( ch, arg ) ) )
    {
      progbug( "Mpechoat - victim does not exist", ch );
      return;
    }

  actflags = ch->act;
  REMOVE_BIT(ch->act, ACT_SECRETIVE);

  if ( (color = get_color(argument)) )
    {
      argument = one_argument( argument, arg );
      act( color, argument, ch, NULL, victim, TO_VICT );
    }
  else
    act( AT_ACTION, argument, ch, NULL, victim, TO_VICT );

  ch->act = actflags;
}
