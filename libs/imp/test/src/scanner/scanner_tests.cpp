#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <vector>
#include <utility>

#include "imp/scanner/tokenkind.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/token.hpp"

using namespace Imp;

TEST(ScannerTests, TestSmallProgram)
{
    // Arrange
    std::vector<std::string> source =
    {
        "",
        "# En hyggelig hilsen",
        "navn = \"Kai\"",
        "print ('Hei, ', navn)"
    };

    std::vector<TokenKind> expected =
    { 
        TokenKind::NameToken,
        TokenKind::EqualToken,
        TokenKind::StringToken,
        TokenKind::NewLineToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::StringToken,
        TokenKind::CommaToken,
        TokenKind::NameToken, 
        TokenKind::RightParToken,
        TokenKind::NewLineToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        EXPECT_EQ(*iter, s.CurToken()->Kind());
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}

TEST(ScannerTests, TestStringLiteral)
{
    // Arrange
    std::vector<std::string> source =
    {
        "\"Kai Braaten\"",
        "'Kai Braaten'"
    };
    std::string expected = "Kai Braaten";
    Scanner s("unit test", source);

    // Act
    s.ReadNextToken();
    auto t1 = s.CurToken();
    s.ReadNextToken(); // skip NEWLINE
    s.ReadNextToken();
    auto t2 = s.CurToken();

    // Assert
    EXPECT_EQ(TokenKind::StringToken, t1->Kind());
    EXPECT_EQ(TokenName(TokenKind::StringToken), TokenName(t1->Kind()));
    EXPECT_EQ(1, t1->LineNum());
    EXPECT_EQ(expected, t1->StringLit());

    EXPECT_EQ(TokenKind::StringToken, t2->Kind());
    EXPECT_EQ(TokenName(TokenKind::StringToken), TokenName(t2->Kind()));
    EXPECT_EQ(2, t2->LineNum());
    EXPECT_EQ(expected, t2->StringLit());
}

TEST(ScannerTests, ForLoop)
{
    std::vector<std::string> source =
    {
        "for y in [2020, 2021, 2022, 2023, 2024, 2025]:",
        "    a = y % 19",
        "",
        "for y in range(1, 2):",
        "    pass"
    };

    std::vector<Imp::TokenKind> expected =
    {
        TokenKind::ForToken,
        TokenKind::NameToken,
        TokenKind::InToken,
        TokenKind::LeftBracketToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::RightBracketToken,
        TokenKind::ColonToken,
        TokenKind::NewLineToken,
        TokenKind::IndentToken,
        TokenKind::NameToken,
        TokenKind::EqualToken,
        TokenKind::NameToken,
        TokenKind::PercentToken,
        TokenKind::IntegerToken,
        TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::ForToken,
        TokenKind::NameToken,
        TokenKind::InToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::IntegerToken,
        TokenKind::CommaToken,
        TokenKind::IntegerToken,
        TokenKind::RightParToken,
        TokenKind::ColonToken,
        TokenKind::NewLineToken,
        TokenKind::IndentToken,
        TokenKind::PassToken,
        TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        EXPECT_EQ(TokenName(*iter), TokenName(s.CurToken()->Kind()));
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}

TEST(ScannerTests, Expressions)
{
    std::vector<std::string> source =
    {
        "def myfun(a, b):",
        "    x = -(-2); print('Yo!');",
        "    x <= 5.4 and foo or bar"
    };

    std::vector<Imp::TokenKind> expected =
    {
        TokenKind::DefToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::NameToken,
        TokenKind::CommaToken,
        TokenKind::NameToken,
        TokenKind::RightParToken,
        TokenKind::ColonToken,
        TokenKind::NewLineToken,
        TokenKind::IndentToken,
        TokenKind::NameToken,
        TokenKind::EqualToken,
        TokenKind::MinusToken,
        TokenKind::LeftParToken,
        TokenKind::MinusToken,
        TokenKind::IntegerToken,
        TokenKind::RightParToken,
        TokenKind::SemicolonToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::StringToken,
        TokenKind::RightParToken,
        TokenKind::SemicolonToken,
        TokenKind::NewLineToken,
        TokenKind::NameToken,
        TokenKind::LessEqualToken,
        TokenKind::FloatToken,
        TokenKind::AndToken,
        TokenKind::NameToken,
        TokenKind::OrToken,
        TokenKind::NameToken,
        TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        EXPECT_EQ(TokenName(*iter), TokenName(s.CurToken()->Kind()));
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}


TEST(ScannerTests, Numbers)
{
    std::vector<std::string> source =
    {
        "10 5.4 0 0.5 123 0.0"
    };

    std::vector<Imp::TokenKind> expected =
    {
        TokenKind::IntegerToken,
        TokenKind::FloatToken,
        TokenKind::IntegerToken,
        TokenKind::FloatToken,
        TokenKind::IntegerToken,
        TokenKind::FloatToken,
        TokenKind::NewLineToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        EXPECT_EQ(TokenName(*iter), TokenName(s.CurToken()->Kind()));
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}

TEST(ScannerTests, Indents)
{
    std::vector<std::string> source =
    {
        "True",
        "    True",
        "        True",
        "    True",
        "True",
        "True",
        "    True",
        "        True",
        "True",
        "    True"
    };

    std::vector<Imp::TokenKind> expected =
    {
        TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::IndentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::IndentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::DedentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::DedentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::IndentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::IndentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::DedentToken, TokenKind::DedentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::IndentToken, TokenKind::TrueToken, TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        auto expectedToken = TokenName(*iter);
        auto actualToken = TokenName(s.CurToken()->Kind());
        EXPECT_EQ(expectedToken, actualToken);
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}

TEST(ScannerTests, Defs)
{
    std::vector<std::string> source =
    {
        "def a1(b):",
        "    return True",
        "",
        "def a2(b):",
        "    return True",
        ""
    };

    std::vector<Imp::TokenKind> expected =
    {
        TokenKind::DefToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::NameToken,
        TokenKind::RightParToken,
        TokenKind::ColonToken,
        TokenKind::NewLineToken,
        TokenKind::IndentToken,
        TokenKind::ReturnToken,
        TokenKind::TrueToken,
        TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::DefToken,
        TokenKind::NameToken,
        TokenKind::LeftParToken,
        TokenKind::NameToken,
        TokenKind::RightParToken,
        TokenKind::ColonToken,
        TokenKind::NewLineToken,
        TokenKind::IndentToken,
        TokenKind::ReturnToken,
        TokenKind::TrueToken,
        TokenKind::NewLineToken,
        TokenKind::DedentToken,
        TokenKind::EofToken
    };

    Scanner s("unit test", source);
    auto iter = expected.begin();

    do
    {
        s.ReadNextToken();
        auto expectedToken = TokenName(*iter);
        auto actualToken = TokenName(s.CurToken()->Kind());
        EXPECT_EQ(expectedToken, actualToken);
        ++iter;
    } while(s.CurToken()->Kind() != TokenKind::EofToken);
}
