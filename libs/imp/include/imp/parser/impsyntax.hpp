#ifndef _IMP_PARSER_IMPSYNTAX_HPP_
#define _IMP_PARSER_IMPSYNTAX_HPP_

#include <memory>
#include <iostream>
#include <string>

namespace Imp
{
    class RuntimeValue;
    class RuntimeScope;
    class Scanner;
    enum class TokenKind;

    class ImpSyntax
    {
    public:
        ImpSyntax(int n);
        virtual ~ImpSyntax();
        int LineNum() const;

        virtual void PrettyPrint(std::ostream &out) = 0;
        virtual RuntimeValue Eval(RuntimeScope curScope) = 0;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };

    void ParserError(std::string message, int lineNum = 0);
    void Skip(std::shared_ptr<Scanner> s, TokenKind tk);
}

#endif
