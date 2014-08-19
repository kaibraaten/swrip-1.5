#include "character.h"
#include "mud.h"

void do_beep( Character *ch, char *argument )
{
  Character *victim = NULL;
  char arg[MAX_STRING_LENGTH];
  bool ch_comlink = false, victim_comlink = false;

  argument = OneArgument( argument, arg );

  RemoveBit( ch->deaf, CHANNEL_TELLS );
  if ( IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if (!IsNpc(ch)
      && ( IsBitSet(ch->act, PLR_SILENCE)
           ||   IsBitSet(ch->act, PLR_NO_TELL) ) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Beep who?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL
       || ( IsNpc(victim) && victim->in_room != ch->in_room )
       || (IsAuthed(ch) && !IsAuthed(victim) && !IsImmortal(ch) ) )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsImmortal( ch ) )
    {
      ch_comlink = true;
      victim_comlink = true;
    }

  if ( IsImmortal( victim ) )
    victim_comlink = true;

  ch_comlink = HasComlink( ch );

  if ( !ch_comlink )
    {
      SendToCharacter( "You need a comlink to do that!\r\n", ch);
      return;
    }

  if( !victim_comlink )
    {
      victim_comlink = HasComlink( ch );
    }

  if ( !victim_comlink )
    {
      SendToCharacter( "They don't seem to have a comlink!\r\n", ch);
      return;
    }

  if (!IsAuthed(ch) && IsAuthed(victim) && !IsImmortal(victim) )
    {
      SendToCharacter( "They can't hear you because you are not authorized.\r\n", ch);
      return;
    }

  if ( !IsNpc( victim ) && ( victim->switched )
       && ( GetTrustLevel( ch ) > LEVEL_AVATAR ) )
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
      act( AT_PLAIN, "$E has $S tells turned off.", ch, NULL, victim,
           TO_CHAR );
      return;
    }

  if ( !IsNpc (victim) && ( IsBitSet (victim->act, PLR_SILENCE ) ) )
    {
      SendToCharacter( "That player is silenced.  They will receive your message but can not respond.\r\n", ch );
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
      act( AT_PLAIN, "$E is currently in a writing buffer. Please try again in a few minutes.", ch, 0, victim, TO_CHAR );
      return;
    }

  ChPrintf(ch , "&WYou beep %s: %s\r\n\a" , victim->name, argument );
  SendToCharacter("\a",victim);

  if ( CharacterKnowsLanguage( victim, ch->speaking, ch )
       ||  (IsNpc(ch) && !ch->speaking) )
    act( AT_WHITE, "$n beeps: '$t'", ch, argument, victim, TO_VICT );
  else
    act( AT_WHITE, "$n beeps: '$t'", ch, Scramble(argument, ch->speaking), victim, TO_VICT );
}
