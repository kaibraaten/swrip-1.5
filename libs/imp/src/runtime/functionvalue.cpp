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
    FunctionValue::FunctionValue(const std::string &name)
        : _Name(name)
    {

    }

    FunctionValue::FunctionValue(const std::string &name,
                                 const std::vector<std::string> &formalParams,
                                 std::shared_ptr<RuntimeScope> scopeDeclared,
                                 std::shared_ptr<Suite> body)
        : _Name(name),
        _FormalParams(formalParams),
        _ScopeDeclared(scopeDeclared),
        _Body(body)
    {

    }

    std::string FunctionValue::TypeName()
    {
        return "func";
    }

    std::string FunctionValue::ShowInfo()
    {
        std::ostringstream output;
        output << _Name << "(";
        bool isFirst = true;

        for(auto p : _FormalParams)
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
        if(actualParams.size() != _FormalParams.size())
        {
            RuntimeError("Wrong number of parameters.", where);
        }

        auto scope = std::make_shared<RuntimeScope>(_ScopeDeclared);

        for(int i = 0; i < actualParams.size(); ++i)
        {
            scope->Assign(_FormalParams[i], actualParams[i]);
        }

        try
        {
            _Body->Eval(scope);
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
        return _Name;
    }
}
