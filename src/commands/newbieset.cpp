#include "character.hpp"
#include "mud.hpp"

void do_newbieset( Character *ch, std::string argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument (argument, arg2);

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Syntax: newbieset <char>.\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( ( victim->TopLevel < 1 ) || ( victim->TopLevel > 5 ) )
    {
      SendToCharacter( "Level of victim must be 1 to 5.\r\n", ch );
      return;
    }

  obj = CreateObject( GetProtoObject(OBJ_VNUM_SCHOOL_GLOWROD), 1 );
  ObjectToCharacter(obj, victim);

  obj = CreateObject( GetProtoObject(OBJ_VNUM_SCHOOL_BLADE), 1 );
  ObjectToCharacter(obj, victim);

  Act( AT_IMMORT, "$n has equipped you with a newbieset.", ch, NULL, victim, TO_VICT);
  Echo( ch, "You have re-equipped %s.\r\n", victim->Name );
}
