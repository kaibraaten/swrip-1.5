#include <imp/utility.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/funcs/spawnobj_func.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "protoobject.hpp"

SpawnObjFunc::SpawnObjFunc()
    : Imp::FunctionValue("spawnobj")
{

}

std::shared_ptr<Imp::RuntimeValue> SpawnObjFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    auto arg1 = actualParams[0];
    std::shared_ptr<Object> obj;
    std::shared_ptr<ProtoObject> protoobj;
    int timer = 0;
    
    if(dynamic_cast<Imp::IntValue*>(arg1.get()))
    {
        vnum_t vnum = arg1->GetIntValue("spawnobj param 1", where);
        protoobj = GetProtoObject(vnum);
    }
    else if(dynamic_cast<Imp::StringValue*>(arg1.get()))
    {
        std::string tag = arg1->GetStringValue("spawnobj param 1", where);
        protoobj = GetProtoObject(tag);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in spawnobj() param 1.", where);
    }

    if(protoobj == nullptr)
    {
        Imp::RuntimeValue::RuntimeError("Nonexistant vnum in spawnobj() param 1", where);
    }
    
    if(actualParams.size() > 1)
    {
        Imp::CheckNumParams(actualParams, 2, "spawnobj", where);
        
        if(dynamic_cast<Imp::IntValue*>(actualParams[1].get()))
        {
            timer = std::dynamic_pointer_cast<Imp::IntValue>(actualParams[1])->GetIntValue("spawnobj param 2", where);

            if(timer < 0)
            {
                Imp::RuntimeValue::RuntimeError("Timer value in spawnobj() param 2 must be >= 0.", where);
            }
        }
        else
        {
            Imp::RuntimeValue::RuntimeError("Type error in spawnobj() param 2.", where);
        }
    }

    obj = CreateObject(protoobj, 100);
    obj->Timer = timer;
    ObjectToRoom(obj, GetRoom(ROOM_VNUM_SPAWNLOCATION));
    return std::make_shared<ImpObject>(obj);
}
