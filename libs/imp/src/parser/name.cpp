#include "imp/parser/name.hpp"
#include "imp/scanner/scanner.hpp"

namespace Imp
{
    Name::Name(int n)
        : Atom(n)
    {

    }

    void Name::PrettyPrint(std::ostream &out)
    {
        out << name;
    }

    std::shared_ptr<Name> Name::Parse(std::shared_ptr<Scanner> s)
    {
        auto n = std::make_shared<Name>(s->CurLineNum());
        n->name = s->CurToken()->Name();
        s->ReadNextToken();
        return n;
    }
}
