#include "character.hpp"
#include "mud.hpp"

void do_remresident(Character *ch, std::string argument)
{
  Room *home;
  Character *victim;

  home = ch->InRoom;

  if ( !IsBitSet(home->Flags, ROOM_PLR_HOME) || home != ch->PlayerHome )
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
      SendToCharacter("&RRemove which resident?\r\n",ch);
      return;
    }

  if ( (victim = GetCharacterInRoom(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter("&RYou are the home owner. Use sellhome to sell it.\r\n",ch);
      return;
    }

  if ( !IsBitSet(victim->Flags, PLR_HOME_RESIDENT) || victim->PlayerHome != home )
    {
      SendToCharacter("&RThat player is not a resident of your home.\r\n",ch);
      return;
    }

  victim->PlayerHome = NULL;
  RemoveBit(victim->Flags, PLR_HOME_RESIDENT);
  do_save(victim,"");

  Act(AT_PLAIN,"You remove $N as a resident.",ch,NULL,victim,TO_CHAR);
  SendToCharacter("You are no longer a resident of this home.\r\n",victim);
}
