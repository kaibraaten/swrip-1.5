#ifndef _SWRIP_IMPSCRIPT_CHARACTER_HPP_
#define _SWRIP_IMPSCRIPT_CHARACTER_HPP_

#include <imp/runtime/runtimevalue.hpp>

class Character;

class ImpCharacter : public Imp::RuntimeValue
{
public:
    ImpCharacter(std::shared_ptr<Character> ch);
    ~ImpCharacter();
    std::string TypeName() override;
    std::string ShowInfo() override;
    std::shared_ptr<Imp::RuntimeValue> EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                 const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                    const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalStr(const Imp::ImpSyntax *where) override;
    std::shared_ptr<Character> Char() const;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
