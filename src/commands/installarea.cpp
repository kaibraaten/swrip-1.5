#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "playerrepository.hpp"

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->Author and area->Name are cleaned up... it will be easier
 */
void do_installarea( Character *ch, char *argument )
{
  Area *tarea = nullptr;
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int num = 0;

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
          for(Character *author : PlayerCharacters->Entities())
            {
              if(author->PCData->Build.Area == tarea)
                {
                  /* remove area from author */
                  author->PCData->Build.Area = nullptr;
                  /* clear out author vnums  */
                  author->PCData->Build.VnumRanges.Room.First = INVALID_VNUM;
                  author->PCData->Build.VnumRanges.Room.Last = INVALID_VNUM;
                  author->PCData->Build.VnumRanges.Object.First = INVALID_VNUM;
                  author->PCData->Build.VnumRanges.Object.Last = INVALID_VNUM;
                  author->PCData->Build.VnumRanges.Mob.First = INVALID_VNUM;
                  author->PCData->Build.VnumRanges.Mob.Last = INVALID_VNUM;
                }
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
