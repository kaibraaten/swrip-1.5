#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "imp/scanner/tokenkind.hpp"
#include "imp/except/scannerexception.hpp"

TEST(TokenKindTests, TokenFromName)
{
    // Arrange
    auto expected = Imp::TokenKind::AndToken;
    
    // Act
    auto actual = Imp::TokenFromName("and");

    // Assert
    EXPECT_EQ(expected, actual);
}

TEST(TokenKindTests, TokenNameUnknownNameThrowsException)
{
    EXPECT_THROW(Imp::TokenFromName("DOES NOT EXIST!"), Imp::ScannerException);
}

TEST(TokenKindTests, TokenName)
{
    // Arrange
    std::string expected = "NEWLINE";

    // Act
    auto actual = Imp::TokenName(Imp::TokenKind::NewLineToken);

    // Assert
    EXPECT_EQ(expected, actual);
}
