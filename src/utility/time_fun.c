#include "os.h"
#include <time.h>

#ifndef _WIN32
#include <sys/time.h>
#endif

#include "swr_support.h"

#ifdef __cplusplus
extern "C" {
#endif
void bug( const char *str, ... );
#ifdef __cplusplus
}
#endif

struct tm *update_time( struct tm *old_time )
{
  time_t t = mktime(old_time);
  return localtime(&t);
}

void subtract_times(struct timeval *etime, struct timeval *start_time)
{
  etime->tv_sec -= start_time->tv_sec;
  etime->tv_usec -= start_time->tv_usec;

  while ( etime->tv_usec < 0 )
  {
    etime->tv_usec += 1000000;
    etime->tv_sec--;
  }
}

void start_timer(struct timeval *start_time)
{
  if ( !start_time )
  {
    bug( "Start_timer: NULL start_time.", 0 );
    return;
  }

  gettimeofday(start_time, NULL);
}

time_t end_timer(struct timeval *start_time)
{
  struct timeval etime;

  /* Mark etime before checking start_time, so that we get a better reading. */
  gettimeofday(&etime, NULL);

  if ( !start_time || (!start_time->tv_sec && !start_time->tv_usec) )
  {
    bug( "End_timer: bad start_time.", 0 );
    return 0;
  }

  subtract_times(&etime, start_time);

  /* start_time becomes time used */
  *start_time = etime;
  return (etime.tv_sec*1000000)+etime.tv_usec;
}
