#include "character.h"
#include "mud.h"

void do_log( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Log whom?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      if ( fLogAll )
        {
          fLogAll = FALSE;
          send_to_char( "Log ALL off.\r\n", ch );
        }
      else
        {
          fLogAll = TRUE;
          send_to_char( "Log ALL on.\r\n", ch );
        }
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  /*
   * No level check, gods can log anyone.
   */
  if ( IS_SET(victim->act, PLR_LOG) )
    {
      REMOVE_BIT(victim->act, PLR_LOG);
      send_to_char( "LOG removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_LOG);
      send_to_char( "LOG set.\r\n", ch );
    }
}
