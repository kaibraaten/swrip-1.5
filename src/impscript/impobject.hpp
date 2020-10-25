#ifndef _SWRIP_IMPSCRIPT_OBJECT_HPP_
#define _SWRIP_IMPSCRIPT_OBJECT_HPP_

#include <imp/runtime/runtimevalue.hpp>

class Object;

class ImpObject : public Imp::RuntimeValue
{
public:
    ImpObject(std::shared_ptr<Object> obj);
    ~ImpObject();
    std::string TypeName() override;
    std::string ShowInfo() override;
    std::shared_ptr<Imp::RuntimeValue> EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                 const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                    const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalStr(const Imp::ImpSyntax *where) override;
    std::shared_ptr<Object> Entity(const Imp::ImpSyntax *where) const;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
