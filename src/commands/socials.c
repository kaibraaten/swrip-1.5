#include "mud.h"

void do_socials( Character *ch, char *argument )
{
  int iHash;
  int col = 0;
  Social *social;

  SetPagerColor( AT_PLAIN, ch );
  for ( iHash = 0; iHash < 27; iHash++ )
    for ( social = social_index[iHash]; social; social = social->next )
      {
        PagerPrintf( ch, "%-12s", social->name );
        if ( ++col % 6 == 0 )
          SendToPager( "\r\n", ch );
      }

  if ( col % 6 != 0 )
    SendToPager( "\r\n", ch );
}
