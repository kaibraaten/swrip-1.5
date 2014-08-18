#include "mud.h"

void do_socials( Character *ch, char *argument )
{
  int iHash;
  int col = 0;
  Social *social;

  set_pager_color( AT_PLAIN, ch );
  for ( iHash = 0; iHash < 27; iHash++ )
    for ( social = social_index[iHash]; social; social = social->next )
      {
        pager_printf( ch, "%-12s", social->name );
        if ( ++col % 6 == 0 )
          send_to_pager( "\r\n", ch );
      }

  if ( col % 6 != 0 )
    send_to_pager( "\r\n", ch );
}
