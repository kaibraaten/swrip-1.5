#include "mud.h"

void do_beep( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim = NULL;
  char arg[MAX_STRING_LENGTH];
  bool ch_comlink = FALSE, victim_comlink = FALSE;

  argument = one_argument( argument, arg );

  REMOVE_BIT( ch->deaf, CHANNEL_TELLS );
  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if (!IS_NPC(ch)
      && ( IS_SET(ch->act, PLR_SILENCE)
           ||   IS_SET(ch->act, PLR_NO_TELL) ) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "Beep who?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL
       || ( IS_NPC(victim) && victim->in_room != ch->in_room )
       || (!NOT_AUTHED(ch) && NOT_AUTHED(victim) && !IS_IMMORTAL(ch) ) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_IMMORTAL( ch ) )
    {
      ch_comlink = TRUE;
      victim_comlink = TRUE;
    }

  if ( IS_IMMORTAL( victim ) )
    victim_comlink = TRUE;

  ch_comlink = has_comlink( ch );

  if ( !ch_comlink )
    {
      send_to_char( "You need a comlink to do that!\r\n", ch);
      return;
    }

  if( !victim_comlink )
    {
      victim_comlink = has_comlink( ch );
    }

  if ( !victim_comlink )
    {
      send_to_char( "They don't seem to have a comlink!\r\n", ch);
      return;
    }

  if (NOT_AUTHED(ch) && !NOT_AUTHED(victim) && !IS_IMMORTAL(victim) )
    {
      send_to_char( "They can't hear you because you are not authorized.\r\n", ch);
      return;
    }

  if ( !IS_NPC( victim ) && ( victim->switched )
       && ( get_trust( ch ) > LEVEL_AVATAR ) )
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
      act( AT_PLAIN, "$E has $S tells turned off.", ch, NULL, victim,
           TO_CHAR );
      return;
    }

  if ( !IS_NPC (victim) && ( IS_SET (victim->act, PLR_SILENCE ) ) )
    {
      send_to_char( "That player is silenced.  They will receive your message but can not respond.\r\n", ch );
    }

  if ( (!IS_IMMORTAL(ch) && !IS_AWAKE(victim) )
       || (!IS_NPC(victim)&&IS_SET(victim->in_room->room_flags, ROOM_SILENCE ) ) )
    {
      act( AT_PLAIN, "$E can't hear you.", ch, 0, victim, TO_CHAR );
      return;
    }

  if ( victim->desc
       &&   victim->desc->connected == CON_EDITING
       &&   get_trust(ch) < LEVEL_GOD )
    {
      act( AT_PLAIN, "$E is currently in a writing buffer. Please try again in a few minutes.", ch, 0, victim, TO_CHAR );
      return;
    }

  ch_printf(ch , "&WYou beep %s: %s\r\n\a" , victim->name, argument );
  send_to_char("\a",victim);

  if ( knows_language( victim, ch->speaking, ch )
       ||  (IS_NPC(ch) && !ch->speaking) )
    act( AT_WHITE, "$n beeps: '$t'", ch, argument, victim, TO_VICT );
  else
    act( AT_WHITE, "$n beeps: '$t'", ch, scramble(argument, ch->speaking), victim, TO_VICT );
}
