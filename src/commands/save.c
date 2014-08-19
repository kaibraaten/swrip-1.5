#include "character.h"
#include "mud.h"

void do_save( Character *ch, char *argument )
{
  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_POLYMORPHED))
    {
      SendToCharacter("You can't save while polymorphed.\r\n", ch);
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( !IsBitSet( ch->affected_by, RaceTable[ch->race].affected ) )
    SetBit( ch->affected_by, RaceTable[ch->race].affected );

  if ( !IsBitSet( ch->resistant, RaceTable[ch->race].resist ) )
    SetBit( ch->resistant, RaceTable[ch->race].resist );

  if ( !IsBitSet( ch->susceptible, RaceTable[ch->race].suscept ) )
    SetBit( ch->susceptible, RaceTable[ch->race].suscept );

  if ( !IsAuthed(ch) )
    {
      SendToCharacter("You can't save until after you've graduated from the academy.\r\n", ch);
      return;
    }

  save_char_obj( ch );
  save_home (ch );

  if ( IsBitSet( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
    save_storeroom( ch->in_room );

  saving_char = NULL;
  SendToCharacter( "Ok.\r\n", ch );
}
