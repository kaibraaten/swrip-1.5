#include "character.h"
#include "mud.h"

void do_addresident(Character *ch, char *argument)
{
  Room *home;
  Character *victim;

  home = ch->in_room;

  if ( !IsBitSet(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      SendToCharacter("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IsBitSet(ch->act,PLR_HOME_RESIDENT) )
    {
      SendToCharacter("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter("&RAdd who as a resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter("&RNot only are you a resident of this home, but you are its owner.\r\n",ch);
      return;
    }

  if ( victim->plr_home != NULL )
    {
      SendToCharacter("&RThat player already has a home.\r\n",ch);
      return;
    }

  victim->plr_home = home;
  SetBit(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You add $N as a resident.",ch,NULL,victim,TO_CHAR);
  SendToCharacter("You are now a resident of this home.\r\n",victim);
}
