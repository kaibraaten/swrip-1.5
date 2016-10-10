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

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpforce - Bad syntax", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch;

      for ( vch = ch->in_room->FirstPerson; vch; vch = vch->next_in_room )
        if ( GetTrustLevel( vch ) < GetTrustLevel( ch ) && CanSeeCharacter( ch, vch ) )
          Interpret( vch, argument );
    }
  else
    {
      Character *victim;

      if ( ( victim = GetCharacterInRoomMudProg( ch, arg ) ) == NULL )
        {
          ProgBug( "Mpforce - No such victim", ch );
          return;
        }

      if ( victim == ch )
        {
          ProgBug( "Mpforce - Forcing oneself", ch );
          return;
        }

      if ( !IsNpc( victim )
           && ( !victim->desc )
           && IsImmortal( victim ) )
        {
          ProgBug( "Mpforce - Attempting to force link dead immortal", ch );
          return;
        }


      Interpret( victim, argument );
    }
}
