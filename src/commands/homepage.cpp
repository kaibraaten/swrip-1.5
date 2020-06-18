#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_homepage( std::shared_ptr<Character> ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(ch) )
    return;

  if ( argument.empty() )
    {
      ch->Echo("Your homepage is: %s\r\n", ch->PCData->HomePage.c_str() );
      return;
    }

  if ( !StrCmp( argument, "clear" ) )
    {
      ch->PCData->HomePage.erase();
      ch->Echo("Homepage cleared.\r\n");
      return;
    }

  if ( strstr( argument.c_str(), "://" ) )
    strcpy( buf, argument.c_str() );
  else
    sprintf( buf, "http://%s", argument.c_str() );

  if ( strlen(buf) > 70 )
    buf[70] = '\0';

  ch->PCData->HomePage = buf;
  ch->Echo("Homepage set.\r\n");
}


