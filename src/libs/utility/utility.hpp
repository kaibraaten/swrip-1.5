#ifndef _SWR_UTILITY_H_
#define _SWR_UTILITY_H_

#include <string>
#include <cstdio>
#include <cstdlib>
#include "vector3.hpp"
#include "os.hpp"

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
 if (!(point))                                                 \
   {                                                             \
 Bug( "Freeing null pointer" ); \
 fprintf( stderr, "DISPOSEing NULL in %s, line %d\n", __FILE__, __LINE__\
	  ); \
   }                                                             \
 else free(point);                                             \
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

int ParseBet (const int currentbet, const char *s);
int umin( int check, int ncheck );
int umax( int check, int ncheck );
int urange( int mincheck, int check, int maxcheck );

/* string_handling.c */
char *WordWrap( char *txt, unsigned short wrap );
int NumberArgument( const std::string &argument, std::string &arg );
std::string OneArgument( const std::string &argument, std::string &arg_first );
bool IsName( const std::string &str, std::string namelist );
bool IsNamePrefix( const std::string &str, const std::string &namelist );
bool NiftyIsName( const std::string &str, const std::string &namelist );
bool NiftyIsNamePrefix( const std::string &str, const std::string &namelist );
std::string AOrAn( const std::string &text );
bool IsVowel( const char letter );
std::string StripCarriageReturn( const std::string &str  );
char *CopyString( const std::string &str );
int CountStringOccurances(const char *psource, const char *ptarget);
void SmashTilde( std::string& );
void SmushTilde( std::string& );
void HideTilde( std::string& );
std::string ShowTilde( const std::string &str );
std::string EncodeString( const std::string& );
char *TrimStringStart( char *string, char junk );
char *TrimStringEnd( char *string, char junk );
char *TrimString( char *string, char junk );
std::string Scramble( const std::string &argument, int modifier );
bool IsNullOrEmpty( const char *str );
std::string IntToString( int num, int base = 10 );

/* file_io.c */
char ReadChar( FILE *fp );
float ReadFloat( FILE *fp );
int ReadInt( FILE *fp );
char *ReadStringToTilde( FILE *fp );
void ReadToEndOfLine( FILE *fp );
char *ReadWord( FILE *fp );
char *ReadLine( FILE *fp );
void ForEachLuaFileInDir( const std::string &pathToDir,
			  void (*doOnFile)(const std::string&, void *ud),
			  void *userData );
std::string ConvertToLuaFilename( std::string name );

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
char *PunctuateNumber( long number, char **optionalBuffer );

/* time_fun.c */
struct tm *UpdateTime( struct tm *old_time );
void SubtractTimes( struct timeval *etime, struct timeval *start_time );
void StartTimer(struct timeval *start_time);
time_t StopTimer(struct timeval *start_time);

char *FlagString( int bitvector, const char * const flagarray[] );
void AppendToFile( const char *file, const char *str );

#endif /* include guard */
