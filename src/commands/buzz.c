#include "character.h"
#include "mud.h"

void do_buzz (Character *ch, char *arg)
{
  short exit_dir;
  Room *home;
  Exit *exitdat;

  if ( !str_cmp( arg, "n"  ) || !str_cmp( arg, "north"     ) )
    exit_dir = DIR_NORTH;
  else if ( !str_cmp( arg, "e"  ) || !str_cmp( arg, "east"      ) )
    exit_dir = DIR_EAST;
  else if ( !str_cmp( arg, "s"  ) || !str_cmp( arg, "south"     ) )
    exit_dir = DIR_SOUTH;
  else if ( !str_cmp( arg, "w"  ) || !str_cmp( arg, "west"      ) )
    exit_dir = DIR_WEST;
  else if ( !str_cmp( arg, "u"  ) || !str_cmp( arg, "up"        ) )
    exit_dir = DIR_UP;
  else if ( !str_cmp( arg, "d"  ) || !str_cmp( arg, "down"      ) )
    exit_dir = DIR_DOWN;
  else if ( !str_cmp( arg, "ne" ) || !str_cmp( arg, "northeast" ) )
    exit_dir = DIR_NORTHEAST;
  else if ( !str_cmp( arg, "nw" ) || !str_cmp( arg, "northwest" ) )
    exit_dir = DIR_NORTHWEST;
  else if ( !str_cmp( arg, "se" ) || !str_cmp( arg, "southeast" ) )
    exit_dir = DIR_SOUTHEAST;
  else if ( !str_cmp( arg, "sw" ) || !str_cmp( arg, "southwest" ) )
    exit_dir = DIR_SOUTHWEST;
  else
    {
      send_to_char("&RBuzz the home in what direction?\r\n",ch);
      return;
    }

  exitdat = get_exit(ch->in_room, exit_dir);

  if ( exitdat == NULL )
    {
      send_to_char("&RYou can't do that.\r\n",ch);
      return;
    }

  home = exitdat->to_room;

  if ( IS_SET(home->room_flags,ROOM_EMPTY_HOME) )
    {
      send_to_char("&RThat home isn't owned by anyone.\r\n",ch);
      return;
    }

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) )
    {
      send_to_char("&RThat isn't a home.\r\n",ch);
      return;
    }

  ch->buzzed_from_room = ch->in_room;

  echo_to_room(AT_WHITE,home,"The door buzzer sounds.\r\n");
  send_to_char("You press the door buzzer.\r\n",ch);
  act(AT_ACTION,"$n presses a door buzzer.",ch,NULL,NULL,TO_ROOM);
}
