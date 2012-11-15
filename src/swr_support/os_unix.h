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

#ifndef _SWR2_OS_UNIX_H_
#define _SWR2_OS_UNIX_H_

#include <netinet/in.h>

#ifdef __sun__

#else
#include <sys/cdefs.h>
#endif

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <fcntl.h>
#include <signal.h>
#include <unistd.h>
/*#include <arpa/telnet.h>*/

#ifdef SWRIP_USE_DLSYM
#include <dlfcn.h>
#endif

#include <dirent.h>

static const int INVALID_SOCKET = -1;
static const int SOCKET_ERROR = -1;
#define GETERROR errno
#define closesocket close
typedef int socket_t;
typedef char sockbuf_t;

#endif /* include guard */

