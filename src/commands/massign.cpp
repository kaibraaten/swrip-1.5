#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_massign( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  std::string arg3;
  Character *victim = NULL;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  vnum_t m_lo = ToLong( arg2 );
  vnum_t m_hi = ToLong( arg3 );

  if ( arg1.empty() || m_lo < 0 || m_hi < 0 )
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
  victim->Echo("%s has assigned you the monster vnum range %ld - %ld.\r\n",
               ch->Name.c_str(), m_lo, m_hi );
}

