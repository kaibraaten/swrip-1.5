#include "mud.hpp"
#include "social.hpp"

void do_socials( Character *ch, char *argument )
{
  int col = 0;

  SetPagerColor( AT_PLAIN, ch );

  for(const Social *social : Socials->Entities())
    {
      PagerPrintf( ch, "%-12s", social->Name );
      
      if ( ++col % 6 == 0 )
        {
          SendToPager( "\r\n", ch );
        }
    }

  if ( col % 6 != 0 )
    {
      SendToPager( "\r\n", ch );
    }
}
