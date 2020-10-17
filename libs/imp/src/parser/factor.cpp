#include "imp/parser/factor.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/parser/factorprefix.hpp"
#include "imp/parser/factoropr.hpp"

namespace Imp
{
    Factor::Factor(int n)
        : ImpSyntax(n)
    {

    }

    void Factor::PrettyPrint(std::ostream &out)
    {
        for(const auto &p : primaries)
        {
            if(p.opr != nullptr)
            {
                out << " ";
                p.opr->PrettyPrint(out);
                out << " ";
            }

            if(p.prefix != nullptr)
            {
                p.prefix->PrettyPrint(out);
            }

            p.primary->PrettyPrint(out);
        }
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
}
