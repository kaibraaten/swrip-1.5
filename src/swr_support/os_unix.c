#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "os.h"

extern FILE *out_stream;

static const char *get_next_filename( const char *directory )
{
  static char filename[256];
  DIR *dp = NULL;
  struct dirent *de = NULL;
  int high_num = 1000;

  *filename = '\0';

  if( !( dp = opendir( directory ) ) )
  {
    perror( directory );
    return filename;
  }

  while( ( de = readdir( dp ) ) != NULL )
  {
    if( de->d_name[0] != '.' )
    {
      int current_number = strtol( de->d_name, 0, 10 );
      high_num = current_number > high_num ? current_number : high_num;
    }
  }

  ++high_num;
  snprintf( filename, 256, "%s%d.log", directory, high_num );
  return filename;
}

FILE *open_log_file(void)
{
	return fopen( get_next_filename( "log/" ), "w" );
}

void os_setup( void )
{
  out_stream = open_log_file();

  if( !out_stream )
  {
    fprintf( stderr, "Failed to open new log file.\n" );
    perror( strerror( errno ) );
    exit( 1 );
  }
}

void os_cleanup( void )
{
  if( out_stream )
  {
    fclose( out_stream );
  }
}

int set_nonblocking( socket_t sock )
{
  return fcntl( sock, F_SETFL, O_NONBLOCK );
}
