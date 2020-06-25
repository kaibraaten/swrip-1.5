#ifndef _SWR_UTILITY_HPP_
#define _SWR_UTILITY_HPP_

#ifndef __GNUC__
#define __attribute__(a)
#endif

#include <functional>
#include <vector>
#include <string>
#include <bitset>
#include <initializer_list>
#include <cstdio>
#include <cstdlib>
#include <cstdarg>
#include <utility/types.hpp>
#include <utility/vector3.hpp>
#include <utility/os.hpp>
#include <utility/linkedlist.hpp>
#include <utility/oldrepository.hpp>
#include <utility/logger.hpp>

/*
 * String and memory management parameters.
 */
constexpr auto MAX_KEY_HASH = 2048;
constexpr auto MAX_STRING_LENGTH = 4096;  /* buf */
constexpr auto MAX_INPUT_LENGTH = 1024;  /* arg */
constexpr auto MAX_INBUF_SIZE = 1024;

#if     !defined(BERR)
#define BERR     255
#endif

/*
 * Utility macros.
 */

#define SetBit(var, bit)       ((var) |= (bit))
#define RemoveBit(var, bit)    ((var) &= ~(bit))
#define ToggleBit(var, bit)    ((var) ^= (bit))

bool IsBitSet(unsigned long flags, size_t bit);

/*
 * Memory allocation macros.
 */

 /*
  * NOTE: Do NOT change from calloc to malloc. This will lead to undefined
  * behaviour because a lot of the code assumes the memory is initialized.
  */
#define AllocateMemory(result, type, number)                            \
do                                                              \
  {                                                               \
 if (!((result) = (type *) calloc ((number), sizeof(type))))  \
   { perror("calloc failure"); abort(); }                  \
  } while(0)

#define ReAllocateMemory(result,type,number)                            \
do                                                              \
  {                                                               \
 if (!((result) = (type *) realloc ((result), sizeof(type) * (number))))\
   { perror("realloc failure"); abort(); }                 \
  } while(0)


#define FreeMemory(point)                                          \
do                                                              \
  {                                                               \
    free(point);                                                  \
    point = NULL;                                                 \
  } while(0)

#if defined(KEY)
#undef KEY
#endif

#define KEY( literal, field, value )                                    \
  if ( !StrCmp( (word), (literal) ) )					\
    {                                       \
      (field) = (value);		    \
      fMatch = true;			    \
      break;				    \
    }

  /* double-linked list handling macros -Thoric */
#define LINK(link, first, last, next, prev)                     \
do                                                              \
  {                                                               \
 if ( !(first) )                                             \
   (first)                   = (link);                       \
 else                                                        \
   (last)->next              = (link);                       \
 (link)->next                = NULL;                         \
 (link)->prev                = (last);                       \
 (last)                      = (link);                       \
  } while(0)

#ifdef INSERT
#undef INSERT
#endif

#define INSERT(link, insert, first, next, prev)                 \
do                                                              \
  {                                                               \
 (link)->prev                = (insert)->prev;               \
 if ( !(insert)->prev )                                      \
   (first)                   = (link);                       \
 else                                                        \
   (insert)->prev->next      = (link);                       \
 (insert)->prev              = (link);                       \
 (link)->next                = (insert);                     \
  } while(0)

#define UNLINK(link, first, last, next, prev)                   \
do                                                              \
  {                                                               \
 if ( !(link)->prev )                                        \
   (first)                   = (link)->next;                 \
 else                                                        \
   (link)->prev->next        = (link)->next;                 \
 if ( !(link)->next )                                        \
   (last)                    = (link)->prev;                 \
 else                                                        \
   (link)->next->prev        = (link)->prev;                 \
  } while(0)

#define DikuForEach( ListType, head, next, callbackFunction, userData )     \
  do {                                                                  \
    ListType *tmpNext;                                                  \
    ListType *element;                                                  \
    for((element) = (head); (element); (element) = (tmpNext))           \
      {                                                                 \
	(tmpNext) = (element)->next;                                    \
	if((callbackFunction((element), (userData))) == 0)              \
	  {                                                             \
	    break;                                                      \
	  }                                                             \
      }                                                                 \
  } while(0)

/*
  This function allows the following kinds of bets to be made:

  Absolute bet
  ============

  bet 14k, bet 50m66, bet 100k

  Relative bet
  ============

  These bets are calculated relative to the current bet. The '+' symbol adds
  a certain number of percent to the current bet. The default is 25, so
  with a current bet of 1000, bet + gives 1250, bet +50 gives 1500 etc.
  Please note that the number must follow exactly after the +, without any
  spaces!

  The '*' or 'x' bet multiplies the current bet by the number specified,
  defaulting to 2. If the current bet is 1000, bet x  gives 2000, bet x10
  gives 10,000 etc.

*/
int ParseBet(const int currentbet, const std::string &s);

/**
 * \brief Return the lesser of two values.
 * \tparam A
 * \tparam B
 * \param check The first value to compare.
 * \param ncheck The second value to compare.
 * \return The lesser value.
 */
template<typename A, typename B>
auto umin(const A &check, const B &ncheck)
{
    return check < ncheck ? check : ncheck;
}

/**
 * \brief Return the greater of two values.
 * \tparam A
 * \tparam B
 * \param check The first value to compare.
 * \param ncheck The second value to compare.
 * \return The greater value.
 */
template<typename A, typename B>
auto umax(const A &check, const B &ncheck)
{
    return check > ncheck ? check : ncheck;
}

/**
 * \brief "Clip" a value to stay within a certain range.
 * \tparam A
 * \tparam B
 * \tparam C
 * \param mincheck The minimum value of the range.
 * \param check The value to "clip".
 * \param maxcheck The maximum value of the range.
 * \return The clipped value.
 */
template<typename A, typename B, typename C>
B urange(const A &mincheck, const B &check, const C &maxcheck)
{
    if(check < mincheck)
        return mincheck;

    if(check > maxcheck)
        return maxcheck;

    return check;
}

/* string_handling.c */
std::string WordWrap(const std::string &txt, unsigned short wrap);

void ReplaceAll(std::string &doc, const std::string &original,
                const std::string &replacement);

/**
 * \brief Return true if an argument is completely numeric.
 */
bool IsNumber(const std::string &arg);

/**
 * \brief Given a string like 14.foo, return 14 and 'foo'.
 */
int NumberArgument(const std::string &argument, std::string &arg);

/**
 * \brief Pick off one argument from a string and return the rest. Understands quotes.
 *
 * \param argument The original string you want to be chopped up. Will not be modified.
 * \param arg_first The first argument.
 * \return The rest of the string after arg_first
 */
std::string OneArgument(const std::string &argument, std::string &arg_first);

int IsName(const std::string &str, const std::string &namelist);
int IsNamePrefix(const std::string &str, const std::string &namelist);

/**
 * \brief Returns true if all keywords in str exists in namelist.
 */
int NiftyIsName(const std::string &str, const std::string &namelist);

/**
 * \brief Returns true if the prefix of all keywords in str exists in namelist.
 */
int NiftyIsNamePrefix(const std::string &str, const std::string &namelist);

int StrCmp(const std::string &astr, const std::string &bstr);
int StringPrefix(const std::string &astr, const std::string &bstr);
int StringInfix(const std::string &astr, const std::string &bstr);
int StringSuffix(const std::string &astr, const std::string &bstr);
std::string Capitalize(const std::string &str);
std::string ToLower(std::string str);
std::string ToUpper(std::string str);
std::string AOrAn(const std::string &str);
std::string StripCarriageReturn(const std::string &str);
char *CopyString(const std::string &str);
int CountStringOccurances(const std::string &source, const std::string &target);
std::string SmashTilde(std::string &str);
std::string SmushTilde(std::string &str);
void ReplaceChar(std::string &str, char, char);
std::string EncodeString(const std::string &str);
std::string TrimStringStart(const std::string &str, char junk = ' ');
std::string TrimStringEnd(const std::string &str, char junk = ' ');
std::string TrimString(const std::string &str, char junk = ' ');
std::string Scramble(const std::string &argument, int modifier);
bool IsNullOrEmpty(const char *str);
std::string CenterString(const std::string &txt, size_t totalWidth, char pad);
std::string FormatString(const char *fmt, ...) __attribute__((format(printf, 1, 2)));
std::vector<char> CreateFmtBuffer(const char *fmt, va_list va);
std::vector<char> StringToVector(const std::string &);

/**
 * \brief Check if a string ends with a specified character sequence.
 * \param str The string to check.
 * \param ending The character sequence that we want to know if str ends with.
 * \return true if str ends with ending.
 */
bool StringEndsWith(const std::string &str, const std::string &ending);

/* file_io.c */
char ReadChar(FILE *fp, Logger *log, bool fBootDb);
float ReadFloat(FILE *fp, Logger *log, bool fBootDb);
int ReadInt(FILE *fp, Logger *log, bool fBootDb);
std::string ReadStringToTilde(FILE *fp, Logger *log, bool fBootDb);
void ReadToEndOfLine(FILE *fp, Logger *log, bool fBootDb);
std::string ReadWord(FILE *fp, Logger *log, bool fBootDb);
std::string ReadLine(FILE *fp, Logger *log, bool fBootDb);
void ForEachLuaFileInDir(const std::string &pathToDir,
                         const std::function<void(const std::string &, void *)> &doOnFile,
                         void *userData);
std::string ConvertToLuaFilename(const std::string &name);

/* misc stuff */
int Interpolate(int level, int value_00, int value_32);
char *StripColorCodes(char *text);
char CharToLowercase(char c);
char CharToUppercase(char c);

/**
 * \brief Convert a string into a long.
 *
 * Note that if the input isn't a valid number, the function
 * will return 0.
 *
 * \param str The input string.
 * \return The numeric representation of the input string.
 */
long ToLong(const std::string &str);

/**
 * \brief Based on a list of bits, create a bitset object.
 * \tparam N The size of the bitset. Ie, the number of bits.
 * \param args List of bits. For instance: {0, 5, 7, 23}
 * \return The newly constructed bitset.
 */
template<size_t N>
std::bitset<N> CreateBitSet(std::initializer_list<size_t> args)
{
    std::bitset<N> bs;

    for(size_t bit : args)
    {
        bs.set(bit);
    }

    return bs;
}

/**
 * \brief Takes a number such as 1234567890 and returns it as 1,234,567,890.
 * \param number The number to punctuate.
 * \return The punctuated number as a string.
 */
std::string PunctuateNumber(long number);

/* time_fun.c */
tm *UpdateTime(tm *old_time);
void SubtractTimes(timeval *etime, const timeval *start_time);
void StartTimer(timeval *start_time);
time_t StopTimer(timeval *start_time);

/**
 * \brief Create a string of space-separated bit names.
 *
 * The current implementation assumes exactly 32 bits, which means the
 * flagarray argument must also have at least 32 elements.
 *
 * \param bitvector All the flags packed into an integer.
 * \param flagarray An array containing the names of each bit.
 * \return A string such as: "name_of_bit1 name_of_bit7 name_of_bit30"
 */
std::string FlagString(int bitvector, const char *const flagarray[]);


/**
 * \brief Append text to a file.
 * \param file The name of the file.
 * \param str The text to append.
 */
void AppendToFile(const std::string &file, const std::string &str);

#endif /* include guard */
