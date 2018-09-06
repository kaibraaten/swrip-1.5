#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_addresident(Character *ch, std::string argument)
{
  Room *home = ch->InRoom;

  if ( !IsBitSet(home->Flags,ROOM_PLR_HOME) || home != ch->PlayerHome )
    {
      ch->Echo("&RThis isn't your home!\r\n");
      return;
    }

  if ( IsBitSet(ch->Flags, PLR_HOME_RESIDENT) )
    {
      ch->Echo("&RYou are not the owner of this home.\r\n");
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo("&RAdd who as a resident?\r\n");
      return;
    }

  Character *victim = GetCharacterInRoom(ch,argument);
  
  if ( victim == nullptr )
    {
      ch->Echo("&RThey aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("&RNot only are you a resident of this home, but you are its owner.\r\n");
      return;
    }

  if ( victim->PlayerHome != NULL )
    {
      ch->Echo("&RThat player already has a home.\r\n");
      return;
    }

  victim->PlayerHome = home;
  SetBit(victim->Flags, PLR_HOME_RESIDENT);
  do_save(victim,"");

  Act(AT_PLAIN,"You add $N as a resident.",ch,NULL,victim,TO_CHAR);
  victim->Echo("You are now a resident of this home.\r\n");
}

