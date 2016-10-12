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

  if ( !IsBitSet( ch->AffectedBy, RaceTable[ch->Race].affected ) )
    SetBit( ch->AffectedBy, RaceTable[ch->Race].affected );

  if ( !IsBitSet( ch->Resistant, RaceTable[ch->Race].resist ) )
    SetBit( ch->Resistant, RaceTable[ch->Race].resist );

  if ( !IsBitSet( ch->Susceptible, RaceTable[ch->Race].suscept ) )
    SetBit( ch->Susceptible, RaceTable[ch->Race].suscept );

  if ( !IsAuthed(ch) )
    {
      SendToCharacter("You can't save until after you've graduated from the academy.\r\n", ch);
      return;
    }

  SaveCharacter( ch );
  SaveHome (ch );

  if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
    SaveStoreroom( ch->InRoom );

  saving_char = NULL;
  SendToCharacter( "Ok.\r\n", ch );
}
