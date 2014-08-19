#include <string.h>
#include "mud.h"
#include "character.h"

bool spec_newbie_pilot( Character *ch )
{
  Character *victim = NULL;
  Character *v_next = NULL;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      Object *obj = NULL;
      char buf[MAX_STRING_LENGTH];
      bool diploma = false;

      v_next = victim->next_in_room;

      if ( IsNpc(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        if ( obj->Prototype->vnum == OBJ_VNUM_SCHOOL_DIPLOMA )
          diploma = true;

      if ( !diploma )
        continue;

      strcpy( buf, "After a brief journey you arrive at Coruscant's Manari Spaceport.\r\n\r\n" );
      EchoToRoom( AT_ACTION , ch->in_room, buf );

      CharacterFromRoom( victim );
      CharacterToRoom( victim, GetRoom( ROOM_START_PLAYER ) );

      do_look( victim , "" );

      sprintf( buf, "%s steps out and the shuttle quickly returns to the academy.\r\n", victim->name );
      EchoToRoom( AT_ACTION , ch->in_room, buf );
    }

  return false;
}
