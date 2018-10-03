#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_weather( Character *ch, std::string argument )
{
  static const char * const sky_look[] =
    {
      "cloudless",
      "cloudy",
      "rainy",
      "lit by flashes of lightning"
    };

  if ( !IS_OUTSIDE(ch) )
    {
      ch->Echo("You can't see the sky from here.\r\n");
      return;
    }

  SetCharacterColor( AT_BLUE, ch );
  ch->Echo("The sky is %s and %s.\r\n",
             sky_look[weather_info.Sky],
             weather_info.Change >= 0
             ? "a warm southerly breeze blows"
             : "a cold northern gust blows"
             );
}
