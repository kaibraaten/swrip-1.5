#include "mud.h"
#include "spaceobject.h"

static void write_spaceobject_list( void );

void do_makespaceobject( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char filename[256];
  Spaceobject *spaceobject;

  if ( !argument || argument[0] == '\0' )
    {
      SendToCharacter( "Usage: makespaceobject <spaceobject name>\r\n", ch );
      return;
    }


  AllocateMemory( spaceobject, Spaceobject, 1 );
  LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

  spaceobject->Name      = CopyString( argument );

  spaceobject->LandingSites.LocationAName = CopyString( "" );
  spaceobject->LandingSites.LocationBName = CopyString( "" );
  spaceobject->LandingSites.LocationCName = CopyString( "" );

  argument = OneArgument( argument, arg );
  sprintf( filename, "%s" , StringToLowercase(arg) );
  spaceobject->Filename = CopyString( filename );
  SaveSpaceobject( spaceobject );
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
      Bug( "FATAL: cannot open space.lst for writing!\r\n", 0 );
      return;
    }

  for ( tspaceobject = first_spaceobject; tspaceobject; tspaceobject = tspaceobject->next )
    fprintf( fpout, "%s\n", tspaceobject->Filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}
