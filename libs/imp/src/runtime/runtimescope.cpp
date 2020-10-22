#include <unordered_map>
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    struct RuntimeScope::Impl
    {
        Impl(std::shared_ptr<RuntimeScope> outer)
            : Outer(outer)
        {

        }

        std::shared_ptr<RuntimeScope> Outer;
        std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> decls;
    };

    RuntimeScope::RuntimeScope(std::shared_ptr<RuntimeScope> outer)
        : pImpl(std::make_unique<Impl>(outer))
    {

    }

    RuntimeScope::~RuntimeScope()
    {

    }

    void RuntimeScope::Assign(const std::string &id, std::shared_ptr<RuntimeValue> value)
    {
        pImpl->decls[id] = value;
    }

    std::shared_ptr<RuntimeValue> RuntimeScope::Find(const std::string &id,
                                                     ImpSyntax *where)
    {
        auto iter = pImpl->decls.find(id);

        if(iter != pImpl->decls.end())
        {
            return iter->second;
        }
        else if(pImpl->Outer != nullptr)
        {
            return pImpl->Outer->Find(id, where);
        }
        else
        {
            RuntimeValue::RuntimeError("Name " + id + " not defined!", where);
            return nullptr;
        }
    }
}
