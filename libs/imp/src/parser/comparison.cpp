#include "imp/parser/comparison.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/parser/compopr.hpp"

namespace Imp
{
    Comparison::Comparison(int n)
        : ImpSyntax(n)
    {

    }

    void Comparison::PrettyPrint(std::ostream &out)
    {
        for(const auto &term : terms)
        {
            if(term.compOpr != nullptr)
            {
                out << " ";
                term.compOpr->PrettyPrint(out);
                out << " ";
            }

            term.term->PrettyPrint(out);
        }
    }

    std::shared_ptr<Comparison> Comparison::Parse(std::shared_ptr<Scanner> s)
    {
        auto comp = std::make_shared<Comparison>(s->CurLineNum());
        CompTerm term(Term::Parse(s));
        comp->terms.push_back(term);

        while(s->IsCompOpr())
        {
            auto compOpr = std::make_shared<CompOpr>(CompOpr::Parse(s));
            term = CompTerm(Term::Parse(s));
            term.compOpr = compOpr;

            comp->terms.push_back(term);
        }

        return comp;
    }
}
