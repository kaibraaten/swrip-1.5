#include <vector>
#include "imp/parser/term.hpp"
#include "imp/parser/factor.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/termopr.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include "imp/except/runtimeexception.hpp"

namespace Imp
{
    struct FactorData
    {
        std::shared_ptr<Factor> factor;
        std::shared_ptr<TermOpr> termOpr;

        FactorData(std::shared_ptr<Factor> f)
        {
            factor = f;
        }

        FactorData()
        {

        }
    };

    struct Term::Impl
    {
        std::vector<FactorData> factors;
    };

    Term::Term(const std::string &scriptname, int n)
        : ImpSyntax(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Term::~Term()
    {

    }

    std::shared_ptr<Term> Term::Parse(std::shared_ptr<Scanner> s)
    {
        auto term = std::make_shared<Term>(s->ScriptName(), s->CurLineNum());
        term->pImpl->factors.push_back(FactorData(Factor::Parse(s)));

        while(s->IsTermOpr())
        {
            FactorData f;
            f.termOpr = TermOpr::Parse(s);
            f.factor = Factor::Parse(s);
            term->pImpl->factors.push_back(f);
        }

        return term;
    }

    std::shared_ptr<RuntimeValue> Term::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = pImpl->factors[0].factor->Eval(curScope);

        for(int i = 1; i < pImpl->factors.size(); ++i)
        {
            TokenKind k = pImpl->factors[i].termOpr->opr;
            auto rhv = pImpl->factors[i].factor->Eval(curScope);

            switch(k)
            {
            case TokenKind::MinusToken:
                v = v->EvalSubtract(rhv, this);
                break;

            case TokenKind::PlusToken:
                v = v->EvalAdd(rhv, this);
                break;

            default:
                RuntimeValue::RuntimeError("Illegal term operator: " + TokenName(k) + "!", this);
                break;
            }
        }

        return v;
    }
}
