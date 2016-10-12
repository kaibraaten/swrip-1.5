#include "character.h"
#include "mud.h"

void do_mpapply( Character *ch, char *argument )
{
  Character *victim;

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

  if( victim->PCData->auth_state >= 1 )
    return;

  sprintf( log_buf, "%s@%s new %s applying for authorization...",
           victim->Name, victim->Desc->remote.hostname,
           RaceTable[victim->race].race_name);
  LogPrintf( log_buf );
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  victim->PCData->auth_state = 1;
}
