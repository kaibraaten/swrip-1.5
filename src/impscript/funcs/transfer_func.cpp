#include <imp/utility.hpp>
#include <imp/runtime/nonevalue.hpp>
#include "impscript/impobject.hpp"
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/funcs/transfer_func.hpp"
#include "mud.hpp"
#include "object.hpp"
#include "character.hpp"
#include "room.hpp"

static void RemoveFromOldLocation(std::shared_ptr<Object> obj);
static void RemoveFromOldLocation(std::shared_ptr<Character> ch);

TransferFunc::TransferFunc()
    : Imp::FunctionValue("transfer")
{

}

std::shared_ptr<Imp::RuntimeValue> TransferFunc::EvalFuncCall(const std::vector<std::shared_ptr<Imp::RuntimeValue>> &actualParams, const Imp::ImpSyntax *where)
{
    Imp::CheckNumParams(actualParams, 2, "transfer", where);
    auto arg1 = actualParams[0];
    auto arg2 = actualParams[1];
    
    if(dynamic_cast<ImpObject*>(arg1.get()))
    {
        auto obj = std::dynamic_pointer_cast<ImpObject>(arg1)->Entity(where);

        if(dynamic_cast<ImpObject*>(arg2.get()))
        {
            auto destination = std::dynamic_pointer_cast<ImpObject>(arg2)->Entity(where);
            RemoveFromOldLocation(obj);
            ObjectToObject(obj, destination);
        }
        else if(dynamic_cast<ImpRoom*>(arg2.get()))
        {
            auto destination = std::dynamic_pointer_cast<ImpRoom>(arg2)->Entity(where);
            RemoveFromOldLocation(obj);
            ObjectToRoom(obj, destination);
        }
        else if(dynamic_cast<ImpCharacter*>(arg2.get()))
        {
            auto destination = std::dynamic_pointer_cast<ImpCharacter>(arg2)->Entity(where);
            RemoveFromOldLocation(obj);
            ObjectToCharacter(obj, destination);
        }
        else
        {
            Imp::RuntimeValue::RuntimeError("Type error in transfer() param 2.", where);
        }
    }
    else if(dynamic_cast<ImpCharacter*>(arg1.get()))
    {
        auto ch = std::dynamic_pointer_cast<ImpCharacter>(arg1)->Entity(where);

        if(dynamic_cast<ImpRoom*>(arg2.get()))
        {
            auto destination = std::dynamic_pointer_cast<ImpRoom>(arg2)->Entity(where);
            CharacterToRoom(ch, destination);
            RemoveFromOldLocation(ch);
        }
        else
        {
            Imp::RuntimeValue::RuntimeError("Type error in transfer() param 2.", where);
        }
    }
    else
    {
        Imp::RuntimeValue::RuntimeError("Type error in transfer() param 1.", where);
    }
    
    return std::make_shared<Imp::NoneValue>();
}

static void RemoveFromOldLocation(std::shared_ptr<Object> obj)
{
    if(obj->CarriedBy)
    {
        ObjectFromCharacter(obj);
    }
    else if(obj->InRoom)
    {
        ObjectFromRoom(obj);
    }
    else if(obj->InObject)
    {
        ObjectFromObject(obj);
    }
    else
    {
        // Intentionally left blank.
    }
}

static void RemoveFromOldLocation(std::shared_ptr<Character> ch)
{
    if(ch->InRoom)
    {
        CharacterFromRoom(ch);
    }
    else
    {
        // Intentionally left blank.
    }
}
