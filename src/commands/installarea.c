#include "character.h"
#include "mud.h"
#include "reset.h"

/*
 * A complicated to use command as it currently exists.         -Thoric
 * Once area->author and area->name are cleaned up... it will be easier
 */
void do_installarea( Character *ch, char *argument )
{
  Area     *tarea;
  char  arg[MAX_INPUT_LENGTH];
  char  buf[MAX_STRING_LENGTH];
  int           num;
  Descriptor *d;

  argument = OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Syntax: installarea <filename> [Area title]\r\n", ch );
      return;
    }

  for ( tarea = first_build; tarea; tarea = tarea->next )
    {
      if ( !StrCmp( tarea->filename, arg ) )
        {
          if ( argument && argument[0] != '\0' )
            {
              FreeMemory( tarea->name );
              tarea->name = CopyString( argument );
            }

	  /* Fold area with install flag -- auto-removes prototype flags */
          SendToCharacter( "Saving and installing file...\r\n", ch );
          FoldArea( tarea, tarea->filename, true );

          /* Remove from prototype area list */
          UNLINK( tarea, first_build, last_build, next, prev );

          /* Add to real area list */
          LINK( tarea, first_area, last_area, next, prev );

          /* Fix up author if online */
          for ( d = first_descriptor; d; d = d->next )
            if ( d->character
                 &&   d->character->pcdata
                 &&   d->character->pcdata->area == tarea )
              {
                /* remove area from author */
                d->character->pcdata->area = NULL;
                /* clear out author vnums  */
                d->character->pcdata->r_range_lo = 0;
                d->character->pcdata->r_range_hi = 0;
                d->character->pcdata->o_range_lo = 0;
                d->character->pcdata->o_range_hi = 0;
                d->character->pcdata->m_range_lo = 0;
                d->character->pcdata->m_range_hi = 0;
              }

          top_area++;
          SendToCharacter( "Writing area.lst...\r\n", ch );
          WriteAreaList();
          SendToCharacter( "Resetting new area.\r\n", ch );
          num = tarea->nplayer;
          tarea->nplayer = 0;
          ResetArea( tarea );
          tarea->nplayer = num;
          SendToCharacter( "Renaming author's building file.\r\n", ch );
          sprintf( buf, "%s%s.installed", BUILD_DIR, tarea->filename );
          sprintf( arg, "%s%s", BUILD_DIR, tarea->filename );
          rename( arg, buf );
          SendToCharacter( "Done.\r\n", ch );
          return;
        }
    }

  SendToCharacter( "No such area exists.\r\n", ch );
}
