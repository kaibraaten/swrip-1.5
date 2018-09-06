#include "mud.hpp"
#include "character.hpp"
#include "systemdata.hpp"

void do_force( Character *ch, std::string argument )
{
  std::string arg;
  bool mobsonly = false;
  argument = OneArgument( argument, arg );

  if ( arg.empty() || argument.empty() )
    {
      ch->Echo( "Force whom to do what?\r\n" );
      return;
    }

  mobsonly = GetTrustLevel( ch ) < SysData.LevelToForcePlayers;

  if ( !StrCmp( arg, "all" ) )
    {
      Character *vch = nullptr;
      Character *vch_next = nullptr;

      if ( mobsonly )
        {
          ch->Echo( "Force whom to do what?\r\n" );
          return;
        }

      for ( vch = FirstCharacter; vch; vch = vch_next )
        {
          vch_next = vch->Next;

          if ( !IsNpc(vch) && GetTrustLevel( vch ) < GetTrustLevel( ch ) )
            {
              Act( AT_IMMORT, "$n forces you to '$t'.",
                   ch, argument.c_str(), vch, TO_VICT );
              Interpret( vch, argument );
	    }
        }
    }
  else
    {
      Character *victim = nullptr;

      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
        {
          ch->Echo( "They aren't here.\r\n" );
          return;
        }

      if ( victim == ch )
        {
          ch->Echo( "Aye aye, right away!\r\n" );
          return;
        }

      if ( ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
           || ( mobsonly && !IsNpc( victim ) ) )
        {
          ch->Echo( "Do it yourself!\r\n" );
          return;
        }

      Act( AT_IMMORT, "$n forces you to '$t'.",
           ch, argument.c_str(), victim, TO_VICT );
      Interpret( victim, argument );
    }

  ch->Echo( "Ok.\r\n" );
}

