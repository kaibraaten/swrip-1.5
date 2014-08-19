#include "mud.h"
#include "character.h"

void do_massign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  m_lo, m_hi;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  m_lo = atoi( arg2 );  m_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || m_lo < 0 || m_hi < 0 )
    {
      SendToCharacter( "Syntax: massign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      SendToCharacter( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_CREATOR )
    {
      SendToCharacter( "They wouldn't know what to do with a monster range.\r\n", ch );
      return;
    }
  if ( m_lo > m_hi )
    {
      SendToCharacter( "Unacceptable monster range.\r\n", ch );
      return;
    }
  victim->pcdata->m_range_lo = m_lo;
  victim->pcdata->m_range_hi = m_hi;
  AssignAreaTo( victim );
  SendToCharacter( "Done.\r\n", ch );
  ChPrintf( victim, "%s has assigned you the monster vnum range %d - %d.\r\n",
             ch->name, m_lo, m_hi );
}
