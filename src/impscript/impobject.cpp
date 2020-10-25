#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impobject.hpp"
#include "object.hpp"

struct ImpObject::Impl
{
    Impl(std::shared_ptr<Object> obj)
        : Entity(obj)
    {

    }

    std::weak_ptr<Object> Entity;
};

ImpObject::ImpObject(std::shared_ptr<Object> obj)
    : pImpl(std::make_unique<Impl>(obj))
{

}

ImpObject::~ImpObject()
{

}

std::string ImpObject::TypeName()
{
    return "object";
}

std::string ImpObject::ShowInfo()
{
    if(!pImpl->Entity.expired())
    {
        auto obj = pImpl->Entity.lock();
        return obj->ShortDescr;
    }
    else
    {
        return "";
    }
}

std::shared_ptr<Object> ImpObject::Entity(const Imp::ImpSyntax *where) const
{
    if(pImpl->Entity.expired())
    {
        RuntimeError("Object reference expired.", where);
    }
    
    return pImpl->Entity.lock();
}

std::shared_ptr<Imp::RuntimeValue> ImpObject::EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                        const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(false);
    }
    else if(dynamic_cast<ImpObject*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpObject>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) == other->Entity(where));
    }

    RuntimeError("Type error for ==.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpObject::EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                           const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(true);
    }
    else if(dynamic_cast<ImpObject*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpObject>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) != other->Entity(where));
    }

    RuntimeError("Type error for !=.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpObject::EvalStr(const Imp::ImpSyntax *where)
{
    auto obj = Entity(where);
    return std::make_shared<Imp::StringValue>(obj->ShortDescr);
}
