#include <unordered_map>
#include "imp/parser/dictdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/dictvalue.hpp"

namespace Imp
{
    DictDisplay::DictDisplay(int n)
        : Atom(n)
    {

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
        std::unordered_map<std::string, std::shared_ptr<RuntimeValue>> values;

        for(const auto &pair : elements)
        {
            auto key = pair.first->Eval(curScope)->GetStringValue("dict key", this);
            auto value = pair.second->Eval(curScope);
            values.insert({ key, value });
        }

        return std::make_shared<DictValue>(values);
    }
}