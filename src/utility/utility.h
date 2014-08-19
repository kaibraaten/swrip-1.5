#ifndef _SWR_UTILITY_H_
#define _SWR_UTILITY_H_

#include <stdio.h>
#include <stdlib.h>
#include "vector3.h"
#include "os.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
 * String and memory management parameters.
 */
#define MAX_KEY_HASH             2048
#define MAX_STRING_LENGTH        4096  /* buf */
#define MAX_INPUT_LENGTH         1024  /* arg */
#define MAX_INBUF_SIZE           1024

/*
 * Short scalar types.
 * Diavolo reports AIX compiler has bugs with short types.
 */
#ifndef __cplusplus
#if __STDC_VERSION__ < 199901L
typedef unsigned char bool;
#define true 1
#define false 0
#endif
#endif /* !__cplusplus */

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

int ParseBet (const int currentbet, const char *s);
int umin( int check, int ncheck );
int umax( int check, int ncheck );
int urange( int mincheck, int check, int maxcheck );

/* string_handling.c */
char *WordWrap( char *txt, unsigned short wrap );
char *CatSprintf(char *dest, const char *fmt, ...);
bool IsNumber( const char *arg );
int NumberArgument( const char *argument, char *arg );
char *OneArgument( char *argument, char *arg_first );
char *OneArgument2( char *argument, char *arg_first );
bool IsName( const char *str, const char *namelist );
bool IsNamePrefix( const char *str, const char *namelist );
bool NiftyIsName( const char *str, const char *namelist );
bool NiftyIsNamePrefix( const char *str, const char *namelist );
bool StrCmp( const char *astr, const char *bstr );
bool StringPrefix( const char *astr, const char *bstr );
bool StringInfix( const char *astr, const char *bstr );
bool StringSuffix( const char *astr, const char *bstr );
char *Capitalize( const char *str );
char *StringToLowercase( const char *str );
char *StringToUppercase( const char *str );
const char *AOrAn( const char *str );
char *StripCarriageReturn( const char *str  );
char *CopyString( const char *str );
int CountStringOccurances(const char *psource, const char *ptarget);
void SmashTilde( char *str );
void SmushTilde( char* );
void HideTilde( char *str );
char *ShowTilde( const char *str );
void ReplaceChar( char*, char, char );
char *EncodeString( const char* );
char *TrimStringStart( char *string, char junk );
char *TrimStringEnd( char *string, char junk );
char *TrimString( char *string, char junk );
char *Scramble( const char *argument, int modifier );

/* file_io.c */
char ReadChar( FILE *fp );
float ReadFloat( FILE *fp );
int ReadInt( FILE *fp );
char *ReadStringToTilde( FILE *fp );
void ReadToEndOfLine( FILE *fp );
char *ReadWord( FILE *fp );
char *ReadLine( FILE *fp );

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

/* time_fun.c */
struct tm *UpdateTime( struct tm *old_time );
void SubtractTimes( struct timeval *etime, struct timeval *start_time );
void StartTimer(struct timeval *start_time);
time_t StopTimer(struct timeval *start_time);

char *FlagString( int bitvector, const char * const flagarray[] );
void AppendToFile( const char *file, const char *str );

#ifdef __cplusplus
}
#endif

#endif /* include guard */
