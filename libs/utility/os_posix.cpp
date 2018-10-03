#include <cstdio>
#include <cstdlib>
#include <cerrno>
#include <cstring>
#include "os.hpp"

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
