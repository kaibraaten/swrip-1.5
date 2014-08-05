#include "character.h"
#include "mud.h"

void do_oassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  o_lo, o_hi;
  Character *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  o_lo = atoi( arg2 );  o_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || o_lo < 0 || o_hi < 0 )
    {
      send_to_char( "Syntax: oassign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( is_npc( victim ) || get_trust( victim ) < LEVEL_CREATOR )
    {
      send_to_char( "They wouldn't know what to do with an object range.\r\n", ch );
      return;
    }
  if ( o_lo > o_hi )
    {
      send_to_char( "Unacceptable object range.\r\n", ch );
      return;
    }
  victim->pcdata->o_range_lo = o_lo;
  victim->pcdata->o_range_hi = o_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the object vnum range %d - %d.\r\n",
             ch->name, o_lo, o_hi );
}
