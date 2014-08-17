#include "character.h"
#include "mud.h"

void do_gtell( Character *ch, char *argument )
{
  Character *gch;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Tell your group what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->act, PLR_NO_TELL ) )
    {
      send_to_char( "Your message didn't get through!\r\n", ch );
      return;
    }

  /*
   * Note use of send_to_char, so gtell works on sleepers.
   */
  /*    sprintf( buf, "%s tells the group '%s'.\r\n", ch->name, argument );*/
  for ( gch = first_char; gch; gch = gch->next )
    {
      if ( is_same_group( gch, ch ) )
        {
	  set_char_color( AT_GTELL, gch );
          /* Groups unscrambled regardless of clan language.  Other languages
             still garble though. -- Altrag */
          if ( knows_language( gch, ch->speaking, gch )
               ||  (IsNpc(ch) && !ch->speaking) )
            ch_printf( gch, "%s tells the group '%s'.\r\n", ch->name, argument );
          else
            ch_printf( gch, "%s tells the group '%s'.\r\n", ch->name, scramble(argument, ch->speaking) );
        }
    }
}
