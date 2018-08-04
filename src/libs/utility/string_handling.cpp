#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <algorithm>
#include <cctype>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <cassert>

#include "utility.hpp"
#include "sha256.hpp"

#define HIDDEN_TILDE    '*'

typedef int (*STRING_COMPARATOR)(const std::string&, const std::string&);
typedef char* (*STRING_TOKENIZER)( char*, char* );

static std::string GetNextChunk( std::string &str, const char c );
static int IsName2(const std::string&, const std::string&);
static int IsName2Prefix(const std::string&, const std::string&);
static int IsNameInternal(const std::string&, const std::string&,
                          STRING_COMPARATOR, STRING_TOKENIZER );
static int NiftyIsNameInternal(const std::string&, const std::string&,
                               STRING_COMPARATOR, STRING_TOKENIZER );

/*
 * See if a string is one of the names of an object.
 */
static int IsNameInternal( const std::string &str, const std::string &namelist,
                           STRING_COMPARATOR compare_string,
                           STRING_TOKENIZER tokenize_string )
{
  char name[MAX_INPUT_LENGTH];
  char tmp_buf[MAX_INPUT_LENGTH];
  char *tmp = tmp_buf;
  sprintf( tmp_buf, "%s", namelist.c_str() );

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

int IsName(const std::string &str, const std::string &namelist)
{
  return IsNameInternal( str, namelist, StrCmp, OneArgument );
}

int IsNamePrefix(const std::string &str, const std::string &namelist)
{
  return IsNameInternal( str, namelist, StringPrefix, OneArgument );
}

/*
 * See if a string is one of the names of an object.            -Thoric
 * Treats a dash as a word delimiter as well as a space
 */
int IsName2(const std::string &str, const std::string &namelist)
{
  return IsNameInternal( str, namelist, StrCmp, OneArgument2 );
}

int IsName2Prefix(const std::string &str, const std::string &namelist)
{
  return IsNameInternal( str, namelist, StringPrefix, OneArgument2 );
}

/*                                                              -Thoric
 * Checks if str is a name in namelist supporting multiple keywords
 */
static int NiftyIsNameInternal(const std::string &str, const std::string &namelist,
                               STRING_COMPARATOR compare_string,
                               STRING_TOKENIZER tokenize_string )
{
  char name[MAX_INPUT_LENGTH];
  char tmp_str_buf[MAX_INPUT_LENGTH];
  char *tmp_str = tmp_str_buf;
  char tmp_namelist_buf[MAX_INPUT_LENGTH];
  char *tmp_namelist = tmp_namelist_buf;

  if(str.empty())
    return false;

  sprintf( tmp_str_buf, "%s", str.c_str() );
  sprintf( tmp_namelist_buf, "%s", namelist.c_str() );

  for ( ; ; )
    {
      tmp_str = tokenize_string( tmp_str, name );

      if ( name[0] == '\0' )
        return true;

      if ( !compare_string( name, tmp_namelist ) )
        return false;
    }
}

int NiftyIsName(const std::string &str, const std::string &namelist)
{
  return NiftyIsNameInternal( str, namelist, IsName2, OneArgument2 );
}

int NiftyIsNamePrefix(const std::string &str, const std::string &namelist)
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
int StrCmp(const std::string &first, const std::string &second)
{
#ifdef HAVE_STRCASECMP
  return strcasecmp( first.c_str(), second.c_str() );
#else
  return strcmp( ToUpper( first ).c_str(), ToUpper( second ).c_str() );
#endif
}

/*
 * Compare strings, case insensitive, for prefix matching.
 * Return true if astr not a prefix of bstr
 *   (compatibility with historical functions).
 */
int StringPrefix( const std::string &needle, const std::string &haystack )
{
  int match = 1;

  if( haystack.size() >= needle.size()
      && !StrCmp( needle, haystack.substr( 0, needle.size() ) ) )
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
int StringInfix( const std::string &needle,
                 const std::string &haystackRef )
{
  std::string haystack = haystackRef;
  int match = 1;

  while( !haystack.empty() )
    {
      std::string token = GetNextChunk( haystack, ' ' );

      if( !StringPrefix( needle, token ) )
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
  int sstr1 = astr.size();
  int sstr2 = bstr.size();
  const char *bstr_ptr = bstr.c_str();

  if ( sstr1 <= sstr2 && !StrCmp( astr, bstr_ptr + sstr2 - sstr1 ) )
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

std::string ToLower( std::string str )
{
  transform( str.begin(), str.end(), str.begin(), tolower );
  return str;
}

std::string ToUpper( std::string str )
{
  transform( str.begin(), str.end(), str.begin(), toupper );
  return str;
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

  assert(str != nullptr);

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
bool IsNumber( const std::string &arg )
{
  if (arg.empty())
    return false;

  for (char letter : arg)
    {
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
  sprintf( argument, "%s", orig_argument );

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
char *CopyString(const std::string &str)
{
  static char *ret = NULL;
  AllocateMemory( ret, char, strlen( str.c_str() ) + 1 );
  strcpy( ret, str.c_str() );
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

const char *IntToString( int num )
{
  static char buf[MAX_STRING_LENGTH];
  sprintf( buf, "%d", num );
  return buf;  
}

static std::string GetNextChunk( std::string &str, const char c )
{
  std::string::size_type pos = str.find( c );
  std::string line = str.substr( 0, pos );

  if( pos == std::string::npos )
    {
      str.erase();
    }
  else
    {
      str.erase( 0, pos + 1 );
    }

  return line;
}
