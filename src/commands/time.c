#include <time.h>
#include "mud.h"

char * const day_name[] =
  {
    "Palpatine", "Controversy", "Protest", "Order", "Destruction",
    "Rebellion", "Strife"
  };

char * const month_name[] =
  {
    "Winter", "The Rise of the Old Republic", "Peace", "Naboo's Struggle",
    "The Senator's Election", "the Spring", "The Rise of the New Order", "Trust", "Betrayal",
    "the Summer", "the Heat", "The Senate's Final Dismissal", "The Dark Side", "Alderaan's Punishment",
    "The Fall of the Machine", "The Search for Rebellion", "The Rise of a Jedi"
  };

void do_time( Character *ch, char *argument )
{
  extern char str_boot_time[];
  extern char reboot_time[];
  char *suf;
  int day = time_info.day + 1;

  if ( day > 4 && day <  20 )
    suf = "th";
  else if ( day % 10 ==  1 )
    suf = "st";
  else if ( day % 10 ==  2 )
    suf = "nd";
  else if ( day % 10 ==  3 )
    suf = "rd";
  else
    suf = "th";

  set_char_color( AT_YELLOW, ch );
  set_char_color( AT_YELLOW, ch );
  ch_printf( ch,
             "It is %d o'clock %s, Day of %s, %d%s the Month of %s.\r\n"
             "The mud started up at:    %s\r"
             "The system time (E.S.T.): %s\r"
             "Next Reboot is set for:   %s\r",

             (time_info.hour % 12 == 0) ? 12 : time_info.hour % 12,
             time_info.hour >= 12 ? "pm" : "am",
             day_name[day % 7],
             day, suf,
             month_name[time_info.month],
             str_boot_time,
             (char *) ctime( &current_time ),
             reboot_time
             );
}
