#include "character.h"
#include "mud.h"

void do_remresident(CHAR_DATA *ch, char *argument)
{
  ROOM_INDEX_DATA *home;
  CHAR_DATA *victim;

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
      send_to_char("&RRemove which resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      send_to_char("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      send_to_char("&RYou are the home owner. Use sellhome to sell it.\r\n",ch);
      return;
    }

  if ( !IS_SET(victim->act,PLR_HOME_RESIDENT) || victim->plr_home != home )
    {
      send_to_char("&RThat player is not a resident of your home.\r\n",ch);
      return;
    }

  victim->plr_home = NULL;
  REMOVE_BIT(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You remove $N as a resident.",ch,NULL,victim,TO_CHAR);
  send_to_char("You are no longer a resident of this home.\r\n",victim);
}
