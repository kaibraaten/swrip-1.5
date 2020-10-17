#include "imp/parser/primary.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/primarysuffix.hpp"
#include "imp/parser/atom.hpp"

namespace Imp
{
    Primary::Primary(int n)
        : ImpSyntax(n)
    {

    }

    void Primary::PrettyPrint(std::ostream &out)
    {
        atom->PrettyPrint(out);

        for(auto suffix : suffices)
        {
            suffix->PrettyPrint(out);
        }
    }

    std::shared_ptr<Primary> Primary::Parse(std::shared_ptr<Scanner> s)
    {
        auto aspPrimary = std::make_shared<Primary>(s->CurLineNum());
        aspPrimary->atom = Atom::Parse(s);

        while(s->CurToken()->Kind() == TokenKind::LeftBracketToken
              || s->CurToken()->Kind() == TokenKind::LeftParToken)
        {
            aspPrimary->suffices.push_back(PrimarySuffix::Parse(s));
        }

        return aspPrimary;
    }

    std::shared_ptr<RuntimeValue> Primary::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
