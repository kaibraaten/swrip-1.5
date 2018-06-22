#include "character.h"
#include "mud.h"

void do_unjail ( Character *ch , char *argument )
{
  Character *victim =NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument(argument, arg);

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "That would be a waste of time.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      SendToCharacter( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->InRoom->Vnum == ROOM_VNUM_HELL)
    {
      SendToCharacter( "Only an immortal can unhell someone.\r\n", ch );
      return;
    }
  SendToCharacter( "Jail restrictions released.\r\n", ch );
  victim->PCData->JailVnum = 0;
  victim->PCData->ReleaseDate = 0;
}
