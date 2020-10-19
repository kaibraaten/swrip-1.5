#ifndef _IMP_RUNTIME_RUNTIMESCOPE_HPP_
#define _IMP_RUNTIME_RUNTIMESCOPE_HPP_

#include <string>
#include <memory>
#include <unordered_map>

namespace Imp
{
    class RuntimeValue;
    class ImpSyntax;

    class RuntimeScope
    {
    public:
        RuntimeScope(std::shared_ptr<RuntimeScope> outer = nullptr);
        void Assign(const std::string &id, std::shared_ptr<RuntimeValue> value);
        std::shared_ptr<RuntimeValue> Find(const std::string &id, std::shared_ptr<ImpSyntax> where);

    private:
        std::shared_ptr<RuntimeScope> _Outer;
        std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> decls;
    };
}

#endif
