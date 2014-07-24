#include "character.h"
#include "mud.h"

void do_addresident(Character *ch, char *argument)
{
  ROOM_INDEX_DATA *home;
  Character *victim;

  home = ch->in_room;

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      send_to_char("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IS_SET(ch->act,PLR_HOME_RESIDENT) )
    {
      send_to_char("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char("&RAdd who as a resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      send_to_char("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      send_to_char("&RNot only are you a resident of this home, but you are its owner.\r\n",ch);
      return;
    }

  if ( victim->plr_home != NULL )
    {
      send_to_char("&RThat player already has a home.\r\n",ch);
      return;
    }

  victim->plr_home = home;
  SET_BIT(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You add $N as a resident.",ch,NULL,victim,TO_CHAR);
  send_to_char("You are now a resident of this home.\r\n",victim);
}
