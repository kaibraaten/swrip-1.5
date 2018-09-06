#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_invite(Character *ch, std::string argument )
{
  Room *home = ch->InRoom;
  Character *victim = nullptr;

  if ( !IsBitSet(home->Flags,ROOM_PLR_HOME) || home != ch->PlayerHome )
    {
      ch->Echo("&RThis isn't your home!\r\n");
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo("&RInvite who?\r\n");
      return;
    }

  if ( (victim = GetCharacterAnywhere(ch, argument)) == NULL )
    {
      ch->Echo("&RThey aren't here.\r\n");
      return;
    }

  if ( victim->BuzzedFromRoom == NULL && victim->BuzzedHome != home )
    {
      ch->Echo("&RThey didn't buzz your home.\r\n");
      return;
    }

  if ( victim->BuzzedFromRoom != victim->InRoom )
    {
      ch->Echo("&RThey aren't outside your home anymore.\r\n");
      return;
    }

  Act(AT_ACTION,"You invite $N to enter, and $E steps inside.",ch,NULL,victim,TO_CHAR);
  Act(AT_ACTION,"$n invites you to enter, and you step inside.",ch,NULL,victim,TO_VICT);
  CharacterFromRoom(victim);
  CharacterToRoom(victim,home);
  victim->BuzzedHome = NULL;
  victim->BuzzedFromRoom = NULL;
}


