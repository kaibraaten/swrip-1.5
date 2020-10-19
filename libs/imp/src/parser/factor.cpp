#include "imp/parser/factor.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/factorprefix.hpp"
#include "imp/parser/factoropr.hpp"
#include "imp/parser/primary.hpp"

namespace Imp
{
    Factor::Factor(int n)
        : ImpSyntax(n)
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
        factor->primaries.push_back(p);

        while(s->IsFactorOpr())
        {
            p = PrimaryData();
            p.opr = FactorOpr::Parse(s);

            if(s->IsFactorPrefix())
            {
                p.prefix = FactorPrefix::Parse(s);
            }

            p.primary = Primary::Parse(s);
            factor->primaries.push_back(p);
        }

        return factor;
    }

    std::shared_ptr<RuntimeValue> Factor::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
