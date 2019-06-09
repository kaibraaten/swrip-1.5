#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>

class StringHandlingTests : public ::testing::Test
{
protected:
    void SetUp() override
    {

    }

    void TearDown() override
    {

    }
};

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(StringHandlingTests, IsName)
{
    const std::string haystack = "joe bob johnny bubba jane";

    EXPECT_TRUE(IsName("joe", haystack));
    EXPECT_TRUE(IsName("johnny", haystack));
    EXPECT_TRUE(IsName("jane", haystack));
    EXPECT_TRUE(IsName("joe bob johnny bubba jane", haystack));

    EXPECT_FALSE(IsName("jo", haystack));
    EXPECT_FALSE(IsName("ob jo", haystack));
}

TEST_F(StringHandlingTests, IsNamePrefix)
{
    const std::string haystack = "joe bob johnny bubba jane";

    EXPECT_TRUE(IsNamePrefix("joe", haystack));
    EXPECT_TRUE(IsNamePrefix("john", haystack));
    EXPECT_TRUE(IsNamePrefix("j", haystack));
    EXPECT_TRUE(IsNamePrefix("joe bob johnny bubba jane", haystack));

    EXPECT_FALSE(IsNamePrefix("foobarbaz", haystack));
    EXPECT_FALSE(IsNamePrefix("ob jo", haystack));
}

TEST_F(StringHandlingTests, NiftyIsName)
{
    const std::string haystack = "joe bob johnny bubba jane";

    EXPECT_TRUE(NiftyIsName("joe", haystack));
    EXPECT_TRUE(NiftyIsName("joe bob", haystack));
    EXPECT_TRUE(NiftyIsName("joe jane", haystack));
    EXPECT_TRUE(NiftyIsName("jane joe", haystack));
    EXPECT_TRUE(NiftyIsName("joe bob johnny bubba jane", haystack));

    EXPECT_FALSE(NiftyIsName("joe foobarbaz", haystack));
}

TEST_F(StringHandlingTests, NiftyIsNamePrefix)
{
    const std::string haystack = "joe bob johnny bubba jane";

    EXPECT_TRUE(NiftyIsNamePrefix("joe", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("joe bob", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("joe jane", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("jane joe", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("joe bob johnny bubba jane", haystack));

    EXPECT_TRUE(NiftyIsNamePrefix("j", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("j b", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("joh jane", haystack));
    EXPECT_TRUE(NiftyIsNamePrefix("bub j", haystack));

    EXPECT_FALSE(NiftyIsNamePrefix("joe foobarbaz", haystack));
}
#endif

TEST_F(StringHandlingTests, SmashTilde)
{
    const std::string input = "This~is a st~ring.~";
    const std::string expected = "This-is a st-ring.-";
    std::string actual = input;

    SmashTilde(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(StringHandlingTests, SmushTilde)
{
    const std::string input = "This~is a st~ring.~";
    const std::string expected = "This-is a st-ring.~";
    std::string actual = input;

    SmushTilde(actual);

    EXPECT_EQ(expected, actual);
}

TEST_F(StringHandlingTests, StrCmp)
{
    const std::string str1 = "aaaa";
    const std::string str2 = "bbbb";

    EXPECT_EQ(StrCmp(str1, str1), 0);
    EXPECT_LT(StrCmp(str1, str2), 0);
    EXPECT_GT(StrCmp(str2, str1), 0);
    EXPECT_EQ(StrCmp("", ""), 0);
    EXPECT_LT(StrCmp("", str2), 0);
    EXPECT_GT(StrCmp(str2, ""), 0);
    EXPECT_EQ(StrCmp("AaA", "aAa"), 0);
}

TEST_F(StringHandlingTests, StringPrefix)
{
    EXPECT_EQ(0, StringPrefix("John", "Johnny"));
    EXPECT_EQ(0, StringPrefix("", "Johnny"));
    EXPECT_EQ(0, StringPrefix("", ""));

    EXPECT_NE(0, StringPrefix("Johnny", "John"));
    EXPECT_NE(0, StringPrefix("John", ""));
}

TEST_F(StringHandlingTests, StringInfix)
{
    const std::string haystack = "joe bob johnny bubba jane";

    EXPECT_EQ(0, StringInfix("bob", haystack));
    EXPECT_EQ(0, StringInfix("bo", haystack));

    EXPECT_NE(0, StringInfix("ob joh", haystack));
    EXPECT_NE(0, StringInfix("bob johnny", haystack));
}

TEST_F(StringHandlingTests, StringSuffix)
{
    EXPECT_EQ(0, StringSuffix("hnny", "Johnny"));
    EXPECT_EQ(0, StringSuffix("", "Johnny"));
    EXPECT_EQ(0, StringSuffix("", ""));

    EXPECT_NE(0, StringSuffix("Johnny", "John"));
    EXPECT_NE(0, StringSuffix("John", ""));
}

TEST_F(StringHandlingTests, Capitalize)
{
    EXPECT_EQ("Bob", Capitalize("bob"));
    EXPECT_EQ("Bob", Capitalize("Bob"));

    EXPECT_NE("BOB", Capitalize("bob"));
}

TEST_F(StringHandlingTests, ToLower)
{
    EXPECT_EQ("bob", ToLower("BOB"));
    EXPECT_EQ("bob", ToLower("bob"));
    EXPECT_EQ("bob", ToLower("bOB"));
}

TEST_F(StringHandlingTests, ToUpper)
{
    EXPECT_EQ("BOB", ToUpper("BOB"));
    EXPECT_EQ("BOB", ToUpper("bob"));
    EXPECT_EQ("BOB", ToUpper("bOB"));
}

TEST_F(StringHandlingTests, AOrAn)
{
    EXPECT_EQ("a fish", AOrAn("fish"));
    EXPECT_EQ("an apple", AOrAn("apple"));
    EXPECT_EQ("a yoke", AOrAn("yoke"));
}

TEST_F(StringHandlingTests, ReplaceChar)
{
    std::string buf = "My, oh my what a mess!";

    ReplaceChar(buf, 'm', 'w');

    EXPECT_EQ("My, oh wy what a wess!", buf);
}

TEST_F(StringHandlingTests, IsNumber)
{
    EXPECT_TRUE(IsNumber("123"));
    EXPECT_TRUE(IsNumber("+123"));
    EXPECT_TRUE(IsNumber("-123"));
    EXPECT_TRUE(IsNumber("-1,200.58"));

    EXPECT_FALSE(IsNumber("NotANumber"));
}

TEST_F(StringHandlingTests, NumberArgument)
{
    std::string buf;
    int number = NumberArgument("foo", buf);
    EXPECT_EQ(1, number);
    EXPECT_EQ("foo", buf);

    number = NumberArgument("14.foo", buf);
    EXPECT_EQ(14, number);
    EXPECT_EQ("foo", buf);

    number = NumberArgument("-14.foo", buf);
    EXPECT_EQ(-14, number);
    EXPECT_EQ("foo", buf);
}

TEST_F(StringHandlingTests, OneArgument)
{
    std::string original = "find 14 apples";
    std::string head;
    std::string remainder;

    remainder = OneArgument(original, head);

    EXPECT_EQ(original, "find 14 apples");
    EXPECT_EQ(head, "find");
    EXPECT_EQ(remainder, "14 apples");
}

TEST_F(StringHandlingTests, OneArgumentEmptyArgument)
{
    std::string original;
    std::string head;
    std::string remainder;

    remainder = OneArgument(original, head);
    remainder = OneArgument(original, head);
    
    EXPECT_EQ(original, "");
    EXPECT_EQ(head, "");
    EXPECT_EQ(remainder, "");
}

TEST_F(StringHandlingTests, OneArgument_WithQuotes)
{
    std::string original = "'find 14 apples' for me";
    std::string head;
    std::string remainder;

    remainder = OneArgument(original, head);

    EXPECT_EQ(original, "'find 14 apples' for me");
    EXPECT_EQ(head, "find 14 apples");
    EXPECT_EQ(remainder, "for me");
}

TEST_F(StringHandlingTests, CopyString)
{
    const char *original = "This is a string!";

    char *target = CopyString(original);

    EXPECT_STREQ(original, target);

    FreeMemory(target);
}

TEST_F(StringHandlingTests, CountStringOccurances)
{
    const char *haystack = "my haystack my haystack my precious";
    const char *needle = "my";
    const int expected = 3;

    const int actual = CountStringOccurances(haystack, needle);

    EXPECT_EQ(expected, actual);
}

TEST_F(StringHandlingTests, IsNullOrEmpty)
{
    const char empty[1] = { '\0' };
    const char *null = nullptr;
    const char *containsSomething = "Something";

    EXPECT_TRUE(IsNullOrEmpty(empty));
    EXPECT_TRUE(IsNullOrEmpty(null));
    EXPECT_FALSE(IsNullOrEmpty(containsSomething));
}

TEST_F(StringHandlingTests, TrimStringStart)
{
    {
        std::string original = "   Starts here.";

        std::string result = TrimStringStart(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "---Starts here.";

        std::string result = TrimStringStart(original, '-');

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "Starts here.";

        std::string result = TrimStringStart(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "";

        std::string result = TrimStringStart(original);

        EXPECT_EQ(result, "");
    }
}

TEST_F(StringHandlingTests, TrimStringEnd)
{
    {
        std::string original = "Starts here.    ";

        std::string result = TrimStringEnd(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "Starts here.----";

        std::string result = TrimStringEnd(original, '-');

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "Starts-here.";

        std::string result = TrimStringEnd(original, '-');

        EXPECT_EQ(result, "Starts-here.");
    }
    {
        std::string original = "";

        std::string result = TrimStringEnd(original);

        EXPECT_EQ(result, "");
    }
}

TEST_F(StringHandlingTests, TrimString)
{
    {
        std::string original = "        Starts here.    ";

        std::string result = TrimString(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "        Starts here.";

        std::string result = TrimString(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "Starts here.    ";

        std::string result = TrimString(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "Starts here.";

        std::string result = TrimString(original);

        EXPECT_EQ(result, "Starts here.");
    }
    {
        std::string original = "";

        std::string result = TrimString(original);

        EXPECT_EQ(result, "");
    }
}

TEST_F(StringHandlingTests, StringEndsWith)
{
    /// Arrange
    const std::string stringToCheck = "Check if with string ends with disaster";
    const std::string ending = "disaster";

    // Act
    const bool hadExpectedEnding = StringEndsWith(stringToCheck, ending);

    // Assert
    EXPECT_TRUE(hadExpectedEnding);
}
