#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/impobject.hpp"
#include "impscript/funcs/vnum_func.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "room.hpp"

VnumFunc::VnumFunc()
    : Imp::FunctionValue("vnum")
{

}

std::shared_ptr<Imp::RuntimeValue> VnumFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "vnum", where);
    auto entity = actualParams[0];
    vnum_t vnum = INVALID_VNUM;
    
    if((dynamic_cast<ImpCharacter*>(entity.get())))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(entity);

        if(IsNpc(ch->Entity(where)))
        {
            vnum = ch->Entity(where)->Prototype->Vnum;
        }
        else
        {
            return std::make_shared<Imp::NoneValue>();
        }
    }
    else if((dynamic_cast<ImpRoom*>(entity.get())))
    {
        auto room = std::dynamic_pointer_cast<ImpRoom>(entity);
        vnum = room->Entity(where)->Vnum;
    }
    else if((dynamic_cast<ImpObject*>(entity.get())))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(entity);
        vnum = obj->Entity(where)->Prototype->Vnum;
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in vnum() param 1.", where);
    }
    
    return std::make_shared<Imp::IntValue>(vnum);
}
