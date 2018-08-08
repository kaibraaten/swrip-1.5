#include "character.hpp"
#include "mud.hpp"

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

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );

  if (  (vict =GetCharacterAnywhere(ch, arg1)) == NULL )
    {
      ProgBug( "Mpdream: No such character", ch );
      return;
    }

  if( vict->Position <= POS_SLEEPING)
    {
      vict->Echo(argument);
      vict->Echo("\r\n");
    }
}

