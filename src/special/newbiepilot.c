#include <string.h>
#include "mud.h"
#include "character.h"

bool spec_newbie_pilot( Character *ch )
{
  int           home = 32149;
  Character   * victim;
  Character   * v_next;
  OBJ_DATA    * obj;
  char          buf[MAX_STRING_LENGTH];
  bool          diploma = FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( is_npc(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        if ( obj->pIndexData->vnum == OBJ_VNUM_SCHOOL_DIPLOMA )
          diploma = TRUE;

      if ( !diploma )
        continue;

      switch ( victim->race )
        {
        case RACE_MON_CALAMARI:
          home = 21100;
          strcpy ( buf , "After a brief journey you arrive on Mon Calamari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

	case RACE_QUARREN:
          home = 6904;
          strcpy ( buf , "After a brief journey you arrive on Mon Calamari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_GAMORREAN:
          home = 28038;
          strcpy ( buf , "After a brief journey you arrive on Gamorr.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_ADARIAN:
          home = 29006;
          strcpy ( buf , "After a brief journey you arrive on Adari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_JAWA:
          home = 31821;
          strcpy ( buf , "After a brief journey you arrive on Tatooine.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_WOOKIEE:
          home = 28600;
          strcpy ( buf , "After a brief journey you arrive on Kashyyyk.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_HUMAN:
          home = 201;
          strcpy ( buf , "After a brief journey you arrive at Coruscants Menari Spaceport.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        default:
          sprintf ( buf , "Hmm, a %s." , race_table[victim->race].race_name );
          do_look ( ch, victim->name );
          do_say ( ch, buf );
          do_say ( ch, "You're home planet is a little hard to get to right now." );
          do_say ( ch, "I'll take you to the Pluogus instead." );
          echo_to_room( AT_ACTION , ch->in_room, "After a brief journey the shuttle docks with the Serin Pluogus.\r\n\r\n" );
          break;
        }

      char_from_room ( victim );
      char_to_room ( victim , get_room_index ( home ) );

      do_look ( victim , "" );

      sprintf ( buf , "%s steps out and the shuttle quickly returns to the academy.\r\n" , victim->name );
      echo_to_room( AT_ACTION , ch->in_room, buf );
    }

  return FALSE;
}
