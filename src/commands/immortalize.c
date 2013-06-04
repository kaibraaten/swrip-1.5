#include "character.h"
#include "mud.h"

void do_immortalize( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: immortalize <char>\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim->top_level != LEVEL_AVATAR )
    {
      send_to_char( "This player is not worthy of immortality yet.\r\n", ch );
      return;
    }

  send_to_char( "Immortalizing a player...\r\n", ch );
  set_char_color( AT_IMMORT, victim );
  act( AT_IMMORT, "$n begins to chant softly... then raises $s arms to the sky...",
       ch, NULL, NULL, TO_ROOM );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You suddenly feel very strange...\r\n\r\n", victim );
  set_char_color( AT_LBLUE, victim );

  do_help(victim, "M_GODLVL1_" );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You awake... all your possessions are gone.\r\n", victim );
  while ( victim->first_carrying )
    extract_obj( victim->first_carrying );

  victim->top_level = LEVEL_IMMORTAL;
  victim->trust = 0;
}
