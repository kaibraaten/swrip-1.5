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
#ifndef _SWR2_OS_AMIGA_H_
#define _SWR2_OS_AMIGA_H_

#if defined __cplusplus
extern "C" {
#endif

#include <sys/errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <proto/socket.h>

typedef long socklen_t;
typedef long SOCKET;
typedef long ssize_t;

#define INVALID_SOCKET -1
#define SOCKET_ERROR -1
#define closesocket CloseSocket
#define GETERROR Errno()
#define MSG_NOSIGNAL 0

#define __FUNCTION__ __FUNC__
typedef const STRPTR CONST_STRPTR;

#define strcasecmp strcmp
#define strncasecmp( a, b, len ) strcasecmp((a), (b))

#if defined __cplusplus
}
#endif

#endif /* include guard */

