#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_restoretime( Character *ch, char *argument )
{
  long int time_passed = 0;
  int hour = 0, minute = 0;

  if ( !last_restore_all_time )
    {
      ch->Echo("There has been no restore all since reboot\r\n");
    }
  else
    {
      time_passed = current_time - last_restore_all_time;
      hour = (int) ( time_passed / 3600 );
      minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
      ch->Echo("The  last restore all was %d hours and %d minutes ago.\r\n",
                 hour, minute );
    }

  if ( !ch->PCData )
    return;

  if ( !ch->PCData->RestoreTime )
    {
      ch->Echo("You have never done a restore all.\r\n");
      return;
    }

  time_passed = current_time - ch->PCData->RestoreTime;
  hour = (int) ( time_passed / 3600 );
  minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
  ch->Echo("Your last restore all was %d hours and %d minutes ago.\r\n",
             hour, minute );
}

