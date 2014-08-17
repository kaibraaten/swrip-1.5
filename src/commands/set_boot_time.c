#include <time.h>
#include "mud.h"

extern char reboot_time[];
extern struct tm new_boot_struct;

void do_set_boot_time( Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  bool check;

  check = false;

  argument = OneArgument(argument, arg);

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: setboot time {hour minute <day> <month> <year>}\r\n", ch);
      send_to_char( "        setboot manual {0/1}\r\n", ch);
      send_to_char( "        setboot default\r\n", ch);
      ch_printf( ch, "Boot time is currently set to %s, manual bit is set to %d\r\n"
                 ,reboot_time, set_boot_time->manual );
      return;
    }

  if ( !StrCmp(arg, "time") )
    {
      struct tm *now_time;

      argument = OneArgument(argument, arg);
      argument = OneArgument(argument, arg1);
      if ( !*arg || !*arg1 || !IsNumber(arg) || !IsNumber(arg1) )
        {
          send_to_char("You must input a value for hour and minute.\r\n", ch);
          return;
        }
      now_time = localtime(&current_time);

      if ( (now_time->tm_hour = atoi(arg)) < 0 || now_time->tm_hour > 23 )
        {
          send_to_char("Valid range for hour is 0 to 23.\r\n", ch);
          return;
	}

      if ( (now_time->tm_min = atoi(arg1)) < 0 || now_time->tm_min > 59 )
        {
          send_to_char("Valid range for minute is 0 to 59.\r\n", ch);
          return;
        }

      argument = OneArgument(argument, arg);
      if ( *arg != '\0' && IsNumber(arg) )
        {
          if ( (now_time->tm_mday = atoi(arg)) < 1 || now_time->tm_mday > 31 )
            {
              send_to_char("Valid range for day is 1 to 31.\r\n", ch);
              return;
            }
          argument = OneArgument(argument, arg);
          if ( *arg != '\0' && IsNumber(arg) )
            {
              if ( (now_time->tm_mon = atoi(arg)) < 1 || now_time->tm_mon > 12 )
                {
                  send_to_char( "Valid range for month is 1 to 12.\r\n", ch );
                  return;
                }
              now_time->tm_mon--;
              argument = OneArgument(argument, arg);
              if ( (now_time->tm_year = atoi(arg)-1900) < 0 ||
                   now_time->tm_year > 199 )
                {
                  send_to_char( "Valid range for year is 1900 to 2099.\r\n", ch );
                  return;
                }
            }
        }
      now_time->tm_sec = 0;
      if ( mktime(now_time) < current_time )
        {
          send_to_char( "You can't set a time previous to today!\r\n", ch );
          return;
        }
      if (set_boot_time->manual == 0)
        set_boot_time->manual = 1;
      new_boot_time = UpdateTime(now_time);
      new_boot_struct = *new_boot_time;
      new_boot_time = &new_boot_struct;
      reboot_check(mktime(new_boot_time));
      get_reboot_string();

      ch_printf(ch, "Boot time set to %s\r\n", reboot_time);
      check = true;
    }
  else if ( !StrCmp(arg, "manual") )
    {
      argument = OneArgument(argument, arg1);
      if (arg1[0] == '\0')
        {
          send_to_char("Please enter a value for manual boot on/off\r\n", ch);
          return;
        }

      if ( !IsNumber(arg1))
        {
          send_to_char("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      if (atoi(arg1) < 0 || atoi(arg1) > 1)
        {
          send_to_char("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      set_boot_time->manual = atoi(arg1);
      ch_printf(ch, "Manual bit set to %s\r\n", arg1);
      check = true;
      get_reboot_string();
      return;
    }

  else if (!StrCmp( arg, "default" ))
    {
      set_boot_time->manual = 0;
      /* Reinitialize new_boot_time */
      new_boot_time = localtime(&current_time);
      new_boot_time->tm_mday += 1;
      if (new_boot_time->tm_hour > 12)
        new_boot_time->tm_mday += 1;
      new_boot_time->tm_hour = 6;
      new_boot_time->tm_min = 0;
      new_boot_time->tm_sec = 0;
      new_boot_time = UpdateTime(new_boot_time);

      sysdata.DENY_NEW_PLAYERS = false;

      send_to_char("Reboot time set back to normal.\r\n", ch);
      check = true;
    }

  if (!check)
    {
      send_to_char("Invalid argument for setboot.\r\n", ch);
      return;
    }

  else
    {
      get_reboot_string();
      new_boot_time_t = mktime(new_boot_time);
    }
}
