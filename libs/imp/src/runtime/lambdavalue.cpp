#include "imp/runtime/lambdavalue.hpp"
#include "imp/runtime/returnvalue.hpp"
#include "imp/parser/impsyntax.hpp"
#include "imp/parser/expr.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/stringvalue.hpp"

namespace Imp
{
    LambdaValue::LambdaValue(const std::vector<std::string> &args,
                             std::shared_ptr<Expr> body,
                             std::shared_ptr<RuntimeScope> scope)
        : _FormalParams(args),
        _Body(body),
        _ScopeDeclared(scope)
    {

    }

    std::string LambdaValue::TypeName()
    {
        return "lambda";
    }

    std::string LambdaValue::ShowInfo()
    {
        return "<anonymous lambda>";
    }

    std::shared_ptr<RuntimeValue> LambdaValue::EvalFuncCall(const std::vector<std::shared_ptr<RuntimeValue>> &actualParams,
                                                            std::shared_ptr<ImpSyntax> where)
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

        std::shared_ptr<RuntimeValue> result;

        try
        {
            result = _Body->Eval(scope);
        }
        catch(const ReturnValue &e)
        {
            RuntimeError("lambdas can't have return statement.", where);
        }

        return result;
    }

    std::shared_ptr<RuntimeValue> LambdaValue::EvalStr(std::shared_ptr<ImpSyntax> where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
