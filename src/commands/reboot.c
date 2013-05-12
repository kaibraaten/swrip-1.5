#include "mud.h"

extern bool mud_down;

void do_reboot( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *vch;
  SHIP_DATA *ship;

  if ( str_cmp( argument, "mud now" )
       &&   str_cmp( argument, "nosave" )
       &&   str_cmp( argument, "and sort skill table" ) )
    {
      send_to_char( "Syntax: 'reboot mud now' or 'reboot nosave'\r\n", ch );
      return;
    }

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Reboot by %s.", ch->name );
  do_echo( ch, buf );

  if ( !str_cmp(argument, "and sort skill table") )
    {
      sort_skill_table();
      save_skill_table();
    }

  /* Save all characters before booting. */
  if ( str_cmp(argument, "nosave") )
    for ( vch = first_char; vch; vch = vch->next )
      if ( !IS_NPC( vch ) )
        save_char_obj( vch );

  for ( ship = first_ship; ship; ship = ship->next )
    save_ship( ship );

  mud_down = TRUE;
}