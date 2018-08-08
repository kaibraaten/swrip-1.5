#include <time.h>
#include "mud.hpp"
#include "character.hpp"

extern char reboot_time[];
extern struct tm new_boot_struct;

void do_set_boot_time( Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  bool check = false;

  argument = OneArgument(argument, arg);

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Syntax: setboot time {hour minute <day> <month> <year>}\r\n");
      ch->Echo("        setboot manual {0/1}\r\n");
      ch->Echo("        setboot default\r\n");
      ch->Echo("Boot time is currently set to %s, manual bit is set to %d\r\n",
	    reboot_time, set_boot_time->Manual );
      return;
    }

  if ( !StrCmp(arg, "time") )
    {
      struct tm *now_time;

      argument = OneArgument(argument, arg);
      argument = OneArgument(argument, arg1);

      if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( arg1 ) || !IsNumber(arg) || !IsNumber(arg1) )
        {
          ch->Echo("You must input a value for hour and minute.\r\n");
          return;
        }

      now_time = localtime(&current_time);

      if ( (now_time->tm_hour = atoi(arg)) < 0 || now_time->tm_hour > 23 )
        {
          ch->Echo("Valid range for hour is 0 to 23.\r\n");
          return;
	}

      if ( (now_time->tm_min = atoi(arg1)) < 0 || now_time->tm_min > 59 )
        {
          ch->Echo("Valid range for minute is 0 to 59.\r\n");
          return;
        }

      argument = OneArgument(argument, arg);

      if ( !IsNullOrEmpty( arg ) && IsNumber(arg) )
        {
          if ( (now_time->tm_mday = atoi(arg)) < 1 || now_time->tm_mday > 31 )
            {
              ch->Echo("Valid range for day is 1 to 31.\r\n");
              return;
            }
	  
          argument = OneArgument(argument, arg);

	  if ( IsNullOrEmpty( arg ) && IsNumber(arg) )
            {
              if ( (now_time->tm_mon = atoi(arg)) < 1 || now_time->tm_mon > 12 )
                {
                  ch->Echo("Valid range for month is 1 to 12.\r\n");
                  return;
                }

              now_time->tm_mon--;
              argument = OneArgument(argument, arg);

	      if ( (now_time->tm_year = atoi(arg)-1900) < 0 ||
                   now_time->tm_year > 199 )
                {
                  ch->Echo("Valid range for year is 1900 to 2099.\r\n");
                  return;
                }
            }
        }

      now_time->tm_sec = 0;

      if ( mktime(now_time) < current_time )
        {
          ch->Echo("You can't set a time previous to today!\r\n");
          return;
        }

      if (set_boot_time->Manual == 0)
        set_boot_time->Manual = 1;

      new_boot_time = UpdateTime(now_time);
      new_boot_struct = *new_boot_time;
      new_boot_time = &new_boot_struct;
      RebootCheck(mktime(new_boot_time));
      GenerateRebootString();

      ch->Echo("Boot time set to %s\r\n", reboot_time);
      check = true;
    }
  else if ( !StrCmp(arg, "manual") )
    {
      argument = OneArgument(argument, arg1);

      if ( IsNullOrEmpty( arg1 ) )
        {
          ch->Echo("Please enter a value for manual boot on/off\r\n");
          return;
        }

      if ( !IsNumber(arg1))
        {
          ch->Echo("Value for manual must be 0 (off) or 1 (on)\r\n");
          return;
        }

      if (atoi(arg1) < 0 || atoi(arg1) > 1)
        {
          ch->Echo("Value for manual must be 0 (off) or 1 (on)\r\n");
          return;
        }

      set_boot_time->Manual = atoi(arg1);
      ch->Echo("Manual bit set to %s\r\n", arg1);
      check = true;
      GenerateRebootString();
      return;
    }

  else if (!StrCmp( arg, "default" ))
    {
      set_boot_time->Manual = 0;
      /* Reinitialize new_boot_time */
      new_boot_time = localtime(&current_time);
      new_boot_time->tm_mday += 1;
      if (new_boot_time->tm_hour > 12)
        new_boot_time->tm_mday += 1;
      new_boot_time->tm_hour = 6;
      new_boot_time->tm_min = 0;
      new_boot_time->tm_sec = 0;
      new_boot_time = UpdateTime(new_boot_time);

      SysData.DenyNewPlayers = false;

      ch->Echo("Reboot time set back to normal.\r\n");
      check = true;
    }

  if (!check)
    {
      ch->Echo("Invalid argument for setboot.\r\n");
      return;
    }

  else
    {
      GenerateRebootString();
      new_boot_time_t = mktime(new_boot_time);
    }
}

