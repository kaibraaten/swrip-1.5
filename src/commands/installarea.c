#include "character.h"
#include "mud.h"

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

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: installarea <filename> [Area title]\r\n", ch );
      return;
    }

  for ( tarea = first_build; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) )
        {
          if ( argument && argument[0] != '\0' )
            {
              DISPOSE( tarea->name );
              tarea->name = str_dup( argument );
            }

	  /* Fold area with install flag -- auto-removes prototype flags */
          send_to_char( "Saving and installing file...\r\n", ch );
          fold_area( tarea, tarea->filename, true );

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
          send_to_char( "Writing area.lst...\r\n", ch );
          write_area_list( );
          send_to_char( "Resetting new area.\r\n", ch );
          num = tarea->nplayer;
          tarea->nplayer = 0;
          reset_area( tarea );
          tarea->nplayer = num;
          send_to_char( "Renaming author's building file.\r\n", ch );
          sprintf( buf, "%s%s.installed", BUILD_DIR, tarea->filename );
          sprintf( arg, "%s%s", BUILD_DIR, tarea->filename );
          rename( arg, buf );
          send_to_char( "Done.\r\n", ch );
          return;
        }
    }

  send_to_char( "No such area exists.\r\n", ch );
}
