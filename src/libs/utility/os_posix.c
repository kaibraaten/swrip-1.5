#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "os.h"

void OsSetup( void )
{

}

void OsCleanup( void )
{

}

int SetNonBlockingSocket( socket_t sock )
{
  return fcntl( sock, F_SETFL, O_NONBLOCK );
}
