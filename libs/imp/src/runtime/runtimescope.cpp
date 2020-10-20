#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/runtimevalue.hpp"

namespace Imp
{
    RuntimeScope::RuntimeScope(std::shared_ptr<RuntimeScope> outer)
        : _Outer(outer)
    {

    }

    void RuntimeScope::Assign(const std::string &id, std::shared_ptr<RuntimeValue> value)
    {
        decls[id] = value;
    }

    std::shared_ptr<RuntimeValue> RuntimeScope::Find(const std::string &id,
                                                     ImpSyntax *where)
    {
        auto iter = decls.find(id);

        if(iter != decls.end())
        {
            return iter->second;
        }
        else if(_Outer != nullptr)
        {
            return _Outer->Find(id, where);
        }
        else
        {
            RuntimeValue::RuntimeError("Name " + id + " not defined!", where);
            return nullptr;
        }
    }
}
