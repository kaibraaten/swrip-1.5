#include "character.h"
#include "mud.h"

void do_low_purge( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Object *obj = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ))
    {
      SendToCharacter( "Purge what?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL
       && ( obj = GetObjectHere ( ch, arg ) ) == NULL )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return;
    }

  if ( obj )
    {
      SeparateOneObjectFromGroup( obj );
      Act( AT_IMMORT, "$n purges $p!", ch, obj, NULL, TO_ROOM );
      Act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR );
      ExtractObject( obj );
      return;
    }

  if ( !IsNpc(victim) )
    {
      SendToCharacter( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "You cannot purge yourself!\r\n", ch );
      return;
    }

  Act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  Act( AT_IMMORT, "You make $N disappear in a puff of smoke!",
       ch, NULL, victim, TO_CHAR );
  ExtractCharacter( victim, true );
}
