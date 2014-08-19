#include "character.h"
#include "mud.h"

void do_tell( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  int position = POS_STANDING;
  Character *switched_victim = NULL;
  Character *vch = NULL;
  bool sameroom = false;

  if ( IsBitSet( ch->deaf, CHANNEL_TELLS ) && !IsImmortal( ch ) )
    {
      act( AT_PLAIN, "You have tells turned off... try chan +tells first",
	   ch, NULL, NULL, TO_CHAR );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if (!IsNpc(ch)
      && ( IsBitSet(ch->act, PLR_SILENCE) ||   IsBitSet(ch->act, PLR_NO_TELL) ) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      SendToCharacter( "Tell whom what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL
       || ( IsNpc(victim) && victim->in_room != ch->in_room )
       || (IsAuthed(ch) && !IsAuthed(victim) && !IsImmortal(ch) ) )
    {
      SendToCharacter( "They can't hear you.\r\n", ch );
      return;
    }

  if ( ch == victim )
    {
      SendToCharacter( "You have a nice little chat with yourself.\r\n", ch );
      return;
    }

  if (victim->in_room == ch->in_room )
    {
      sameroom = true;
    }
  else
    {
      bool ch_comlink = HasComlink(ch) || IsImmortal(ch);
      bool victim_comlink = HasComlink(victim) || IsImmortal(victim);

      if ( !ch_comlink )
        {
          SendToCharacter( "You need a comlink to do that!\r\n", ch);
          return;
        }

      if ( !victim_comlink )
        {
          SendToCharacter( "They don't seem to have a comlink!\r\n", ch);
          return;
        }
    }

  if (!IsAuthed(ch) && IsAuthed(victim) && !IsImmortal(victim) )
    {
      SendToCharacter( "They can't hear you because you are not authorized.\r\n", ch);
      return;
    }

  if ( !IsNpc( victim ) && ( victim->switched )
       && ( GetTrustLevel( ch ) > LEVEL_AVATAR )
       && !IsBitSet(victim->switched->act, ACT_POLYMORPHED)
       && !IsAffectedBy(victim->switched, AFF_POSSESS) )
    {
      SendToCharacter( "That player is switched.\r\n", ch );
      return;
    }
  else if ( !IsNpc( victim ) && ( victim->switched )
            && (IsBitSet(victim->switched->act, ACT_POLYMORPHED)
                ||  IsAffectedBy(victim->switched, AFF_POSSESS) ) )
    {
      switched_victim = victim->switched;
    }
  else if ( !IsNpc( victim ) && ( !victim->desc ) )
    {
      SendToCharacter( "That player is link-dead.\r\n", ch );
      return;
    }

  if ( IsBitSet( victim->deaf, CHANNEL_TELLS )
       && ( !IsImmortal( ch ) || ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) ) )
    {
      act( AT_PLAIN, "They can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->act, PLR_SILENCE ) ) )
    {
      SendToCharacter( "That player is silenced. They will receive your message but can not respond.\r\n", ch );
    }

  if ( (!IsImmortal(ch) && !IsAwake(victim) )
       || (!IsNpc(victim)&&IsBitSet(victim->in_room->room_flags, ROOM_SILENCE ) ) )
    {
      act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( victim->desc
       &&   victim->desc->connection_state == CON_EDITING
       &&   GetTrustLevel(ch) < LEVEL_GREATER )
    {
      act( AT_PLAIN, "$E is currently in a writing buffer.  Please try again in a few minutes.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->act, PLR_AFK ) ) )
    {
      SendToCharacter( "That player is afk so he may not respond.\r\n", ch );
    }

  if(switched_victim)
    victim = switched_victim;

  act( AT_TELL, "(&COutgoing Message&B) $N: '$t'",
       ch, argument, victim, TO_CHAR );
  position = victim->position;
  victim->position = POS_STANDING;

  if ( CharacterKnowsLanguage( victim, ch->speaking, ch )
       ||  (IsNpc(ch) && !ch->speaking) )
    {
      act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, argument, victim, TO_VICT );
    }
  else
    {
      act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, Scramble(argument, ch->speaking), victim, TO_VICT );
    }

  victim->position = position;
  victim->reply = ch;

  if ( IsBitSet( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (tell to) %s.",
               IsNpc( ch ) ? ch->short_descr : ch->name,
               argument,
               IsNpc( victim ) ? victim->short_descr : victim->name );
      AppendToFile( LOG_FILE, buf );
    }

  if( !IsImmortal(ch) && !sameroom )
    {
      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !CharacterKnowsLanguage(vch, ch->speaking, ch) &&
               (!IsNpc(ch) || ch->speaking != 0) )
            sbuf = Scramble(argument, ch->speaking);

          sbuf = DrunkSpeech( sbuf, ch );

          MOBtrigger = false;
          act( AT_SAY, "$n says quietly into $s comlink '$t'",
	       ch, sbuf, vch, TO_VICT );
        }

      if ( !IsImmortal(victim) )
	{
	  act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }

  mprog_speech_trigger( argument, ch );
}
