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
#if     !defined(FALSE)
#define FALSE    0
#endif

#if     !defined(TRUE)
#define TRUE     1
#endif

typedef unsigned char                   bool;

#else
#if !defined(__STORMGCC__) && !defined(__MORPHOS__)
#define TRUE true
#define FALSE false
#endif /* StormC4 */
#endif /* __cplusplus */

#if     !defined(BERR)
#define BERR     255
#endif

/*
 * Utility macros.
 */
#define UMIN( a, b )      ( umin( (a), (b) ) )
#define UMAX( a, b )      ( umax( (a), (b) ) )
#define URANGE(a, b, c )  ( urange( (a), (b), (c) ) )
#define LOWER(c)                ((char) tolower((int)(c)))
#define UPPER(c)                ((char) toupper((int)(c)))
#define IS_SET(flag, bit)       ((flag) & (bit))
#define SET_BIT(var, bit)       ((var) |= (bit))
#define REMOVE_BIT(var, bit)    ((var) &= ~(bit))
#define TOGGLE_BIT(var, bit)    ((var) ^= (bit))

  /*#define HASHSTR*/                  /* use string hashing */

/*
 * Memory allocation macros.
 */

/*
 * NOTE: Do NOT change from calloc to malloc. This will lead to undefined
 * behaviour because a lot of the code assumes the memory is initialized.
 */
#define CREATE(result, type, number)                            \
do                                                              \
  {                                                               \
 if (!((result) = (type *) calloc ((number), sizeof(type))))  \
   { perror("calloc failure"); abort(); }                  \
  } while(0)

#define RECREATE(result,type,number)                            \
do                                                              \
  {                                                               \
 if (!((result) = (type *) realloc ((result), sizeof(type) * (number))))\
   { perror("realloc failure"); abort(); }                 \
  } while(0)


#define DISPOSE(point)                                          \
do                                                              \
  {                                                               \
 if (!(point))                                                 \
   {                                                             \
 bug( "Freeing null pointer" ); \
 fprintf( stderr, "DISPOSEing NULL in %s, line %d\n", __FILE__, __LINE__\
	  ); \
   }                                                             \
 else free(point);                                             \
 point = NULL;                                                 \
 } while(0)

#ifdef HASHSTR
#define STRALLOC(point)         str_alloc((point))
#define QUICKLINK(point)        quick_link((point))
#define QUICKMATCH(p1, p2)      ((int) (p1) == (int) (p2))
#define STRFREE(point)                                          \
do                                                              \
  {                                                               \
 if (!(point))                                                 \
   {                                                             \
 bug( "Freeing null pointer" );                          \
 fprintf( stderr, "STRFREEing NULL in %s, line %d\n", __FILE__, __LINE__\
	  ); \
   }                                                             \
 else if (str_free((point))==-1)                               \
   fprintf( stderr, "STRFREEing bad pointer in %s, line %d\n", __FILE__, __LINE__ ); \
 } while(0)
#else
#define STRALLOC(point)         str_dup((point))
#define QUICKLINK(point)        str_dup((point))
#define QUICKMATCH(p1, p2)      (strcmp((p1), (p2)) == 0)
#define STRFREE(point)                                          \
do                                                              \
  {                                                               \
 if (!(point))                                                 \
   {                                                             \
 bug( "Freeing null pointer" );                          \
 fprintf( stderr, "STRFREEing NULL in %s, line %d\n", __FILE__, __LINE__ ); \
   }                                                             \
 else free((point));                                           \
 } while(0)
#endif

#if defined(KEY)
#undef KEY
#endif

#define KEY( literal, field, value )                                    \
  if ( !str_cmp( (word), (literal) ) )					\
    {                                       \
      (field) = (value);		    \
      fMatch = TRUE;			    \
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

int parsebet (const int currentbet, const char *s);
int umin( int check, int ncheck );
int umax( int check, int ncheck );
int urange( int mincheck, int check, int maxcheck );

/* string_handling.c */
char *wordwrap( char *txt, unsigned short wrap );
char *cat_sprintf(char *dest, const char *fmt, ...);
bool is_number( const char *arg );
int number_argument( const char *argument, char *arg );
char *one_argument( char *argument, char *arg_first );
char *one_argument2( char *argument, char *arg_first );
int is_name( const char *str, const char *namelist );
int is_name_prefix( const char *str, const char *namelist );
int nifty_is_name( const char *str, const char *namelist );
int nifty_is_name_prefix( const char *str, const char *namelist );
int str_cmp( const char *astr, const char *bstr );
int str_prefix( const char *astr, const char *bstr );
int str_infix( const char *astr, const char *bstr );
int str_suffix( const char *astr, const char *bstr );
char *capitalize( const char *str );
char *strlower( const char *str );
char *strupper( const char *str );
const char *aoran( const char *str );
char *strip_cr( const char *str  );
char *str_dup( const char *str );
void smash_tilde( char *str );
void hide_tilde( char *str );
char *show_tilde( const char *str );
void replace_char( char*, char, char );
void smush_tilde( char* );
char *encode_string( const char* );

/* file_io.c */
char fread_letter( FILE *fp );
float fread_float( FILE *fp );
int fread_number( FILE *fp );
char *fread_string( FILE *fp, char *buffer, size_t bufferSize );
char *fread_string_hash( FILE *fp );
char *fread_string_nohash( FILE *fp );
void fread_to_eol( FILE *fp );
char *fread_word( FILE *fp );
char *fread_line( FILE *fp );
void append_to_file( const char *file, const char *str );

/* hashstr.c */
char *str_alloc( const char *str );
char *quick_link( const char *str );
int str_free( char *str );
void show_hash( int count );
char *hash_stats( void );
char *check_hash( const char *str );
void hash_dump( int hash );
void show_high_hash( int top );

char *scramble( const char *argument, int modifier );

/* Random number stuff */
void init_mm( void );
int number_fuzzy( int number );
int number_range( int from, int to );
int number_percent( void );
int number_door( void );
int number_bits( int width );
int dice( int number, int size );

/* misc stuff */
int interpolate( int level, int value_00, int value_32 );
char *stripclr( char *text );

/* time_fun.c */
struct tm *update_time( struct tm *old_time );
void subtract_times( struct timeval *etime, struct timeval *start_time );
void start_timer(struct timeval *start_time);
time_t end_timer(struct timeval *start_time);

char *flag_string( int bitvector, const char * const flagarray[] );

#ifdef __cplusplus
}
#endif

#endif /* include guard */
