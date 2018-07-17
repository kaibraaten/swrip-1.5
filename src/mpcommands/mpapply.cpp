#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_mpapply( Character *ch, char *argument )
{
  Character *victim = NULL;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ProgBug("Mpapply - bad syntax", ch );
      return;
    }

  if ( (victim = GetCharacterInRoomMudProg( ch, argument ) ) == NULL )
    {
      ProgBug("Mpapply - no such player in room.", ch );
      return;
    }

  if ( !victim->Desc )
    {
      SendToCharacter( "Not on linkdeads.\r\n", ch );
      return;
    }

  if( IsAuthed(victim) )
    return;

  if( victim->PCData->AuthState >= 1 )
    return;

  sprintf( log_buf, "%s@%s new %s applying for authorization...",
           victim->Name, victim->Desc->Remote.Hostname,
           RaceTable[victim->Race].Name);
  LogPrintf( log_buf );
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  victim->PCData->AuthState = 1;
}
