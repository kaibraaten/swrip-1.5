#include "character.h"
#include "mud.h"

void do_rassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  r_lo, r_hi;
  Character *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  r_lo = atoi( arg2 );
  r_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || r_lo < 0 || r_hi < 0 )
    {
      send_to_char( "Syntax: assign <who> <low> <high>\r\n", ch );
      return;
    }

  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_AVATAR )
    {
      send_to_char( "They wouldn't know what to do with a room range.\r\n", ch );
      return;
    }

  if ( r_lo > r_hi )
    {
      send_to_char( "Unacceptable room range.\r\n", ch );
      return;
    }

  if ( r_lo == 0 )
    r_hi = 0;

  victim->pcdata->r_range_lo = r_lo;
  victim->pcdata->r_range_hi = r_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the room range %d - %d.\r\n",
             ch->name, r_lo, r_hi );
  assign_area( victim );

  if ( !victim->pcdata->area )
    {
      bug( "rassign: assign_area failed", 0 );
      return;
    }

  if (r_lo == 0)
    {
      REMOVE_BIT ( victim->pcdata->area->status, AREA_LOADED );
      SET_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
  else
    {
      SET_BIT( victim->pcdata->area->status, AREA_LOADED );
      REMOVE_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
}
