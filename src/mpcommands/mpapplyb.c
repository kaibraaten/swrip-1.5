#include "character.h"
#include "mud.h"

void do_mpapplyb( Character *ch, char *argument )
{
  Character *victim;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if (argument[0] == '\0')
    {
      ProgBug("Mpapplyb - bad syntax", ch );
      return;
    }

  if ( (victim = GetCharacterInRoomMudProg( ch, argument ) ) == NULL )
    {
      ProgBug("Mpapplyb - no such player in room.", ch );
      return;
    }

  if ( !victim->desc )
    {
      SendToCharacter( "Not on linkdeads.\r\n", ch );
      return;
    }

  if( IsAuthed(victim) )
    return;

  if ( GetTimer(victim, TIMER_APPLIED) >= 1)
    return;

  switch( victim->pcdata->auth_state )
    {
    case 0:
    case 1:
    default:
      SendToCharacter( "You attempt to regain the gods' attention.\r\n", victim);
      sprintf( log_buf, "%s@%s new %s applying for authorization...",
               victim->name, victim->desc->remote.hostname,
               RaceTable[victim->race].race_name);
      LogPrintf( log_buf );
      ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
      AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
      victim->pcdata->auth_state = 1;
      break;

    case 2:
      SendToCharacter("Your name has been deemed unsuitable by the gods. Please choose a more apropriate name with the 'name' command.\r\n", victim);
      AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
      break;

    case 3:
      SendToCharacter( "The gods permit you to enter the Star Wars Reality.\r\n", victim);
      RemoveBit(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->fighting )
        StopFighting( victim, true );
      CharacterFromRoom(victim);
      CharacterToRoom(victim, GetRoom(ROOM_VNUM_SCHOOL));
      Act( AT_WHITE, "$n enters this world from within a column of blinding light!",
           victim, NULL, NULL, TO_ROOM );
      do_look(victim, "auto");
      break;
    }
}
