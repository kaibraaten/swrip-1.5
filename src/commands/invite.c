#include "character.h"
#include "mud.h"

void do_invite(Character *ch, char *argument)
{
  Room *home;
  Character *victim;

  home = ch->in_room;

  if ( !IsBitSet(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      SendToCharacter("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter("&RInvite who?\r\n",ch);
      return;
    }

  if ( (victim = get_char_world(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim->buzzed_from_room == NULL && victim->buzzed_home != home )
    {
      SendToCharacter("&RThey didn't buzz your home.\r\n",ch);
      return;
    }

  if ( victim->buzzed_from_room != victim->in_room )
    {
      SendToCharacter("&RThey aren't outside your home anymore.\r\n",ch);
      return;
    }

  Act(AT_ACTION,"You invite $N to enter, and $E steps inside.",ch,NULL,victim,TO_CHAR);
  Act(AT_ACTION,"$n invites you to enter, and you step inside.",ch,NULL,victim,TO_VICT);
  CharacterFromRoom(victim);
  CharacterToRoom(victim,home);
  victim->buzzed_home = NULL;
  victim->buzzed_from_room = NULL;
}
