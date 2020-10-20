#include <sstream>
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/returnvalue.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/nonevalue.hpp"
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

    std::shared_ptr<RuntimeValue> FunctionValue::EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams, std::shared_ptr<ImpSyntax> where)
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

    std::shared_ptr<RuntimeValue> FunctionValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
