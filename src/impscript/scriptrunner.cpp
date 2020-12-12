#include <thread>
#include <condition_variable>
#include <mutex>
#include <imp/except/impexception.hpp>
#include "scriptrunner.hpp"
#include "threaddatavalue.hpp"
#include "exitexception.hpp"
#include "log.hpp"

struct ScriptRunner::Impl
{
    Impl(std::shared_ptr<Imp::Program> prog,
         std::shared_ptr<Imp::RuntimeScope> scope,
         std::function<void(std::shared_ptr<Imp::Program>, std::shared_ptr<Imp::RuntimeScope>)> doAfterEval);
    double Resume();
    void Abort();
    void DispatchScript();
    std::shared_ptr<Imp::Program> Prog;
    std::shared_ptr<Imp::RuntimeScope> Scope;
    bool scriptWaiting = false;
    std::condition_variable ScriptDone;
    std::condition_variable WakeUp;
    std::shared_ptr<ThreadDataValue> ThreadData;
    std::shared_ptr<std::thread> TheThread;
    std::function<void(std::shared_ptr<Imp::Program>, std::shared_ptr<Imp::RuntimeScope>)> DoAfterEval;
};

ScriptRunner::Impl::Impl(std::shared_ptr<Imp::Program> prog,
                         std::shared_ptr<Imp::RuntimeScope> scope,
                         std::function<void(std::shared_ptr<Imp::Program>, std::shared_ptr<Imp::RuntimeScope>)> doAfterEval)
    : Prog(prog),
    Scope(scope),
    DoAfterEval(doAfterEval)
{

}

double ScriptRunner::Impl::Resume()
{
    double waitDuration = 0;

    if(!scriptWaiting)
    {
        ThreadData = std::make_shared<ThreadDataValue>(ScriptDone, WakeUp);
        Scope->Assign("__threaddata__", ThreadData);
        TheThread = std::make_shared<std::thread>(&ScriptRunner::Impl::DispatchScript, this);
    }
    else
    {
        scriptWaiting = false;
        ThreadData->YesReallyWakeUp = true;
        ThreadData->WakeUp.notify_one();
    }

    std::mutex mtx;
    std::unique_lock lk(mtx);
    ScriptDone.wait(lk, [&]
                    {
                        return ThreadData->YesReallyDone;
                    });
    ThreadData->YesReallyDone = false;
    waitDuration = ThreadData->WaitDuration;
    ThreadData->WaitDuration = 0;

    if(waitDuration > 0)
    {
        scriptWaiting = true;
    }
    else
    {
        TheThread->join();
    }

    return waitDuration;
}

void ScriptRunner::Impl::Abort()
{
    scriptWaiting = false;
    ThreadData->YesReallyWakeUp = true;
    ThreadData->Abort = true;
    ThreadData->WakeUp.notify_one();
    std::mutex mtx;
    std::unique_lock lk(mtx);
    ScriptDone.wait(lk, [&]
                    {
                        return ThreadData->YesReallyDone;
                    });
    TheThread->join();
}

void ScriptRunner::Impl::DispatchScript()
{
    try
    {
        Prog->Eval(Scope);
        DoAfterEval(Prog, Scope);
    }
    catch(const Imp::ImpException &ex)
    {
        Log->Bug("%s", ex.what());
    }
    catch(const ImpExitException &ex)
    {
        // Script aborted normally with exit() function,
        // so do nothing special.
    }

    scriptWaiting = false;
    ThreadData->YesReallyDone = true;
    ThreadData->WaitDuration = 0;
    ScriptDone.notify_one();
}

////////////////////////////////////////////////////////////////////////////
ScriptRunner::ScriptRunner(std::shared_ptr<Imp::Program> prog,
                           std::shared_ptr<Imp::RuntimeScope> scope,
                           std::function<void(std::shared_ptr<Imp::Program>, std::shared_ptr<Imp::RuntimeScope>)> doAfterEval)
    : pImpl(std::make_unique<Impl>(prog, scope, doAfterEval))
{

}

ScriptRunner::~ScriptRunner()
{

}

double ScriptRunner::Resume()
{
    return pImpl->Resume();
}

void ScriptRunner::Abort()
{
    pImpl->Abort();
}
