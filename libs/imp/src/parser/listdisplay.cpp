#include <list>
#include "imp/parser/listdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    struct ListDisplay::Impl
    {
        std::list<std::shared_ptr<Expr>> exprs;
    };

    ListDisplay::ListDisplay(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    ListDisplay::~ListDisplay()
    {

    }

    std::shared_ptr<ListDisplay> ListDisplay::Parse(std::shared_ptr<Scanner> s)
    {
        auto listDisplay = std::make_shared<ListDisplay>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);

        if(s->CurToken()->Kind() != TokenKind::RightBracketToken)
        {
            while(true)
            {
                listDisplay->pImpl->exprs.push_back(Expr::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightBracketToken);
        return listDisplay;
    }

    std::shared_ptr<RuntimeValue> ListDisplay::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::deque<std::shared_ptr<RuntimeValue>> values;

        for(auto e : pImpl->exprs)
        {
            values.push_back(e->Eval(curScope));
        }

        return std::make_shared<ListValue>(values);
    }
}
