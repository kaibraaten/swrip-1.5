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
          fLogAll = false;
          send_to_char( "Log ALL off.\r\n", ch );
        }
      else
        {
          fLogAll = true;
          send_to_char( "Log ALL on.\r\n", ch );
        }
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  /*
   * No level check, gods can log anyone.
   */
  if ( IsBitSet(victim->act, PLR_LOG) )
    {
      RemoveBit(victim->act, PLR_LOG);
      send_to_char( "LOG removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_LOG);
      send_to_char( "LOG set.\r\n", ch );
    }
}
