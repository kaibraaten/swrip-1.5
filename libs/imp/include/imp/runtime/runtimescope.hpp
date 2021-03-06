#ifndef _IMP_RUNTIME_RUNTIMESCOPE_HPP_
#define _IMP_RUNTIME_RUNTIMESCOPE_HPP_

#include <string>
#include <memory>
#include <list>

namespace Imp
{
    class RuntimeValue;
    class ImpSyntax;

    class RuntimeScope
    {
    public:
        RuntimeScope(std::shared_ptr<RuntimeScope> outer = nullptr);
        virtual ~RuntimeScope();
        void Assign(const std::string &id, std::shared_ptr<RuntimeValue> value);
        std::shared_ptr<RuntimeValue> Find(const std::string &id, const ImpSyntax *where);
        bool Exists(const std::string &id) const;
        std::list<std::string> Serialize() const;
        
    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
