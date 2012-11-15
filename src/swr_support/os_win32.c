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

#include <stdio.h>
#include <time.h>
#include "os.h"

extern FILE *out_stream;

static const char *get_next_filename( const char *directory )
{
  static char buf[256];
  int high_num = 1000;
  WIN32_FIND_DATA info;
  HANDLE h;

  snprintf( buf, 256, "%s*.*", directory );
  h = FindFirstFile( buf, &info );

  if( h != INVALID_HANDLE_VALUE )
  {
    do
    {
      if( info.cFileName[0] != '.' )
      {
	int curr = strtol( info.cFileName, 0, 10 );
	high_num = curr > high_num ? curr : high_num;
      }
    }
    while( FindNextFile( h, &info ) );

    FindClose( h );
  }

  ++high_num;
  snprintf( buf, 256, "%s%d.log", directory, high_num );
  return buf;
}

FILE *open_log_file(void)
{
	fopen( get_next_filename( "log/" ), "w" );
}

void os_setup( void )
{
  WSADATA wsaData;
  out_stream = open_log_file();

  if( WSAStartup( MAKEWORD( 2, 2 ), &wsaData ) != 0 )
  {
    fprintf( out_stream, "%s (%s:%d) - WSAStartup failed.\n",
	__FUNCTION__, __FILE__, __LINE__ );
    exit( 1 );
  }
}

void os_cleanup( void )
{
  WSACleanup();

  if( out_stream )
  {
    fclose( out_stream );
    out_stream = 0;
  }
}

// gettimeofday for Windows
// http://www.openasthra.com/c-tidbits/gettimeofday-function-for-windows/
#if defined(_MSC_VER) || defined(_MSC_EXTENSIONS)
#define DELTA_EPOCH_IN_MICROSECS  11644473600000000Ui64
#else
#define DELTA_EPOCH_IN_MICROSECS  11644473600000000ULL
#endif

int gettimeofday( struct timeval *tv, struct timezone *tz )
{
  FILETIME ft;
  unsigned __int64 tmpres = 0;
  static int tzflag = 0;

  if( NULL != tv )
  {
    GetSystemTimeAsFileTime( &ft );

    tmpres |= ft.dwHighDateTime;
    tmpres <<= 32;
    tmpres |= ft.dwLowDateTime;

    /*converting file time to unix epoch*/
    tmpres /= 10;  /*convert into microseconds*/
    tmpres -= DELTA_EPOCH_IN_MICROSECS; 
    tv->tv_sec = (long)(tmpres / 1000000UL);
    tv->tv_usec = (long)(tmpres % 1000000UL);
  }

  if( NULL != tz )
  {
    if( !tzflag )
    {
      _tzset();
      tzflag++;
    }

    tz->tz_minuteswest = _timezone / 60;
    tz->tz_dsttime = _daylight;
  }

  return 0;
}

int set_nonblocking( SOCKET sock )
{
  unsigned long optval = 1;
  return ioctlsocket( sock, FIONBIO, &optval );
}
