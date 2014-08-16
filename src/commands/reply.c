#include "mud.h"
#include "character.h"

void do_reply( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;
  int position = POS_STANDING;
  Character *vch = NULL;
  bool sameroom = false;

  REMOVE_BIT( ch->deaf, CHANNEL_TELLS );

  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch) && IS_SET(ch->act, PLR_SILENCE) )
    {
      send_to_char( "Your message didn't get through.\r\n", ch );
      return;
    }

  if ( ( victim = ch->reply ) == NULL )
    {
      send_to_char( "They can't hear you.\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && ( victim->switched )
       && CanSeeCharacter( ch, victim ) && ( GetTrustLevel( ch ) > LEVEL_AVATAR ) )
    {
      send_to_char( "That player is switched.\r\n", ch );
      return;
    }
  else if ( !IsNpc( victim ) && ( !victim->desc ) )
    {
      send_to_char( "That player is link-dead.\r\n", ch );
      return;
    }

  if ( IS_SET( victim->deaf, CHANNEL_TELLS )
       && ( !IsImmortal( ch ) || ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) ) )
    {
      act( AT_PLAIN, "They can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ( !IsImmortal(ch) && !IsAwake(victim) )
       || ( !IsNpc(victim) && IS_SET( victim->in_room->room_flags, ROOM_SILENCE ) ) )
    {
      act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IS_SET (victim->act, PLR_AFK ) ) )
    {
      send_to_char( "That player is afk so he may not respond.\r\n", ch );
    }

  if (victim->in_room == ch->in_room )
    {
      sameroom = true;
    }

  act( AT_TELL, "(&COutgoing Message&B) $N: '$t'", ch, argument, victim, TO_CHAR );
  position = victim->position;
  victim->position = POS_STANDING;

  if ( knows_language( victim, ch->speaking, ch ) ||
       (IsNpc(ch) && !ch->speaking) )
    {
      act( AT_TELL, "(&CIncoming Message&B) $n: '$t'", ch, argument, victim, TO_VICT );
    }
  else
    {
    act( AT_TELL, "(&CIncoming Message&B) $n: '$t'", ch, scramble(argument, ch->speaking), victim, TO_VICT );
    }

  victim->position = position;
  victim->reply = ch;

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (reply to) %s.",
               IsNpc( ch ) ? ch->short_descr : ch->name,
               argument,
               IsNpc( victim ) ? victim->short_descr : victim->name );
      append_to_file( LOG_FILE, buf );
    }

  if( !IsImmortal(ch) && !sameroom )
    {
      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !knows_language(vch, ch->speaking, ch) &&
               (!IsNpc(ch) || ch->speaking != 0) )
            sbuf = scramble(argument, ch->speaking);

          sbuf = drunk_speech( sbuf, ch );

          MOBtrigger = false;
          act( AT_SAY, "$n says quietly into his comlink '$t'", ch, sbuf, vch, TO_VICT );
        }

      if ( !IsImmortal(victim) )
	{
	  act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }
}
