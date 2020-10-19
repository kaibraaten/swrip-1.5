#include "imp/scanner/all.hpp"
#include "imp/parser/arguments.hpp"
#include "imp/parser/expr.hpp"

namespace Imp
{
    Arguments::Arguments(int n)
        : PrimarySuffix(n)
    {

    }

    std::shared_ptr<Arguments> Arguments::Parse(std::shared_ptr<Scanner> s)
    {
        auto args = std::make_shared<Arguments>(s->CurLineNum());
        Skip(s, TokenKind::LeftParToken);

        if(s->CurToken()->Kind() != TokenKind::RightParToken)
        {
            while(true)
            {
                args->exprs.push_back(Expr::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightParToken);
        return args;
    }

    std::shared_ptr<RuntimeValue> Arguments::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
