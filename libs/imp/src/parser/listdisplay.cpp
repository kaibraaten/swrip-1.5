#include "imp/parser/listdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    ListDisplay::ListDisplay(int n)
        : Atom(n)
    {

    }

    std::shared_ptr<ListDisplay> ListDisplay::Parse(std::shared_ptr<Scanner> s)
    {
        auto listDisplay = std::make_shared<ListDisplay>(s->CurLineNum());
        Skip(s, TokenKind::LeftBracketToken);

        if(s->CurToken()->Kind() != TokenKind::RightBracketToken)
        {
            while(true)
            {
                listDisplay->exprs.push_back(Expr::Parse(s));

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

        for(auto e : exprs)
        {
            values.push_back(e->Eval(curScope));
        }

        return std::make_shared<ListValue>(values);
    }
}
