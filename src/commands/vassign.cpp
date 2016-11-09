#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_vassign( Character *ch, std::string argument )
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
      SendToCharacter( "Syntax: vassign <who> <low> <high>\r\n", ch );
      return;
    }

  if ( (victim = GetCharacterAnywhere( ch, arg1 )) == NULL )
    {
      SendToCharacter( "They don't seem to be around.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) || GetTrustLevel( victim ) < LEVEL_CREATOR )
    {
      SendToCharacter( "They wouldn't know what to do with a vnum range.\r\n", ch );
      return;
    }

  if ( r_lo > r_hi )
    {
      SendToCharacter( "Unacceptable room range.\r\n", ch );
      return;
    }

  if ( r_lo == 0 )
    r_hi = 0;

  victim->PCData->Build.VnumRanges.Room.First = r_lo;
  victim->PCData->Build.VnumRanges.Room.Last = r_hi;
  victim->PCData->Build.VnumRanges.Object.First = r_lo;
  victim->PCData->Build.VnumRanges.Object.Last = r_hi;
  victim->PCData->Build.VnumRanges.Mob.First = r_lo;
  victim->PCData->Build.VnumRanges.Mob.Last = r_hi;

  AssignAreaTo( victim );
  SendToCharacter( "Done.\r\n", ch );
  Echo( victim, "%s has assigned you the vnum range %d - %d.\r\n",
             ch->Name, r_lo, r_hi );
  AssignAreaTo( victim );        /* Put back by Thoric on 02/07/96 */

  if ( !victim->PCData->Build.Area )
    {
      Bug( "rassign: AssignAreaTo failed", 0 );
      return;
    }

  if (r_lo == 0)                                /* Scryn 8/12/95 */
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
