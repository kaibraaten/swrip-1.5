#include "character.hpp"
#include "mud.hpp"

void do_invite(Character *ch, char *argument)
{
  Room *home;
  Character *victim;

  home = ch->InRoom;

  if ( !IsBitSet(home->Flags,ROOM_PLR_HOME) || home != ch->PlayerHome )
    {
      SendToCharacter("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter("&RInvite who?\r\n",ch);
      return;
    }

  if ( (victim = GetCharacterAnywhere(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim->BuzzedFromRoom == NULL && victim->BuzzedHome != home )
    {
      SendToCharacter("&RThey didn't buzz your home.\r\n",ch);
      return;
    }

  if ( victim->BuzzedFromRoom != victim->InRoom )
    {
      SendToCharacter("&RThey aren't outside your home anymore.\r\n",ch);
      return;
    }

  Act(AT_ACTION,"You invite $N to enter, and $E steps inside.",ch,NULL,victim,TO_CHAR);
  Act(AT_ACTION,"$n invites you to enter, and you step inside.",ch,NULL,victim,TO_VICT);
  CharacterFromRoom(victim);
  CharacterToRoom(victim,home);
  victim->BuzzedHome = NULL;
  victim->BuzzedFromRoom = NULL;
}
