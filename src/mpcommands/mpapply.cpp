#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "descriptor.hpp"

void do_mpapply( Character *ch, char *argument )
{
  Character *victim = NULL;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
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
      ch->Echo("Not on linkdeads.\r\n");
      return;
    }

  if( IsAuthed(victim) )
    return;

  if( victim->PCData->AuthState >= 1 )
    return;

  sprintf( log_buf, "%s@%s new %s applying for authorization...",
           victim->Name, victim->Desc->Remote.Hostname,
           RaceTable[victim->Race].Name);
  Log->Info( log_buf );
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  victim->PCData->AuthState = 1;
}

