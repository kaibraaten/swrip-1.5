#include <vector>
#include "imp/runtime/lambdavalue.hpp"
#include "imp/runtime/returnvalue.hpp"
#include "imp/parser/impsyntax.hpp"
#include "imp/parser/expr.hpp"
#include "imp/runtime/runtimescope.hpp"
#include "imp/runtime/stringvalue.hpp"
#include "imp/runtime/nonevalue.hpp"
#include "imp/runtime/boolvalue.hpp"

namespace Imp
{
    struct LambdaValue::Impl
    {
        Impl(const std::vector<std::string> &args,
             std::shared_ptr<Expr> body,
             std::shared_ptr<RuntimeScope> scope)
            : FormalParams(args),
            Body(body),
            ScopeDeclared(scope)
        {

        }

        std::vector<std::string> FormalParams;
        std::shared_ptr<Expr> Body;
        std::shared_ptr<RuntimeScope> ScopeDeclared;
    };

    LambdaValue::LambdaValue(const std::vector<std::string> &args,
                             std::shared_ptr<Expr> body,
                             std::shared_ptr<RuntimeScope> scope)
        : pImpl(std::make_unique<Impl>(args, body, scope))
    {

    }

    LambdaValue::~LambdaValue()
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
                                                            ImpSyntax *where)
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

        std::shared_ptr<RuntimeValue> result;

        try
        {
            result = pImpl->Body->Eval(scope);
        }
        catch(const ReturnValue &e)
        {
            RuntimeError("lambdas can't have return statement.", where);
        }

        return result;
    }

    std::shared_ptr<RuntimeValue> LambdaValue::EvalEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(false);
        }

        RuntimeError("Type error for ==.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> LambdaValue::EvalNotEqual(std::shared_ptr<RuntimeValue> v, ImpSyntax *where)
    {
        if(dynamic_cast<NoneValue *>(v.get()))
        {
            return std::make_shared<BoolValue>(true);
        }

        RuntimeError("Type error for !=.", where);
        return nullptr;
    }

    std::shared_ptr<RuntimeValue> LambdaValue::EvalStr(ImpSyntax *where)
    {
        return std::make_shared<StringValue>(ShowInfo());
    }
}
