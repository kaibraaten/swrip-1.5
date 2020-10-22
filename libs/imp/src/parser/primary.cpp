#include <vector>
#include "imp/parser/primary.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/primarysuffix.hpp"
#include "imp/parser/atom.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/functionvalue.hpp"
#include "imp/runtime/lambdavalue.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    struct Primary::Impl
    {
        std::shared_ptr<Atom> atom;
        std::vector<std::shared_ptr<PrimarySuffix>> suffices;
    };

    Primary::Primary(int n)
        : ImpSyntax(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Primary::~Primary()
    {

    }

    std::shared_ptr<Primary> Primary::Parse(std::shared_ptr<Scanner> s)
    {
        auto aspPrimary = std::make_shared<Primary>(s->CurLineNum());
        aspPrimary->pImpl->atom = Atom::Parse(s);

        while(s->CurToken()->Kind() == TokenKind::LeftBracketToken
              || s->CurToken()->Kind() == TokenKind::LeftParToken)
        {
            aspPrimary->pImpl->suffices.push_back(PrimarySuffix::Parse(s));
        }

        return aspPrimary;
    }

    std::shared_ptr<RuntimeValue> Primary::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto valueOfLastSubscript = pImpl->atom->Eval(curScope);

        for(auto suffix : pImpl->suffices)
        {
            if(suffix->BracketKind() == TokenKind::LeftBracketToken)
            {
                auto subscriptValue = suffix->Eval(curScope);
                valueOfLastSubscript = valueOfLastSubscript->EvalSubscription(subscriptValue, this);
            }
            else
            {
                auto actualParams = std::dynamic_pointer_cast<ListValue>(suffix->Eval(curScope));
                std::string funcName;

                if(dynamic_cast<FunctionValue*>(valueOfLastSubscript.get()))
                {
                    funcName = ((FunctionValue*)valueOfLastSubscript.get())->GetName();
                }
                else if(dynamic_cast<LambdaValue*>(valueOfLastSubscript.get()))
                {
                    funcName = "<anonymous lambda>";
                }
                else
                {
                    RuntimeValue::RuntimeError("Cannot call " + valueOfLastSubscript->ShowInfo() + " as a function.", this);
                }

                std::vector<std::shared_ptr<RuntimeValue>> params(actualParams->Value().begin(), actualParams->Value().end());
                valueOfLastSubscript = valueOfLastSubscript->EvalFuncCall(params, this);
            }
        }

        return valueOfLastSubscript;
    }
}
