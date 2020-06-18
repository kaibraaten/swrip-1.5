#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

void do_delay( std::shared_ptr<Character> ch, std::string argument )
{
  Character *victim = NULL;
  std::string arg;
  int delay = 0;

  SetCharacterColor( AT_IMMORT, ch );

  argument = OneArgument( argument, arg );

  if ( arg.empty() )
    {
      ch->Echo( "Syntax:  delay <victim> <# of rounds>\r\n" );
      return;
    }

  if ( !( victim = GetCharacterAnywhere( ch, arg ) ) )
    {
      ch->Echo( "No such character online.\r\n" );
      return;
    }

  if ( IsNpc( victim ) )
    {
      ch->Echo( "Mobiles are unaffected by lag.\r\n" );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo( "You don't have the power to succeed against them.\r\n" );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( arg.empty() )
    {
      ch->Echo( "For how long do you wish to delay them?\r\n" );
      return;
    }

  if ( !StrCmp( arg, "none" ) )
    {
      ch->Echo( "All character delay removed.\r\n" );
      victim->Wait = 0;
      return;
    }

  delay = ToLong( arg );
  
  if ( delay < 1 )
    {
      ch->Echo( "Pointless. Try a positive number.\r\n" );
      return;
    }

  if ( delay > 999 )
    {
      ch->Echo( "You cruel bastard. Just kill them.\r\n" );
      return;
    }

  SetWaitState( victim, delay * PULSE_VIOLENCE );
  ch->Echo( "You've delayed %s for %d rounds.\r\n", victim->Name.c_str(), delay );
}

