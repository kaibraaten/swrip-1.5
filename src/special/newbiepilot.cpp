#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

bool spec_newbie_pilot( Character *ch )
{
  Character *victim = NULL;
  Character *v_next = NULL;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      Object *obj = NULL;
      char buf[MAX_STRING_LENGTH];
      bool diploma = false;

      v_next = victim->NextInRoom;

      if ( IsNpc(victim) || victim->Position == POS_FIGHTING )
        continue;

      for ( obj = victim->LastCarrying; obj; obj = obj->PreviousContent )
        if ( obj->Prototype->Vnum == OBJ_VNUM_SCHOOL_DIPLOMA )
          diploma = true;

      if ( !diploma )
        continue;

      strcpy( buf, "After a brief journey you arrive at Coruscant's Manari Spaceport.\r\n\r\n" );
      EchoToRoom( AT_ACTION , ch->InRoom, buf );

      CharacterFromRoom( victim );
      CharacterToRoom( victim, GetRoom( ROOM_START_PLAYER ) );

      do_look( victim , "" );

      sprintf( buf, "%s steps out and the shuttle quickly returns to the academy.\r\n", victim->Name );
      EchoToRoom( AT_ACTION , ch->InRoom, buf );
    }

  return false;
}

