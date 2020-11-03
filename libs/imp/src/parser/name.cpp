#include "imp/parser/name.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/runtimescope.hpp"

namespace Imp
{
    struct Name::Impl
    {
        std::string Name;
    };

    Name::Name(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Name::~Name()
    {

    }

    std::shared_ptr<Name> Name::Parse(std::shared_ptr<Scanner> s)
    {
        auto n = std::make_shared<Name>(s->ScriptName(), s->CurLineNum());
        n->pImpl->Name = s->CurToken()->Name();
        s->ReadNextToken();
        return n;
    }

    std::string Name::GetName() const
    {
        return pImpl->Name;
    }

    std::shared_ptr<RuntimeValue> Name::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return curScope->Find(pImpl->Name, this);
    }
}
