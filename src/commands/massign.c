#include "mud.h"
#include "character.h"

void do_massign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  m_lo, m_hi;
  Character *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  m_lo = atoi( arg2 );  m_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || m_lo < 0 || m_hi < 0 )
    {
      send_to_char( "Syntax: massign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( is_npc( victim ) || get_trust( victim ) < LEVEL_CREATOR )
    {
      send_to_char( "They wouldn't know what to do with a monster range.\r\n", ch );
      return;
    }
  if ( m_lo > m_hi )
    {
      send_to_char( "Unacceptable monster range.\r\n", ch );
      return;
    }
  victim->pcdata->m_range_lo = m_lo;
  victim->pcdata->m_range_hi = m_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the monster vnum range %d - %d.\r\n",
             ch->name, m_lo, m_hi );
}
