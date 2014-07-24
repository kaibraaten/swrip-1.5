#include "mud.h"

void do_timecmd( Character *ch, char *argument )
{
  struct timeval start_time;
  struct timeval etime;
  static bool timing;
  extern Character *timechar;
  char arg[MAX_INPUT_LENGTH];

  send_to_char("Timing\r\n",ch);
  if ( timing )
    return;
  one_argument(argument, arg);
  if ( !*arg )
    {
      send_to_char( "No command to time.\r\n", ch );
      return;
    }
  if ( !str_cmp(arg, "update") )
    {
      if ( timechar )
        send_to_char( "Another person is already timing updates.\r\n", ch );
      else
        {
          timechar = ch;
	  send_to_char( "Setting up to record next update loop.\r\n", ch );
        }
      return;
    }
  set_char_color(AT_PLAIN, ch);
  send_to_char( "Starting timer.\r\n", ch );
  timing = TRUE;
  gettimeofday(&start_time, NULL);
  interpret(ch, argument);
  gettimeofday(&etime, NULL);
  timing = FALSE;
  set_char_color(AT_PLAIN, ch);
  send_to_char( "Timing complete.\r\n", ch );
  subtract_times(&etime, &start_time);
  ch_printf( ch, "Timing took %d.%06d seconds.\r\n",
             etime.tv_sec, etime.tv_usec );
}
