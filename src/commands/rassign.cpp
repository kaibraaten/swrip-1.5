#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_rassign( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  vnum_t r_lo = INVALID_VNUM, r_hi = INVALID_VNUM;
  Character *victim = NULL;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  argument = OneArgument( argument, arg3 );
  r_lo = atoi( arg2 );
  r_hi = atoi( arg3 );

  if ( IsNullOrEmpty( arg1 ) || r_lo < 0 || r_hi < 0 )
    {
      ch->Echo("Syntax: assign <who> <low> <high>\r\n");
      return;
    }

  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      ch->Echo("They don't seem to be around.\r\n");
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_AVATAR )
    {
      ch->Echo("They wouldn't know what to do with a room range.\r\n");
      return;
    }

  if ( r_lo > r_hi )
    {
      ch->Echo("Unacceptable room range.\r\n");
      return;
    }

  if ( r_lo == 0 )
    r_hi = 0;

  victim->PCData->Build.VnumRanges.Room.First = r_lo;
  victim->PCData->Build.VnumRanges.Room.Last = r_hi;
  AssignAreaTo( victim );        /* Put back by Thoric on 02/07/96 */
  ch->Echo("Done.\r\n");
  victim->Echo("%s has assigned you the room range %d - %d.\r\n",
             ch->Name, r_lo, r_hi );
  AssignAreaTo( victim );

  assert(victim->PCData->Build.Area != nullptr);

  if (r_lo == 0)
    {
      RemoveBit ( victim->PCData->Build.Area->Status, AREA_LOADED );
      SetBit( victim->PCData->Build.Area->Status, AREA_DELETED );
    }
  else
    {
      SetBit( victim->PCData->Build.Area->Status, AREA_LOADED );
      RemoveBit( victim->PCData->Build.Area->Status, AREA_DELETED );
    }
}

