#include "character.h"
#include "mud.h"

void do_speak( Character *ch, char *argument )
{
  int langs = 0;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument(argument, arg );

  if ( !StrCmp( arg, "all" ) && IsImmortal( ch ) )
    {
      set_char_color( AT_SAY, ch );
      ch->speaking = ~LANG_CLAN;
      send_to_char( "Now speaking all languages.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "clan" ))
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "Clan language? There is no such thing.\r\n", ch );
      return;
    }


  if ( ch->race == RACE_WOOKIEE && StringPrefix( arg, "wookiee" ))
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "Your vocal cords refuse to make those sounds.\r\n", ch );
      return;
    }

  if ( ch->race == RACE_VERPINE && StringPrefix( arg, "verpine" ))
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "Your jaws cant pronounce that language.\r\n", ch );
      return;
    }

  if ( ch->race == RACE_GAMORREAN && StringPrefix( arg, "gamorrean" ))
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "You can barely speak your own language!\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "common" ) &&
       ( ch->race == RACE_EWOK || ch->race == RACE_JAWA ))
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "You can not speak common, although you may be able to learn to understand it.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "twilek" ) && ch->race != RACE_TWI_LEK )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "To speak the Twi'lek language requires body parts that you don't have.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "binary" ) && !IsDroid(ch) )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "Only droids are able to speak binary.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "verpine" ) && ch->race != RACE_VERPINE )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "You need certain bodyparts you do not have to speak verpine.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "trandoshan" ) && ch->race != RACE_TRANDOSHAN )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "Only a fellow reptile can speak the trandoshan language.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "gamorrean" ) && ch->race != RACE_GAMORREAN )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "The gamorrean language can only be spoken by the pigs themselves!\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "ithorian" ) && ch->race != RACE_ITHORIAN )
    {
      set_char_color( AT_SAY, ch );
      send_to_char( "You can not replicate the sounds of the ithorian language.\r\n", ch );
      return;
    }

  for ( langs = 0; lang_array[langs] != LANG_UNKNOWN; langs++ )
    {
      if ( !StringPrefix( arg, lang_names[langs] ) )
	{
	  if ( knows_language( ch, lang_array[langs], ch ) )
	    {
	      if ( lang_array[langs] == LANG_CLAN &&
		   (IsNpc(ch) || !ch->pcdata->clan) )
		{
		  continue;
		}

	      ch->speaking = lang_array[langs];
	      set_char_color( AT_SAY, ch );
	      ch_printf( ch, "You now speak %s.\r\n", lang_names[langs] );
	      return;
	    }
	}
    }

  set_char_color( AT_SAY, ch );
  send_to_char( "You do not know that language.\r\n", ch );
}
