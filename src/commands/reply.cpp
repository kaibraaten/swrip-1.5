#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_reply( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;
  PositionType position = POS_STANDING;
  bool sameroom = false;

  RemoveBit( ch->Deaf, CHANNEL_TELLS );

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SILENCE ) )
    {
      ch->Echo("You can't do that here.\r\n");
      return;
    }

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_SILENCE) )
    {
      ch->Echo("Your message didn't get through.\r\n");
      return;
    }

  if ( ( victim = ch->Reply ) == NULL )
    {
      ch->Echo("They can't hear you.\r\n");
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
                   Capitalize( HeSheIt( victim ) ).c_str() );
          return;
        }
    }

  if ( !IsNpc( victim ) && ( victim->Switched )
       && CanSeeCharacter( ch, victim ) && ( GetTrustLevel( ch ) > LEVEL_AVATAR ) )
    {
      ch->Echo("That player is switched.\r\n");
      return;
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

  if ( ( !IsImmortal(ch) && !IsAwake(victim) )
       || ( !IsNpc(victim) && IsBitSet( victim->InRoom->Flags, ROOM_SILENCE ) ) )
    {
      Act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->Flags, PLR_AFK ) ) )
    {
      ch->Echo("That player is afk so %s may not respond.\r\n",
               Capitalize( HeSheIt( victim ) ).c_str() );
    }

  if (victim->InRoom == ch->InRoom )
    {
      sameroom = true;
    }

  Act( AT_TELL, "(&COutgoing Message&B) $N: '$t'",
       ch, argument.c_str(), victim, TO_CHAR );
  position = victim->Position;
  victim->Position = POS_STANDING;

  if ( CharacterKnowsLanguage( victim, ch->Speaking, ch ) ||
       (IsNpc(ch) && !ch->Speaking) )
    {
      Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
           ch, argument.c_str(), victim, TO_VICT );
    }
  else
    {
      Act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
           ch, Scramble(argument, ch->Speaking).c_str(), victim, TO_VICT );
    }

  victim->Position = position;
  victim->Reply = ch;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (reply to) %s.",
               IsNpc( ch ) ? ch->ShortDescr.c_str() : ch->Name.c_str(),
               argument.c_str(),
               IsNpc( victim ) ? victim->ShortDescr.c_str() : victim->Name.c_str() );
      AppendToFile( LOG_FILE, buf );
    }

  if( !IsImmortal(ch) && !sameroom )
    {
      for(Character *vch : ch->InRoom->Characters())
        {
          std::string sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !CharacterKnowsLanguage(vch, ch->Speaking, ch) &&
               (!IsNpc(ch) || ch->Speaking != 0) )
            sbuf = Scramble(argument, ch->Speaking);

          std::string speech = DrunkSpeech( sbuf, ch );

          MOBtrigger = false;
          Act( AT_SAY, "$n says quietly into $s comlink '$t'",
               ch, speech.c_str(), vch, TO_VICT );
        }

      if ( !IsImmortal(victim) )
	{
	  Act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }
}

