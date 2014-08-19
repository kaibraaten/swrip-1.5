#include "character.h"
#include "mud.h"

void do_immortalize( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Syntax: immortalize <char>\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim->top_level != LEVEL_AVATAR )
    {
      SendToCharacter( "This player is not worthy of immortality yet.\r\n", ch );
      return;
    }

  SendToCharacter( "Immortalizing a player...\r\n", ch );
  SetCharacterColor( AT_IMMORT, victim );
  Act( AT_IMMORT, "$n begins to chant softly... then raises $s arms to the sky...",
       ch, NULL, NULL, TO_ROOM );
  SetCharacterColor( AT_WHITE, victim );
  SendToCharacter( "You suddenly feel very strange...\r\n\r\n", victim );
  SetCharacterColor( AT_LBLUE, victim );

  do_help(victim, "M_GODLVL1_" );
  SetCharacterColor( AT_WHITE, victim );
  SendToCharacter( "You awake... all your possessions are gone.\r\n", victim );
  while ( victim->first_carrying )
    ExtractObject( victim->first_carrying );

  victim->top_level = LEVEL_IMMORTAL;
  victim->trust = 0;
}
