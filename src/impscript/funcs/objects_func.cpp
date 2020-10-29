#include <deque>
#include <imp/utility.hpp>
#include <imp/runtime/listvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/impobject.hpp"
#include "impscript/funcs/objects_func.hpp"
#include "room.hpp"
#include "character.hpp"
#include "object.hpp"

ObjectsFunc::ObjectsFunc()
    : Imp::FunctionValue("objects")
{

}

std::shared_ptr<Imp::RuntimeValue> ObjectsFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 1, "objects", where);
    auto container = actualParams[0];

    if(dynamic_cast<ImpRoom*>(container.get()))
    {
        auto room = std::dynamic_pointer_cast<ImpRoom>(container)->Entity(where);
        std::deque<std::shared_ptr<Imp::RuntimeValue>> listData;

        for(auto obj : room->Objects())
        {
            listData.push_back(std::make_shared<ImpObject>(obj));
        }
        
        return std::make_shared<Imp::ListValue>(listData);
    }
    else if(dynamic_cast<ImpCharacter*>(container.get()))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(container)->Entity(where);
        std::deque<std::shared_ptr<Imp::RuntimeValue>> listData;

        for(auto obj : ch->Objects())
        {
            listData.push_back(std::make_shared<ImpObject>(obj));
        }

        return std::make_shared<Imp::ListValue>(listData);
    }
    else if(dynamic_cast<ImpObject*>(container.get()))
    {
        auto o = std::dynamic_pointer_cast<ImpObject>(container)->Entity(where);
        std::deque<std::shared_ptr<Imp::RuntimeValue>> listData;

        for(auto obj : o->Objects())
        {
            listData.push_back(std::make_shared<ImpObject>(obj));
        }

        return std::make_shared<Imp::ListValue>(listData);
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in characters().", where);
        return nullptr;
    }
}
