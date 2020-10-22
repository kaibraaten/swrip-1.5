#include <vector>
#include "imp/parser/factor.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/factorprefix.hpp"
#include "imp/parser/factoropr.hpp"
#include "imp/parser/primary.hpp"
#include "imp/runtime/runtimevalue.hpp"
#include <imp/except/runtimeexception.hpp>

namespace Imp
{
    struct PrimaryData
    {
        std::shared_ptr<Primary> primary;
        std::shared_ptr<FactorPrefix> prefix;
        std::shared_ptr<FactorOpr> opr;
    };

    struct Factor::Impl
    {
        std::vector<PrimaryData> primaries;
    };

    Factor::Factor(int n)
        : ImpSyntax(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Factor::~Factor()
    {

    }

    std::shared_ptr<Factor> Factor::Parse(std::shared_ptr<Scanner> s)
    {
        auto factor = std::make_shared<Factor>(s->CurLineNum());
        PrimaryData p;

        if(s->IsFactorPrefix())
        {
            p.prefix = FactorPrefix::Parse(s);
        }

        p.primary = Primary::Parse(s);
        factor->pImpl->primaries.push_back(p);

        while(s->IsFactorOpr())
        {
            p = PrimaryData();
            p.opr = FactorOpr::Parse(s);

            if(s->IsFactorPrefix())
            {
                p.prefix = FactorPrefix::Parse(s);
            }

            p.primary = Primary::Parse(s);
            factor->pImpl->primaries.push_back(p);
        }

        return factor;
    }

    std::shared_ptr<RuntimeValue> Factor::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        auto v = pImpl->primaries[0].primary->Eval(curScope);

        if(pImpl->primaries[0].prefix != nullptr
           && pImpl->primaries[0].prefix->opr == TokenKind::MinusToken)
        {
            v = v->EvalNegate(pImpl->primaries[0].primary.get());
        }

        for(int i = 1; i < pImpl->primaries.size(); ++i)
        {
            auto p = pImpl->primaries[i];
            TokenKind k = p.opr->opr;
            auto rhv = p.primary->Eval(curScope);

            if(p.prefix != nullptr && p.prefix->opr == TokenKind::MinusToken)
            {
                rhv = rhv->EvalNegate(this);
            }

            switch(k)
            {
            case TokenKind::AstToken:
                v = v->EvalMultiply(rhv, this);
                break;

            case TokenKind::SlashToken:
                v = v->EvalDivide(rhv, this);
                break;

            case TokenKind::DoubleSlashToken:
                v = v->EvalIntDivide(rhv, this);
                break;

            case TokenKind::PercentToken:
                v = v->EvalModulo(rhv, this);
                break;

            default:
                throw RuntimeException("Illegal term operator: " + TokenName(k) + "!");
            }
        }

        return v;
    }
}
