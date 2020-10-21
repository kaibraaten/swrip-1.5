#include "imp/parser/term.hpp"
#include "imp/parser/factor.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/termopr.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/except/runtimeexception.hpp"

namespace Imp
{
    Term::Term(int n)
        : ImpSyntax(n)
    {

    }

    std::shared_ptr<Term> Term::Parse(std::shared_ptr<Scanner> s)
    {
        auto term = std::make_shared<Term>(s->CurLineNum());
        term->factors.push_back(FactorData(Factor::Parse(s)));

        while(s->IsTermOpr())
        {
            FactorData f;
            f.termOpr = TermOpr::Parse(s);
            f.factor = Factor::Parse(s);
            term->factors.push_back(f);
        }

        return term;
    }

    std::shared_ptr<RuntimeValue> Term::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = factors[0].factor->Eval(curScope);

        for(int i = 1; i < factors.size(); ++i)
        {
            TokenKind k = factors[i].termOpr->opr;
            auto rhv = factors[i].factor->Eval(curScope);

            switch(k)
            {
            case TokenKind::MinusToken:
                v = v->EvalSubtract(rhv, this);
                break;

            case TokenKind::PlusToken:
                v = v->EvalAdd(rhv, this);
                break;

            default:
                throw RuntimeException("Illegal term operator: " + TokenName(k) + "!");
            }
        }

        return v;
    }
}
