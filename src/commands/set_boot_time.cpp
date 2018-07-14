#include <time.h>
#include "mud.hpp"

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
      SendToCharacter( "Syntax: setboot time {hour minute <day> <month> <year>}\r\n", ch);
      SendToCharacter( "        setboot manual {0/1}\r\n", ch);
      SendToCharacter( "        setboot default\r\n", ch);
      Echo( ch, "Boot time is currently set to %s, manual bit is set to %d\r\n",
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
          SendToCharacter("You must input a value for hour and minute.\r\n", ch);
          return;
        }

      now_time = localtime(&current_time);

      if ( (now_time->tm_hour = atoi(arg)) < 0 || now_time->tm_hour > 23 )
        {
          SendToCharacter("Valid range for hour is 0 to 23.\r\n", ch);
          return;
	}

      if ( (now_time->tm_min = atoi(arg1)) < 0 || now_time->tm_min > 59 )
        {
          SendToCharacter("Valid range for minute is 0 to 59.\r\n", ch);
          return;
        }

      argument = OneArgument(argument, arg);

      if ( !IsNullOrEmpty( arg ) && IsNumber(arg) )
        {
          if ( (now_time->tm_mday = atoi(arg)) < 1 || now_time->tm_mday > 31 )
            {
              SendToCharacter("Valid range for day is 1 to 31.\r\n", ch);
              return;
            }
	  
          argument = OneArgument(argument, arg);

	  if ( IsNullOrEmpty( arg ) && IsNumber(arg) )
            {
              if ( (now_time->tm_mon = atoi(arg)) < 1 || now_time->tm_mon > 12 )
                {
                  SendToCharacter( "Valid range for month is 1 to 12.\r\n", ch );
                  return;
                }

              now_time->tm_mon--;
              argument = OneArgument(argument, arg);

	      if ( (now_time->tm_year = atoi(arg)-1900) < 0 ||
                   now_time->tm_year > 199 )
                {
                  SendToCharacter( "Valid range for year is 1900 to 2099.\r\n", ch );
                  return;
                }
            }
        }

      now_time->tm_sec = 0;

      if ( mktime(now_time) < current_time )
        {
          SendToCharacter( "You can't set a time previous to today!\r\n", ch );
          return;
        }

      if (set_boot_time->Manual == 0)
        set_boot_time->Manual = 1;

      new_boot_time = UpdateTime(now_time);
      new_boot_struct = *new_boot_time;
      new_boot_time = &new_boot_struct;
      RebootCheck(mktime(new_boot_time));
      GenerateRebootString();

      Echo(ch, "Boot time set to %s\r\n", reboot_time);
      check = true;
    }
  else if ( !StrCmp(arg, "manual") )
    {
      argument = OneArgument(argument, arg1);

      if ( IsNullOrEmpty( arg1 ) )
        {
          SendToCharacter("Please enter a value for manual boot on/off\r\n", ch);
          return;
        }

      if ( !IsNumber(arg1))
        {
          SendToCharacter("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      if (atoi(arg1) < 0 || atoi(arg1) > 1)
        {
          SendToCharacter("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      set_boot_time->Manual = atoi(arg1);
      Echo(ch, "Manual bit set to %s\r\n", arg1);
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

      SendToCharacter("Reboot time set back to normal.\r\n", ch);
      check = true;
    }

  if (!check)
    {
      SendToCharacter("Invalid argument for setboot.\r\n", ch);
      return;
    }

  else
    {
      GenerateRebootString();
      new_boot_time_t = mktime(new_boot_time);
    }
}
