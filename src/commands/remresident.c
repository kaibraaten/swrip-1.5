#include "character.h"
#include "mud.h"

void do_remresident(Character *ch, char *argument)
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
      SendToCharacter("&RRemove which resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      SendToCharacter("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter("&RYou are the home owner. Use sellhome to sell it.\r\n",ch);
      return;
    }

  if ( !IsBitSet(victim->act,PLR_HOME_RESIDENT) || victim->plr_home != home )
    {
      SendToCharacter("&RThat player is not a resident of your home.\r\n",ch);
      return;
    }

  victim->plr_home = NULL;
  RemoveBit(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You remove $N as a resident.",ch,NULL,victim,TO_CHAR);
  SendToCharacter("You are no longer a resident of this home.\r\n",victim);
}
