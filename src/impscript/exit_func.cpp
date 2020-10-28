#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include "impscript/exit_func.hpp"
#include "impscript/exitexception.hpp"

ExitFunc::ExitFunc()
    : Imp::FunctionValue("exit")
{

}

std::shared_ptr<Imp::RuntimeValue> ExitFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    throw ImpExitException();
    return std::make_shared<Imp::NoneValue>();
}
