#ifndef _WIN32
#include "os.hpp"

void OsSetup()
{

}

void OsCleanup()
{

}

int SetNonBlockingSocket(socket_t sock)
{
    return fcntl(sock, F_SETFL, O_NONBLOCK);
}
#endif
