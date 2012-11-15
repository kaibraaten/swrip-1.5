#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "os.h"

void os_setup( void )
{

}

void os_cleanup( void )
{

}

int set_nonblocking( socket_t sock )
{
  return fcntl( sock, F_SETFL, O_NONBLOCK );
}
