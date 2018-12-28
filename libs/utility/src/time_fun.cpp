#include "os.hpp"
#include <ctime>
#include <cassert>

#ifndef _WIN32
#include <sys/time.h>
#endif

#include "utility.hpp"

struct tm *UpdateTime( struct tm *old_time )
{
  time_t t = mktime(old_time);
  return localtime(&t);
}

void SubtractTimes(struct timeval *etime, struct timeval *start_time)
{
  etime->tv_sec -= start_time->tv_sec;
  etime->tv_usec -= start_time->tv_usec;

  while ( etime->tv_usec < 0 )
  {
    etime->tv_usec += 1000000;
    etime->tv_sec--;
  }
}

void StartTimer(struct timeval *start_time)
{
  assert(start_time != nullptr);
  gettimeofday(start_time, NULL);
}

time_t StopTimer(struct timeval *start_time)
{
  struct timeval etime;

  /* Mark etime before checking start_time, so that we get a better reading. */
  gettimeofday(&etime, NULL);

  if ( !start_time || (!start_time->tv_sec && !start_time->tv_usec) )
  {
    assert(false);
    return 0;
  }

  SubtractTimes(&etime, start_time);

  /* start_time becomes time used */
  *start_time = etime;
  return (etime.tv_sec*1000000)+etime.tv_usec;
}