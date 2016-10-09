#include "character.h"
#include "mud.h"

/* lets the mobile transfer people.  the all argument transfers
   everyone in the current room to the specified location */

void do_mptransfer( Character *ch, char *argument )
{
  char             arg1[ MAX_INPUT_LENGTH ];
  char             arg2[ MAX_INPUT_LENGTH ];
  char buf[MAX_STRING_LENGTH];
  Room *location;
  Character       *victim;
  Character       *nextinroom;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ProgBug( "Mptransfer - Bad syntax", ch );
      return;
    }

  /* Put in the variable nextinroom to make this work right. -Narn */
  if ( !StrCmp( arg1, "all" ) )
    {
      for ( victim = ch->in_room->first_person; victim; victim = nextinroom )
        {
          nextinroom = victim->next_in_room;
          if ( victim != ch
               && IsAuthed(victim)
               && CanSeeCharacter( ch, victim ) )
            {
              sprintf( buf, "%s %s", victim->name, arg2 );
              do_mptransfer( ch, buf );
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
          ProgBug( "Mptransfer - No such location", ch );
          return;
        }

      if ( IsRoomPrivate( ch, location ) )
        {
          ProgBug( "Mptransfer - Private room", ch );
          return;
        }
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      ProgBug( "Mptransfer - No such person", ch );
      return;
    }

  if ( !victim->in_room )
    {
      ProgBug( "Mptransfer - Victim in Limbo", ch );
      return;
    }

  if (!IsAuthed(victim) && location->area != victim->in_room->area)
    {
      ProgBug( "Mptransfer - transferring unauthorized player", ch);
      return;
    }


  /* If victim not in area's level range, do not transfer */
  if ( !InHardRange( victim, location->area )
       &&   !IsBitSet( location->room_flags, ROOM_PROTOTYPE ) )
    return;

  if ( victim->fighting )
    StopFighting( victim, true );

  CharacterFromRoom( victim );
  CharacterToRoom( victim, location );
}
