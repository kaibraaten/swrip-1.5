#include "mud.hpp"
#include "character.hpp"

/*
 * Force a level one player to quit.             Gorog
 */
void do_fquit( Character *ch, char *argument )
{
  Character *victim = nullptr;
  char arg1[MAX_INPUT_LENGTH];
  argument = OneArgument( argument, arg1 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Force whom to quit?\r\n" );
      return;
    }

  if ( !( victim = GetCharacterAnywhere( ch, arg1 ) ) )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( victim->TopLevel != 1 )
    {
      ch->Echo( "They are not level one!\r\n" );
      return;
    }

  victim->Echo( "The MUD administrators force you to quit\r\n" );
  do_quit(victim, "");
  ch->Echo( "Ok.\r\n" );
}

