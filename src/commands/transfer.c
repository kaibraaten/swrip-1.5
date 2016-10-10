#include "mud.h"
#include "character.h"

void do_transfer( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Room *location;
  Descriptor *d;
  Character *victim;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Transfer whom (and where)?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg1, "all" ) )
    {
      for ( d = first_descriptor; d; d = d->next )
        {
          if ( d->connection_state == CON_PLAYING
               && d->character != ch
               && d->character->in_room
               && d->newstate != 2
               && CanSeeCharacter( ch, d->character ) )
            {
              char buf[MAX_STRING_LENGTH];
              sprintf( buf, "%s %s", d->character->name, arg2 );
              do_transfer( ch, buf );
            }
        }

      return;
    }

  /*
   * Thanks to Grodyn for the optional location parameter.
   */
  if ( IsNullOrEmpty( arg2 ) )
    {
      location = ch->in_room;
    }
  else
    {
      if ( ( location = FindLocation( ch, arg2 ) ) == NULL )
        {
          SendToCharacter( "No such location.\r\n", ch );
          return;
        }

      if ( IsRoomPrivate( ch, location ) )
        {
          SendToCharacter( "That room is private right now.\r\n", ch );
          return;
        }
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if (!IsAuthed(victim))
    {
      SendToCharacter( "They are not authorized yet!\r\n", ch);
      return;
    }

  if ( !victim->in_room )
    {
      SendToCharacter( "They are in limbo.\r\n", ch );
      return;
    }

  if ( victim->fighting )
    StopFighting( victim, true );

  Act( AT_MAGIC, "$n disappears in a cloud of swirling colors.", victim, NULL, NULL, TO_ROOM );
  victim->retran = victim->in_room->Vnum;
  CharacterFromRoom( victim );
  CharacterToRoom( victim, location );
  Act( AT_MAGIC, "$n arrives from a puff of smoke.", victim, NULL, NULL, TO_ROOM );

  if ( ch != victim )
    Act( AT_IMMORT, "$n has transferred you.", ch, NULL, victim, TO_VICT );

  do_look( victim, "auto" );
  SendToCharacter( "Ok.\r\n", ch );

  if (!IsImmortal(victim) && !IsNpc(victim)
      && !InHardRange( victim, location->Area ) )
    {
      SendToCharacter("Warning: the player's level is not within the area's level range.\r\n", ch);
    }
}
