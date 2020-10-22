#include <vector>
#include "imp/scanner/all.hpp"
#include "imp/parser/arguments.hpp"
#include "imp/parser/expr.hpp"
#include "imp/runtime/listvalue.hpp"

namespace Imp
{
    struct Arguments::Impl
    {
        std::vector<std::shared_ptr<Expr>> exprs;
    };

    Arguments::Arguments(int n)
        : PrimarySuffix(n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Arguments::~Arguments()
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
                args->pImpl->exprs.push_back(Expr::Parse(s));

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
        std::deque<std::shared_ptr<RuntimeValue>> args;

        for(auto e : pImpl->exprs)
        {
            args.push_back(e->Eval(curScope));
        }

        return std::make_shared<ListValue>(args);
    }
}
