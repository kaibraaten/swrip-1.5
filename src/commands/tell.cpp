#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_tell( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  PositionType position = POS_STANDING;
  Character *switched_victim = NULL;
  bool sameroom = false;

  if ( IsBitSet( ch->Deaf, CHANNEL_TELLS ) && !IsImmortal( ch ) )
    {
      Act( AT_PLAIN, "You have tells turned off... try chan +tells first",
	   ch, NULL, NULL, TO_CHAR );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SILENCE ) )
    {
      ch->Echo("You can't do that here.\r\n");
      return;
    }

  if (!IsNpc(ch)
      && ( IsBitSet(ch->Flags, PLR_SILENCE) || IsBitSet(ch->Flags, PLR_NO_TELL) ) )
    {
      ch->Echo("You can't do that.\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Tell whom what?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL
       || ( IsNpc(victim) && victim->InRoom != ch->InRoom )
       || (IsAuthed(ch) && !IsAuthed(victim) && !IsImmortal(ch) ) )
    {
      ch->Echo("%s can't hear you.\r\n",
	    Capitalize( victim != NULL ? HeSheIt( victim ) : "they" ) );
      return;
    }

  if ( ch == victim )
    {
      ch->Echo("You have a nice little chat with yourself.\r\n");
      return;
    }

  if (victim->InRoom == ch->InRoom )
    {
      sameroom = true;
    }
  else
    {
      bool ch_comlink = HasComlink(ch) || IsImmortal(ch);
      bool victim_comlink = HasComlink(victim) || IsImmortal(victim);

      if ( !ch_comlink )
        {
          ch->Echo("You need a comlink to do that!\r\n");
          return;
        }

      if ( !victim_comlink )
        {
   ch->Echo("%s doesn't seem to have a comlink!\r\n",
                Capitalize( HeSheIt( victim ) ) );
          return;
        }
    }

  if (!IsAuthed(ch) && IsAuthed(victim) && !IsImmortal(victim) )
    {
      ch->Echo("%s can't hear you because you are not authorized.\r\n",
	    Capitalize( HeSheIt( victim ) ) );
      return;
    }

  if ( !IsNpc( victim ) && ( victim->Switched )
       && ( GetTrustLevel( ch ) > LEVEL_AVATAR )
       && !IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
       && !IsAffectedBy(victim->Switched, AFF_POSSESS) )
    {
      ch->Echo("That player is switched.\r\n");
      return;
    }
  else if ( !IsNpc( victim ) && ( victim->Switched )
            && (IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
                ||  IsAffectedBy(victim->Switched, AFF_POSSESS) ) )
    {
      switched_victim = victim->Switched;
    }
  else if ( !IsNpc( victim ) && ( !victim->Desc ) )
    {
      ch->Echo("That player is link-dead.\r\n");
      return;
    }

  if ( IsBitSet( victim->Deaf, CHANNEL_TELLS )
       && ( !IsImmortal( ch ) || ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) ) )
    {
      Act( AT_PLAIN, "$E can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->Flags, PLR_SILENCE ) ) )
    {
      ch->Echo("That player is silenced. %s will receive your message but can not respond.\r\n",
	    Capitalize( HeSheIt( victim ) ) );
    }

  if ( (!IsImmortal(ch) && !IsAwake(victim) )
       || (!IsNpc(victim)&&IsBitSet(victim->InRoom->Flags, ROOM_SILENCE ) ) )
    {
      Act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( victim->Desc
       &&   victim->Desc->ConnectionState == CON_EDITING
       &&   GetTrustLevel(ch) < LEVEL_GREATER )
    {
      Act( AT_PLAIN, "$E is currently in a writing buffer. Please try again in a few minutes.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->Flags, PLR_AFK ) ) )
    {
      ch->Echo("That player is afk so %s may not respond.\r\n",
	    Capitalize( HeSheIt( victim ) ) );
    }

  if(switched_victim)
    victim = switched_victim;

  Act( AT_TELL, "(&COutgoing Message&B) $N: '$t'",
       ch, argument, victim, TO_CHAR );
  position = victim->Position;
  victim->Position = POS_STANDING;

  if ( CharacterKnowsLanguage( victim, ch->Speaking, ch )
       ||  (IsNpc(ch) && !ch->Speaking) )
    {
      Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, argument, victim, TO_VICT );
    }
  else
    {
      Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, Scramble(argument, ch->Speaking), victim, TO_VICT );
    }

  victim->Position = position;
  victim->Reply = ch;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (tell to) %s.",
               IsNpc( ch ) ? ch->ShortDescr : ch->Name,
               argument,
               IsNpc( victim ) ? victim->ShortDescr : victim->Name );
      AppendToFile( LOG_FILE, buf );
    }

  if( !IsImmortal(ch) && !sameroom )
    {
      for(Character *vch : ch->InRoom->Characters())
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !CharacterKnowsLanguage(vch, ch->Speaking, ch) &&
               (!IsNpc(ch) || ch->Speaking != 0) )
            sbuf = Scramble(argument, ch->Speaking);

          sbuf = DrunkSpeech( sbuf, ch );

          MOBtrigger = false;
          Act( AT_SAY, "$n says quietly into $s comlink '$t'",
	       ch, sbuf, vch, TO_VICT );
        }

      if ( !IsImmortal(victim) )
	{
	  Act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }

  MobProgSpeechTrigger( argument, ch );
}
