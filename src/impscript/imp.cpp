#include <imp/except/impexception.hpp>
#include <imp/runtime/functionvalue.hpp>
#include <imp/runtime/standardlibrary.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/scanner/scanner.hpp>
#include <imp/runtime/listvalue.hpp>
#include "impscript/imp.hpp"
#include "impscript/mudlibrary.hpp"
#include "impscript/scriptrunner.hpp"
#include "impscript/scriptscheduler.hpp"
#include "log.hpp"

std::shared_ptr<Imp::RuntimeScope> MakeImpScope()
{
    auto standardLib = std::make_shared<Imp::StandardLibrary>();
    auto mudLib = std::make_shared<MudLibrary>(standardLib);
    auto globalScope = std::make_shared<Imp::RuntimeScope>(mudLib);
    std::deque<std::shared_ptr<Imp::RuntimeValue>> paths
        {
            std::make_shared<Imp::StringValue>("data/scripts"),
            std::make_shared<Imp::StringValue>("data/plugins")
        };
    globalScope->Assign("__scriptpath__", std::make_shared<Imp::ListValue>(paths));
    return globalScope;
}

std::shared_ptr<Imp::Program> ParseImpProgram(const std::string &scriptname,
                                              const std::vector<std::string> &code)
{
    auto scanner = std::make_shared<Imp::Scanner>(scriptname, code);
    auto prog = Imp::Program::Parse(scanner);

    return prog;
}

void DispatchImpFunction(const std::string &funcName,
                         const std::vector<std::shared_ptr<Imp::RuntimeValue>> params,
                         const std::vector<std::string> &code,
                         const std::string &scriptname)
{
    try
    {
        auto globalScope = MakeImpScope();
        auto prog = ParseImpProgram(scriptname, code);

        auto doAfterEval = [funcName, params](std::shared_ptr<Imp::Program> program,
                                              std::shared_ptr<Imp::RuntimeScope> scope)
                           {
                               auto func = scope->Find(funcName, program.get());

                               if(dynamic_cast<Imp::FunctionValue *>(func.get()) != nullptr)
                               {
                                   auto callback = std::dynamic_pointer_cast<Imp::FunctionValue>(func);
                                   callback->EvalFuncCall(params, program.get());
                               }
                               else
                               {
                                   Imp::RuntimeValue::RuntimeError(funcName + " isn't a function!",
                                                                   program.get());
                               }
                           };

        auto scriptRunner = std::make_shared<ScriptRunner>(prog, globalScope, doAfterEval);
        Schedule(scriptRunner);
    }
    catch(const Imp::ImpException &ex)
    {
        Log->Bug("%s", ex.what());
    }
}
