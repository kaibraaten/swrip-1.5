#include "character.h"
#include "mud.h"

/* lets the mobile force someone to do something.  must be mortal level
   and the all argument only affects those in the room with the mobile */

void do_mpforce( Character *ch, char *argument )
{
  char arg[ MAX_INPUT_LENGTH ];

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ch->desc )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      progbug( "Mpforce - Bad syntax", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch;

      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        if ( GetTrustLevel( vch ) < GetTrustLevel( ch ) && CanSeeCharacter( ch, vch ) )
          interpret( vch, argument );
    }
  else
    {
      Character *victim;

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

      if ( !IsNpc( victim )
           && ( !victim->desc )
           && IsImmortal( victim ) )
        {
          progbug( "Mpforce - Attempting to force link dead immortal", ch );
          return;
        }


      interpret( victim, argument );
    }
}
