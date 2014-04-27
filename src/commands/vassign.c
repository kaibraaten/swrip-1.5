#include "character.h"
#include "mud.h"

void do_vassign( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  r_lo, r_hi;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  r_lo = atoi( arg2 );
  r_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || r_lo < 0 || r_hi < 0 )
    {
      send_to_char( "Syntax: vassign <who> <low> <high>\r\n", ch );
      return;
    }

  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }

  if ( is_npc( victim ) || get_trust( victim ) < LEVEL_CREATOR )
    {
      send_to_char( "They wouldn't know what to do with a vnum range.\r\n", ch );
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
  victim->pcdata->o_range_lo = r_lo;
  victim->pcdata->o_range_hi = r_hi;
  victim->pcdata->m_range_lo = r_lo;
  victim->pcdata->m_range_hi = r_hi;

  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the vnum range %d - %d.\r\n",
             ch->name, r_lo, r_hi );
  assign_area( victim );        /* Put back by Thoric on 02/07/96 */

  if ( !victim->pcdata->area )
    {
      bug( "rassign: assign_area failed", 0 );
      return;
    }

  if (r_lo == 0)                                /* Scryn 8/12/95 */
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
