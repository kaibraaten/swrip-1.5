#include <imp/runtime/boolvalue.hpp>
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include "impscript/impcharacter.hpp"
#include "character.hpp"

struct ImpCharacter::Impl
{
    Impl(std::shared_ptr<Character> ch)
        : Char(ch)
    {

    }

    std::shared_ptr<Character> Char;
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
    return IsNpc(pImpl->Char) ? pImpl->Char->ShortDescr : pImpl->Char->Name;
}

std::shared_ptr<Character> ImpCharacter::Char() const
{
    return pImpl->Char;
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
        return std::make_shared<Imp::BoolValue>(pImpl->Char == other->Char());
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
        return std::make_shared<Imp::BoolValue>(pImpl->Char != other->Char());
    }

    RuntimeError("Type error for !=.", where);
    return nullptr;
}

std::shared_ptr<Imp::RuntimeValue> ImpCharacter::EvalStr(const Imp::ImpSyntax *where)
{
    return std::make_shared<Imp::StringValue>(ShowInfo());
}
