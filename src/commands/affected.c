#include "character.h"
#include "mud.h"

void do_affected ( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  Affect *paf;
  Skill *skill;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  if ( !StrCmp( arg, "by" ) )
    {
      set_char_color( AT_BLUE, ch );
      send_to_char( "\r\nImbued with:\r\n", ch );
      set_char_color( AT_SCORE, ch );
      ch_printf( ch, "%s\r\n", FlagString( ch->affected_by, affected_flags ) );
      if ( ch->top_level >= 20 )
        {
          send_to_char( "\r\n", ch );
          if ( ch->resistant > 0 )
            {
              set_char_color ( AT_BLUE, ch );
              send_to_char( "Resistances:  ", ch );
              set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", FlagString(ch->resistant, ris_flags) );
            }
          if ( ch->immune > 0 )
            {
              set_char_color( AT_BLUE, ch );
              send_to_char( "Immunities:   ", ch);
	      set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", FlagString(ch->immune, ris_flags) );
            }
          if ( ch->susceptible > 0 )
            {
              set_char_color( AT_BLUE, ch );
              send_to_char( "Suscepts:     ", ch );
              set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", FlagString(ch->susceptible, ris_flags) );
            }
        }
      return;
    }

  if ( !ch->first_affect )
    {
      set_char_color( AT_SCORE, ch );
      send_to_char( "\r\nNo cantrip or skill affects you.\r\n", ch );
    }
  else
    {
      send_to_char( "\r\n", ch );
      for (paf = ch->first_affect; paf; paf = paf->next)
        if ( (skill=get_skilltype(paf->type)) != NULL )
          {
            set_char_color( AT_BLUE, ch );
            send_to_char( "Affected:  ", ch );
            set_char_color( AT_SCORE, ch );
            if ( ch->top_level >= 20 )
              {
                if (paf->duration < 25 ) set_char_color( AT_WHITE, ch );
                if (paf->duration < 6  ) set_char_color( AT_WHITE + AT_BLINK, ch );
                ch_printf( ch, "(%5d)   ", paf->duration );
              }
            ch_printf( ch, "%-18s\r\n", skill->name );
          }
    }
  return;
}
