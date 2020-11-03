#ifndef _IMP_SCANNER_SCANNER_HPP_
#define _IMP_SCANNER_SCANNER_HPP_

#include <memory>
#include <string>
#include <list>
#include <utility>

namespace Imp
{
    class Token;

    class Scanner
    {
    public:
        Scanner(const std::string &scriptname,
                const std::list<std::string> &sourceCode);
        ~Scanner();
        std::shared_ptr<Token> CurToken() const;
        void ReadNextToken();
        int CurLineNum() const;
        std::string ScriptName() const;
        bool IsCompOpr() const;
        bool IsFactorPrefix() const;
        bool IsFactorOpr() const;
        bool IsTermOpr() const;
        bool AnyEqualToken() const;

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
