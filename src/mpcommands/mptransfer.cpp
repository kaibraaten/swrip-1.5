#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

/* lets the mobile transfer people.  the all argument transfers
   everyone in the current room to the specified location */

void do_mptransfer( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  char buf[MAX_STRING_LENGTH];
  Room *location = nullptr;
  Character *victim = nullptr;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
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
      std::list<Character*> charactersToTransfer = Filter(ch->InRoom->Characters(),
                                                          [ch](auto candidate)
                                                          {
                                                            return candidate != ch
                                                              && IsAuthed(candidate)
                                                              && CanSeeCharacter(ch, candidate);
                                                          });

      for(Character *transferee : charactersToTransfer)
        {
          sprintf( buf, "%s %s", transferee->Name, arg2 );
          do_mptransfer( ch, buf );
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

  if ( !victim->InRoom )
    {
      ProgBug( "Mptransfer - Victim in Limbo", ch );
      return;
    }

  if (!IsAuthed(victim) && location->Area != victim->InRoom->Area)
    {
      ProgBug( "Mptransfer - transferring unauthorized player", ch);
      return;
    }


  /* If victim not in area's level range, do not transfer */
  if ( !InHardRange( victim, location->Area )
       &&   !IsBitSet( location->Flags, ROOM_PROTOTYPE ) )
    return;

  if ( victim->Fighting )
    StopFighting( victim, true );

  CharacterFromRoom( victim );
  CharacterToRoom( victim, location );
}

