#include <list>
#include "imp/parser/lambda.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/lambdavalue.hpp"

namespace Imp
{
    struct Lambda::Impl
    {
        std::list<std::shared_ptr<Name>> formalParams;
        std::shared_ptr<Expr> body;
    };

    Lambda::Lambda(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    Lambda::~Lambda()
    {

    }

    std::shared_ptr<Lambda> Lambda::Parse(std::shared_ptr<Scanner> s)
    {
        auto lambdaExpr = std::make_shared<Lambda>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::LambdaToken);

        if(s->CurToken()->Kind() != TokenKind::ColonToken)
        {
            while(true)
            {
                lambdaExpr->pImpl->formalParams.push_back(Name::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::ColonToken);
        lambdaExpr->pImpl->body = Expr::Parse(s);

        return lambdaExpr;
    }

    std::shared_ptr<RuntimeValue> Lambda::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        std::vector<std::string> args;

        for(auto e : pImpl->formalParams)
        {
            args.push_back(e->GetName());
        }

        return std::make_shared<LambdaValue>(args, pImpl->body, curScope);
    }
}
