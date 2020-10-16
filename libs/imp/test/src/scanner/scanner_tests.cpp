#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <list>
#include <utility>

#include "imp/scanner/tokenkind.hpp"
#include "imp/scanner/scanner.hpp"
#include "imp/scanner/token.hpp"

TEST(ScannerTests, TestSmallProgram)
{
    // Arrange
    std::list<std::string> source =
    {
        "",
        "# En hyggelig hilsen",
        "navn = \"Kai\"",
        "print ('Hei, ', navn)"
    };

    std::list<Imp::TokenKind> expected =
    { 
        Imp::TokenKind::NameToken,
        Imp::TokenKind::EqualToken,
        Imp::TokenKind::StringToken,
        Imp::TokenKind::NewLineToken,
        Imp::TokenKind::NameToken,
        Imp::TokenKind::LeftParToken,
        Imp::TokenKind::StringToken,
        Imp::TokenKind::CommaToken,
        Imp::TokenKind::NameToken, 
        Imp::TokenKind::RightParToken,
        Imp::TokenKind::NewLineToken,
        Imp::TokenKind::EofToken
    };

    Imp::Scanner scanner(source);
    auto iter = expected.begin();

    do
    {
        scanner.ReadNextToken();
        EXPECT_EQ(*iter, scanner.CurToken()->Kind());
        ++iter;
    } while(scanner.CurToken()->Kind() != Imp::TokenKind::EofToken);
}

TEST(ScannerTests, TestStringLiteral)
{
    // Arrange
    std::list<std::string> source =
    {
        "\"Kai Braaten\"",
        "'Kai Braaten'"
    };
    std::string expected = "Kai Braaten";
    Imp::Scanner s(source);

    // Act
    s.ReadNextToken();
    auto t1 = s.CurToken();
    s.ReadNextToken(); // skip NEWLINE
    s.ReadNextToken();
    auto t2 = s.CurToken();

    // Assert
    EXPECT_EQ(Imp::TokenKind::StringToken, t1->Kind());
    EXPECT_EQ(Imp::TokenName(Imp::TokenKind::StringToken), Imp::TokenName(t1->Kind()));
    EXPECT_EQ(1, t1->LineNum());
    EXPECT_EQ(expected, t1->StringLit());

    EXPECT_EQ(Imp::TokenKind::StringToken, t2->Kind());
    EXPECT_EQ(Imp::TokenName(Imp::TokenKind::StringToken), Imp::TokenName(t2->Kind()));
    EXPECT_EQ(2, t2->LineNum());
    EXPECT_EQ(expected, t2->StringLit());
}
