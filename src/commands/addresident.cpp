#include "character.hpp"
#include "mud.hpp"

void do_addresident(Character *ch, char *argument)
{
  Room *home;
  Character *victim;

  home = ch->InRoom;

  if ( !IsBitSet(home->Flags,ROOM_PLR_HOME) || home != ch->PlayerHome )
    {
      SendToCharacter("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IsBitSet(ch->Flags, PLR_HOME_RESIDENT) )
    {
      SendToCharacter("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter("&RAdd who as a resident?\r\n",ch);
      return;
    }

  if ( (victim = GetCharacterInRoom(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter("&RNot only are you a resident of this home, but you are its owner.\r\n",ch);
      return;
    }

  if ( victim->PlayerHome != NULL )
    {
      SendToCharacter("&RThat player already has a home.\r\n",ch);
      return;
    }

  victim->PlayerHome = home;
  SetBit(victim->Flags, PLR_HOME_RESIDENT);
  do_save(victim,"");

  Act(AT_PLAIN,"You add $N as a resident.",ch,NULL,victim,TO_CHAR);
  SendToCharacter("You are now a resident of this home.\r\n",victim);
}
