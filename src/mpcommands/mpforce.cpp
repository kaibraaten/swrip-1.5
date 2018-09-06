#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

/* lets the mobile force someone to do something.  must be mortal level
   and the all argument only affects those in the room with the mobile */

void do_mpforce( Character *ch, std::string argument )
{
  std::string arg;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ch->Desc )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg.empty() || argument.empty() )
    {
      ProgBug( "Mpforce - Bad syntax", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      std::list<Character*> charactersToForce(ch->InRoom->Characters());

      for(Character *vch : charactersToForce)
        {
          if ( GetTrustLevel( vch ) < GetTrustLevel( ch ) && CanSeeCharacter( ch, vch ) )
            {
              Interpret( vch, argument );
            }
        }
    }
  else
    {
      Character *victim = nullptr;

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
           && ( !victim->Desc )
           && IsImmortal( victim ) )
        {
          ProgBug( "Mpforce - Attempting to force link dead immortal", ch );
          return;
        }

      Interpret( victim, argument );
    }
}
