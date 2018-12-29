/*
 * Copyright (c) 2008-2018 Kai Braaten
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

#ifndef _SWRIP_OS_WIN32_HPP_
#define _SWRIP_OS_WIN32_HPP_

#if defined(_WIN32)

#include <io.h>
#include <winsock2.h>
#include <windows.h>
#include <sys/types.h>
#include <sys/stat.h>

#ifdef _MSC_VER
using ssize_t = int;
#define strncasecmp strnicmp
#define strcasecmp stricmp
#endif

typedef SOCKET socket_t;

typedef int socklen_t;
#define GETERROR WSAGetLastError()
#undef EPIPE
#undef EINVAL
#define EPIPE WSAENOTCONN
#define EINVAL WSAEINVAL
#undef EINTR
#undef EMFILE
#define EINTR WSAEINTR
#define EMFILE WSAEMFILE 
using sockbuf_t = char;

// Telnet commands
#define IAC 255
#define WONT 252
#define WILL 251
#define GA 249

// Telnet options
#define TELOPT_ECHO 1

struct timezone
{
    int tz_minuteswest; /* minutes W of Greenwich */
    int tz_dsttime;     /* type of dst correction */
};

int gettimeofday(struct timeval*, struct timezone*);

#endif
#endif /* include guard */

