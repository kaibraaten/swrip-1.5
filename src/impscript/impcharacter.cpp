#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "character.hpp"

struct ImpCharacter::Impl
{
    Impl(std::shared_ptr<Character> ch)
        : Entity(ch)
    {

    }

    std::weak_ptr<Character> Entity;
};

ImpCharacter::ImpCharacter(std::shared_ptr<Character> ch)
    : pImpl(std::make_unique<Impl>(ch))
{

}

ImpCharacter::~ImpCharacter()
{

}

std::string ImpCharacter::TypeName()
{
    return "character";
}

std::string ImpCharacter::ShowInfo()
{
    if(!pImpl->Entity.expired())
    {
        auto ch = pImpl->Entity.lock();
        return IsNpc(ch) ? ch->ShortDescr : ch->Name;
    }
    else
    {
        return "";
    }
}

std::shared_ptr<Character> ImpCharacter::Entity(const Imp::ImpSyntax *where) const
{
    if(pImpl->Entity.expired())
    {
        RuntimeError("Character reference expired.", where);
    }
    
    return pImpl->Entity.lock();
}

std::shared_ptr<Imp::RuntimeValue> ImpCharacter::EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                           const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(false);
    }
    else if(dynamic_cast<ImpCharacter*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpCharacter>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) == other->Entity(where));
    }

    RuntimeError("Type error for ==.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpCharacter::EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                              const Imp::ImpSyntax *where)
{
    if(dynamic_cast<Imp::NoneValue*>(v.get()))
    {
        return std::make_shared<Imp::BoolValue>(true);
    }
    else if(dynamic_cast<ImpCharacter*>(v.get()))
    {
        auto other = std::dynamic_pointer_cast<ImpCharacter>(v);
        return std::make_shared<Imp::BoolValue>(Entity(where) != other->Entity(where));
    }

    RuntimeError("Type error for !=.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpCharacter::EvalStr(const Imp::ImpSyntax *where)
{
    auto ch = Entity(where);
    auto str = IsNpc(ch) ? ch->ShortDescr : ch->Name;
    return std::make_shared<Imp::StringValue>(str);
}

std::shared_ptr<Imp::RuntimeValue> ImpCharacter::EvalNot(const Imp::ImpSyntax *where)
{
    return std::make_shared<Imp::BoolValue>(pImpl->Entity.expired());
}
