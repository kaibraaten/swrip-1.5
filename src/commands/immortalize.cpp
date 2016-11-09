#include "character.hpp"
#include "mud.hpp"

void do_immortalize( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Syntax: immortalize <char>\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim->TopLevel != LEVEL_AVATAR )
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
  while ( victim->FirstCarrying )
    ExtractObject( victim->FirstCarrying );

  victim->TopLevel = LEVEL_IMMORTAL;
  victim->Trust = 0;
}
