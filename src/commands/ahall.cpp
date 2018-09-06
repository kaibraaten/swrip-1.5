#include <cstring>
#include <ctime>
#include "mud.hpp"
#include "arena.hpp"
#include "character.hpp"

void do_ahall(Character *ch, std::string argument)
{
  if (!FameList)
    {
      ch->Echo("No-one is in the Hall of Fame.\r\n");
      return;
    }

  ch->Echo("&B+----------------------------------------------------+\r\n");
  ch->Echo("|      &WPast Winners of The Rise in Power Arena&B       |\r\n");
  ch->Echo("+----------------------------------------------------+\r\r\n\n");

  ch->Echo("%-25.25s  %-15.15s  %-16.16s\r\n",
           "&RName",
           "&RDate",
           "&RAward Amt");
  ch->Echo("%-25.25s  %-15.15s  %-16.16s\r\n",
           "&B---------------------------------",
           "&B---------------------------------",
           "&B---------------------------------");

  for (HallOfFameElement *fame_node = FameList; fame_node; fame_node = fame_node->Next)
    {
      char site[MAX_INPUT_LENGTH];
        
      if (fame_node->Date)
        {
          char *timestr = asctime(localtime(&(fame_node->Date)));
          *(timestr + 10) = 0;
          strcpy(site, timestr);
        }
      else
        {
          strcpy(site, "Unknown");
        }

      ch->Echo("&W%-23.23s  &R%-13.13s  &Y%-16d\r\n",
               fame_node->Name, site, fame_node->Award);
    }
}

