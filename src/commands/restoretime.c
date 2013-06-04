#include "mud.h"
#include "character.h"

void do_restoretime( Character *ch, char *argument )
{
  long int time_passed;
  int hour, minute;

  if ( !last_restore_all_time )
    {
      ch_printf( ch, "There has been no restore all since reboot\r\n");
    }
  else
    {
      time_passed = current_time - last_restore_all_time;
      hour = (int) ( time_passed / 3600 );
      minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
      ch_printf( ch, "The  last restore all was %d hours and %d minutes ago.\r\n",
                 hour, minute );
    }

  if ( !ch->pcdata )
    return;

  if ( !ch->pcdata->restore_time )
    {
      send_to_char( "You have never done a restore all.\r\n", ch );
      return;
    }

  time_passed = current_time - ch->pcdata->restore_time;
  hour = (int) ( time_passed / 3600 );
  minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
  ch_printf( ch, "Your last restore all was %d hours and %d minutes ago.\r\n",
             hour, minute );
}
