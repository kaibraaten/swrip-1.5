#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bestow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Bestow whom with what?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( IsNpc( victim ) )
    {
      ch->Echo( "You can't give special abilities to a mob!\r\n" );
      return;
    }

  if ( GetTrustLevel( victim ) > GetTrustLevel( ch ) )
    {
      ch->Echo( "You aren't powerful enough...\r\n" );
      return;
    }

  if (!victim->PCData->Bestowments)
    victim->PCData->Bestowments = CopyString("");

  if ( IsNullOrEmpty( argument ) || !StrCmp( argument, "list" ) )
    {
      ch->Echo( "Current bestowed commands on %s: %s.\r\n",
                victim->Name, victim->PCData->Bestowments );
      return;
    }

  if ( !StrCmp( argument, "none" ) )
    {
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString("");
      ch->Echo( "Bestowments removed from %s.\r\n", victim->Name );
      victim->Echo( "%s has removed your bestowed commands.\r\n", ch->Name );
      return;
    }

  sprintf( buf, "%s %s", victim->PCData->Bestowments, argument );
  FreeMemory( victim->PCData->Bestowments );
  victim->PCData->Bestowments = CopyString( buf );
  victim->Echo( "%s has bestowed on you the command(s): %s\r\n",
                ch->Name, argument );
  ch->Echo( "Done.\r\n" );
}

