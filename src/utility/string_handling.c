#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _BSD_SOURCE
#endif

#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

#include "utility.h"
#include "sha256.h"

#define HIDDEN_TILDE    '*'

typedef bool (*STRING_COMPARATOR)( const char*, const char* );
typedef char* (*STRING_TOKENIZER)( char*, char* );

#ifdef __cplusplus
extern "C" {
#endif
  void Bug( const char *str, ... );
#ifdef __cplusplus
}
#endif

static bool IsName2( const char*, const char* );
static bool IsName2Prefix( const char*, const char* );
static bool IsNameInternal( const char*, const char*, STRING_COMPARATOR, STRING_TOKENIZER );
static bool NiftyIsNameInternal( const char*, const char*,
                                    STRING_COMPARATOR, STRING_TOKENIZER );
/*
 * See if a string is one of the names of an object.
 */
static bool IsNameInternal( const char *str, const char *namelist,
                              STRING_COMPARATOR compare_string,
                              STRING_TOKENIZER tokenize_string )
{
  char name[MAX_INPUT_LENGTH];
  char tmp_buf[MAX_INPUT_LENGTH];
  char *tmp = tmp_buf;
  snprintf( tmp_buf, MAX_INPUT_LENGTH, "%s", namelist );

  for ( ; ; )
    {
      tmp = tokenize_string( tmp, name );

      if ( name[0] == '\0' )
        {
          return false;
        }

      if ( !compare_string( str, name ) )
        {
          return true;
        }
    }
}

bool IsName( const char *str, const char *namelist )
{
  return IsNameInternal( str, namelist, StrCmp, OneArgument );
}

bool IsNamePrefix( const char *str, const char *namelist )
{
  return IsNameInternal( str, namelist, StringPrefix, OneArgument );
}

/*
 * See if a string is one of the names of an object.            -Thoric
 * Treats a dash as a word delimiter as well as a space
 */
bool IsName2( const char *str, const char *namelist )
{
  return IsNameInternal( str, namelist, StrCmp, OneArgument2 );
}

bool IsName2Prefix( const char *str, const char *namelist )
{
  return IsNameInternal( str, namelist, StringPrefix, OneArgument2 );
}

/*                                                              -Thoric
 * Checks if str is a name in namelist supporting multiple keywords
 */
static bool NiftyIsNameInternal( const char *str, const char *namelist,
                                    STRING_COMPARATOR compare_string,
                                    STRING_TOKENIZER tokenize_string )
{
  char name[MAX_INPUT_LENGTH];
  char tmp_str_buf[MAX_INPUT_LENGTH];
  char *tmp_str = tmp_str_buf;
  char tmp_namelist_buf[MAX_INPUT_LENGTH];
  char *tmp_namelist = tmp_namelist_buf;

  if( !str || str[0] == '\0' )
    return false;

  snprintf( tmp_str_buf, MAX_INPUT_LENGTH, "%s", str );
  snprintf( tmp_namelist_buf, MAX_INPUT_LENGTH, "%s", namelist );

  for ( ; ; )
    {
      tmp_str = tokenize_string( tmp_str, name );

      if ( name[0] == '\0' )
        return true;

      if ( !compare_string( name, tmp_namelist ) )
        return false;
    }
}

bool NiftyIsName( const char *str, const char *namelist )
{
  return NiftyIsNameInternal( str, namelist, IsName2, OneArgument2 );
}

bool NiftyIsNamePrefix( const char *str, const char *namelist )
{
  return NiftyIsNameInternal( str, namelist, IsName2Prefix, OneArgument2 );
}

/*
 * Removes the tildes from a string.
 * Used for player-entered strings that go into disk files.
 */
void SmashTilde( char *str )
{
  ReplaceChar( str, '~', '-' );
}

/*
 * Encodes the tildes in a string.                              -Thoric
 * Used for player-entered strings that go into disk files.
 */
void HideTilde( char *str )
{
  ReplaceChar( str, '~', HIDDEN_TILDE );
}

char *ShowTilde( const char *str )
{
  static char buf[MAX_STRING_LENGTH];
  char *bufptr = buf;

  for ( ; *str != '\0'; str++, bufptr++ )
    {
      if ( *str == HIDDEN_TILDE )
        *bufptr = '~';
      else
        *bufptr = *str;
    }
  *bufptr = '\0';

  return buf;
}

/*
 * Compare strings, case insensitive.
 * Return true if different
 *   (compatibility with historical functions).
 */
bool StrCmp( const char *astr, const char *bstr )
{
  if ( !astr )
    {
      Bug( "Str_cmp: null astr." );
      if ( bstr )
        fprintf( stdout, "StrCmp: astr: (null)  bstr: %s\n", bstr );
      return true;
    }

  if ( !bstr )
    {
      Bug( "Str_cmp: null bstr." );
      if ( astr )
        fprintf( stdout, "StrCmp: astr: %s  bstr: (null)\n", astr );
      return true;
    }

  for ( ; *astr || *bstr; astr++, bstr++ )
    {
      if ( CharToLowercase(*astr) != CharToLowercase(*bstr) )
        return true;
    }

  return false;
}

/*
 * Compare strings, case insensitive, for prefix matching.
 * Return true if astr not a prefix of bstr
 *   (compatibility with historical functions).
 */
bool StringPrefix( const char *astr, const char *bstr )
{
  if ( !astr )
    {
      Bug( "Strn_cmp: null astr." );
      return true;
    }

  if ( !bstr )
    {
      Bug( "Strn_cmp: null bstr." );
      return true;
    }

  for ( ; *astr; astr++, bstr++ )
    {
      if ( CharToLowercase(*astr) != CharToLowercase(*bstr) )
        return true;
    }

  return false;
}

/*
 * Compare strings, case insensitive, for match anywhere.
 * Returns true is astr not part of bstr.
 *   (compatibility with historical functions).
 */
bool StringInfix( const char *astr, const char *bstr )
{
  int sstr1 = strlen(astr);
  int sstr2 = strlen(bstr);
  int ichar = 0;
  char c0 = 0;

  if ( ( c0 = CharToLowercase(astr[0]) ) == '\0' )
    return false;

  for ( ichar = 0; ichar <= sstr2 - sstr1; ichar++ )
    if ( c0 == CharToLowercase(bstr[ichar]) && !StringPrefix( astr, bstr + ichar ) )
      return false;

  return true;
}

/*
 * Compare strings, case insensitive, for suffix matching.
 * Return true if astr not a suffix of bstr
 *   (compatibility with historical functions).
 */
bool StringSuffix( const char *astr, const char *bstr )
{
  int sstr1 = strlen(astr);
  int sstr2 = strlen(bstr);

  if ( sstr1 <= sstr2 && !StrCmp( astr, bstr + sstr2 - sstr1 ) )
    return false;
  else
    return true;
}

/*
 * Returns an initial-capped string.
 * Rewritten by FearItself@AvP
 */
char *Capitalize( const char *str )
{
  static char buf[MAX_STRING_LENGTH];
  char *dest = buf;
  enum { Normal, Color } state = Normal;
  bool bFirst = true;
  char c = 0;

  while( (c = *str++) )
    {
      if( state == Normal )
        {
          if( c == '&' || c == '^' || c == '}' )
            {
              state = Color;
            }
          else if( isalpha( (int) c ) )
            {
              c = bFirst ? toupper( (int) c )  : tolower( (int) c );
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

/*
 * Returns a lowercase string.
 */
char *StringToLowercase( const char *str )
{
  static char strlow[MAX_STRING_LENGTH];
  int i = 0;

  for ( i = 0; str[i] != '\0'; i++ )
    strlow[i] = CharToLowercase(str[i]);

  strlow[i] = '\0';
  return strlow;
}

/*
 * Returns an uppercase string.
 */
char *StringToUppercase( const char *str )
{
  static char strup[MAX_STRING_LENGTH];
  int i = 0;

  for ( i = 0; str[i] != '\0'; i++ )
    strup[i] = CharToUppercase(str[i]);

  strup[i] = '\0';
  return strup;
}

/*
 * Returns true or false if a letter is a vowel                 -Thoric
 */
#if defined(AMIGA) || defined(__MORPHOS__)
static bool isavowel( unsigned letter )
#else
  static bool isavowel( char letter )
#endif
{
  char c = tolower( (int)letter );

  if ( c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' )
    return true;
  else
    return false;
}

/*
 * Shove either "a " or "an " onto the beginning of a string    -Thoric
 */
const char *AOrAn( const char *str )
{
  static char temp[MAX_STRING_LENGTH];

  if ( !str )
    {
      Bug( "Aoran(): NULL str" );
      return "";
    }

  if ( isavowel(str[0])
       || ( strlen(str) > 1 && tolower((int)str[0]) == 'y'
            && !isavowel(str[1])) )
    strcpy( temp, "an " );
  else
    strcpy( temp, "a " );

  strcat( temp, str );
  return temp;
}

void ReplaceChar( char *buf, char replace, char with )
{
  size_t i = 0;

  for( i = 0; i < strlen( buf ); ++i )
    {
      if( buf[i] == replace )
        {
          buf[i] = with;
        }
    }
}

/*
 * Return true if an argument is completely numeric.
 */
bool IsNumber( const char *arg )
{
  if ( *arg == '\0' )
    return false;

  for ( ; *arg != '\0'; arg++ )
    {
      char letter = *arg;

      if ( !isdigit((int) letter)
	   && letter != '.'
	   && letter != ','
	   && letter != '+'
	   && letter != '-' )
        return false;
    }

  return true;
}

/*
 * Given a string like 14.foo, return 14 and 'foo'
 */
int NumberArgument( const char *orig_argument, char *arg )
{
  char *pdot = NULL;
  int number = 0;
  char argument[MAX_STRING_LENGTH];
  snprintf( argument, MAX_STRING_LENGTH, "%s", orig_argument );

  for ( pdot = argument; *pdot != '\0'; pdot++ )
    {
      if ( *pdot == '.' )
        {
          *pdot = '\0';
          number = atoi( argument );
          *pdot = '.';
          strcpy( arg, pdot+1 );
          return number;
        }
    }

  strcpy( arg, argument );
  return 1;
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.
 */
char *OneArgument( char *argument, char *arg_first )
{
  char cEnd = ' ';
  short count = 0;

  while ( isspace((int) *argument) )
    argument++;

  if ( *argument == '\'' || *argument == '"' )
    cEnd = *argument++;

  while ( *argument != '\0' || ++count >= 255 )
    {
      if ( *argument == cEnd )
        {
          argument++;
          break;
        }

      *arg_first = *argument;
      arg_first++;
      argument++;
    }

  *arg_first = '\0';

  while ( isspace((int) *argument) )
    argument++;

  return argument;
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.  Delimiters = { ' ', '-' }
 */
char *OneArgument2( char *argument, char *arg_first )
{
  char cEnd = ' ';
  short count = 0;

  while ( isspace((int) *argument) )
    argument++;

  if ( *argument == '\'' || *argument == '"' )
    cEnd = *argument++;

  while ( *argument != '\0' || ++count >= 255 )
    {
      if ( *argument == cEnd || *argument == '-' )
        {
          argument++;
          break;
        }

      *arg_first = *argument;
      arg_first++;
      argument++;
    }

  *arg_first = '\0';

  while ( isspace((int) *argument) )
    argument++;

  return argument;
}

/*
 * Remove carriage returns from a line
 */
char *StripCarriageReturn( const char *str )
{
  static char newstr[MAX_STRING_LENGTH];
  int i = 0, j = 0;

  for ( i=j=0; str[i] != '\0'; i++ )
    if ( str[i] != '\r' )
      {
        newstr[j++] = str[i];
      }
  newstr[j] = '\0';
  return newstr;
}

/*
 * Removes the tildes from a line, except if it's the last character.
 */
void SmushTilde( char *str )
{
  char *strptr = str;
  size_t len = strlen( str );
  char last = len != 0 ? strptr[len-1] : '\0';

  for ( ; *str != '\0'; str++ )
    {
      if ( *str == '~' )
        *str = '-';
    }

  if ( len )
    strptr[len-1] = last;
}

static char *grab_word( char *argument, char *arg_first )
{
  char cEnd = ' ';
  short count = 0;

  while ( isspace((int)*argument) )
    argument++;

  if ( *argument == '\'' || *argument == '"' )
    cEnd = *argument++;

  while ( *argument != '\0' || ++count >= 255 )
    {
      if ( *argument == cEnd )
        {
          argument++;
          break;
        }

      *arg_first++ = *argument++;
    }

  *arg_first = '\0';

  while ( isspace((int)*argument) )
    argument++;

  return argument;
}

char *WordWrap( char *txt, unsigned short wrap )
{
  static char buf[MAX_STRING_LENGTH];
  char *bufp = buf;

  buf[0] = '\0';

  if ( txt != NULL && strlen(txt) > 0 )
    {
      char line[MAX_STRING_LENGTH] = {'\0'};
      char temp[MAX_STRING_LENGTH];
      char *ptr = txt;

      ++bufp;
      line[0] = '\0';

      while ( *ptr )
        {
          size_t ln = strlen( line );
          size_t x = 0;

          ptr = grab_word( ptr, temp );
          x = strlen( temp );

          if ( (ln + x + 1) < wrap )
            {
              char *p = NULL;

              if ( ln > 0 && line[ln-1] == '.' )
                {
                  strcat( line, "  " );
                }
              else
                {
                  strcat( line, " " );
                }

              strcat( line, temp );
              p = strchr( line, '\n' );

              if ( !p )
                {
                  p = strchr( line, '\r' );
                }

              if ( p )
                {
                  strcat( buf, line );
                  line[0] = '\0';
                }
            }
          else
            {
              strcat( line, "\r\n" );
              strcat( buf, line );
              strcpy( line, temp );
            }
        }

      if ( line[0] != '\0' )
        {
          strcat( buf, line );
        }
    }

  return bufp;
}

char *EncodeString( const char *str )
{
  return sha256_crypt( str );
}

char *CatSprintf(char *dest, const char *fmt, ...)
{
  char buf[MAX_STRING_LENGTH];

  va_list args;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);

  return strcat(dest, buf);
}

/*
 * custom CopyString using create                                  -Thoric
 */
char *CopyString( const char *str )
{
  static char *ret = NULL;

  if( !str )
    return NULL;

  AllocateMemory( ret, char, strlen( str ) + 1 );
  strcpy( ret, str );
  return ret;
}

char *TrimStringStart( char *string, char junk )
{
  while( *string == junk )
    ++string;

  return string;
}

char *TrimStringEnd( char *string, char junk )
{
  size_t pos = strlen( string ) - 1;

  while( string[pos] == junk )
    {
      string[pos] = '\0';
      --pos;
    }

  return string;
}

char *TrimString( char *string, char junk )
{
  string = TrimStringStart( string, junk );
  string = TrimStringEnd( string, junk );

  return string;
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
static const char *str_str( const char *astr, const char *bstr )
{
  int sstr1, sstr2, ichar;
  char c0;

  if ( ( c0 = CharToLowercase(bstr[0]) ) == '\0' )
    return NULL;

  sstr1 = strlen(astr);
  sstr2 = strlen(bstr);

  for ( ichar = 0; ichar <= sstr1 - sstr2; ichar++ )
    if ( c0 == CharToLowercase(astr[ichar]) && !StringPrefix(bstr, astr+ichar) )
      return (astr+ichar);

  return NULL;
}

/*
 * Counts the number of times a target string occurs in a source string.
 * case insensitive -- Gorog
 */
int CountStringOccurances(const char *psource, const char *ptarget)
{
  const char *ptemp = psource;
  int count=0;

  while ( (ptemp = str_str(ptemp, ptarget)) )
    {
      ptemp++;
      count++;
    }

  return count;
}

bool IsNullOrEmpty( const char *str )
{
  return !str || str[0] == '\0';
}
