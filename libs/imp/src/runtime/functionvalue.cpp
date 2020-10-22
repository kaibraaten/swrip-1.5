#include <vector>
#include <sstream>
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/returnvalue.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/parser/suite.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    struct FunctionValue::Impl
    {
        Impl(const std::string &name)
            : Name(name)
        {

        }

        Impl(const std::string &name,
                      const std::vector<std::string> &formalParams,
                      std::shared_ptr<RuntimeScope> scopeDeclared,
                      std::shared_ptr<Suite> body)
            : Name(name),
            FormalParams(formalParams),
            ScopeDeclared(scopeDeclared),
            Body(body)
        {

        }

        std::string Name;
        std::vector<std::string> FormalParams;
        std::shared_ptr<RuntimeScope> ScopeDeclared;
        std::shared_ptr<Suite> Body;
    };

    FunctionValue::FunctionValue(const std::string &name)
        : pImpl(std::make_unique<Impl>(name))
    {

    }

    FunctionValue::FunctionValue(const std::string &name,
                                 const std::vector<std::string> &formalParams,
                                 std::shared_ptr<RuntimeScope> scopeDeclared,
                                 std::shared_ptr<Suite> body)
        : pImpl(std::make_unique<Impl>(name, formalParams, scopeDeclared, body))
    {

    }

    FunctionValue::~FunctionValue()
    {

    }

    std::string FunctionValue::TypeName()
    {
        return "func";
    }

    std::string FunctionValue::ShowInfo()
    {
        std::ostringstream output;
        output << pImpl->Name << "(";
        bool isFirst = true;

        for(auto p : pImpl->FormalParams)
        {
            if(!isFirst)
            {
                output << ", ";
            }

            output << p;
            isFirst = false;
        }

        output << ")";
        return output.str();
    }

    std::shared_ptr<RuntimeValue> FunctionValue::EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, ImpSyntax *where)
    {
        if(actualParams.size() != pImpl->FormalParams.size())
        {
            RuntimeError("Wrong number of parameters.", where);
        }

        auto scope = std::make_shared<RuntimeScope>(pImpl->ScopeDeclared);

        for(int i = 0; i < actualParams.size(); ++i)
        {
            scope->Assign(pImpl->FormalParams[i], actualParams[i]);
        }

        try
        {
            pImpl->Body->Eval(scope);
        }
        catch(const ReturnValue &ret)
        {
            return ret.Value();
        }

        return std::make_shared<NoneValue>();
    }

    std::shared_ptr<RuntimeValue> FunctionValue::EvalStr(ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }

    std::shared_ptr<RuntimeValue> FunctionValue::EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> FunctionValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::string FunctionValue::GetName() const
    {
        return pImpl->Name;
    }
}
