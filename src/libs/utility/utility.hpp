#ifndef _SWR_UTILITY_HPP_
#define _SWR_UTILITY_HPP_

#include <string>
#include <cstdio>
#include <cstdlib>
#include <utility/types.hpp>
#include <utility/vector3.hpp>
#include <utility/os.hpp>
#include <utility/linkedlist.hpp>
#include <utility/oldrepository.hpp>
#include <utility/event.hpp>
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
#define CharToLowercase(c)                ((char) tolower((int)(c)))
#define CharToUppercase(c)                ((char) toupper((int)(c)))
#define IsBitSet(flag, bit)       ((flag) & (bit))
#define SetBit(var, bit)       ((var) |= (bit))
#define RemoveBit(var, bit)    ((var) &= ~(bit))
#define ToggleBit(var, bit)    ((var) ^= (bit))

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
char *WordWrap( char *txt, unsigned short wrap );
char *CatSprintf(char *dest, const char *fmt, ...);
bool IsNumber(const std::string &arg);
int NumberArgument( const char *argument, char *arg );
char *OneArgument( char *argument, char *arg_first );
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
char *Capitalize( const std::string &str );
std::string ToLower( std::string str );
std::string ToUpper( std::string str );
const char *AOrAn( const std::string &str );
char *StripCarriageReturn(const std::string &str);
char *CopyString( const std::string &str );
int CountStringOccurances(const std::string &source, const std::string &target);
void SmashTilde( char *str );
void SmushTilde( char* );
void HideTilde( char *str );
char *ShowTilde( const std::string &arg);
void ReplaceChar( char*, char, char );
char *EncodeString( const std::string &str );
char *TrimStringStart( char *string, char junk = ' ' );
char *TrimStringEnd( char *string, char junk = ' ' );
char *TrimString( char *string, char junk  = ' ');
char *Scramble( const std::string &argument, int modifier );
bool IsNullOrEmpty( const char *str );

/* file_io.c */
char ReadChar( FILE *fp, Logger *log, bool fBootDb );
float ReadFloat( FILE *fp, Logger *log, bool fBootDb );
int ReadInt( FILE *fp, Logger *log, bool fBootDb );
char *ReadStringToTilde( FILE *fp, Logger *log, bool fBootDb );
void ReadToEndOfLine( FILE *fp, Logger *log, bool fBootDb);
char *ReadWord( FILE *fp, Logger *log, bool fBootDb );
char *ReadLine( FILE *fp, Logger *log, bool fBootDb );
void ForEachLuaFileInDir( const char *pathToDir,
			  void (*doOnFile)(const std::string&, void *ud),
			  void *userData );
const char *ConvertToLuaFilename( const std::string &name );

/* Random number stuff */
void InitMM( void );
int NumberFuzzy( int number );
int GetRandomNumberFromRange( int from, int to );
int GetRandomPercent( void );
int GetRandomDoor( void );
int NumberBits( int width );
int RollDice( int number, int size );

/* misc stuff */
int Interpolate( int level, int value_00, int value_32 );
char *StripColorCodes( char *text );

/*
 * Takes a number such as 1234567890
 * and returns it as 1,234,567,890
 *
 * The second argument is optional. If you supply NULL, the
 * function will return a pointer to an internal static
 * character string. The implication is that it will not
 * be threadsafe, and you can't use it twice in the same
 * statement. For instance, if you use it twice in the
 * same sprintf() call, only the last result will actually
 * be used. If this is a problem in your case you'll need
 * to supply your own buffer.
 */
char *PunctuateNumber( long number, char **optionalBuffer = nullptr);

/* time_fun.c */
struct tm *UpdateTime( struct tm *old_time );
void SubtractTimes( struct timeval *etime, struct timeval *start_time );
void StartTimer(struct timeval *start_time);
time_t StopTimer(struct timeval *start_time);

std::string FlagString( int bitvector, const char * const flagarray[] );
void AppendToFile( const std::string &file, const std::string &str );

#endif /* include guard */
