#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_remresident(Character *ch, std::string argument )
{
  Room *home = nullptr;
  Character *victim = nullptr;

  home = ch->InRoom;

  if ( !home->Flags.test( Flag::Room::PlayerHome )
       || home != ch->PlayerHome )
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
      ch->Echo("&RRemove which resident?\r\n");
      return;
    }

  if ( (victim = GetCharacterInRoom(ch,argument)) == NULL )
    {
      ch->Echo("&RThey aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("&RYou are the home owner. Use sellhome to sell it.\r\n");
      return;
    }

  if ( !IsBitSet(victim->Flags, PLR_HOME_RESIDENT) || victim->PlayerHome != home )
    {
      ch->Echo("&RThat player is not a resident of your home.\r\n");
      return;
    }

  victim->PlayerHome = NULL;
  RemoveBit(victim->Flags, PLR_HOME_RESIDENT);
  do_save(victim,"");

  Act(AT_PLAIN,"You remove $N as a resident.",ch,NULL,victim,TO_CHAR);
  victim->Echo("You are no longer a resident of this home.\r\n");
}
