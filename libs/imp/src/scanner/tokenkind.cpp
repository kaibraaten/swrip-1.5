#include <unordered_map>
#include "imp/scanner/tokenkind.hpp"
#include "imp/except/scannerexception.hpp"

namespace Imp
{
    static const std::unordered_map<std::string, TokenKind> _nameTokenMapping =
    {
        { "name", TokenKind::NameToken },
        { "integer literal", TokenKind::IntegerToken },
        { "float literal", TokenKind::FloatToken },
        { "string literal", TokenKind::StringToken },

        // Keywords:
        { "and", TokenKind::AndToken },
        { "def", TokenKind::DefToken },
        { "elif", TokenKind::ElifToken },
        { "else", TokenKind::ElseToken },
        { "False", TokenKind::FalseToken },
        { "for", TokenKind::ForToken },
        { "from", TokenKind::FromToken },
        { "if", TokenKind::IfToken },
        { "import", TokenKind::ImportToken },
        { "in", TokenKind::InToken },
        { "lambda", TokenKind::LambdaToken },
        { "None", TokenKind::NoneToken },
        { "not", TokenKind::NotToken },
        { "or", TokenKind::OrToken },
        { "pass", TokenKind::PassToken },
        { "return", TokenKind::ReturnToken },
        { "True", TokenKind::TrueToken },
        { "while", TokenKind::WhileToken },

        // Operators:
        { "*", TokenKind::AstToken },
        { "==", TokenKind::DoubleEqualToken },
        { "//", TokenKind::DoubleSlashToken },
        { ">", TokenKind::GreaterToken },
        { ">=", TokenKind::GreaterEqualToken },
        { "<", TokenKind::LessToken },
        { "<=", TokenKind::LessEqualToken },
        { "-", TokenKind::MinusToken },
        { "!=", TokenKind::NotEqualToken },
        { "%", TokenKind::PercentToken },
        { "+", TokenKind::PlusToken },
        { "/", TokenKind::SlashToken },

        // Delimiters:
        { ":", TokenKind::ColonToken },
        { ",", TokenKind::CommaToken },
        { "=", TokenKind::EqualToken },
        { "{", TokenKind::LeftBraceToken },
        { "[", TokenKind::LeftBracketToken },
        { "(", TokenKind::LeftParToken },
        { "}", TokenKind::RightBraceToken },
        { "]", TokenKind::RightBracketToken },
        { ")", TokenKind::RightParToken },
        { ";", TokenKind::SemicolonToken },

        // Format tokens:
        { "INDENT", TokenKind::IndentToken },
        { "DEDENT", TokenKind::DedentToken },
        { "NEWLINE", TokenKind::NewLineToken },
        { "E-o-f", TokenKind::EofToken }
    };

    TokenKind &operator++(TokenKind &kind)
    {
        if(kind > TokenKind::EofToken)
        {
            throw std::out_of_range("for TokenKind &operator++(TokenKind &kind)");
        }

        kind = TokenKind(static_cast<std::underlying_type<TokenKind>::type>(kind) + 1);
        return kind;
    }

    std::string TokenName(TokenKind kind)
    {
        for(auto pair : _nameTokenMapping)
        {
            if(pair.second == kind)
            {
                return pair.first;
            }
        }

        throw std::logic_error("Invalid TokenKind: " + std::to_string((int)kind));
    }

    TokenKind TokenFromName(const std::string &name)
    {
        auto iter = _nameTokenMapping.find(name);

        if(iter != _nameTokenMapping.end())
        {
            return iter->second;
        }
        else
        {
            throw ScannerException(name + " is not a valid token name");
        }
    }
}
