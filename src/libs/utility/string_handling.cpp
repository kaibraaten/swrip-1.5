#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#endif

#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

#include "utility.hpp"
#include "sha256.h"

#define HIDDEN_TILDE    '*'

typedef bool (*STRING_COMPARATOR)( const std::string&, const std::string& );
typedef std::string (*STRING_TOKENIZER)( const std::string&, std::string& );

#ifdef __cplusplus
extern "C" {
#endif
  void Bug( const char *str, ... );
#ifdef __cplusplus
}
#endif

static bool IsName2( const std::string&, const std::string& );
static bool IsName2Prefix( const std::string&, const std::string& );
static bool IsNameInternal( const std::string&, const std::string&,
			    STRING_COMPARATOR, STRING_TOKENIZER );
static bool NiftyIsNameInternal( const std::string&, const std::string&,
				 STRING_COMPARATOR, STRING_TOKENIZER );
static std::string OneArgument2( const std::string &argument, std::string &arg_first );

/*
 * See if a string is one of the names of an object.
 */
static bool IsNameInternal( const std::string&, const std::string&,
			    STRING_COMPARATOR compare_string,
			    STRING_TOKENIZER tokenize_string )
{
  std::string name;

  for( ;; )
    {
      namelist = tokenize_string( namelist, name );

      if( name.empty() )
        {
          return false;
        }

      if( !compare_string( str, name ) )
        {
          return true;
        }
    }

  return false;
}

/*
 * See if a string is one of the names of an object.
 */
bool IsName( const std::string &str, std::string namelist )
{
  return IsNameInternal( str, namelist, Alice::iCaseCmp, OneArgument );
}

bool IsNamePrefix( const std::string &str, const std::string &namelist )
{
  return IsNameInternal( str, namelist, Alice::PrefixCmp, OneArgument );
}

/*
 * See if a string is one of the names of an object.            -Thoric
 * Treats a dash as a word delimiter as well as a space
 */
static bool IsName2( const std::string &str, const std::string &namelist )
{
  return IsNameInternal( str, namelist, Alice::iCaseCmp, OneArgument2 );
}

static bool IsName2Prefix( const std::string &str, const std::string &namelist )
{
  return IsNameInternal( str, namelist, Alice::PrefixCmp, OneArgument2 );
}

/*                                                              -Thoric
 * Checks if str is a name in namelist supporting multiple keywords
 */
static bool NiftyIsNameInternal( const std::string &str, const std::string &namelist,
				 STRING_COMPARATOR compare_string,
				 STRING_TOKENIZER tokenize_string )
{
  std::string name;

  if( str.empty() || namelist.empty() )
    return false;

  for( ;; )
    {
      str = tokenize_string( str, name );

      if( name.empty() )
        return true;

      if( !compare_string( name, namelist ) )
        return false;
    }
}

bool NiftyIsName( const std::string &str, const std::string &namelist )
{
  return NiftyIsNameInternal( str, namelist, IsName2, OneArgument2 );
}

bool NiftyIsNamePrefix( const std::string &str, const std::string &namelist )
{
  return NiftyIsNameInternal( str, namelist, IsName2Prefix, OneArgument2 );
}

/*
 * Removes the tildes from a string.
 * Used for player-entered strings that go into disk files.
 */
void SmashTilde( std::string &str )
{
  Alice::ReplaceChar( str, '~', '-' );
}

/*
 * Encodes the tildes in a string.                              -Thoric
 * Used for player-entered strings that go into disk files.
 */
void HideTilde( std::string &str )
{
  Alice::ReplaceChar( str, '~', HIDDEN_TILDE );
}

std::string ShowTilde( const std::string &arg )
{
  char buf[MAX_STRING_LENGTH];
  char *bufptr = buf;
  char *strptr = arg.c_str();
  
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
 * Shove either "a " or "an " onto the beginning of a string    -Thoric
 */
std::string AOrAn( const std::string &text )
{
  if( text.empty() )
    {
      return "";
    }

  if( IsVowel( text[0] )
      || ( !text.empty() && tolower( text[0] ) == 'y' && !IsVowel( text[0] ) ) )
    {
      return "an " + text;
    }
  else
    {
      return "a " + text;
    }
}

/*
 * Given a string like 14.foo, return 14 and 'foo'
 */
int NumberArgument( const std::string &argument, std::string &arg )
{
  std::string::size_type pos;

  arg.erase();

  if( ( pos = argument.find( "." ) ) != std::string::npos )
    {
      arg = argument.substr( pos+1 );
      return std::atoi( argument.substr( 0, pos ).c_str() );
    }

  arg = argument;
  return 1;
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.
 */
std::string OneArgument( const std::string &argument, std::string &arg_first )
{
  char cEnd;
  std::string::const_iterator argp = argument.begin();

  arg_first.erase();

  while( argp != argument.end() && isspace( *argp ) )
    {
      argp++;
    }

  cEnd = ' ';

  if( *argp == '\'' || *argp == '"' )
    {
      cEnd = *argp++;
    }

  while( argp != argument.end() )
    {
      if( *argp == cEnd )
        {
          argp++;
          break;
        }

      arg_first.append( 1, *argp );
      argp++;
    }

  while( argp != argument.end() && isspace( *argp ) )
    {
      argp++;
    }

  return std::string( argp, argument.end() );
}

/*
 * Pick off one argument from a string and return the rest.
 * Understands quotes.  Delimiters = { ' ', '-' }
 */
static std::string OneArgument2( const std::string &argument, std::string &arg_first )
{
  char cEnd;
  std::string::const_iterator argp = argument.begin();

  arg_first.erase();

  while( argp != argument.end() && isspace( *argp ) )
    {
      argp++;
    }

  cEnd = ' ';

  if( *argp == '\'' || *argp == '"' )
    {
      cEnd = *argp++;
    }

  while( argp != argument.end() )
    {
      if( *argp == cEnd || *argument == '-' )
        {
          argp++;
          break;
        }

      arg_first.append( 1, *argp );
      argp++;
    }

  while( argp != argument.end() && isspace( *argp ) )
    {
      argp++;
    }

  return std::string( argp, argument.end() );
}

/*
 * Remove carriage returns from a line
 */
std::string StripCarriageReturn( const std::string &str )
{
  char newstr[MAX_STRING_LENGTH];
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
void SmushTilde( std::string &str )
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

static std::string grab_word( char *argument, char *arg_first )
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

std::string EncodeString( const std::string &str )
{
  return sha256_crypt( str.c_str() );
}

/*
 * custom CopyString using create                                  -Thoric
 */
char *CopyString( const std::string &str )
{
  static char *ret = NULL;

  if( str.empty() )
    return NULL;

  AllocateMemory( ret, char, str.length() + 1 );
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

std::string IntToString( int num, int base )
{
  std::string buf;

  if( base < 2 || base > 16 )
    {
      return buf;
    }

  int quotient = value;

  do
    {
      buf += "0123456789abcdef"[ std::abs( quotient % base ) ];
      quotient /= base;
    }
  while( quotient );

  if( value < 0 && base == 10 )
    {
      buf += '-';
    }

  std::reverse( buf.begin(), buf.end() );
  return buf;
}
