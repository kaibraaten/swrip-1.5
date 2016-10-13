#include <string.h>
#include <time.h>
#include "mud.h"
#include "arena.h"

void do_ahall(Character *ch, char *argument)
{
  char site[MAX_INPUT_LENGTH], format[MAX_INPUT_LENGTH], *timestr;
  char format2[MAX_INPUT_LENGTH];
  struct HallOfFameElement *fame_node;

  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!FameList)
    {
      SendToCharacter("No-one is in the Hall of Fame.\r\n", ch);
      return;
    }

  sprintf(buf2, "&B|---------------------------------------|\r\n");
  strcat(buf2, "| &WPast Winners of The Rise in Power Arena&B  |\r\n");
  strcat(buf2, "|---------------------------------------|\r\r\n\n");

  SendToCharacter(buf2, ch);
  strcpy(format, "%-25.25s  %-10.10s  %-16.16s\r\n");
  sprintf(buf, format,
          "&RName",
          "&RDate",
          "&RAward Amt");
  SendToCharacter(buf, ch);
  sprintf(buf, format,
          "&B---------------------------------",
          "&B---------------------------------",
          "&B---------------------------------");

  SendToCharacter(buf, ch);
  strcpy(format2, "&W%-25.25s  &R%-10.10s  &Y%-16d\r\n");
  for (fame_node = FameList; fame_node; fame_node = fame_node->next)
    {
      if (fame_node->Date)
        {
          timestr = asctime(localtime(&(fame_node->Date)));
          *(timestr + 10) = 0;
          strcpy(site, timestr);
        }
      else
        strcpy(site, "Unknown");
      sprintf(buf, format2, fame_node->Name, site, fame_node->Award);
      SendToCharacter(buf, ch);
    }
}
