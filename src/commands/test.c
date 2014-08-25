#include <string.h>
#include <stdlib.h>
#include <sys/utsname.h>

#include "mud.h"
#include "character.h"

void do_test( Character *ch, char *argument )
{
  struct utsname buf;

  if( uname(&buf) == 0 )
    {
      Echo( ch, "&Y%s-%s %s\r\n", buf.sysname, buf.machine, buf.release );
      Echo( ch, "&Ysysname  %s\r\n", buf.sysname );
      Echo( ch, "&Ynodename %s\r\n", buf.nodename );
      Echo( ch, "&Yrelease  %s\r\n", buf.release );
      Echo( ch, "&Yversion  %s\r\n", buf.version );
      Echo( ch, "&Ymachine  %s\r\n", buf.machine );
    }
  else
    {
      Echo( ch, "&RSomething didn't go right.&w\r\n" );
    }
}
