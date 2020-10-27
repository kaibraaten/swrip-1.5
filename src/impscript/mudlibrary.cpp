#include <imp/runtime/nonevalue.hpp>
#include "impscript/mudlibrary.hpp"
#include "impscript/characters_func.hpp"
#include "impscript/echo_func.hpp"
#include "impscript/echoaround_func.hpp"
#include "impscript/exit_func.hpp"
#include "impscript/inroom_func.hpp"
#include "impscript/isnpc_func.hpp"
#include "impscript/objects_func.hpp"
#include "impscript/random_func.hpp"
#include "impscript/say_func.hpp"
#include "impscript/vnum_func.hpp"
#include "impscript/wait_func.hpp"

MudLibrary::MudLibrary(std::shared_ptr<Imp::RuntimeScope> outer)
    : Imp::RuntimeScope(outer)
{
    Assign("characters", std::make_shared<CharactersFunc>());
    Assign("echo", std::make_shared<EchoFunc>());
    Assign("echoaround", std::make_shared<EchoAroundFunc>());
    Assign("exit", std::make_shared<ExitFunc>()); // Override default
    Assign("inroom", std::make_shared<InRoomFunc>());
    Assign("isnpc", std::make_shared<IsNpcFunc>());
    Assign("objects", std::make_shared<ObjectsFunc>());
    Assign("random", std::make_shared<RandomFunc>());
    Assign("say", std::make_shared<SayFunc>());
    Assign("vnum", std::make_shared<VnumFunc>());
    Assign("wait", std::make_shared<WaitFunc>());
    
    // Override functions we don't want in the standard library:
    Assign("print", std::make_shared<Imp::NoneValue>());
    Assign("input", std::make_shared<Imp::NoneValue>());
}
