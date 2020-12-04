#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/improom.hpp"
#include "impscript/funcs/getroom_func.hpp"
#include "mud.hpp"
#include "room.hpp"

GetRoomFunc::GetRoomFunc()
    : Imp::FunctionValue("getroom")
{

}

std::shared_ptr<Imp::RuntimeValue> GetRoomFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "getroom", where);
    auto arg1 = actualParams[0];
    std::shared_ptr<Room> room;
    
    if(dynamic_cast<Imp::IntValue*>(arg1.get()))
    {
        vnum_t vnum = arg1->GetIntValue("getroom() param", where);
        room = GetRoom(vnum);
    }
    else if(dynamic_cast<Imp::StringValue*>(arg1.get()))
    {
        std::string tag = arg1->GetStringValue("getroom() param", where);
        room = GetRoom(tag);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in inroom() param 1.", where);
    }

    if(room == nullptr)
    {
        Imp::RuntimeValue::RuntimeError("Invalid vnum in getroom() param 1.", where);
    }
    
    return std::make_shared<ImpRoom>(room);
}
