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
  bool sameroom = FALSE;

  if ( IS_SET( ch->deaf, CHANNEL_TELLS ) && !is_immortal( ch ) )
    {
      act( AT_PLAIN, "You have tells turned off... try chan +tells first",
	   ch, NULL, NULL, TO_CHAR );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if (!is_npc(ch)
      && ( IS_SET(ch->act, PLR_SILENCE) ||   IS_SET(ch->act, PLR_NO_TELL) ) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Tell whom what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL
       || ( is_npc(victim) && victim->in_room != ch->in_room )
       || (!is_not_authed(ch) && is_not_authed(victim) && !is_immortal(ch) ) )
    {
      send_to_char( "They can't hear you.\r\n", ch );
      return;
    }

  if ( ch == victim )
    {
      send_to_char( "You have a nice little chat with yourself.\r\n", ch );
      return;
    }

  if (victim->in_room == ch->in_room )
    {
      sameroom = TRUE;
    }
  else
    {
      bool ch_comlink = has_comlink(ch) || is_immortal(ch);
      bool victim_comlink = has_comlink(victim) || is_immortal(victim);

      if ( !ch_comlink )
        {
          send_to_char( "You need a comlink to do that!\r\n", ch);
          return;
        }

      if ( !victim_comlink )
        {
          send_to_char( "They don't seem to have a comlink!\r\n", ch);
          return;
        }
    }

  if (is_not_authed(ch) && !is_not_authed(victim) && !is_immortal(victim) )
    {
      send_to_char( "They can't hear you because you are not authorized.\r\n", ch);
      return;
    }

  if ( !is_npc( victim ) && ( victim->switched )
       && ( get_trust( ch ) > LEVEL_AVATAR )
       && !IS_SET(victim->switched->act, ACT_POLYMORPHED)
       && !is_affected_by(victim->switched, AFF_POSSESS) )
    {
      send_to_char( "That player is switched.\r\n", ch );
      return;
    }
  else if ( !is_npc( victim ) && ( victim->switched )
            && (IS_SET(victim->switched->act, ACT_POLYMORPHED)
                ||  is_affected_by(victim->switched, AFF_POSSESS) ) )
    {
      switched_victim = victim->switched;
    }
  else if ( !is_npc( victim ) && ( !victim->desc ) )
    {
      send_to_char( "That player is link-dead.\r\n", ch );
      return;
    }

  if ( IS_SET( victim->deaf, CHANNEL_TELLS )
       && ( !is_immortal( ch ) || ( get_trust( ch ) < get_trust( victim ) ) ) )
    {
      act( AT_PLAIN, "They can't hear you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !is_npc (victim) && ( IS_SET (victim->act, PLR_SILENCE ) ) )
    {
      send_to_char( "That player is silenced. They will receive your message but can not respond.\r\n", ch );
    }

  if ( (!is_immortal(ch) && !is_awake(victim) )
       || (!is_npc(victim)&&IS_SET(victim->in_room->room_flags, ROOM_SILENCE ) ) )
    {
      act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( victim->desc
       &&   victim->desc->connection_state == CON_EDITING
       &&   get_trust(ch) < LEVEL_GREATER )
    {
      act( AT_PLAIN, "$E is currently in a writing buffer.  Please try again in a few minutes.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( !is_npc (victim) && ( IS_SET (victim->act, PLR_AFK ) ) )
    {
      send_to_char( "That player is afk so he may not respond.\r\n", ch );
    }

  if(switched_victim)
    victim = switched_victim;

  act( AT_TELL, "(&COutgoing Message&B) $N: '$t'",
       ch, argument, victim, TO_CHAR );
  position = victim->position;
  victim->position = POS_STANDING;

  if ( knows_language( victim, ch->speaking, ch )
       ||  (is_npc(ch) && !ch->speaking) )
    {
      act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, argument, victim, TO_VICT );
    }
  else
    {
      act( AT_TELL, "(&CIncoming Message&B) $n: '$t'",
	   ch, scramble(argument, ch->speaking), victim, TO_VICT );
    }

  victim->position = position;
  victim->reply = ch;

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s (tell to) %s.",
               is_npc( ch ) ? ch->short_descr : ch->name,
               argument,
               is_npc( victim ) ? victim->short_descr : victim->name );
      append_to_file( LOG_FILE, buf );
    }

  if( !is_immortal(ch) && !sameroom )
    {
      for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
        {
          const char *sbuf = argument;

          if ( vch == ch )
            continue;

          if ( !knows_language(vch, ch->speaking, ch) &&
               (!is_npc(ch) || ch->speaking != 0) )
            sbuf = scramble(argument, ch->speaking);

          sbuf = drunk_speech( sbuf, ch );

          MOBtrigger = FALSE;
          act( AT_SAY, "$n says quietly into $s comlink '$t'",
	       ch, sbuf, vch, TO_VICT );
        }

      if ( !is_immortal(victim) )
	{
	  act( AT_ACTION, "$n's comlink buzzes with a message.",
	       victim, NULL, NULL, TO_ROOM);
	}
    }

  mprog_speech_trigger( argument, ch );
}
