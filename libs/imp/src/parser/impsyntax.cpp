#include "imp/parser/impsyntax.hpp"
#include "imp/except/parserexception.hpp"
#include "imp/scanner/all.hpp"

namespace Imp
{
    void ParserError(const std::string &message, const std::string &scriptname, int lineNum)
    {
        std::string msg = "[" + scriptname + "] Imp parser error";

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
            ParserError("Expected " + TokenName(tk) + " but found " + TokenName(current) + "!",
                        s->ScriptName(), s->CurLineNum());
        }

        s->ReadNextToken();
    }

    // Impl
    struct ImpSyntax::Impl
    {
        Impl(const std::string &scriptname, int n)
            : ScriptName(scriptname),
            LineNum(n)
        {

        }

        std::string ScriptName;
        int LineNum = 0;
    };

    // ImpSyntax
    ImpSyntax::ImpSyntax(const std::string &scriptname, int n)
        : pImpl(std::make_unique<Impl>(scriptname, n))
    {

    }

    ImpSyntax::~ImpSyntax()
    {
    }

    int ImpSyntax::LineNum() const
    {
        return pImpl->LineNum;
    }

    std::string ImpSyntax::ScriptName() const
    {
        return pImpl->ScriptName;
    }
}
