#include <unordered_map>
#include "imp/parser/dictdisplay.hpp"
#include "imp/parser/expr.hpp"
#include "imp/parser/stringliteral.hpp"
#include "imp/scanner/all.hpp"
#include "imp/runtime/dictvalue.hpp"

namespace Imp
{
    struct DictDisplay::Impl
    {
        std::vector<std::pair<std::shared_ptr<StringLiteral>, std::shared_ptr<Expr>>> elements;
    };

    DictDisplay::DictDisplay(const std::string &scriptname, int n)
        : Atom(scriptname, n),
        pImpl(std::make_unique<Impl>())
    {

    }

    DictDisplay::~DictDisplay()
    {

    }

    std::shared_ptr<DictDisplay> DictDisplay::Parse(std::shared_ptr<Scanner> s)
    {
        auto dictDisplay = std::make_shared<DictDisplay>(s->ScriptName(), s->CurLineNum());
        Skip(s, TokenKind::LeftBraceToken);

        if(s->CurToken()->Kind() != TokenKind::RightBraceToken)
        {
            while(true)
            {
                auto key = StringLiteral::Parse(s);
                Skip(s, TokenKind::ColonToken);
                auto value = Expr::Parse(s);
                dictDisplay->pImpl->elements.push_back({ key, value });

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

        for(const auto &pair : pImpl->elements)
        {
            auto key = pair.first->Eval(curScope)->GetStringValue("dict key", this);
            auto value = pair.second->Eval(curScope);
            values.insert({ key, value });
        }

        return std::make_shared<DictValue>(values);
    }
}
