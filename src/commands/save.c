#include "character.h"
#include "mud.h"

void do_save( Character *ch, char *argument )
{
  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_POLYMORPHED))
    {
      send_to_char("You can't save while polymorphed.\r\n", ch);
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( !IsBitSet( ch->affected_by, race_table[ch->race].affected ) )
    SetBit( ch->affected_by, race_table[ch->race].affected );

  if ( !IsBitSet( ch->resistant, race_table[ch->race].resist ) )
    SetBit( ch->resistant, race_table[ch->race].resist );

  if ( !IsBitSet( ch->susceptible, race_table[ch->race].suscept ) )
    SetBit( ch->susceptible, race_table[ch->race].suscept );

  if ( !IsAuthed(ch) )
    {
      send_to_char("You can't save until after you've graduated from the academy.\r\n", ch);
      return;
    }

  save_char_obj( ch );
  save_home (ch );

  if ( IsBitSet( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
    save_storeroom( ch->in_room );

  saving_char = NULL;
  send_to_char( "Ok.\r\n", ch );
}
