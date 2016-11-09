/*
 * Copyright (c) 2008-2010 Kai Braaten
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#ifndef _SWRIP_OS_WIN32_H_
#define _SWRIP_OS_WIN32_H_

#include <io.h>
#include <winsock2.h>
#include <windows.h>
#include <sys/types.h>
#include <sys/stat.h>

#ifdef _MSC_VER
typedef int ssize_t;
#define snprintf _snprintf
#define strncasecmp strnicmp
#define strcasecmp stricmp
#endif

typedef SOCKET socket_t;

typedef int socklen_t;
#define GETERROR WSAGetLastError()
#define EWOULDBLOCK WSAEWOULDBLOCK
#define EADDRINUSE WSAEADDRINUSE
#define ETIMEDOUT WSAETIMEDOUT
#define ECONNRESET WSAECONNRESET
#define EMSGSIZE WSAEMSGSIZE
#define EHOSTUNREACH WSAEHOSTUNREACH
#define ENETUNREACH WSAENETRESET
#undef EPIPE
#undef EINVAL
#define EPIPE WSAENOTCONN
#define EINVAL WSAEINVAL
#define ECONNREFUSED WSAECONNABORTED
#undef EINTR
#undef EMFILE
#define EINTR WSAEINTR
#define EMFILE WSAEMFILE 
#define EINPROGRESS WSAEINPROGRESS
typedef char sockbuf_t;

struct timezone 
{
  int  tz_minuteswest; /* minutes W of Greenwich */
  int  tz_dsttime;     /* type of dst correction */
};

int gettimeofday( struct timeval*, struct timezone* );

#endif /* include guard */

