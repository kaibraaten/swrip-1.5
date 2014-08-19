#include "character.h"
#include "mud.h"

void do_delay( Character *ch, char *argument )
{
  Character *victim = NULL;
  char arg[MAX_INPUT_LENGTH];
  int delay = 0;

  SetCharacterColor( AT_IMMORT, ch );

  argument = OneArgument( argument, arg );

  if ( !*arg )
    {
      SendToCharacter( "Syntax:  delay <victim> <# of rounds>\r\n", ch );
      return;
    }

  if ( !( victim = get_char_world( ch, arg ) ) )
    {
      SendToCharacter( "No such character online.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) )
    {
      SendToCharacter( "Mobiles are unaffected by lag.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "You haven't the power to succeed against them.\r\n", ch );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !*arg )
    {
      SendToCharacter( "For how long do you wish to delay them?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "none" ) )
    {
      SendToCharacter( "All character delay removed.\r\n", ch );
      victim->wait = 0;
      return;
    }

  delay = atoi( arg );
  
  if ( delay < 1 )
    {
      SendToCharacter( "Pointless. Try a positive number.\r\n", ch );
      return;
    }

  if ( delay > 999 )
    {
      SendToCharacter( "You cruel bastard. Just kill them.\r\n", ch );
      return;
    }

  SetWaitState( victim, delay * PULSE_VIOLENCE );
  ChPrintf( ch, "You've delayed %s for %d rounds.\r\n", victim->name, delay );
}
