#include "mud.h"

static void write_spaceobject_list( void );

void do_makespaceobject( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char filename[256];
  Spaceobject *spaceobject;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }


  CREATE( spaceobject, Spaceobject, 1 );
  LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

  spaceobject->name      = str_dup( argument );

  spaceobject->landing_site.locationa = str_dup( "" );
  spaceobject->landing_site.locationb = str_dup( "" );
  spaceobject->landing_site.locationc = str_dup( "" );

  argument = one_argument( argument, arg );
  sprintf( filename, "%s" , strlower(arg) );
  spaceobject->filename = str_dup( filename );
  save_spaceobject( spaceobject );
  write_spaceobject_list();
}

static void write_spaceobject_list( void )
{
  Spaceobject *tspaceobject = NULL;
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
