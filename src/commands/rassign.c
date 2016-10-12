#include "character.h"
#include "mud.h"

void do_rassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  r_lo, r_hi;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  r_lo = atoi( arg2 );
  r_hi = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || r_lo < 0 || r_hi < 0 )
    {
      SendToCharacter( "Syntax: assign <who> <low> <high>\r\n", ch );
      return;
    }

  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      SendToCharacter( "They don't seem to be around.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_AVATAR )
    {
      SendToCharacter( "They wouldn't know what to do with a room range.\r\n", ch );
      return;
    }

  if ( r_lo > r_hi )
    {
      SendToCharacter( "Unacceptable room range.\r\n", ch );
      return;
    }

  if ( r_lo == 0 )
    r_hi = 0;

  victim->PCData->r_range_lo = r_lo;
  victim->PCData->r_range_hi = r_hi;
  AssignAreaTo( victim );
  SendToCharacter( "Done.\r\n", ch );
  Echo( victim, "%s has assigned you the room range %d - %d.\r\n",
             ch->Name, r_lo, r_hi );
  AssignAreaTo( victim );

  if ( !victim->PCData->area )
    {
      Bug( "rassign: AssignAreaTo failed", 0 );
      return;
    }

  if (r_lo == 0)
    {
      RemoveBit ( victim->PCData->area->status, AREA_LOADED );
      SetBit( victim->PCData->area->status, AREA_DELETED );
    }
  else
    {
      SetBit( victim->PCData->area->status, AREA_LOADED );
      RemoveBit( victim->PCData->area->status, AREA_DELETED );
    }
}
