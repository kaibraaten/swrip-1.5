#include "imp/parser/name.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimescope.hpp"

namespace Imp
{
    Name::Name(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<Name> Name::Parse(std::shared_ptr<Scanner> s)
    {
        auto n = std::make_shared<Name>(s->CurLineNum());
        n->_Name = s->CurToken()->Name();
        s->ReadNextToken();
        return n;
    }

    std::string Name::GetName() const
    {
        return _Name;
    }

    std::shared_ptr<RuntimeValue> Name::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return curScope->Find(_Name, this);
    }
}
