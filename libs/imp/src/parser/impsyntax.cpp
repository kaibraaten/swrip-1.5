#include "imp/parser/impsyntax.hpp"
#include "imp/except/parserexception.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    void ParserError(std::string message, int lineNum)
    {
        std::string msg = "Imp parser error";

        if(lineNum > 0)
        {
            msg += " on line " + std::to_string(lineNum);
        }

        msg += ": " + message;
        throw ParserException(msg);
    }

    void Skip(std::shared_ptr<Scanner> s, TokenKind tk)
    {
        auto current = s->CurToken()->Kind();

        if(current != tk)
        {
            ParserError("Expected " + TokenName(tk) + " but found " + TokenName(current) + "!", s->CurLineNum());
        }

        s->ReadNextToken();
    }

    // Impl
    struct ImpSyntax::Impl
    {
        Impl(int n)
            : LineNum(n)
        {

        }

        int LineNum = 0;
    };

    // ImpSyntax
    ImpSyntax::ImpSyntax(int n)
        : pImpl(std::make_unique<Impl>(n))
    {
    }

    ImpSyntax::~ImpSyntax()
    {
    }

    int ImpSyntax::LineNum() const
    {
        return pImpl->LineNum;
    }
}
