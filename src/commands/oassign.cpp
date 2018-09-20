#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_oassign( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  std::string arg3;
  Character *victim = NULL;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );

  vnum_t o_lo = ToLong( arg2 );
  vnum_t o_hi = ToLong( arg3 );

  if ( arg1.empty() || o_lo < 0 || o_hi < 0 )
    {
      ch->Echo("Syntax: oassign <who> <low> <high>\r\n");
      return;
    }

  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      ch->Echo("They don't seem to be around.\r\n");
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_CREATOR )
    {
      ch->Echo("They wouldn't know what to do with an object range.\r\n");
      return;
    }

  if ( o_lo > o_hi )
    {
      ch->Echo("Unacceptable object range.\r\n");
      return;
    }

  victim->PCData->Build.VnumRanges.Object.First = o_lo;
  victim->PCData->Build.VnumRanges.Object.Last = o_hi;
  AssignAreaTo( victim );
  ch->Echo("Done.\r\n");
  victim->Echo("%s has assigned you the object vnum range %d - %d.\r\n",
               ch->Name.c_str(), o_lo, o_hi );
}

