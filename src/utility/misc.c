#include "utility.h"
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <locale.h>
#include <monetary.h>

#ifdef __cplusplus
extern "C"
#endif

int umin( int check, int ncheck )
{
  return check < ncheck ? check : ncheck;
}

int umax( int check, int ncheck )
{
  return check > ncheck ? check : ncheck;
}

int urange( int mincheck, int check, int maxcheck )
{
  if( check < mincheck )
    return mincheck;

  if( check > maxcheck )
    return maxcheck;

  return check;
}

char *Scramble( const char *argument, int modifier )
{
  static char arg[MAX_INPUT_LENGTH];
  int position = 0;
  int conversion = 0;

  modifier %= GetRandomNumberFromRange( 80, 300 ); /* Bitvectors get way too large #s */

  for ( position = 0; position < MAX_INPUT_LENGTH; position++ )
  {
    if ( argument[position] == '\0' )
    {
      arg[position] = '\0';
      return arg;
    }
    else if ( argument[position] >= 'A' && argument[position] <= 'Z' )
    {
      conversion = -conversion + position
	- modifier + argument[position] - 'A';
      conversion = GetRandomNumberFromRange( conversion - 5, conversion + 5 );
      while ( conversion > 25 )
	conversion -= 26;
      while ( conversion < 0 )
	conversion += 26;
      arg[position] = (char)(conversion + 'A');
    }
    else if ( argument[position] >= 'a' && argument[position] <= 'z' )
    {
      conversion = -conversion + position
	- modifier + argument[position] - 'a';
      conversion = GetRandomNumberFromRange( conversion - 5, conversion + 5 );
      while ( conversion > 25 )
	conversion -= 26;
      while ( conversion < 0 )
	conversion += 26;
      arg[position] = (char)(conversion + 'a');
    }
    else if ( argument[position] >= '0' && argument[position] <= '9' )
    {
      conversion = -conversion + position
	- modifier + argument[position] - '0';
      conversion = GetRandomNumberFromRange( conversion - 2, conversion + 2 );
      while ( conversion > 9 )
	conversion -= 10;
      while ( conversion < 0 )
	conversion += 10;
      arg[position] = (char)(conversion + '0');
    }
    else
      arg[position] = argument[position];
  }

  arg[position-1] = '\0';
  return arg;
}

/*
 * I've gotten too many bad reports on OS-supplied random number generators.
 * This is the Mitchell-Moore algorithm from Knuth Volume II.
 * Best to leave the constants alone unless you've read Knuth.
 * -- Furey
 */
static int rgiState[2+55];

void InitMM( void )
{
  int *piState = &rgiState[2];
  int iState = 0;

  piState[-2] = 55 - 55;
  piState[-1] = 55 - 24;

  piState[0]  = ((int) time(0) ) & ((1 << 30) - 1);
  piState[1]  = 1;

  for ( iState = 2; iState < 55; iState++ )
  {
    piState[iState] = (piState[iState-1] + piState[iState-2])
      & ((1 << 30) - 1);
  }
}

static int number_mm( void )
{
  int *piState = &rgiState[2];
  int iState1 = piState[-2];
  int iState2 = piState[-1];
  int iRand = (piState[iState1] + piState[iState2]) & ((1 << 30) - 1);

  piState[iState1]    = iRand;

  if ( ++iState1 == 55 )
    iState1 = 0;

  if ( ++iState2 == 55 )
    iState2 = 0;

  piState[-2]         = iState1;
  piState[-1]         = iState2;
  return iRand >> 6;
}

int NumberBits( int width )
{
  return number_mm() & ( ( 1 << width ) - 1 );
}

/*
 * Roll some dice.                                              -Thoric
 */
int RollDice( int number, int size )
{
  int idice = 0;
  int sum = 0;

  switch ( size )
  {
    case 0:
      return 0;

    case 1:
      return number;
  }

  for ( idice = 0, sum = 0; idice < number; idice++ )
    sum += GetRandomNumberFromRange( 1, size );

  return sum;
}

/*
 * Stick a little fuzz on a number.
 */
int NumberFuzzy( int number )
{
  switch ( NumberBits( 2 ) )
  {
    case 0:
      number -= 1;
      break;

    case 3:
      number += 1;
      break;
  }

  return umax( 1, number );
}

/*
 * Generate a random number.
 */
int GetRandomNumberFromRange( int from, int to )
{
  if ( ( to = to - from + 1 ) <= 1 )
    return from;

  return (number_mm() % to) + from;
}

/*
 * Generate a percentile roll.
 */
int GetRandomPercent( void )
{
  return number_mm() % 100;
}

/*
 * Generate a random door.
 */
int GetRandomDoor( void )
{
  int door = 0;

  while ( ( door = number_mm() & (16-1) ) > 9 )
    ;

  return door;
}

char *FlagString( int bitvector, const char * const flagarray[] )
{
  static char buf[MAX_STRING_LENGTH];
  int x = 0;

  buf[0] = '\0';

  for ( x = 0; x < 32 ; x++ )
    {
      if ( IsBitSet( bitvector, 1 << x ) )
	{
	  strcat( buf, flagarray[x] );
	  strcat( buf, " " );
	}
    }

  if ( (x=strlen( buf )) > 0 )
    {
      buf[--x] = '\0';
    }

  return buf;
}

/*
 * Simple linear interpolation.
 */
int Interpolate( int level, int value_00, int value_32 )
{
  return value_00 + level * (value_32 - value_00) / 32;
}

/*
 * StripColorCodes - removes the color codes from a string.
 *
 * Notice: currently setup for the default smaug/swr color code system,
 * if you do not use these, then you will have to do some editing.
 *
 * This function should properly remove the color codes from a string
 * Not sure if its any use to anyone, but i thought i'd give it out.
 *
 * I'm not asking for my name to be displayed, but i would like to have my name\
 at
 * least still attached to this function. Altho, it certainly would be nice.
 *
 * Feel free to contact me if you have any problems.
 *
 * - Gavin - ur_gavin@hotmail.com
 * - Unknown Regions - http://ur.lynker.com
 */
char *StripColorCodes( char *text )
{
  int i = 0, j = 0;

  if (!text || text[0] == '\0')
    {
      return NULL;
    }
  else
    {
      char *buf;
      static char done[MAX_INPUT_LENGTH*2];

      done[0] = '\0';

      if ( (buf = (char *)malloc( strlen(text) * sizeof(text) )) == NULL)
        return text;

      /* Loop through until you've hit your terminating 0 */
      while (text[i] != '\0')
        {
          while (text[i] == '&')
            {
              i += 2;
            }
	  if ( text[i] != '\0' )
            {
              if ( isspace(text[i]) )
                {
                  buf[j] = ' ';
                  i++;
                  j++;
                }
              else
                {
                  buf[j] = text[i];
                  i++;
                  j++;
                }
            }
          else
            buf[j] = '\0';
        }

      buf[j] = '\0';

      sprintf(done, "%s", buf);
      buf = (char*)realloc(buf, j*sizeof(char));
      free( buf);

      return done;
    }
}

char *PunctuateNumber( long number, char **externalBuffer )
{
  static char staticBuffer[1024];
  char *buffer = NULL;

  if( externalBuffer != NULL && *externalBuffer != NULL )
    {
      buffer = *externalBuffer;
    }
  else
    {
      buffer = staticBuffer;
    }

  setlocale( LC_MONETARY, "en_US" );
  strfmon( buffer, 1024, "%!#0.0n", (double)number );

  return TrimString( buffer, ' ' );
}
