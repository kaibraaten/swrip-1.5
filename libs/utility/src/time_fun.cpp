#include "os.hpp"
#include <ctime>
#include <cassert>

#ifndef _WIN32
#include <sys/time.h>
#endif

#include "utility.hpp"

tm *UpdateTime(tm *old_time)
{
    const time_t t = mktime(old_time);
    return localtime(&t);
}

void SubtractTimes(timeval *etime, const timeval *start_time)
{
    etime->tv_sec -= start_time->tv_sec;
    etime->tv_usec -= start_time->tv_usec;

    while (etime->tv_usec < 0)
    {
        etime->tv_usec += 1000000;
        etime->tv_sec--;
    }
}

void StartTimer(timeval *start_time)
{
    assert(start_time != nullptr);
    gettimeofday(start_time, nullptr);
}

time_t StopTimer(timeval *start_time)
{
    timeval etime{};

    /* Mark etime before checking start_time, so that we get a better reading. */
    gettimeofday(&etime, nullptr);

    if (!start_time || (!start_time->tv_sec && !start_time->tv_usec))
    {
        assert(false);
        return 0;
    }

    SubtractTimes(&etime, start_time);

    /* start_time becomes time used */
    *start_time = etime;
    return (etime.tv_sec * 1000000) + etime.tv_usec;
}
