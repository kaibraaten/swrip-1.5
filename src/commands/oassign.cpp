#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_oassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  o_lo = 0, o_hi = 0;
  Character *victim = NULL;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  o_lo = atoi( arg2 );  o_hi = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || o_lo < 0 || o_hi < 0 )
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
             ch->Name, o_lo, o_hi );
}

