#include <string.h>
#include "mud.h"
#include "character.h"
#include "area.h"

void do_foldarea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char arg[MAX_INPUT_LENGTH];
  bool fold_all_areas = false;
  bool found = false;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: foldarea <filename> [remproto]\r\n", ch );
      return;
    }

  if( !StrCmp( arg, "this" ) )
    {
      strcpy( arg, ch->InRoom->Area->Filename );
    }

  fold_all_areas = !StrCmp( arg, "all" );

  for ( tarea = first_area; tarea; tarea = tarea->Next )
    {
      if ( !StrCmp( tarea->Filename, arg ) || fold_all_areas )
        {
          if (!StrCmp( argument, "remproto") )
            FoldArea( tarea, tarea->Filename, true );
          else
            FoldArea( tarea, tarea->Filename, false );

	  found = true;
        }
    }

  if( found )
    {
      Echo( ch, "Done.\r\n" );
    }
  else
    {
      Echo( ch, "No such area exists.\r\n" );
    }
}
