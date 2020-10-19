#include "imp/parser/name.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    Name::Name(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<Name> Name::Parse(std::shared_ptr<Scanner> s)
    {
        auto n = std::make_shared<Name>(s->CurLineNum());
        n->name = s->CurToken()->Name();
        s->ReadNextToken();
        return n;
    }

    std::shared_ptr<RuntimeValue> Name::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
