#include "character.h"
#include "mud.h"

void do_weather( Character *ch, char *argument )
{
  static char * const sky_look[4] =
    {
      "cloudless",
      "cloudy",
      "rainy",
      "lit by flashes of lightning"
    };

  if ( !IS_OUTSIDE(ch) )
    {
      SendToCharacter( "You can't see the sky from here.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_BLUE, ch );
  ChPrintf( ch, "The sky is %s and %s.\r\n",
             sky_look[weather_info.sky],
             weather_info.change >= 0
             ? "a warm southerly breeze blows"
             : "a cold northern gust blows"
             );
}
