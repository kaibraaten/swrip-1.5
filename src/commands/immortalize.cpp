#include "character.hpp"
#include "mud.hpp"

void do_immortalize( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Syntax: immortalize <char>\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("That player is not here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( victim->TopLevel != LEVEL_AVATAR )
    {
      ch->Echo("This player is not worthy of immortality yet.\r\n");
      return;
    }

  ch->Echo("Immortalizing a player...\r\n");
  SetCharacterColor( AT_IMMORT, victim );
  Act( AT_IMMORT, "$n begins to chant softly... then raises $s arms to the sky...",
       ch, NULL, NULL, TO_ROOM );
  SetCharacterColor( AT_WHITE, victim );
  victim->Echo("You suddenly feel very strange...\r\n\r\n");
  SetCharacterColor( AT_LBLUE, victim );

  do_help(victim, "M_GODLVL1_" );
  SetCharacterColor( AT_WHITE, victim );
  victim->Echo("You awake... all your possessions are gone.\r\n");
  while ( victim->FirstCarrying )
    ExtractObject( victim->FirstCarrying );

  victim->TopLevel = LEVEL_IMMORTAL;
  victim->Trust = 0;
}

