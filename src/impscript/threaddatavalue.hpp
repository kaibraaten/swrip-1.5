#ifndef _SWRIP_IMPSCRIPT_THREADDATAVALUE_HPP_
#define _SWRIP_IMPSCRIPT_THREADDATAVALUE_HPP_

#include <condition_variable>
#include <imp/runtime/runtimevalue.hpp>

class ThreadDataValue : public Imp::RuntimeValue
{
public:
    ThreadDataValue(std::condition_variable &scriptDone, std::condition_variable &wakeUp);
    std::string TypeName();
    std::string ShowInfo();

    double WaitDuration = 0;
    bool YesReallyDone = false;
    bool YesReallyWakeUp = false;
    std::condition_variable &ScriptDone;
    std::condition_variable &WakeUp;
    bool Abort = false;
};

#endif
