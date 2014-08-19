#include "mud.h"
#include "character.h"

/*
 * Force a level one player to quit.             Gorog
 */
void do_fquit( Character *ch, char *argument )
{
  Character *victim;
  char arg1[MAX_INPUT_LENGTH];
  argument = OneArgument( argument, arg1 );

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Force whom to quit?\r\n", ch );
      return;
    }

  if ( !( victim = GetCharacterAnywhere( ch, arg1 ) ) )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->top_level != 1 )
    {
      SendToCharacter( "They are not level one!\r\n", ch );
      return;
    }

  SendToCharacter( "The MUD administrators force you to quit\r\n", victim );
  do_quit (victim, "");
  SendToCharacter( "Ok.\r\n", ch );
}
