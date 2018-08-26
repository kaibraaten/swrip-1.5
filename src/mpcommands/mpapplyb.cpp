#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "descriptor.hpp"

void do_mpapplyb( Character *ch, char *argument )
{
  Character *victim = NULL;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ProgBug("Mpapplyb - bad syntax", ch );
      return;
    }

  if ( (victim = GetCharacterInRoomMudProg( ch, argument ) ) == NULL )
    {
      ProgBug("Mpapplyb - no such player in room.", ch );
      return;
    }

  if ( !victim->Desc )
    {
      ch->Echo("Not on linkdeads.\r\n");
      return;
    }

  if( IsAuthed(victim) )
    return;

  if ( GetTimer(victim, TIMER_APPLIED) >= 1)
    return;

  switch( victim->PCData->AuthState )
    {
    case 0:
    case 1:
    default:
      victim->Echo("You attempt to regain the gods' attention.\r\n");
      sprintf( log_buf, "%s@%s new %s applying for authorization...",
               victim->Name, victim->Desc->Remote.Hostname,
               RaceTable[victim->Race].Name);
      Log->Info( log_buf );
      ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
      AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
      victim->PCData->AuthState = 1;
      break;

    case 2:
      victim->Echo("Your name has been deemed unsuitable by the gods. Please choose a more apropriate name with the 'name' command.\r\n");
      AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
      break;

    case 3:
      victim->Echo("The gods permit you to enter the Star Wars Reality.\r\n");
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);
      if ( victim->Fighting )
        StopFighting( victim, true );
      CharacterFromRoom(victim);
      CharacterToRoom(victim, GetRoom(ROOM_VNUM_SCHOOL));
      Act( AT_WHITE, "$n enters this world from within a column of blinding light!",
           victim, NULL, NULL, TO_ROOM );
      do_look(victim, "auto");
      break;
    }
}

