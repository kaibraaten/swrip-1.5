#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_massign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  m_lo = 0, m_hi = 0;
  Character *victim = NULL;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  m_lo = atoi( arg2 );  m_hi = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || m_lo < 0 || m_hi < 0 )
    {
      ch->Echo("Syntax: massign <who> <low> <high>\r\n");
      return;
    }

  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      ch->Echo("They don't seem to be around.\r\n");
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_CREATOR )
    {
      ch->Echo("They wouldn't know what to do with a monster range.\r\n");
      return;
    }

  if ( m_lo > m_hi )
    {
      ch->Echo("Unacceptable monster range.\r\n");
      return;
    }

  victim->PCData->Build.VnumRanges.Mob.First = m_lo;
  victim->PCData->Build.VnumRanges.Mob.Last = m_hi;
  AssignAreaTo( victim );
  ch->Echo("Done.\r\n");
  victim->Echo("%s has assigned you the monster vnum range %d - %d.\r\n",
             ch->Name, m_lo, m_hi );
}

