#include "character.h"
#include "mud.h"

/* lets the mobile force someone to do something.  must be mortal level
   and the all argument only affects those in the room with the mobile */

void do_mpforce( CHAR_DATA *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) || ch->desc )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      progbug( "Mpforce - Bad syntax", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      CHAR_DATA *vch;

      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        if ( get_trust( vch ) < get_trust( ch ) && can_see( ch, vch ) )
          interpret( vch, argument );
    }
  else
    {
      CHAR_DATA *victim;

      if ( ( victim = get_char_room_mp( ch, arg ) ) == NULL )
        {
          progbug( "Mpforce - No such victim", ch );
          return;
        }

      if ( victim == ch )
        {
          progbug( "Mpforce - Forcing oneself", ch );
          return;
        }

      if ( !IS_NPC( victim )
           && ( !victim->desc )
           && IS_IMMORTAL( victim ) )
        {
          progbug( "Mpforce - Attempting to force link dead immortal", ch );
          return;
        }


      interpret( victim, argument );
    }
}
