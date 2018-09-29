#ifndef _SWR_UTILITY_HPP_
#define _SWR_UTILITY_HPP_

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
#define MAX_KEY_HASH             2048
#define MAX_STRING_LENGTH        4096  /* buf */
#define MAX_INPUT_LENGTH         1024  /* arg */
#define MAX_INBUF_SIZE           1024

#if     !defined(BERR)
#define BERR     255
#endif

/*
 * Utility macros.
 */
char CharToLowercase( char c );
char CharToUppercase( char c );

#define SetBit(var, bit)       ((var) |= (bit))
#define RemoveBit(var, bit)    ((var) &= ~(bit))
#define ToggleBit(var, bit)    ((var) ^= (bit))

bool IsBitSet( unsigned long flags, size_t bit );

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

#define ForEach( ListType, head, next, callbackFunction, userData )     \
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

int ParseBet(const int currentbet, const std::string &s);
int umin( int check, int ncheck );
int umax( int check, int ncheck );
int urange( int mincheck, int check, int maxcheck );

/* string_handling.c */
std::string WordWrap(const std::string &txt, unsigned short wrap);
bool IsNumber(const std::string &arg);
int NumberArgument( const std::string &argument, std::string &arg );
//char *OneArgument( char *argument, char *arg_first );
std::string OneArgument( const std::string&, std::string& );
int IsName(const std::string &str, const std::string &namelist);
int IsNamePrefix(const std::string &str, const std::string &namelist);

// Returns true if all keywords in str exists in namelist.
int NiftyIsName(const std::string &str, const std::string &namelist);

// Returns true if the prefix of all keywords in str exists in namelist.
int NiftyIsNamePrefix(const std::string &str, const std::string &namelist);
int StrCmp(const std::string &astr, const std::string &bstr);
int StringPrefix(const std::string &astr, const std::string &bstr);
int StringInfix(const std::string &astr, const std::string &bstr);
int StringSuffix(const std::string &astr, const std::string &bstr);
std::string Capitalize( const std::string &str );
std::string ToLower( std::string str );
std::string ToUpper( std::string str );
std::string AOrAn( const std::string &str );
std::string StripCarriageReturn(const std::string &str);
char *CopyString( const std::string &str );
int CountStringOccurances(const std::string &source, const std::string &target);
std::string SmashTilde( std::string &str );
std::string SmushTilde( std::string &str );
void ReplaceChar( std::string &str, char, char );
std::string EncodeString( const std::string &str );
std::string TrimStringStart( const std::string &str, char junk = ' ' );
std::string TrimStringEnd( const std::string &str, char junk = ' ' );
std::string TrimString( const std::string &str, char junk  = ' ');
std::string Scramble( const std::string &argument, int modifier );
bool IsNullOrEmpty( const char *str );
std::string CenterString( const std::string &txt, size_t totalWidth, char pad );
std::string FormatString( const char *fmt, ... );
std::vector<char> CreateFmtBuffer( const char *fmt, va_list va );
std::vector<char> StringToVector(const std::string&);

/* file_io.c */
char ReadChar( FILE *fp, Logger *log, bool fBootDb );
float ReadFloat( FILE *fp, Logger *log, bool fBootDb );
int ReadInt( FILE *fp, Logger *log, bool fBootDb );
char *ReadStringToTilde( FILE *fp, Logger *log, bool fBootDb );
void ReadToEndOfLine( FILE *fp, Logger *log, bool fBootDb);
char *ReadWord( FILE *fp, Logger *log, bool fBootDb );
char *ReadLine( FILE *fp, Logger *log, bool fBootDb );
void ForEachLuaFileInDir( const char *pathToDir,
                          std::function<void(const std::string&, void*)> doOnFile,
			  void *userData );
std::string ConvertToLuaFilename( const std::string &name );

/* misc stuff */
int Interpolate( int level, int value_00, int value_32 );
char *StripColorCodes( char *text );
long ToLong( const std::string str );

template<size_t N>
std::bitset<N> CreateBitSet( std::initializer_list<size_t> args )
{
  std::bitset<N> bs;

  for( size_t bit : args )
    {
      bs.set( bit );
    }

  return bs;
}

/*
 * Takes a number such as 1234567890
 * and returns it as 1,234,567,890
 */
std::string PunctuateNumber( long number );

/* time_fun.c */
struct tm *UpdateTime( struct tm *old_time );
void SubtractTimes( struct timeval *etime, struct timeval *start_time );
void StartTimer(struct timeval *start_time);
time_t StopTimer(struct timeval *start_time);

std::string FlagString( int bitvector, const char * const flagarray[] );
void AppendToFile( const std::string &file, const std::string &str );

#endif /* include guard */
