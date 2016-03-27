#include "character.h"
#include "mud.h"

void do_buzz (Character *ch, char *arg)
{
  DirectionType exit_dir;
  Room *home;
  Exit *exitdat;

  if ( !StrCmp( arg, "n"  ) || !StrCmp( arg, "north"     ) )
    exit_dir = DIR_NORTH;
  else if ( !StrCmp( arg, "e"  ) || !StrCmp( arg, "east"      ) )
    exit_dir = DIR_EAST;
  else if ( !StrCmp( arg, "s"  ) || !StrCmp( arg, "south"     ) )
    exit_dir = DIR_SOUTH;
  else if ( !StrCmp( arg, "w"  ) || !StrCmp( arg, "west"      ) )
    exit_dir = DIR_WEST;
  else if ( !StrCmp( arg, "u"  ) || !StrCmp( arg, "up"        ) )
    exit_dir = DIR_UP;
  else if ( !StrCmp( arg, "d"  ) || !StrCmp( arg, "down"      ) )
    exit_dir = DIR_DOWN;
  else if ( !StrCmp( arg, "ne" ) || !StrCmp( arg, "northeast" ) )
    exit_dir = DIR_NORTHEAST;
  else if ( !StrCmp( arg, "nw" ) || !StrCmp( arg, "northwest" ) )
    exit_dir = DIR_NORTHWEST;
  else if ( !StrCmp( arg, "se" ) || !StrCmp( arg, "southeast" ) )
    exit_dir = DIR_SOUTHEAST;
  else if ( !StrCmp( arg, "sw" ) || !StrCmp( arg, "southwest" ) )
    exit_dir = DIR_SOUTHWEST;
  else
    {
      SendToCharacter("&RBuzz the home in what direction?\r\n",ch);
      return;
    }

  exitdat = GetExit(ch->in_room, exit_dir);

  if ( exitdat == NULL )
    {
      SendToCharacter("&RYou can't do that.\r\n",ch);
      return;
    }

  home = exitdat->to_room;

  if ( IsBitSet(home->room_flags,ROOM_EMPTY_HOME) )
    {
      SendToCharacter("&RThat home isn't owned by anyone.\r\n",ch);
      return;
    }

  if ( !IsBitSet(home->room_flags,ROOM_PLR_HOME) )
    {
      SendToCharacter("&RThat isn't a home.\r\n",ch);
      return;
    }

  ch->buzzed_from_room = ch->in_room;

  EchoToRoom(AT_WHITE,home,"The door buzzer sounds.\r\n");
  SendToCharacter("You press the door buzzer.\r\n",ch);
  Act(AT_ACTION,"$n presses a door buzzer.",ch,NULL,NULL,TO_ROOM);
}
