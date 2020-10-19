#include "imp/parser/comparison.hpp"
#include "imp/scanner/all.hpp"
#include "imp/parser/compopr.hpp"
#include "imp/parser/term.hpp"

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
        return nullptr;
    }
}
