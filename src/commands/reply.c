#include "mud.h"

void do_reply( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim = NULL;
  int position = POS_STANDING;
  CHAR_DATA *vch = NULL;
  bool sameroom = FALSE;

  REMOVE_BIT( ch->deaf, CHANNEL_TELLS );

  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if ( !IS_NPC(ch) && IS_SET(ch->act, PLR_SILENCE) )
    {
      send_to_char( "Your message didn't get through.\r\n", ch );
      return;
    }

  if ( ( victim = ch->reply ) == NULL )
    {
      send_to_char( "They can't hear you.\r\n", ch );
      return;
    }

  if ( !IS_NPC( victim ) && ( victim->switched )
       && can_see( ch, victim ) && ( get_trust( ch ) > LEVEL_AVATAR ) )
    {
      send_to_char( "That player is switched.\r\n", ch );
      return;
    }
  else if ( !IS_NPC( victim ) && ( !victim->desc ) )
    {
      send_to_char( "That player is link-dead.\r\n", ch );
      return;
    }

  if ( IS_SET( victim->deaf, CHANNEL_TELLS )
       && ( !IS_IMMORTAL( ch ) || ( get_trust( ch ) < get_trust( victim ) ) ) )
    {
      act( AT_PLAIN, "They can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ( !IS_IMMORTAL(ch) && !IS_AWAKE(victim) )
       || ( !IS_NPC(victim) && IS_SET( victim->in_room->room_flags, ROOM_SILENCE ) ) )
    {
      act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !IS_NPC (victim) && ( IS_SET (victim->act, PLR_AFK ) ) )
    {
      send_to_char( "That player is afk so he may not respond.\r\n", ch );
    }

  if (victim->in_room == ch->in_room )
    {
      sameroom = TRUE;
    }

  act( AT_TELL, "(&COutgoing Message&B) $N: '$t'", ch, argument, victim, TO_CHAR );
  position = victim->position;
  victim->position = POS_STANDING;

  if ( knows_language( victim, ch->speaking, ch ) ||
       (IS_NPC(ch) && !ch->speaking) )
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
               IS_NPC( ch ) ? ch->short_descr : ch->name,
               argument,
               IS_NPC( victim ) ? victim->short_descr : victim->name );
      append_to_file( LOG_FILE, buf );
    }

  if( !IS_IMMORTAL(ch) && !sameroom )
    {
      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !knows_language(vch, ch->speaking, ch) &&
               (!IS_NPC(ch) || ch->speaking != 0) )
            sbuf = scramble(argument, ch->speaking);

          sbuf = drunk_speech( sbuf, ch );

          MOBtrigger = FALSE;
          act( AT_SAY, "$n says quietly into his comlink '$t'", ch, sbuf, vch, TO_VICT );
        }

      if ( !IS_IMMORTAL(victim) )
	{
	  act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }
}
