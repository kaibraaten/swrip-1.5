#include "imp/parser/comparison.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/compopr.hpp"
#include "imp/parser/term.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/runtime/boolvalue.hpp"
#include "imp/except/runtimeexception.hpp"

namespace Imp
{
    Comparison::Comparison(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<Comparison> Comparison::Parse(std::shared_ptr<Scanner> s)
    {
        auto comp = std::make_shared<Comparison>(s->CurLineNum());
        CompTerm term(Term::Parse(s));
        comp->terms.push_back(term);

        while(s->IsCompOpr())
        {
            auto compOpr = CompOpr::Parse(s);
            term = CompTerm(Term::Parse(s));
            term.compOpr = compOpr;

            comp->terms.push_back(term);
        }

        return comp;
    }

    std::shared_ptr<RuntimeValue> Comparison::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::shared_ptr<RuntimeValue> lhv = terms[0].term->Eval(curScope);
        std::shared_ptr<RuntimeValue> result;

        for(int i = 1; i < terms.size(); ++i)
        {
            TokenKind kind = terms[i].compOpr->opr;
            auto rhv = terms[i].term->Eval(curScope);

            switch(kind)
            {
            case TokenKind::LessToken:
                result = lhv->EvalLess(rhv, this);
                break;

            case TokenKind::GreaterToken:
                result = lhv->EvalGreater(rhv, this);
                break;

            case TokenKind::DoubleEqualToken:
                result = lhv->EvalEqual(rhv, this);
                break;

            case TokenKind::GreaterEqualToken:
                result = lhv->EvalGreaterEqual(rhv, this);
                break;

            case TokenKind::LessEqualToken:
                result = lhv->EvalLessEqual(rhv, this);
                break;

            case TokenKind::NotEqualToken:
                result = lhv->EvalNotEqual(rhv, this);
                break;

            default:
                throw RuntimeException("Illegal comparison operator: " + TokenName(kind) + "!");
            }

            if((dynamic_cast<BoolValue*>(result.get())) == nullptr)
            {
                throw RuntimeException("Expected " + TokenName(kind) + " comparison to return bool!");
            }

            if(!result->GetBoolValue(TokenName(kind) + " operand", this))
            {
                break;
            }

            lhv = rhv;
        }

        return result;
    }
}
