#include "character.h"
#include "mud.h"

void do_pardon( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: pardon <character> <planet>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  send_to_char( "Syntax: pardon <character> <planet>.... But it doesn't work .... Tell Durga to hurry up and finish it :p\r\n", ch );
}
