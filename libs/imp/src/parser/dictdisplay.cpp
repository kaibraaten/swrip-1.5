#include "imp/parser/dictdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    DictDisplay::DictDisplay(int n)
        : Atom(n)
    {

    }

    void DictDisplay::PrettyPrint(std::ostream &out)
    {
        out << TokenName(TokenKind::LeftBraceToken);
        int nPrinted = 0;

        for(const auto pair : elements)
        {
            if(nPrinted > 0)
            {
                out << ", ";
            }

            pair.first->PrettyPrint(out);
            out << ": ";
            pair.second->PrettyPrint(out);
            ++nPrinted;
        }

        out << TokenName(TokenKind::RightBraceToken);
    }

    std::shared_ptr<DictDisplay> DictDisplay::Parse(std::shared_ptr<Scanner> s)
    {
        auto dictDisplay = std::make_shared<DictDisplay>(s->CurLineNum());
        Skip(s, TokenKind::LeftBraceToken);

        if(s->CurToken()->Kind() != TokenKind::RightBraceToken)
        {
            while(true)
            {
                auto key = StringLiteral::Parse(s);
                Skip(s, TokenKind::ColonToken);
                auto value = Expr::Parse(s);
                dictDisplay->elements.push_back({ key, value });

                if(s->CurToken()->Kind() != TokenKind::CommaToken)
                {
                    break;
                }

                Skip(s, TokenKind::CommaToken);
            }
        }

        Skip(s, TokenKind::RightBraceToken);
        return dictDisplay;
    }

    std::shared_ptr<RuntimeValue> DictDisplay::Eval(std::shared_ptr<RuntimeScope> curScope)
    {
        return nullptr;
    }
}