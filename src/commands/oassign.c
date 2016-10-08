#include "character.h"
#include "mud.h"

void do_oassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  o_lo, o_hi;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  o_lo = atoi( arg2 );  o_hi = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || o_lo < 0 || o_hi < 0 )
    {
      SendToCharacter( "Syntax: oassign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      SendToCharacter( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_CREATOR )
    {
      SendToCharacter( "They wouldn't know what to do with an object range.\r\n", ch );
      return;
    }
  if ( o_lo > o_hi )
    {
      SendToCharacter( "Unacceptable object range.\r\n", ch );
      return;
    }
  victim->pcdata->o_range_lo = o_lo;
  victim->pcdata->o_range_hi = o_hi;
  AssignAreaTo( victim );
  SendToCharacter( "Done.\r\n", ch );
  Echo( victim, "%s has assigned you the object vnum range %d - %d.\r\n",
             ch->name, o_lo, o_hi );
}
