#include <string.h>
#include <stdlib.h>

#include "mud.h"

static void store_teachers( int *teachers, const SKILLTYPE *skill );
static char is_in_list( int needle, const int *haystack, size_t list_size );
static size_t get_list_size( const int *teachers );
static int comparator( const void*, const void* );
static AREA_DATA *get_area( vnum_t vnum );
static void command_teachers( CHAR_DATA *ch );
static void command_noteacher( CHAR_DATA *ch );
static void add_area_to_list( AREA_DATA **arealist, AREA_DATA *area );
static bool is_in_arealist( AREA_DATA **arealist, AREA_DATA *area );

#define MAX_TEACHER 10000

void do_test( CHAR_DATA *ch, char *argument )
{
  char command[MAX_INPUT_LENGTH];
  argument = one_argument( argument, command );

  if( !str_cmp( command, "teachers" ) )
    {
      command_teachers( ch );
      return;
    }

  if( !str_cmp( command, "noteacher" ) )
    {
      command_noteacher(ch);
      return;
    }

  ch_printf(ch, "Unknown option.\r\n");
}

static void command_noteacher( CHAR_DATA *ch )
{
  int sn = 0;

  for( sn = 0; sn < top_sn; sn++ )
    {
      const SKILLTYPE *skill = skill_table[sn];

      if( skill->type == SKILL_TONGUE )
	{
	  continue;
	}

      if( !skill->teachers || strlen( skill->teachers ) == 0 )
        {
	  ch_printf(ch, "%s has no teachers\r\n", skill->name);
        }
    }
}

#define MAX_AREA_LIST_SIZE 100

static void command_teachers( CHAR_DATA *ch )
{
  int sn = 0;
  int i = 0;
  int teachers[MAX_TEACHER];
  size_t list_size = 0;
  AREA_DATA *arealist[MAX_AREA_LIST_SIZE];

  memset( teachers, 0, sizeof( teachers ) );
  memset( arealist, 0, sizeof( arealist ) );

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
      AREA_DATA *area = NULL;

      if( vnum == 0 )
	{
	  break;
	}

      area = get_area( vnum );

      if( area )
	{
	  add_area_to_list( arealist, area );
	}
    }

  for( i = 0; i < MAX_AREA_LIST_SIZE; ++i )
    {
      AREA_DATA *area = arealist[i];

      if( !area )
	{
	  break;
	}

      ch_printf( ch, "%s\r\n", area->filename );
    }
}

static void add_area_to_list( AREA_DATA **arealist, AREA_DATA *area )
{
  int i = 0;

  if( is_in_arealist( arealist, area ) )
    {
      return;
    }

  for( i = 0; i < MAX_AREA_LIST_SIZE; ++i )
    {
      if( arealist[i] == NULL )
	{
	  arealist[i] = area;
	  return;
	}
    }
}

static bool is_in_arealist( AREA_DATA **arealist, AREA_DATA *area )
{
  bool found = FALSE;
  int i = 0;

  for( i = 0; i < MAX_AREA_LIST_SIZE; ++i )
    {
      if( arealist[i] == area )
	{
	  found = TRUE;
	  break;
	}
    }

  return found;
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
