#include "character.h"
#include "mud.h"

/*
 *   Sends a message to sleeping character.  Should be fun
 *    with room sleep_progs
 *
 */
void do_mpdream( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_STRING_LENGTH];
  CHAR_DATA *vict;

  if ( IS_AFFECTED( ch, AFF_CHARM ) )
    return;

  if ( !IS_NPC( ch ) || ( ch->desc && get_trust( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );

  if (  (vict =get_char_world(ch, arg1)) == NULL )
    {
      progbug( "Mpdream: No such character", ch );
      return;
    }

  if( vict->position <= POS_SLEEPING)
    {
      send_to_char(argument, vict);
      send_to_char("\r\n",   vict);
    }
}
