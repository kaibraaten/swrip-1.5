#include "swr_support.h"
#include <time.h>
#include <string.h>

#ifdef __cplusplus
extern "C"
#endif
void init_mm( void );

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

char *scramble( const char *argument, int modifier )
{
  static char arg[MAX_INPUT_LENGTH];
  int position = 0;
  int conversion = 0;

  modifier %= number_range( 80, 300 ); /* Bitvectors get way too large #s */

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
      conversion = number_range( conversion - 5, conversion + 5 );
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
      conversion = number_range( conversion - 5, conversion + 5 );
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
      conversion = number_range( conversion - 2, conversion + 2 );
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

void init_mm( void )
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

int number_bits( int width )
{
  return number_mm( ) & ( ( 1 << width ) - 1 );
}

/*
 * Roll some dice.                                              -Thoric
 */
int dice( int number, int size )
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
    sum += number_range( 1, size );

  return sum;
}

/*
 * Stick a little fuzz on a number.
 */
int number_fuzzy( int number )
{
  switch ( number_bits( 2 ) )
  {
    case 0:
      number -= 1;
      break;

    case 3:
      number += 1;
      break;
  }

  return UMAX( 1, number );
}

/*
 * Generate a random number.
 */
int number_range( int from, int to )
{
  if ( ( to = to - from + 1 ) <= 1 )
    return from;

  return (number_mm() % to) + from;
}

/*
 * Generate a percentile roll.
 */
int number_percent( void )
{
  return number_mm() % 100;
}

/*
 * Generate a random door.
 */
int number_door( void )
{
  int door = 0;

  while ( ( door = number_mm( ) & (16-1) ) > 9 )
    ;

  return door;
}

char *flag_string( int bitvector, const char * const flagarray[] )
{
  static char buf[MAX_STRING_LENGTH];
  int x = 0;

  buf[0] = '\0';

  for ( x = 0; x < 32 ; x++ )
    if ( IS_SET( bitvector, 1 << x ) )
    {
      strcat( buf, flagarray[x] );
      strcat( buf, " " );
    }

  if ( (x=strlen( buf )) > 0 )
    buf[--x] = '\0';

  return buf;
}
