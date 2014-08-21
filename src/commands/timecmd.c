#include "mud.h"

void do_timecmd( Character *ch, char *argument )
{
  struct timeval start_time;
  struct timeval etime;
  static bool timing;
  extern Character *timechar;
  char arg[MAX_INPUT_LENGTH];

  SendToCharacter("Timing\r\n",ch);
  if ( timing )
    return;
  OneArgument(argument, arg);
  if ( !*arg )
    {
      SendToCharacter( "No command to time.\r\n", ch );
      return;
    }
  if ( !StrCmp(arg, "update") )
    {
      if ( timechar )
        SendToCharacter( "Another person is already timing updates.\r\n", ch );
      else
        {
          timechar = ch;
	  SendToCharacter( "Setting up to record next update loop.\r\n", ch );
        }
      return;
    }
  SetCharacterColor(AT_PLAIN, ch);
  SendToCharacter( "Starting timer.\r\n", ch );
  timing = true;
  gettimeofday(&start_time, NULL);
  Interpret(ch, argument);
  gettimeofday(&etime, NULL);
  timing = false;
  SetCharacterColor(AT_PLAIN, ch);
  SendToCharacter( "Timing complete.\r\n", ch );
  SubtractTimes(&etime, &start_time);
  Echo( ch, "Timing took %d.%06d seconds.\r\n",
             etime.tv_sec, etime.tv_usec );
}
