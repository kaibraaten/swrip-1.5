#ifndef _IMP_SCANNER_TOKENKIND_HPP_
#define _IMP_SCANNER_TOKENKIND_HPP_

#include <string>

namespace Imp
{
    enum class TokenKind
    {
        NameToken,
        IntegerToken,
        FloatToken,
        StringToken,

        // Keywords:
        AndToken,
        DefToken,
        ElifToken,
        ElseToken,
        FalseToken,
        ForToken,
        IfToken,
        InToken,
        LambdaToken,
        NoneToken,
        NotToken,
        OrToken,
        PassToken,
        ReturnToken,
        TrueToken,
        WhileToken,

        // Operators:
        AstToken,
        DoubleEqualToken,
        DoubleSlashToken,
        GreaterToken,
        GreaterEqualToken,
        LessToken,
        LessEqualToken,
        MinusToken,
        NotEqualToken,
        PercentToken,
        PlusToken,
        SlashToken,

        // Delimiters:
        ColonToken,
        CommaToken,
        EqualToken,
        LeftBraceToken,
        LeftBracketToken,
        LeftParToken,
        RightBraceToken,
        RightBracketToken,
        RightParToken,
        SemicolonToken,

        // Format tokens:
        IndentToken,
        DedentToken,
        NewLineToken,
        EofToken
    };

    std::string TokenName(TokenKind kind);
    TokenKind TokenFromName(const std::string &name);
    TokenKind &operator++(TokenKind &kind);
}

#endif
