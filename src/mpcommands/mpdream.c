#include "character.h"
#include "mud.h"

/*
 *   Sends a message to sleeping character.  Should be fun
 *    with room sleep_progs
 *
 */
void do_mpdream( Character *ch, char *argument )
{
  char arg1[MAX_STRING_LENGTH];
  Character *vict;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if (  (vict =get_char_world(ch, arg1)) == NULL )
    {
      progbug( "Mpdream: No such character", ch );
      return;
    }

  if( vict->position <= POS_SLEEPING)
    {
      SendToCharacter(argument, vict);
      SendToCharacter("\r\n",   vict);
    }
}
