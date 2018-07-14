#include "mud.hpp"
#include "social.hpp"

void do_socials( Character *ch, char *argument )
{
  int iHash = 0;
  int col = 0;

  SetPagerColor( AT_PLAIN, ch );

  for ( iHash = 0; iHash < 27; iHash++ )
    {
      const Social *social = NULL;

      for ( social = SocialTable[iHash]; social; social = social->Next )
	{
	  PagerPrintf( ch, "%-12s", social->Name );

	  if ( ++col % 6 == 0 )
	    SendToPager( "\r\n", ch );
	}
    }

  if ( col % 6 != 0 )
    SendToPager( "\r\n", ch );
}
