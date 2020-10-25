#include <imp/runtime/nonevalue.hpp>
#include "impscript/mudlibrary.hpp"
#include "impscript/characters_func.hpp"
#include "impscript/echo_func.hpp"
#include "impscript/isnpc_func.hpp"
#include "impscript/objects_func.hpp"
#include "impscript/vnum_func.hpp"

MudLibrary::MudLibrary(std::shared_ptr<Imp::RuntimeScope> outer)
    : Imp::RuntimeScope(outer)
{
    Assign("characters", std::make_shared<CharactersFunc>());
    Assign("echo", std::make_shared<EchoFunc>());
    Assign("isnpc", std::make_shared<IsNpcFunc>());
    Assign("objects", std::make_shared<ObjectsFunc>());
    Assign("vnum", std::make_shared<VnumFunc>());
    
    // Override functions we don't want in the standard library:
    Assign("print", std::make_shared<Imp::NoneValue>());
    Assign("input", std::make_shared<Imp::NoneValue>());
    Assign("exit", std::make_shared<Imp::NoneValue>());
}
