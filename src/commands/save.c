#include "character.h"
#include "mud.h"

void do_save( Character *ch, char *argument )
{
  if ( IsNpc(ch) && IsBitSet(ch->Flags, ACT_POLYMORPHED))
    {
      SendToCharacter("You can't save while polymorphed.\r\n", ch);
      return;
    }

  if ( IsNpc(ch) )
    return;

  if ( !IsBitSet( ch->AffectedBy, RaceTable[ch->race].affected ) )
    SetBit( ch->AffectedBy, RaceTable[ch->race].affected );

  if ( !IsBitSet( ch->resistant, RaceTable[ch->race].resist ) )
    SetBit( ch->resistant, RaceTable[ch->race].resist );

  if ( !IsBitSet( ch->susceptible, RaceTable[ch->race].suscept ) )
    SetBit( ch->susceptible, RaceTable[ch->race].suscept );

  if ( !IsAuthed(ch) )
    {
      SendToCharacter("You can't save until after you've graduated from the academy.\r\n", ch);
      return;
    }

  SaveCharacter( ch );
  SaveHome (ch );

  if ( IsBitSet( ch->in_room->Flags, ROOM_CLANSTOREROOM ) )
    SaveStoreroom( ch->in_room );

  saving_char = NULL;
  SendToCharacter( "Ok.\r\n", ch );
}
