#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/funcs/spawnmob_func.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"

SpawnMobFunc::SpawnMobFunc()
        : Imp::FunctionValue("spawnmob")
{

}

std::shared_ptr<Imp::RuntimeValue> SpawnMobFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    auto arg1 = actualParams[0];
    std::shared_ptr<Character> mob;
    std::shared_ptr<ProtoMobile> protomob;

    if(dynamic_cast<Imp::IntValue*>(arg1.get()))
    {
        vnum_t vnum = arg1->GetIntValue("spawnmob param 1", where);
        protomob = GetProtoMobile(vnum);
    }
    else if(dynamic_cast<Imp::StringValue*>(arg1.get()))
    {
        std::string tag = arg1->GetStringValue("spawnmob param 1", where);
        protomob = GetProtoMobile(tag);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in spawnmob() param 1.", where);
    }

    if(protomob == nullptr)
    {
        Imp::RuntimeValue::RuntimeError("Nonexistant vnum in spawnmob() param 1", where);
    }

    mob = CreateMobile(protomob);
    CharacterToRoom(mob, GetRoom(ROOM_VNUM_SPAWNLOCATION));
    return std::make_shared<ImpCharacter>(mob);
}
