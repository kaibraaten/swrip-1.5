#include "mud.h"
#include "character.h"

void do_force( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool mobsonly;
  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Force whom to do what?\r\n", ch );
      return;
    }

  mobsonly = GetTrustLevel( ch ) < SysData.LevelToForcePlayers;

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch;
      Character *vch_next;

      if ( mobsonly )
        {
          SendToCharacter( "Force whom to do what?\r\n", ch );
          return;
        }

      for ( vch = FirstCharacter; vch; vch = vch_next )
        {
          vch_next = vch->Next;

          if ( !IsNpc(vch) && GetTrustLevel( vch ) < GetTrustLevel( ch ) )
            {
              Act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, vch, TO_VICT );
              Interpret( vch, argument );
	    }
        }
    }
  else
    {
      Character *victim;

      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          SendToCharacter( "Aye aye, right away!\r\n", ch );
          return;
        }

      if ( ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
           || ( mobsonly && !IsNpc( victim ) ) )
        {
          SendToCharacter( "Do it yourself!\r\n", ch );
          return;
        }

      Act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, victim, TO_VICT );
      Interpret( victim, argument );
    }

  SendToCharacter( "Ok.\r\n", ch );
}
