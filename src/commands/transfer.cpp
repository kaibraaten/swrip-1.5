#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "descriptor.hpp"

void do_transfer( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Room *location = nullptr;
  Descriptor *d = nullptr;
  Character *victim = nullptr;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Transfer whom (and where)?\r\n");
      return;
    }

  if ( !StrCmp( arg1, "all" ) )
    {
      for ( d = FirstDescriptor; d; d = d->Next )
        {
          if ( d->ConnectionState == CON_PLAYING
               && d->Character != ch
               && d->Character->InRoom
               && d->NewState != 2
               && CanSeeCharacter( ch, d->Character ) )
            {
              char buf[MAX_STRING_LENGTH];
              sprintf( buf, "%s %s", d->Character->Name, arg2 );
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
      location = ch->InRoom;
    }
  else
    {
      if ( ( location = FindLocation( ch, arg2 ) ) == NULL )
        {
          ch->Echo("No such location.\r\n");
          return;
        }

      if ( IsRoomPrivate( ch, location ) )
        {
          ch->Echo("That room is private right now.\r\n");
          return;
        }
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if (!IsAuthed(victim))
    {
      ch->Echo("They are not authorized yet!\r\n");
      return;
    }

  if ( !victim->InRoom )
    {
      ch->Echo("They are in limbo.\r\n");
      return;
    }

  if ( victim->Fighting )
    StopFighting( victim, true );

  Act( AT_MAGIC, "$n disappears in a cloud of swirling colors.", victim, NULL, NULL, TO_ROOM );
  victim->ReTran = victim->InRoom->Vnum;
  CharacterFromRoom( victim );
  CharacterToRoom( victim, location );
  Act( AT_MAGIC, "$n arrives from a puff of smoke.", victim, NULL, NULL, TO_ROOM );

  if ( ch != victim )
    Act( AT_IMMORT, "$n has transferred you.", ch, NULL, victim, TO_VICT );

  do_look( victim, "auto" );
  ch->Echo("Ok.\r\n");

  if (!IsImmortal(victim) && !IsNpc(victim)
      && !InHardRange( victim, location->Area ) )
    {
      ch->Echo("Warning: the player's level is not within the area's level range.\r\n");
    }
}

