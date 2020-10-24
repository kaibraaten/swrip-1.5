#include <imp/runtime/nonevalue.hpp>
#include "impscript/mudlibrary.hpp"
#include "impscript/echo_func.hpp"
#include "impscript/isnpc_func.hpp"

MudLibrary::MudLibrary(std::shared_ptr<Imp::RuntimeScope> outer)
    : Imp::RuntimeScope(outer)
{
    Assign("echo", std::make_shared<EchoFunc>());
    Assign("isnpc", std::make_shared<IsNpcFunc>());
    
    // Override functions we don't want in the standard library:
    Assign("print", std::make_shared<Imp::NoneValue>());
    Assign("input", std::make_shared<Imp::NoneValue>());
    Assign("exit", std::make_shared<Imp::NoneValue>());
}
