#include <ctime>
#include "mud.hpp"
#include "character.hpp"

static const char * const day_name[] =
  {
    "Palpatine", "Controversy", "Protest", "Order", "Destruction",
    "Rebellion", "Strife"
  };

static const char * const month_name[] =
  {
    "Winter", "The Rise of the Old Republic", "Peace", "Naboo's Struggle",
    "The Senator's Election", "the Spring", "The Rise of the New Order", "Trust", "Betrayal",
    "the Summer", "the Heat", "The Senate's Final Dismissal", "The Dark Side", "Alderaan's Punishment",
    "The Fall of the Machine", "The Search for Rebellion", "The Rise of a Jedi"
  };

void do_time( std::shared_ptr<Character> ch, std::string argument )
{
  const char *suf = nullptr;
  int day = time_info.Day + 1;

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

  SetCharacterColor( AT_YELLOW, ch );
  ch->Echo("It is %d o'clock %s, Day of %s, %d%s the Month of %s.\r\n"
           "The mud started up at:    %s\r"
           "The system time (E.S.T.): %s\r"
           "Next Reboot is set for:   %s\r",
           (time_info.Hour % 12 == 0) ? 12 : time_info.Hour % 12,
           time_info.Hour >= 12 ? "pm" : "am",
           day_name[day % 7],
           day, suf,
           month_name[time_info.Month],
           str_boot_time.c_str(),
           (char *) ctime( &current_time ),
           reboot_time.c_str()
           );
}
