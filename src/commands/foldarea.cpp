#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "room.hpp"

void do_foldarea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char arg[MAX_INPUT_LENGTH];
  bool fold_all_areas = false;
  bool found = false;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Usage: foldarea <filename> [remproto]\r\n" );
      return;
    }

  if( !StrCmp( arg, "this" ) )
    {
      strcpy( arg, ch->InRoom->Area->Filename );
    }

  fold_all_areas = !StrCmp( arg, "all" );

  for ( tarea = FirstArea; tarea; tarea = tarea->Next )
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
      ch->Echo( "Done.\r\n" );
    }
  else
    {
      ch->Echo( "No such area exists.\r\n" );
    }
}

