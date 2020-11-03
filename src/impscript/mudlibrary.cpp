#include <imp/runtime/nonevalue.hpp>
#include "impscript/mudlibrary.hpp"
#include "impscript/funcs/characters_func.hpp"
#include "impscript/funcs/count_func.hpp"
#include "impscript/funcs/echo_func.hpp"
#include "impscript/funcs/echoaround_func.hpp"
#include "impscript/funcs/equip_func.hpp"
#include "impscript/funcs/equipped_func.hpp"
#include "impscript/funcs/exit_func.hpp"
#include "impscript/funcs/getroom_func.hpp"
#include "impscript/funcs/inroom_func.hpp"
#include "impscript/funcs/interpret_func.hpp"
#include "impscript/funcs/isfighting_func.hpp"
#include "impscript/funcs/isjedi_func.hpp"
#include "impscript/funcs/isnpc_func.hpp"
#include "impscript/funcs/level_func.hpp"
#include "impscript/funcs/objects_func.hpp"
#include "impscript/funcs/objtype_func.hpp"
#include "impscript/funcs/random_func.hpp"
#include "impscript/funcs/say_func.hpp"
#include "impscript/funcs/skill_func.hpp"
#include "impscript/funcs/spawnobj_func.hpp"
#include "impscript/funcs/transfer_func.hpp"
#include "impscript/funcs/vnum_func.hpp"
#include "impscript/funcs/wait_func.hpp"

MudLibrary::MudLibrary(std::shared_ptr<Imp::RuntimeScope> outer)
    : Imp::RuntimeScope(outer)
{
    Assign("characters", std::make_shared<CharactersFunc>());
    Assign("count", std::make_shared<CountFunc>());
    Assign("echo", std::make_shared<EchoFunc>());
    Assign("echoaround", std::make_shared<EchoAroundFunc>());
    Assign("equip", std::make_shared<EquipFunc>());
    Assign("equipped", std::make_shared<EquippedFunc>());
    Assign("exit", std::make_shared<ExitFunc>()); // Override default
    Assign("getroom", std::make_shared<GetRoomFunc>());
    Assign("inroom", std::make_shared<InRoomFunc>());
    Assign("interpret", std::make_shared<InterpretFunc>());
    Assign("isfighting", std::make_shared<IsFightingFunc>());
    Assign("isjedi", std::make_shared<IsJediFunc>());
    Assign("isnpc", std::make_shared<IsNpcFunc>());
    Assign("level", std::make_shared<LevelFunc>());
    Assign("objects", std::make_shared<ObjectsFunc>());
    Assign("objtype", std::make_shared<ObjTypeFunc>());
    Assign("random", std::make_shared<RandomFunc>());
    Assign("say", std::make_shared<SayFunc>());
    Assign("skill", std::make_shared<SkillFunc>());
    Assign("spawnobj", std::make_shared<SpawnObjFunc>());
    Assign("transfer", std::make_shared<TransferFunc>());
    Assign("vnum", std::make_shared<VnumFunc>());
    Assign("wait", std::make_shared<WaitFunc>());
    
    // Override functions we don't want in the standard library:
    Assign("print", std::make_shared<Imp::NoneValue>());
    Assign("input", std::make_shared<Imp::NoneValue>());
}
