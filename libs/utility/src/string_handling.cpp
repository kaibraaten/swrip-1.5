#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <sstream>
#include <algorithm>
#include <functional>
#include <cctype>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <cassert>

#include "utility.hpp"
#include "sha256.hpp"

using STRING_COMPARATOR = std::function<int(const std::string &, const std::string &)>;
using STRING_TOKENIZER = std::function<std::string(const std::string &, std::string &)>;

static std::string GetNextChunk(std::string &str, const char c);
static std::string OneArgument2(const std::string &argument, std::string &arg_first);
static int IsName2(const std::string &, const std::string &);
static int IsName2Prefix(const std::string &, const std::string &);
static int IsNameInternal(const std::string &, const std::string &,
                          STRING_COMPARATOR, STRING_TOKENIZER);
static int NiftyIsNameInternal(const std::string &, const std::string &,
                               STRING_COMPARATOR, STRING_TOKENIZER);

/*
 * See if a string is one of the names of an object.
 */
static int IsNameInternal(const std::string &str, const std::string &namelist,
                          STRING_COMPARATOR compare_string,
                          STRING_TOKENIZER tokenize_string)
{
    std::string name;
    std::string tmp = namelist;

    for(; ; )
    {
        tmp = tokenize_string(tmp, name);

        if(name.empty())
        {
            return false;
        }

        if(!compare_string(str, name))
        {
            return true;
        }
    }
}

int IsName(const std::string &str, const std::string &namelist)
{
    if(StrCmp(str, namelist) == 0)
    {
        return true;
    }
    else
    {
        return IsNameInternal(str, namelist, StrCmp, OneArgument);
    }
}

int IsNamePrefix(const std::string &str, const std::string &namelist)
{
    if(StrCmp(str, namelist) == 0)
    {
        return true;
    }
    else
    {
        return IsNameInternal(str, namelist, StringPrefix, OneArgument);
    }
}

/*
 * See if a string is one of the names of an object.            -Thoric
 * Treats a dash as a word delimiter as well as a space
 */
static int IsName2(const std::string &str, const std::string &namelist)
{
    return IsNameInternal(str, namelist, StrCmp, OneArgument2);
}

static int IsName2Prefix(const std::string &str, const std::string &namelist)
{
    return IsNameInternal(str, namelist, StringPrefix, OneArgument2);
}

/*                                                              -Thoric
 * Checks if str is a name in namelist supporting multiple keywords
 */
static int NiftyIsNameInternal(const std::string &str, const std::string &namelist,
                               STRING_COMPARATOR compare_string,
                               STRING_TOKENIZER tokenize_string)
{
    if(str.empty())
    {
        return false;
    }

    std::string tmp = str;
    std::string name;

    for(; ; )
    {
        tmp = tokenize_string(tmp, name);

        if(name.empty())
        {
            return true;
        }

        if(!compare_string(name, namelist))
        {
            return false;
        }
    }
}

int NiftyIsName(const std::string &str, const std::string &namelist)
{
    if(StrCmp(str, namelist) == 0)
    {
        return true;
    }
    else
    {
        return NiftyIsNameInternal(str, namelist, IsName2, OneArgument2);
    }
}

int NiftyIsNamePrefix(const std::string &str, const std::string &namelist)
{
    if(StrCmp(str, namelist) == 0)
    {
        return true;
    }
    else
    {
        return NiftyIsNameInternal(str, namelist, IsName2Prefix, OneArgument2);
    }
}

/*
 * Removes the tildes from a string.
 * Used for player-entered strings that go into disk files.
 */
std::string SmashTilde(std::string &str)
{
    ReplaceChar(str, '~', '-');
    return str;
}

/*
 * Compare strings, case insensitive.
 * Return true if different
 *   (compatibility with historical functions).
 */
int StrCmp(const std::string &first, const std::string &second)
{
#ifdef HAVE_STRCASECMP
    return strcasecmp(first.c_str(), second.c_str());
#else
    return strcmp(ToUpper(first).c_str(), ToUpper(second).c_str());
#endif
}

/*
 * Compare strings, case insensitive, for prefix matching.
 * Return true if astr not a prefix of bstr
 *   (compatibility with historical functions).
 */
int StringPrefix(const std::string &needle, const std::string &haystack)
{
    int match = 1;

    if(haystack.size() >= needle.size()
       && !StrCmp(needle, haystack.substr(0, needle.size())))
    {
        match = 0;
    }

    return match;
}

/*
 * Compare strings, case insensitive, for match anywhere.
 * Returns true is astr not part of bstr.
 *   (compatibility with historical functions).
 */
int StringInfix(const std::string &needle,
                const std::string &haystackRef)
{
    std::string haystack = haystackRef;
    int match = 1;

    while(!haystack.empty())
    {
        std::string token = GetNextChunk(haystack, ' ');

        if(!StringPrefix(needle, token))
        {
            match = 0;
            break;
        }
    }

    return match;
}

/*
 * Compare strings, case insensitive, for suffix matching.
 * Return true if astr not a suffix of bstr
 *   (compatibility with historical functions).
 */
int StringSuffix(const std::string &astr, const std::string &bstr)
{
    const size_t sstr1 = astr.size();
    const size_t sstr2 = bstr.size();
    const char *bstr_ptr = bstr.c_str();

    if(sstr1 <= sstr2 && !StrCmp(astr, bstr_ptr + sstr2 - sstr1))
    {
        return false;
    }
    else
    {
        return true;
    }
}

/*
 * Returns an initial-capped string.
 * Rewritten by FearItself@AvP
 */
std::string Capitalize(const std::string &argument)
{
    char buf[MAX_STRING_LENGTH];
    const char *str = argument.c_str();
    char *dest = buf;
    enum
    {
        Normal, Color
    } state = Normal;
    bool bFirst = true;
    char c = 0;

    while((c = *str++))
    {
        if(state == Normal)
        {
            if(c == '&' || c == '^')
            {
                state = Color;
            }
            else if(isalpha(c))
            {
                c = bFirst ? toupper(c) : c;
                bFirst = false;
            }
        }
        else
        {
            state = Normal;
        }

        *dest++ = c;
    }

    *dest = c;

    return buf;
}

std::string ToLower(std::string str)
{
    transform(str.begin(), str.end(), str.begin(), tolower);
    return str;
}

std::string ToUpper(std::string str)
{
    transform(str.begin(), str.end(), str.begin(), toupper);
    return str;
}

/*
 * Returns true or false if a letter is a vowel                 -Thoric
 */
static bool isavowel(char letter)
{
    char c = tolower((int)letter);

    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
        return true;
    else
        return false;
}

/*
 * Shove either "a " or "an " onto the beginning of a string    -Thoric
 */
std::string AOrAn(const std::string &str)
{
    std::string temp;

    if(isavowel(str[0])
       || (str.size() > 1 && tolower((int)str[0]) == 'y'
           && !isavowel(str[1])))
    {
        temp = "an ";
    }
    else
    {
        temp = "a ";
    }

    return temp + str;
}

void ReplaceChar(std::string &buf, char replace, char with)
{
    for(size_t i = 0; i < buf.size(); ++i)
    {
        if(buf[i] == replace)
        {
            buf[i] = with;
        }
    }
}

bool IsNumber(const std::string &arg)
{
    if(arg.empty())
        return false;

    for(char letter : arg)
    {
        if(!isdigit((int)letter)
           && letter != '.'
           && letter != ','
           && letter != '+'
           && letter != '-')
            return false;
    }

    return true;
}

int NumberArgument(const std::string &orig_argument, std::string &arg)
{
    char argument[MAX_STRING_LENGTH];
    sprintf(argument, "%s", orig_argument.c_str());

    for(char *pdot = argument; *pdot != '\0'; pdot++)
    {
        if(*pdot == '.')
        {
            *pdot = '\0';
            const int number = strtol(argument, nullptr, 10);
            *pdot = '.';
            arg = pdot + 1;
            return number;
        }
    }

    arg = argument;
    return 1;
}

std::string OneArgument(const std::string &argument, std::string &arg_first)
{
    std::string::const_iterator argp = argument.begin();
    arg_first.erase();

    while(argp != argument.end() && isspace(*argp))
        ++argp;

    char cEnd = ' ';

    if(argp != argument.end() && (*argp == '\'' || *argp == '"'))
        cEnd = *argp++;

    while(argp != argument.end())
    {
        if(*argp == cEnd)
        {
            ++argp;
            break;
        }

        arg_first.append(1, *argp);
        ++argp;
    }

    while(argp != argument.end() && isspace(*argp))
        ++argp;

    return std::string(argp, argument.end());
}

std::vector<char> StringToVector(const std::string &original)
{
    return std::vector<char>(original.c_str(),
                             original.c_str() + original.size() + 1);
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.  Delimiters = { ' ', '-' }
 */
static std::string OneArgument2(const std::string &argument, std::string &arg_first)
{
    std::string::const_iterator argp = argument.begin();
    arg_first.erase();

    while(argp != argument.end() && isspace(*argp))
        ++argp;

    char cEnd = ' ';

    if(argp != argument.end() && (*argp == '\'' || *argp == '"'))
        cEnd = *argp++;

    while(argp != argument.end())
    {
        if(*argp == cEnd || *argp == '-')
        {
            ++argp;
            break;
        }

        arg_first.append(1, *argp);
        ++argp;
    }

    while(argp != argument.end() && isspace(*argp))
        ++argp;

    return std::string(argp, argument.end());
}

/*
 * Remove carriage returns from a line
 */
std::string StripCarriageReturn(const std::string &arg)
{
    char newstr[MAX_STRING_LENGTH] = { '\0' };
    int j = 0;
    const char *str = arg.c_str();

    for(int i = 0; str[i] != '\0'; i++)
    {
        if(str[i] != '\r')
        {
            newstr[j++] = str[i];
        }
    }

    newstr[j] = '\0';
    return newstr;
}

/*
 * Removes the tildes from a line, except if it's the last character.
 */
std::string SmushTilde(std::string &str)
{
    const size_t positionOfLastCharacter = str.empty() ? 0 : str.size() - 1;

    for(size_t i = 0; i < str.size(); ++i)
    {
        if(str[i] == '~' && i != positionOfLastCharacter)
        {
            str[i] = '-';
        }
    }

    return str;
}

std::string EncodeString(const std::string &str)
{
    return sha256_crypt(str);
}

/*
 * custom CopyString using create                                  -Thoric
 */
char *CopyString(const std::string &str)
{
    static char *ret = nullptr;
    AllocateMemory(ret, char, strlen(str.c_str()) + 1);
    strcpy(ret, str.c_str());
    return ret;
}

std::string TrimStringStart(const std::string &str, char junk)
{
    const auto strBegin = str.find_first_not_of(junk);

    if(strBegin == std::string::npos)
        return ""; // no content

    return str.substr(strBegin);
}

std::string TrimStringEnd(const std::string &str, char junk)
{
    const auto strEnd = str.find_last_not_of(junk);

    return str.substr(0, strEnd + 1);
}

std::string TrimString(const std::string &str, char junk)
{
    const auto strBegin = str.find_first_not_of(junk);

    if(strBegin == std::string::npos)
        return ""; // no content

    const auto strEnd = str.find_last_not_of(junk);
    const auto strRange = strEnd - strBegin + 1;

    return str.substr(strBegin, strRange);
}

/*
 * Find the position of a target substring in a source string.
 * Returns pointer to the first occurrence of the string pointed to
 * bstr in the string pointed to by astr. It returns a null pointer
 * if no match is found.  --  Gorog (with help from Thoric)
 *
 * Note I made a change when modifying StringInfix. If the target string is
 * null, I return NULL (meaning no match was found). StringInfix returns
 * false (meaning a match was found).  *grumble*
 */
static const char *str_str(const char *astr, const char *bstr)
{
    const char c0 = CharToLowercase(bstr[0]);

    if(c0 == '\0')
    {
        return nullptr;
    }

    const size_t sstr1 = strlen(astr);
    const size_t sstr2 = strlen(bstr);

    for(size_t ichar = 0; ichar <= sstr1 - sstr2; ++ichar)
    {
        if(c0 == CharToLowercase(astr[ichar]) && !StringPrefix(bstr, astr + ichar))
        {
            return astr + ichar;
        }
    }

    return nullptr;
}

/*
 * Counts the number of times a target string occurs in a source string.
 * case insensitive -- Gorog
 */
int CountStringOccurances(const std::string &source, const std::string &target)
{
    const char *psource = source.c_str();
    const char *ptarget = target.c_str();
    const char *ptemp = psource;
    int count = 0;

    while((ptemp = str_str(ptemp, ptarget)))
    {
        ptemp++;
        count++;
    }

    return count;
}

bool IsNullOrEmpty(const char *str)
{
    return str == nullptr || str[0] == '\0';
}

static std::string GetNextChunk(std::string &str, const char c)
{
    std::string::size_type pos = str.find(c);
    std::string line = str.substr(0, pos);

    if(pos == std::string::npos)
    {
        str.erase();
    }
    else
    {
        str.erase(0, pos + 1);
    }

    return line;
}

std::vector<char> CreateFmtBuffer(const char *fmt, va_list va)
{
    va_list va_tmp;
    va_copy(va_tmp, va);
    std::vector<char> buf(vsnprintf(0, 0, fmt, va_tmp) + 1);
    va_end(va_tmp);

    vsnprintf(&buf[0], buf.size(), fmt, va);

    return buf;
}

std::string FormatString(const char *fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    std::vector<char> buf = CreateFmtBuffer(fmt, va);
    va_end(va);

    return &buf[0];
}

std::string CenterString(const std::string &txt, size_t width, char pad)
{
    std::ostringstream output;

    output << std::string(width / 2 - txt.size() / 2, pad);
    output << txt;
    output << std::string(width - output.str().size(), pad);

    return output.str();
}

static char *grab_word(char *argument, char *arg_first)
{
    char cEnd = ' ';
    short count = 0;

    while(isspace((int)*argument))
        argument++;

    if(*argument == '\'' || *argument == '"')
        cEnd = *argument++;

    while(*argument != '\0' || ++count >= 255)
    {
        if(*argument == cEnd)
        {
            argument++;
            break;
        }

        *arg_first++ = *argument++;
    }

    *arg_first = '\0';

    while(isspace((int)*argument))
        argument++;

    return argument;
}

std::string WordWrap(const std::string &stl_txt, unsigned short wrap)
{
    std::vector<char> txt = StringToVector(stl_txt);
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char *bufp = buf;

    if(!txt.empty())
    {
        char line[MAX_STRING_LENGTH] = { '\0' };
        char temp[MAX_STRING_LENGTH] = { '\0' };
        char *ptr = &txt[0];

        ++bufp;
        line[0] = '\0';

        while(*ptr)
        {
            size_t ln = strlen(line);
            ptr = grab_word(ptr, temp);
            size_t x = strlen(temp);

            if((ln + x + 1) < wrap)
            {
                if(ln > 0 && line[ln - 1] == '.')
                {
                    strcat(line, " ");
                }
                else
                {
                    strcat(line, " ");
                }

                strcat(line, temp);
                const char *p = strchr(line, '\n');

                if(!p)
                {
                    p = strchr(line, '\r');
                }

                if(p)
                {
                    strcat(buf, line);
                    line[0] = '\0';
                }
            }
            else
            {
                strcat(line, "\r\n");
                strcat(buf, line);
                strcpy(line, temp);
            }
        }

        if(line[0] != '\0')
        {
            strcat(buf, line);
        }
    }

    return bufp;
}

bool StringEndsWith(const std::string &str, const std::string &ending)
{
    return !StringSuffix(ending, str);
}

void ReplaceAll(std::string &doc, const std::string &original,
                const std::string &replacement)
{
    std::string::size_type pos = 0;

    while((pos = doc.find(original, pos)) != std::string::npos)
    {
        doc.replace(pos, original.size(), replacement);
        pos += replacement.size();
    }
}
