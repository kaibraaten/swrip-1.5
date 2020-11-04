#include <unordered_map>
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/stringvalue.hpp"

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
        Assign("__scriptpath__", std::make_shared<StringValue>(""));
    }

    RuntimeScope::~RuntimeScope()
    {

    }

    std::list<std::string> RuntimeScope::Serialize() const
    {
        std::list<std::string> data;

        if(pImpl->Outer != nullptr)
        {
            auto outerData = pImpl->Outer->Serialize();
            data.insert(data.begin(),
                        outerData.begin(),
                        outerData.end());
        }

        for(const auto &tuple : pImpl->decls)
        {
            std::string line = tuple.first + " = " + tuple.second->ShowInfo();
            data.push_back(line);
        }

        return data;
    }
    
    void RuntimeScope::Assign(const std::string &id, std::shared_ptr<RuntimeValue> value)
    {
        pImpl->decls[id] = value;
    }

    std::shared_ptr<RuntimeValue> RuntimeScope::Find(const std::string &id,
                                                     const ImpSyntax *where)
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
