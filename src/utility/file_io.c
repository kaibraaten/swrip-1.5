#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>

#include "swr_support.h"

/*
 * Uni-directional dependencies. Fix that.
 */
#ifdef __cplusplus
extern "C" {
#endif
  void bug( const char *str, ... );
  void shutdown_mud( const char *reason );
#ifdef __cplusplus
}
#endif
/*
 * Added lots of EOF checks, as most of the file crashes are based on them.
 * If an area file encounters EOF, the fread_* functions will shutdown the
 * MUD, as all area files should be read in in full or bad things will
 * happen during the game.  Any files loaded in without fBootDb which
 * encounter EOF will return what they have read so far.   These files
 * should include player files, and in-progress areas that are not loaded
 * upon bootup.
 * -- Altrag
 */

extern bool fBootDb;

/*
 * Read a letter from a file.
 */
char fread_letter( FILE *fp )
{
  char c = '\0';

  do
  {
    if ( feof(fp) )
    {
      bug("fread_letter: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );

      return '\0';
    }

    c = fgetc( fp );
  }
  while ( isspace((int) c) );

  return c;
}

/*
 * Read a float number from a file. Turn the result into a float value.
 */
float fread_float( FILE *fp )
{
  float number = 0.0;
  bool sign = FALSE, decimal = FALSE;
  char c = '\0';
  double place = 0.0;

  do
  {
    if( feof( fp ) )
    {
      bug( "%s: EOF encountered on read.", __FUNCTION__ );
      if( fBootDb )
      {
	shutdown_mud( "Corrupt file somewhere." );
	exit( EXIT_FAILURE );
      }
      return 0;
    }
    c = fgetc( fp );
  }
  while( isspace( (int) c ) );

  if( c == '+' )
    c = fgetc( fp );
  else if( c == '-' )
  {
    sign = TRUE;
    c = fgetc( fp );
  }

  if( !isdigit( (int) c ) )
  {
    bug( "%s: bad format. (%c)", __FUNCTION__, c );

    if( fBootDb )
      exit( EXIT_FAILURE );
    return 0;
  }

  while( 1 )
  {
    if( c == '.' || isdigit( (int) c ) )
    {
      if( c == '.' )
      {
	decimal = TRUE;
	c = fgetc( fp );
      }

      if( feof( fp ) )
      {
	bug( "%s: EOF encountered on read.", __FUNCTION__ );
	if( fBootDb )
	  exit( EXIT_FAILURE );
	return number;
      }
      if( !decimal )
	number = number * 10 + c - '0';
      else
      {
	place++;
	number += pow( (double) 10, ( -1 * place ) ) * ( c - '0' );
      }
      c = fgetc( fp );
    }
    else
      break;
  }

  if( sign )
    number = 0 - number;

  if( c == '|' )
    {
      number += fread_float( fp );
    }
  else if( c != ' ' )
    {
      if( ungetc( c, fp ) == EOF )
	{
	  bug("fread_float: EOF encountered on ungetc.\r\n");

	  if ( fBootDb )
	    exit( EXIT_FAILURE );
	}
    }

  return number;
}

/*
 * Read a number from a file.
 */
int fread_number( FILE *fp )
{
  int number = 0;
  bool sign = FALSE;
  char c = 0;

  do
  {
    if ( feof(fp) )
    {
      bug("fread_number: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      return 0;
    }
    c = fgetc( fp );
  }
  while ( isspace( (int) c ) );

  if ( c == '+' )
  {
    c = fgetc( fp );
  }
  else if ( c == '-' )
  {
    sign = TRUE;
    c = fgetc( fp );
  }

  if ( !isdigit((int) c) )
  {
    bug( "Fread_number: bad format. (%c)", c );
    if ( fBootDb )
      exit( EXIT_FAILURE );
    return 0;
  }

  while ( isdigit( (int) c ) )
  {
    if ( feof(fp) )
    {
      bug("fread_number: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      return number;
    }
    number = number * 10 + c - '0';
    c      = fgetc( fp );
  }

  if ( sign )
    number = 0 - number;

  if ( c == '|' )
    number += fread_number( fp );
  else if ( c != ' ' )
    {
      if( ungetc( c, fp ) == EOF )
        {
          bug("fread_number: EOF encountered on ungetc.\r\n");

          if ( fBootDb )
            exit( EXIT_FAILURE );
        }
    }

  return number;
}

/*
 * custom str_dup using create                                  -Thoric
 */
char *str_dup( const char *str )
{
  static char *ret = NULL;

  if( !str )
    return NULL;

  CREATE( ret, char, strlen( str ) + 1 );
  strcpy( ret, str );
  return ret;
}

/*
 * Read a string from file fp
 */
char *fread_string( FILE *fp )
{
  char buf[MAX_STRING_LENGTH];
  char *plast = buf;
  char c = 0;
  int ln = 0;

  buf[0] = '\0';

  /*
   * Skip blanks.
   * Read first char.
   */
  do
  {
    if ( feof(fp) )
    {
      bug("fread_string: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      return STRALLOC("");
    }
    c = fgetc( fp );
  }
  while ( isspace((int)c) );

  if ( ( *plast++ = c ) == '~' )
    return STRALLOC( "" );

  for ( ;; )
  {
    if ( ln >= (MAX_STRING_LENGTH - 1) )
    {
      bug( "fread_string: string too long" );
      *plast = '\0';
      return STRALLOC( buf );
    }
    switch ( (int)( *plast = fgetc( fp ) ) )
    {
      default:
	plast++; ln++;
	break;

      case EOF:
	bug( "Fread_string: EOF" );
	if ( fBootDb )
	  exit( EXIT_FAILURE );
	*plast = '\0';
	return STRALLOC(buf);
	break;

      case '\n':
	plast++;  ln++;
	*plast++ = '\r';  ln++;
	break;

      case '\r':
	break;

      case '~':
	*plast = '\0';
	return STRALLOC( buf );
    }
  }
}

/*
 * Read a string from file fp using str_dup (ie: no string hashing)
 */
char *fread_string_nohash( FILE *fp )
{
  char buf[MAX_STRING_LENGTH];
  char *plast = buf;
  char c = 0;
  int ln = 0;

  buf[0] = '\0';

  /*
   * Skip blanks.
   * Read first char.
   */
  do
  {
    if ( feof(fp) )
    {
      bug("fread_string_no_hash: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      return str_dup("");
    }
    c = fgetc( fp );
  }
  while ( isspace((int)c) );

  if ( ( *plast++ = c ) == '~' )
    return str_dup( "" );

  for ( ;; )
  {
    if ( ln >= (MAX_STRING_LENGTH - 1) )
    {
      bug( "fread_string_no_hash: string too long" );
      *plast = '\0';
      return str_dup( buf );
    }
    switch ( (int)( *plast = fgetc( fp ) ) )
    {
      default:
	plast++; ln++;
	break;

      case EOF:
	bug( "Fread_string_no_hash: EOF" );
	if ( fBootDb )
	  exit( EXIT_FAILURE );
	*plast = '\0';
	return str_dup(buf);
	break;

      case '\n':
	plast++;  ln++;
	*plast++ = '\r';  ln++;
	break;

      case '\r':
	break;

      case '~':
	*plast = '\0';
	return str_dup( buf );
    }
  }
}

/*
 * Read to end of line (for comments).
 */
void fread_to_eol( FILE *fp )
{
  char c = 0;

  do
  {
    if ( feof(fp) )
    {
      bug("fread_to_eol: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      return;
    }
    c = fgetc( fp );
  }
  while ( c != '\n' && c != '\r' );

  do
  {
    c = fgetc( fp );
  }
  while ( c == '\n' || c == '\r' );

  if( ungetc( c, fp ) == EOF )
    {
      bug("fread_to_eol: EOF encountered on ungetc.\r\n");

      if ( fBootDb )
	exit( EXIT_FAILURE );
    }
}

/*
 * Read to end of line into static buffer                       -Thoric
 */
char *fread_line( FILE *fp )
{
  static char line[MAX_STRING_LENGTH];
  char *pline = line;
  char c = 0;
  int ln = 0;

  line[0] = '\0';

  /*
   * Skip blanks.
   * Read first char.
   */
  do
  {
    if ( feof(fp) )
    {
      bug("fread_line: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      strcpy(line, "");
      return line;
    }
    c = fgetc( fp );
  }
  while ( isspace((int)c) );

  if( ungetc( c, fp ) == EOF )
    {
      bug("fread_line: EOF encountered on ungetc.\r\n");

      if ( fBootDb )
	exit( EXIT_FAILURE );
    }

  do
  {
    if ( feof(fp) )
    {
      bug("fread_line: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      *pline = '\0';
      return line;
    }
    c = fgetc( fp );
    *pline++ = c; ln++;
    if ( ln >= (MAX_STRING_LENGTH - 1) )
    {
      bug( "fread_line: line too long" );
      break;
    }
  }
  while ( c != '\n' && c != '\r' );

  do
  {
    c = fgetc( fp );
  }
  while ( c == '\n' || c == '\r' );

  if( ungetc( c, fp ) == EOF )
    {
      bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

      if ( fBootDb )
	exit( EXIT_FAILURE );
    }

  *pline = '\0';
  return line;
}

/*
 * Read one word (into static buffer).
 */
char *fread_word( FILE *fp )
{
  static char word[MAX_INPUT_LENGTH];
  char *pword = NULL;
  char cEnd ='\0';

  do
  {
    if ( feof(fp) )
    {
      bug("fread_word: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      word[0] = '\0';
      return word;
    }
    cEnd = fgetc( fp );
  }
  while ( isspace( (int) cEnd ) );

  if ( cEnd == '\'' || cEnd == '"' )
  {
    pword   = word;
  }
  else
  {
    word[0] = cEnd;
    pword   = word+1;
    cEnd    = ' ';
  }

  for ( ; pword < word + MAX_INPUT_LENGTH; pword++ )
  {
    if ( feof(fp) )
    {
      bug("fread_word: EOF encountered on read.\r\n");
      if ( fBootDb )
	exit( EXIT_FAILURE );
      *pword = '\0';
      return word;
    }
    *pword = fgetc( fp );
    if ( cEnd == ' ' ? isspace((int) *pword) : *pword == cEnd )
    {
      if ( cEnd == ' ' )
	{
	  if( ungetc( *pword, fp ) == EOF )
	    {
	      bug("%s: EOF encountered on ungetc.\r\n", __FUNCTION__);

	      if ( fBootDb )
		exit( EXIT_FAILURE );
	    }
	}

      *pword = '\0';
      return word;
    }
  }

  bug( "Fread_word: word too long" );
  exit( EXIT_FAILURE );
  return NULL;
}

/*
 * Append a string to a file.
 */
void append_to_file( const char *file, const char *str )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( file, "a" ) ) )
  {
    fprintf( fp, "%s\n", str );
    fclose( fp );
  }
}
