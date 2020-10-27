#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/improom.hpp"
#include "room.hpp"

struct ImpRoom::Impl
{
    Impl(std::shared_ptr<Room> room)
        : Entity(room)
    {

    }

    std::weak_ptr<Room> Entity;
};

ImpRoom::ImpRoom(std::shared_ptr<Room> room)
    : pImpl(std::make_unique<Impl>(room))
{

}

ImpRoom::~ImpRoom()
{

}

std::string ImpRoom::TypeName()
{
    return "room";
}

std::string ImpRoom::ShowInfo()
{
    if(!pImpl->Entity.expired())
    {
        auto room = pImpl->Entity.lock();
        return room->Name;
    }
    else
    {
        return "";
    }
}

std::shared_ptr<Room> ImpRoom::Entity(const Imp::ImpSyntax *where) const
{
    if(pImpl->Entity.expired())
    {
        RuntimeError("Room reference expired.", where);
    }
    
    return pImpl->Entity.lock();
}

std::shared_ptr<Imp::RuntimeValue> ImpRoom::EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                           const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(false);
    }
    else if(dynamic_cast<ImpRoom*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpRoom>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) == other->Entity(where));
    }

    RuntimeError("Type error for ==.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpRoom::EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                              const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(true);
    }
    else if(dynamic_cast<ImpRoom*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpRoom>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) != other->Entity(where));
    }

    RuntimeError("Type error for !=.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpRoom::EvalStr(const Imp::ImpSyntax *where)
{
    auto room = Entity(where);
    return std::make_shared<Imp::StringValue>(room->Name);
}

bool ImpRoom::GetBoolValue(const std::string &what, const Imp::ImpSyntax *where)
{
    return !pImpl->Entity.expired();
}

std::shared_ptr<Imp::RuntimeValue> ImpRoom::EvalNot(const Imp::ImpSyntax *where)
{
    return std::make_shared<Imp::BoolValue>(pImpl->Entity.expired());
}
