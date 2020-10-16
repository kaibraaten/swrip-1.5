#ifndef _IMP_SCANNER_TOKEN_HPP_
#define _IMP_SCANNER_TOKEN_HPP_

#include <string>
#include <memory>

namespace Imp
{
    enum class TokenKind;

    class Token
    {
    public:
        Token(TokenKind k);
        Token(TokenKind, int lineNum);
        Token(const TokenKind &rhv);
        ~Token();

        void CheckResWords();
        std::string ShowInfo() const;

        // Accessors
        TokenKind Kind() const;
        void Kind(TokenKind tokenKind);
        std::string Name() const;
        void Name(const std::string &name);
        std::string StringLit() const;
        void StringLit(const std::string &stringLit);
        long IntegerLit() const;
        void IntegerLit(long integerLot);
        double FloatLit() const;
        void FloatLit(double floatLit);
        int LineNum() const;
        void LineNum(int lineNum);

    private:
        struct Impl;
        std::unique_ptr<Impl> pImpl;
    };
}

#endif
