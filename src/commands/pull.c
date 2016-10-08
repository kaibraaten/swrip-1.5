#include "character.h"
#include "mud.h"

void do_pull( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Pull what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( obj = GetObjectHere( ch, arg ) ) == NULL )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg, TO_CHAR );
      return;
    }

  PullOrPush( ch, obj, true );
}
