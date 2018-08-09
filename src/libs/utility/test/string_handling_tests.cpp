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

TEST_F(StringHandlingTests, IsName)
{
  const std::string haystack = "joe bob johnny bubba jane";

  EXPECT_TRUE(IsName("joe", haystack));
  EXPECT_TRUE(IsName("johnny", haystack));
  EXPECT_TRUE(IsName("jane", haystack));

  EXPECT_FALSE(IsName("jo", haystack));
  EXPECT_FALSE(IsName("ob jo", haystack));
}

TEST_F(StringHandlingTests, IsNamePrefix)
{
  const std::string haystack = "joe bob johnny bubba jane";

  EXPECT_TRUE(IsNamePrefix("joe", haystack));
  EXPECT_TRUE(IsNamePrefix("john", haystack));
  EXPECT_TRUE(IsNamePrefix("j", haystack));

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
  
  EXPECT_FALSE(NiftyIsName("joe foobarbaz", haystack));
}

TEST_F(StringHandlingTests, NiftyIsNamePrefix)
{
  const std::string haystack = "joe bob johnny bubba jane";

  EXPECT_TRUE(NiftyIsNamePrefix("joe", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("joe bob", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("joe jane", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("jane joe", haystack));

  EXPECT_TRUE(NiftyIsNamePrefix("j", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("j b", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("joh jane", haystack));
  EXPECT_TRUE(NiftyIsNamePrefix("bub j", haystack));
  
  EXPECT_FALSE(NiftyIsNamePrefix("joe foobarbaz", haystack));
}

TEST_F(StringHandlingTests, SmashTilde)
{
  char buffer[1024];
  char *pointer = buffer;
  const char *input = "This~is a st~ring.~";
  const char *expected = "This-is a st-ring.-";
  strcpy(pointer, input);

  SmashTilde(pointer);

  EXPECT_STREQ(expected, pointer);
}

TEST_F(StringHandlingTests, HideTilde)
{
  char buffer[1024];
  char *pointer = buffer;
  const char *input = "This~is a st~ring.~";
  const char *expected = "This*is a st*ring.*";
  strcpy(pointer, input);

  HideTilde(pointer);

  EXPECT_STREQ(expected, pointer);
}

TEST_F(StringHandlingTests, ShowTilde)
{
  char buffer[1024];
  char *pointer = buffer;
  const char *input = "This*is a st*ring.*";
  const char *expected = "This~is a st~ring.~";
  strcpy(pointer, input);

  const std::string actual = ShowTilde(pointer);

  EXPECT_STREQ(expected, actual.c_str());
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
  EXPECT_STREQ("Bob", Capitalize("bob"));
  EXPECT_STREQ("Bob", Capitalize("Bob"));

  EXPECT_STRNE("BOB", Capitalize("bob"));
}

TEST_F(StringHandlingTests, ToLower)
{
  EXPECT_STREQ("bob", ToLower("BOB").c_str());
  EXPECT_STREQ("bob", ToLower("bob").c_str());
  EXPECT_STREQ("bob", ToLower("bOB").c_str());
}

TEST_F(StringHandlingTests, ToUpper)
{
  EXPECT_STREQ("BOB", ToUpper("BOB").c_str());
  EXPECT_STREQ("BOB", ToUpper("bob").c_str());
  EXPECT_STREQ("BOB", ToUpper("bOB").c_str());
}

TEST_F(StringHandlingTests, AOrAn)
{
  EXPECT_STREQ("a fish", AOrAn("fish"));
  EXPECT_STREQ("an apple", AOrAn("apple"));
  EXPECT_STREQ("a yoke", AOrAn("yoke"));
}

TEST_F(StringHandlingTests, ReplaceChar)
{
  char buf[1024];
  strcpy(buf, "My, oh my what a mess!");

  ReplaceChar(buf, 'm', 'w');

  EXPECT_STREQ("My, oh wy what a wess!", buf);
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
  char buf[1024];
  int number = NumberArgument("foo", buf);
  EXPECT_EQ(1, number);
  EXPECT_STREQ("foo", buf);
  
  number = NumberArgument("14.foo", buf);
  EXPECT_EQ(14, number);
  EXPECT_STREQ("foo", buf);

  number = NumberArgument("-14.foo", buf);
  EXPECT_EQ(-14, number);
  EXPECT_STREQ("foo", buf);
}

TEST_F(StringHandlingTests, OneArgument)
{
  char original[1024];
  strcpy(original, "find 14 apples");

  char head[1024];
  char arg2[1024];
  char *remainder = arg2;

  remainder = OneArgument(original, head);

  EXPECT_STREQ(original, "find 14 apples");
  EXPECT_STREQ(head, "find");
  EXPECT_STREQ(remainder, "14 apples");
}

TEST_F(StringHandlingTests, OneArgument_WithQuotes)
{
  char original[1024];
  strcpy(original, "'find 14 apples' for me");

  char head[1024];
  char arg2[1024];
  char *remainder = arg2;

  remainder = OneArgument(original, head);

  EXPECT_STREQ(original, "'find 14 apples' for me");
  EXPECT_STREQ(head, "find 14 apples");
  EXPECT_STREQ(remainder, "for me");
}

TEST_F(StringHandlingTests, CopyString)
{
  const char *original = "This is a string!";

  char *target = CopyString(original);

  EXPECT_STREQ(original, target);

  FreeMemory(target);
}

TEST_F(StringHandlingTests, TrimStringStart)
{
  {
    char buf[1024];
    char *original = buf;
    strcpy(original, "   Starts here.");

    char *result = TrimStringStart(original);

    EXPECT_STREQ(result, "Starts here.");
  }
  {
    char buf[1024];
    char *original = buf;
    strcpy(original, "---Starts here.");

    char *result = TrimStringStart(original, '-');

    EXPECT_STREQ(result, "Starts here.");
  }
}

TEST_F(StringHandlingTests, TrimStringEnd)
{
  {
    char buf[1024];
    char *original = buf;
    strcpy(original, "Starts here.    ");

    char *result = TrimStringEnd(original);

    EXPECT_STREQ(result, "Starts here.");
  }
  {
    char buf[1024];
    char *original = buf;
    strcpy(original, "Starts here.----");

    char *result = TrimStringEnd(original, '-');

    EXPECT_STREQ(result, "Starts here.");
  }
}

TEST_F(StringHandlingTests, TrimString)
{
  char buf[1024];
  char *original = buf;
  strcpy(original, "        Starts here.    ");

  char *result = TrimString(original);

  EXPECT_STREQ(result, "Starts here.");
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
