#include "character.hpp"
#include "mud.hpp"

void do_pardon( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Syntax: pardon <character> <planet>.\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  SendToCharacter( "Syntax: pardon <character> <planet>.... But it doesn't work .... Tell Durga to hurry up and finish it :p\r\n", ch );
}
