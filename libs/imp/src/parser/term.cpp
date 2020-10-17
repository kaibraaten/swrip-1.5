#include "imp/parser/term.hpp"
#include "imp/parser/factor.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/parser/termopr.hpp"

namespace Imp
{
    Term::Term(int n)
        : ImpSyntax(n)
    {

    }

    void Term::PrettyPrint(std::ostream &out)
    {
        for(const auto &f : factors)
        {
            if(f.termOpr != nullptr)
            {
                out << " ";
                f.termOpr->PrettyPrint(out);
                out << " ";
            }

            f.factor->PrettyPrint(out);
        }
    }

    std::shared_ptr<Term> Term::Parse(std::shared_ptr<Scanner> s)
    {
        auto term = std::make_shared<Term>(s->CurLineNum());
        term->factors.push_back(FactorData(Factor::Parse(s)));

        while(s->IsTermOpr())
        {
            FactorData f;
            term->factors.push_back(f);
            f.termOpr = TermOpr::Parse(s);
            f.factor = Factor::Parse(s);
        }

        return term;
    }

    std::shared_ptr<RuntimeValue> Term::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
