#include <thread>
#include <condition_variable>
#include <mutex>
#include <imp/runtime/functionvalue.hpp>
#include <imp/runtime/floatvalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/utility.hpp>
#include "experimentallibrary.hpp"

class ThreadDataValue : public Imp::RuntimeValue
{
public:
    ThreadDataValue(std::condition_variable &scriptDone, std::condition_variable &wakeUp)
        : ScriptDone(scriptDone),
        WakeUp(wakeUp)
    {

    }

    std::string TypeName()
    {
        return "threaddata";
    }

    std::string ShowInfo()
    {
        return TypeName();
    }

    double WaitDuration = 0;
    bool YesReallyDone = false;
    bool YesReallyWakeUp = false;
    std::condition_variable &ScriptDone;
    std::condition_variable &WakeUp;
};

/////////////////////////////////////////////////////////////
struct ScriptRunner::Impl
{
    Impl(std::shared_ptr<Imp::Program> prog, std::shared_ptr<Imp::RuntimeScope> scope);
    double Resume();
    void DispatchScript();
    std::shared_ptr<Imp::Program> Prog;
    std::shared_ptr<Imp::RuntimeScope> Scope;
    bool scriptWaiting = false;
    std::condition_variable ScriptDone;
    std::condition_variable WakeUp;
    std::shared_ptr<ThreadDataValue> ThreadData;
    std::shared_ptr<std::thread> TheThread;
};

ScriptRunner::Impl::Impl(std::shared_ptr<Imp::Program> prog, std::shared_ptr<Imp::RuntimeScope> scope)
    : Prog(prog),
    Scope(scope)
{

}

double ScriptRunner::Impl::Resume()
{
    double waitDuration = 0;

    if(!scriptWaiting)
    {
        ThreadData = std::make_shared<ThreadDataValue>(ScriptDone, WakeUp);
        Scope->Assign("_THREADDATA_", ThreadData);
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

void ScriptRunner::Impl::DispatchScript()
{
    Prog->Eval(Scope);
    scriptWaiting = false;
    ThreadData->YesReallyDone = true;
    ThreadData->WaitDuration = 0;
    ScriptDone.notify_one();
}

////////////////////////////////////////////////////////////////////////////
ScriptRunner::ScriptRunner(std::shared_ptr<Imp::Program> prog, std::shared_ptr<Imp::RuntimeScope> scope)
    : pImpl(std::make_unique<Impl>(prog, scope))
{

}

ScriptRunner::~ScriptRunner()
{

}

double ScriptRunner::Resume()
{
    return pImpl->Resume();
}

////////////////////////////////////////////////////////////////////////////
class WaitFunc : public Imp::FunctionValue
{
public:
    WaitFunc()
        : Imp::FunctionValue("wait")
    {

    }

    std::shared_ptr<Imp::RuntimeValue> EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams,
                                                    const Imp::ImpSyntax *where,
                                                    std::shared_ptr<Imp::RuntimeScope> curScope) override
    {
        Imp::CheckNumParams(actualParams, 1, "isnpc", where);
        auto ptrToWaitDuration = actualParams[0];


        if(dynamic_cast<Imp::FloatValue *>(ptrToWaitDuration.get()))
        {
            auto duration = std::dynamic_pointer_cast<Imp::FloatValue>(ptrToWaitDuration)->GetFloatValue("wait() param", where);

            if(duration > 0)
            {
                auto threadData = std::dynamic_pointer_cast<ThreadDataValue>(curScope->Find("_THREADDATA_", where));
                threadData->WaitDuration = duration;
                threadData->YesReallyDone = true;
                threadData->ScriptDone.notify_one();
                std::mutex mtx;
                std::unique_lock lk(mtx);
                threadData->WakeUp.wait(lk, [&]
                                        {
                                            return threadData->YesReallyWakeUp;
                                        });
                threadData->YesReallyWakeUp = false;
            }
            else
            {
                Imp::RuntimeValue::RuntimeError("1st param in wait() must be positive.", where);
            }
        }
        else
        {
            Imp::RuntimeValue::RuntimeError("Type error in wait().", where);
        }

        return std::make_shared<Imp::NoneValue>();
    }
};

////////////////////////////////////////////////////////////////////////////
ExperimentalLibrary::ExperimentalLibrary(std::shared_ptr<Imp::RuntimeScope> outer)
    : Imp::RuntimeScope(outer)
{
    Assign("wait", std::make_shared<WaitFunc>());
}