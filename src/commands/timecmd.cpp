#include "mud.hpp"
#include "character.hpp"

void do_timecmd( Character *ch, char *argument )
{
  struct timeval start_time;
  struct timeval etime;
  static bool timing;
  extern Character *timechar;
  char arg[MAX_INPUT_LENGTH];

  ch->Echo("Timing\r\n");
  if ( timing )
    return;
  OneArgument(argument, arg);
  if ( !*arg )
    {
      ch->Echo("No command to time.\r\n");
      return;
    }
  if ( !StrCmp(arg, "update") )
    {
      if ( timechar )
        ch->Echo("Another person is already timing updates.\r\n");
      else
        {
          timechar = ch;
   ch->Echo("Setting up to record next update loop.\r\n");
        }
      return;
    }
  SetCharacterColor(AT_PLAIN, ch);
  ch->Echo("Starting timer.\r\n");
  timing = true;
  gettimeofday(&start_time, NULL);
  Interpret(ch, argument);
  gettimeofday(&etime, NULL);
  timing = false;
  SetCharacterColor(AT_PLAIN, ch);
  ch->Echo("Timing complete.\r\n");
  SubtractTimes(&etime, &start_time);
  ch->Echo("Timing took %d.%06d seconds.\r\n",
             etime.tv_sec, etime.tv_usec );
}

