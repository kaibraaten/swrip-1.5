#include "mud.h"
#include "character.h"

void do_reply( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;
  int position = POS_STANDING;
  Character *vch = NULL;
  bool sameroom = false;

  RemoveBit( ch->deaf, CHANNEL_TELLS );

  if ( IsBitSet( ch->in_room->Flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_SILENCE) )
    {
      SendToCharacter( "Your message didn't get through.\r\n", ch );
      return;
    }

  if ( ( victim = ch->reply ) == NULL )
    {
      SendToCharacter( "They can't hear you.\r\n", ch );
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
          Echo( ch, "%s doesn't seem to have a comlink!\r\n",
		Capitalize( HeSheIt( victim ) ) );
          return;
        }
    }

  if ( !IsNpc( victim ) && ( victim->switched )
       && CanSeeCharacter( ch, victim ) && ( GetTrustLevel( ch ) > LEVEL_AVATAR ) )
    {
      SendToCharacter( "That player is switched.\r\n", ch );
      return;
    }
  else if ( !IsNpc( victim ) && ( !victim->desc ) )
    {
      SendToCharacter( "That player is link-dead.\r\n", ch );
      return;
    }

  if ( IsBitSet( victim->deaf, CHANNEL_TELLS )
       && ( !IsImmortal( ch ) || ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) ) )
    {
      Act( AT_PLAIN, "$E can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ( !IsImmortal(ch) && !IsAwake(victim) )
       || ( !IsNpc(victim) && IsBitSet( victim->in_room->Flags, ROOM_SILENCE ) ) )
    {
      Act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->act, PLR_AFK ) ) )
    {
      Echo( ch, "That player is afk so %s may not respond.\r\n",
	    Capitalize( HeSheIt( victim ) ) );
    }

  if (victim->in_room == ch->in_room )
    {
      sameroom = true;
    }

  Act( AT_TELL, "(&COutgoing Message&B) $N: '$t'", ch, argument, victim, TO_CHAR );
  position = victim->position;
  victim->position = POS_STANDING;

  if ( CharacterKnowsLanguage( victim, ch->speaking, ch ) ||
       (IsNpc(ch) && !ch->speaking) )
    {
      Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'", ch, argument, victim, TO_VICT );
    }
  else
    {
    Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'", ch, Scramble(argument, ch->speaking), victim, TO_VICT );
    }

  victim->position = position;
  victim->reply = ch;

  if ( IsBitSet( ch->in_room->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (reply to) %s.",
               IsNpc( ch ) ? ch->short_descr : ch->name,
               argument,
               IsNpc( victim ) ? victim->short_descr : victim->name );
      AppendToFile( LOG_FILE, buf );
    }

  if( !IsImmortal(ch) && !sameroom )
    {
      for ( vch = ch->in_room->FirstPerson; vch; vch = vch->next_in_room )
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !CharacterKnowsLanguage(vch, ch->speaking, ch) &&
               (!IsNpc(ch) || ch->speaking != 0) )
            sbuf = Scramble(argument, ch->speaking);

          sbuf = DrunkSpeech( sbuf, ch );

          MOBtrigger = false;
          Act( AT_SAY, "$n says quietly into $s comlink '$t'", ch, sbuf, vch, TO_VICT );
        }

      if ( !IsImmortal(victim) )
	{
	  Act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }
}
