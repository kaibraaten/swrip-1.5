#include "imp/parser/lambda.hpp"
#include "imp/parser/name.hpp"
#include "imp/parser/expr.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    Lambda::Lambda(int n)
        : Atom(n)
    {

    }

    void Lambda::PrettyPrint(std::ostream &out)
    {
        out << "lambda";

        bool isFirst = true;

        for(auto param : formalParams)
        {
            if(isFirst)
            {
                out << " ";
            }
            else
            {
                out << ", ";
            }

            param->PrettyPrint(out);
            isFirst = false;
        }

        out << ": ";
        body->PrettyPrint(out);
    }

    std::shared_ptr<Lambda> Lambda::Parse(std::shared_ptr<Scanner> s)
    {
        auto lambdaExpr = std::make_shared<Lambda>(s->CurLineNum());
        Skip(s, TokenKind::LambdaToken);

        if(s->CurToken()->Kind() != TokenKind::ColonToken)
        {
            while(true)
            {
                lambdaExpr->formalParams.push_back(Name::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::ColonToken);
        lambdaExpr->body = Expr::Parse(s);

        return lambdaExpr;
    }

    std::shared_ptr<RuntimeValue> Lambda::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}
