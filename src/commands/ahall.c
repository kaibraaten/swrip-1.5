#include <string.h>
#include <time.h>
#include "mud.h"
#include "arena.h"

void do_ahall(CHAR_DATA *ch, char *argument)
{
  char site[MAX_INPUT_LENGTH], format[MAX_INPUT_LENGTH], *timestr;
  char format2[MAX_INPUT_LENGTH];
  struct hall_of_fame_element *fame_node;

  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!fame_list)
    {
      send_to_char("No-one is in the Hall of Fame.\r\n", ch);
      return;
    }

  sprintf(buf2, "&B|---------------------------------------|\r\n");
  strcat(buf2, "| &WPast Winners of The Rise in Power Arena&B  |\r\n");
  strcat(buf2, "|---------------------------------------|\r\r\n\n");

  send_to_char(buf2, ch);
  strcpy(format, "%-25.25s  %-10.10s  %-16.16s\r\n");
  sprintf(buf, format,
          "&RName",
          "&RDate",
          "&RAward Amt");
  send_to_char(buf, ch);
  sprintf(buf, format,
          "&B---------------------------------",
          "&B---------------------------------",
          "&B---------------------------------");

  send_to_char(buf, ch);
  strcpy(format2, "&W%-25.25s  &R%-10.10s  &Y%-16d\r\n");
  for (fame_node = fame_list; fame_node; fame_node = fame_node->next)
    {
      if (fame_node->date)
        {
          timestr = asctime(localtime(&(fame_node->date)));
          *(timestr + 10) = 0;
          strcpy(site, timestr);
        }
      else
        strcpy(site, "Unknown");
      sprintf(buf, format2, fame_node->name, site, fame_node->award);
      send_to_char(buf, ch);
    }
}
