#include "mud.h"

extern char *spell_target_name;

ch_ret spell_control_weather( int sn, int level, Character *ch, void *vo )
{
  SKILLTYPE *skill = get_skilltype(sn);

  if ( !str_cmp( spell_target_name, "better" ) )
    weather_info.change += dice( level / 3, 4 );
  else if ( !str_cmp( spell_target_name, "worse" ) )
    weather_info.change -= dice( level / 3, 4 );
  else
    {
      send_to_char ("Do you want it to get better or worse?\r\n", ch );
      return rSPELL_FAILED;
    }
  successful_casting( skill, ch, NULL, NULL );
  return rNONE;
}
