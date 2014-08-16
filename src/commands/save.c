#include "character.h"
#include "mud.h"

void do_save( Character *ch, char *argument )
{
  if ( IsNpc(ch) && IS_SET(ch->act, ACT_POLYMORPHED))
    {
      send_to_char("You can't save while polymorphed.\r\n", ch);
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( !IS_SET( ch->affected_by, race_table[ch->race].affected ) )
    SET_BIT( ch->affected_by, race_table[ch->race].affected );

  if ( !IS_SET( ch->resistant, race_table[ch->race].resist ) )
    SET_BIT( ch->resistant, race_table[ch->race].resist );

  if ( !IS_SET( ch->susceptible, race_table[ch->race].suscept ) )
    SET_BIT( ch->susceptible, race_table[ch->race].suscept );

  if ( !IsAuthed(ch) )
    {
      send_to_char("You can't save until after you've graduated from the academy.\r\n", ch);
      return;
    }

  save_char_obj( ch );
  save_home (ch );

  if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
    save_storeroom( ch->in_room );

  saving_char = NULL;
  send_to_char( "Ok.\r\n", ch );
}
