#include <string.h>
#include <stdlib.h>

#include "mud.h"

static void store_teachers( int *teachers, const SKILLTYPE *skill );
static char is_in_list( int needle, const int *haystack, size_t list_size );
static size_t get_list_size( const int *teachers );
static int comparator( const void*, const void* );
static AREA_DATA *get_area( vnum_t vnum );

#define MAX_TEACHER 10000

void do_test( CHAR_DATA *ch, char *argument )
{
  char command[MAX_INPUT_LENGTH];
  argument = one_argument( argument, command );

  if( !str_cmp(command, "teachers") )
    {
      int sn = 0;
      int i = 0;
      int teachers[MAX_TEACHER];
      size_t list_size = 0;
      const AREA_DATA *area = NULL;

      memset( teachers, 0, sizeof( teachers ) );

      for( sn = 0; sn < top_sn; sn++ )
	{
	  const SKILLTYPE *skill = skill_table[sn];

	  if( skill->teachers )
	    {
	      store_teachers( teachers, skill );
	    }
	}

      list_size = get_list_size( teachers );

      qsort( teachers, list_size, sizeof( int ), comparator );

      for( i = 0; i < MAX_TEACHER; i++ )
	{
	  vnum_t vnum = teachers[i];

	  if( vnum == 0 )
	    {
	      break;
	    }

	  area = get_area( vnum );

	  if( area )
	    {
	      ch_printf( ch, "&w%s\r\n", area->filename );
	    }
	  else
	    {
	      ch_printf( ch, "&r%d doesn't exist&w\r\n", vnum );
	    }
	}

      return;
    }

  ch_printf(ch, "Unknown option.\r\n");
}

static int comparator( const void *a, const void *b )
{
  int lhv = *(int*)a;
  int rhv = *(int*)b;

  if( lhv < rhv )
    {
      return -1;
    }
  else if( lhv > rhv )
    {
      return 1;
    }
  else
    {
      return 0;
    }
}

static size_t get_list_size( const int *teachers )
{
  size_t counter = 0;
  int i = 0;

  for( i = 0; i < MAX_TEACHER; ++i )
    {
      if( teachers[i] == 0 )
	{
	  break;
	}
      else
	{
	  ++counter;
	}
    }

  return counter;
}

static void store_teachers( int *teachers, const SKILLTYPE *skill )
{
  char *teachers_buf = skill->teachers;
  vnum_t next_vnum = 0;

  while( (next_vnum = strtol(teachers_buf, &teachers_buf, 10)) != 0 )
    {
      int i = 0;

      if( is_in_list( next_vnum, teachers, MAX_TEACHER ) )
        {
          continue;
        }

      for( i = 0; i < MAX_TEACHER; i++ )
        {
          if( teachers[i] == 0 )
            {
              teachers[i] = next_vnum;
              break;
            }
        }
    }
}

static char is_in_list( int needle, const int *haystack, size_t list_size )
{
  char found = 0;
  size_t i = 0;

  for( i = 0; i < list_size; i++ )
    {
      if( haystack[i] == needle )
        {
          found = 1;
          break;
        }
    }

  return found;
}

static AREA_DATA *get_area( vnum_t vnum )
{
  AREA_DATA *area = NULL;

  for( area = first_area; area; area = area->next )
    {
      if( vnum >= area->low_m_vnum && vnum <= area->hi_m_vnum )
	{
	  break;
	}
    }

  return area;
}
