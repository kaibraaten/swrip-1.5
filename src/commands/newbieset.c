#include "character.h"
#include "mud.h"

void do_newbieset( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument (argument, arg2);

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Syntax: newbieset <char>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( ( victim->top_level < 1 ) || ( victim->top_level > 5 ) )
    {
      SendToCharacter( "Level of victim must be 1 to 5.\r\n", ch );
      return;
    }

  obj = CreateObject( get_obj_index(OBJ_VNUM_SCHOOL_GLOWROD), 1 );
  obj_to_char(obj, victim);

  obj = CreateObject( get_obj_index(OBJ_VNUM_SCHOOL_BLADE), 1 );
  obj_to_char(obj, victim);

  Act( AT_IMMORT, "$n has equipped you with a newbieset.", ch, NULL, victim, TO_VICT);
  ChPrintf( ch, "You have re-equipped %s.\r\n", victim->name );
}
