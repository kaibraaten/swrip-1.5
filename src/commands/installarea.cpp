#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->Author and area->Name are cleaned up... it will be easier
 */
void do_installarea( Character *ch, std::string argument )
{
  Area     *tarea;
  char  arg[MAX_INPUT_LENGTH];
  char  buf[MAX_STRING_LENGTH];
  int           num;
  Descriptor *d;

  argument = OneArgument( argument, arg );
  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Syntax: installarea <filename> [Area title]\r\n", ch );
      return;
    }

  for ( tarea = FirstBuild; tarea; tarea = tarea->Next )
    {
      if ( !StrCmp( tarea->Filename, arg ) )
        {
          if ( !IsNullOrEmpty( argument ) )
            {
              FreeMemory( tarea->Name );
              tarea->Name = CopyString( argument );
            }

	  /* Fold area with install flag -- auto-removes prototype flags */
          SendToCharacter( "Saving and installing file...\r\n", ch );
          FoldArea( tarea, tarea->Filename, true );

          /* Remove from prototype area list */
          UNLINK( tarea, FirstBuild, LastBuild, Next, Previous );

          /* Add to real area list */
          LINK( tarea, FirstArea, LastArea, Next, Previous );

          /* Fix up author if online */
          for ( d = FirstDescriptor; d; d = d->Next )
            if ( d->Character
                 &&   d->Character->PCData
                 &&   d->Character->PCData->Build.Area == tarea )
              {
                /* remove area from author */
                d->Character->PCData->Build.Area = NULL;
                /* clear out author vnums  */
                d->Character->PCData->Build.VnumRanges.Room.First = 0;
                d->Character->PCData->Build.VnumRanges.Room.Last = 0;
                d->Character->PCData->Build.VnumRanges.Object.First = 0;
                d->Character->PCData->Build.VnumRanges.Object.Last = 0;
                d->Character->PCData->Build.VnumRanges.Mob.First = 0;
                d->Character->PCData->Build.VnumRanges.Mob.Last = 0;
              }

          top_area++;
          SendToCharacter( "Writing area.lst...\r\n", ch );
          WriteAreaList();
          SendToCharacter( "Resetting new area.\r\n", ch );
          num = tarea->NumberOfPlayers;
          tarea->NumberOfPlayers = 0;
          ResetArea( tarea );
          tarea->NumberOfPlayers = num;
          SendToCharacter( "Renaming author's building file.\r\n", ch );
          sprintf( buf, "%s%s.installed", BUILD_DIR, tarea->Filename );
          sprintf( arg, "%s%s", BUILD_DIR, tarea->Filename );
          rename( arg, buf );
          SendToCharacter( "Done.\r\n", ch );
          return;
        }
    }

  SendToCharacter( "No such area exists.\r\n", ch );
}
