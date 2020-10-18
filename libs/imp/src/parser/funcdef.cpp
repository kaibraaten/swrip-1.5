#include "imp/parser/funcdef.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/suite.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/parser/name.hpp"

namespace Imp
{
    FuncDef::FuncDef(int n)
        : CompoundStmt(n)
    {

    }

    void FuncDef::PrettyPrint(std::ostream &out)
    {
        out << "def ";
        name->PrettyPrint(out);
        out << "(";

        int numPrinted = 0;

        for(auto arg : arguments)
        {
            if(numPrinted > 0)
            {
                out << ", ";
            }

            arg->PrettyPrint(out);
            ++numPrinted;
        }

        out << "):";
        body->PrettyPrint(out);
        out << "\r\n";
    }

    std::shared_ptr<RuntimeValue> FuncDef::Eval(std::shared_ptr<RuntimeScope> curScope)
    {

    }

    std::shared_ptr<FuncDef> FuncDef::Parse(std::shared_ptr<Scanner> s)
    {
        auto funcDef = std::make_shared<FuncDef>(s->CurLineNum());
        Skip(s, TokenKind::DefToken);
        funcDef->name = Name::Parse(s);
        Skip(s, TokenKind::LeftParToken);

        if(s->CurToken()->Kind() != TokenKind::RightParToken)
        {
            while(true)
            {
                funcDef->arguments.push_back(Name::Parse(s));

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightParToken);
        Skip(s, TokenKind::ColonToken);
        funcDef->body = Suite::Parse(s);

        return funcDef;
    }
}
