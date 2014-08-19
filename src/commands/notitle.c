#include "mud.h"
#include "character.h"

void do_notitle( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Notitle whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "You failed.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->pcdata->flags, PCFLAG_NOTITLE) )
    {
      RemoveBit(victim->pcdata->flags, PCFLAG_NOTITLE);
      SendToCharacter( "You can set your own title again.\r\n", victim );
      SendToCharacter( "NOTITLE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->pcdata->flags, PCFLAG_NOTITLE);
      sprintf( buf, "%s", victim->name );
      SetCharacterTitle( victim, buf );
      SendToCharacter( "You can't set your own title!\r\n", victim );
      SendToCharacter( "NOTITLE set.\r\n", ch );
    }
}
