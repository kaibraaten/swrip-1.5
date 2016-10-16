#include "mud.h"
#include "character.h"

void do_restoretime( Character *ch, char *argument )
{
  long int time_passed;
  int hour, minute;

  if ( !last_restore_all_time )
    {
      Echo( ch, "There has been no restore all since reboot\r\n");
    }
  else
    {
      time_passed = current_time - last_restore_all_time;
      hour = (int) ( time_passed / 3600 );
      minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
      Echo( ch, "The  last restore all was %d hours and %d minutes ago.\r\n",
                 hour, minute );
    }

  if ( !ch->PCData )
    return;

  if ( !ch->PCData->RestoreTime )
    {
      SendToCharacter( "You have never done a restore all.\r\n", ch );
      return;
    }

  time_passed = current_time - ch->PCData->RestoreTime;
  hour = (int) ( time_passed / 3600 );
  minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
  Echo( ch, "Your last restore all was %d hours and %d minutes ago.\r\n",
             hour, minute );
}
