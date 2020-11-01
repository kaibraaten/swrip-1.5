#include <imp/utility.hpp>
#include <imp/runtime/floatvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/runtimescope.hpp>
#include "impscript/funcs/wait_func.hpp"
#include "impscript/threaddatavalue.hpp"

WaitFunc::WaitFunc()
    : Imp::FunctionValue("wait")
{

}

std::shared_ptr<Imp::RuntimeValue> WaitFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams,
                                                const Imp::ImpSyntax *where,
                                                std::shared_ptr<Imp::RuntimeScope> curScope)
{
    Imp::CheckNumParams(actualParams, 1, "wait", where);
    auto ptrToWaitDuration = actualParams[0];


    if(dynamic_cast<Imp::FloatValue *>(ptrToWaitDuration.get()))
    {
        auto duration = std::dynamic_pointer_cast<Imp::FloatValue>(ptrToWaitDuration)->GetFloatValue("wait() param", where);

        if(duration > 0)
        {
            auto threadData = std::dynamic_pointer_cast<ThreadDataValue>(curScope->Find("__threaddata__", where));
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
