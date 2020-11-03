#include "imp/scanner/token.hpp"
#include "imp/scanner/tokenkind.hpp"

namespace Imp
{
    // Token implementation class.
    struct Token::Impl
    {
        Impl(TokenKind k);
        Impl(TokenKind, int lineNum);
        void CheckResWords();
        std::string ShowInfo() const;

        TokenKind Kind;
        std::string Name;
        std::string StringLit;
        int64_t IntegerLit = 0;
        double FloatLit = 0;
        int LineNum = 0;
    };

    Token::Impl::Impl(TokenKind k)
        : Kind(k)
    {

    }

    Token::Impl::Impl(TokenKind k, int lineNum)
        : Kind(k),
        LineNum(lineNum)
    {

    }

    void Token::Impl::CheckResWords()
    {
        if(Kind == TokenKind::NameToken)
        {
            for(TokenKind kind = TokenKind::AndToken; kind < TokenKind::AstToken; ++kind)
            {
                auto name = TokenName(kind);

                if(Name == name)
                {
                    Kind = kind;
                    break;
                }
            }
        }
    }

    std::string Token::Impl::ShowInfo() const
    {
        std::string t = TokenName(Kind) + " token";

        if(LineNum > 0)
        {
            t += " on line " + LineNum;
        }

        switch(Kind)
        {
        case TokenKind::FloatToken:
            t += ": " + std::to_string(FloatLit);
            break;

        case TokenKind::IntegerToken:
            t += ": " + std::to_string(IntegerLit);
            break;

        case TokenKind::NameToken:
            t += ": " + Name;
            break;

        case TokenKind::StringToken:
            if(StringLit.find('"') != std::string::npos)
            {
                t += ": '" + StringLit + "'";
            }
            else
            {
                t += ": " + '"' + StringLit + '"';
            }

            break;

        default:
            break;
        }

        return t;
    }

    // Token class.
    Token::Token(TokenKind k)
        : pImpl(std::make_unique<Impl>(k))
    {

    }

    Token::Token(TokenKind k, int lineNum)
        : pImpl(std::make_unique<Impl>(k, lineNum))
    {

    }

    Token::~Token()
    {

    }

    void Token::CheckResWords()
    {
        pImpl->CheckResWords();
    }

    std::string Token::ShowInfo() const
    {
        return pImpl->ShowInfo();
    }

    TokenKind Token::Kind() const
    {
        return pImpl->Kind;
    }

    void Token::Kind(TokenKind tokenKind)
    {
        pImpl->Kind = tokenKind;
    }
    
    std::string Token::Name() const
    {
        return pImpl->Name;
    }

    void Token::Name(const std::string &name)
    {
        pImpl->Name = name;
    }

    std::string Token::StringLit() const
    {
        return pImpl->StringLit;
    }

    void Token::StringLit(const std::string &stringLit)
    {
        pImpl->StringLit = stringLit;
    }

    int64_t Token::IntegerLit() const
    {
        return pImpl->IntegerLit;
    }

    void Token::IntegerLit(int64_t integerLot)
    {
        pImpl->IntegerLit = integerLot;
    }

    double Token::FloatLit() const
    {
        return pImpl->FloatLit;
    }

    void Token::FloatLit(double floatLit)
    {
        pImpl->FloatLit = floatLit;
    }

    int Token::LineNum() const
    {
        return pImpl->LineNum;
    }

    void Token::LineNum(int lineNum)
    {
        pImpl->LineNum = lineNum;
    }
}
