#include "mud.h"

static void write_spaceobject_list( void );

void do_makespaceobject( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char filename[256];
  SPACE_DATA *spaceobject;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }


  CREATE( spaceobject, SPACE_DATA, 1 );
  LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

  spaceobject->name      = STRALLOC( argument );

  spaceobject->landing_site.locationa = STRALLOC( "" );
  spaceobject->landing_site.locationb = STRALLOC( "" );
  spaceobject->landing_site.locationc = STRALLOC( "" );

  argument = one_argument( argument, arg );
  sprintf( filename, "%s" , strlower(arg) );
  spaceobject->filename = str_dup( filename );
  save_spaceobject( spaceobject );
  write_spaceobject_list();
}

static void write_spaceobject_list( void )
{
  SPACE_DATA *tspaceobject = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SPACE_DIR, SPACE_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open space.lst for writing!\r\n", 0 );
      return;
    }

  for ( tspaceobject = first_spaceobject; tspaceobject; tspaceobject = tspaceobject->next )
    fprintf( fpout, "%s\n", tspaceobject->filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}
