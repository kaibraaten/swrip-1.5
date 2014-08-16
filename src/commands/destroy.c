#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_destroy( Character *ch, char *argument )
{
  Character *victim;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Destroy what player file?\r\n", ch );
      return;
    }

  for ( victim = first_char; victim; victim = victim->next )
    if ( !IsNpc(victim) && !str_cmp(victim->name, arg) )
      break;
  if ( !victim )
    {
      Descriptor *d;

      /* Make sure they aren't halfway logged in. */
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) && !IsNpc(victim) &&
	     !str_cmp(victim->name, arg) )
          break;
      if ( d )
        close_socket( d, true );
    }
  else
    {
      int x, y;

      quitting_char = victim;
      save_char_obj( victim );
      saving_char = NULL;
      extract_char( victim, true );
      for ( x = 0; x < MAX_WEAR; x++ )
        for ( y = 0; y < MAX_LAYERS; y++ )
          save_equipment[x][y] = NULL;
    }

  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
           capitalize( arg ) );
  if ( !rename( buf, buf2 ) )
    {
      Area *pArea;

      set_char_color( AT_RED, ch );
      send_to_char( "Player destroyed.  Pfile saved in backup directory.\r\n", ch );
      sprintf( buf, "%s%s", GOD_DIR, capitalize(arg) );
      if ( !remove( buf ) )
        send_to_char( "Player's immortal data destroyed.\r\n", ch );
      else if ( errno != ENOENT )
        {
          ch_printf( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric.\r\n",
                     errno, strerror( errno ) );
          sprintf( buf2, "%s destroying %s", ch->name, buf );
          perror( buf2 );
        }

      sprintf( buf2, "%s.are", capitalize(arg) );
      for ( pArea = first_build; pArea; pArea = pArea->next )
        if ( !str_cmp( pArea->filename, buf2 ) )
          {
            sprintf( buf, "%s%s", BUILD_DIR, buf2 );
            if ( IS_SET( pArea->status, AREA_LOADED ) )
	      fold_area( pArea, buf, false );
            close_area( pArea );
            sprintf( buf2, "%s.bak", buf );
            set_char_color( AT_RED, ch ); /* Log message changes colors */
            if ( !rename( buf, buf2 ) )
              send_to_char( "Player's area data destroyed.  Area saved as backup.\r\n", ch );
            else if ( errno != ENOENT )
              {
                ch_printf( ch, "Unknown error #%d - %s (area data).  Report to Thoric.\r\n",
                           errno, strerror( errno ) );
                sprintf( buf2, "%s destroying %s", ch->name, buf );
                perror( buf2 );
              }
          }
    }
  else if ( errno == ENOENT )
    {
      set_char_color( AT_PLAIN, ch );
      send_to_char( "Player does not exist.\r\n", ch );
    }
  else
    {
      set_char_color( AT_WHITE, ch );
      ch_printf( ch, "Unknown error #%d - %s.  Report to Thoric.\r\n",
                 errno, strerror( errno ) );
      sprintf( buf, "%s destroying %s", ch->name, arg );
      perror( buf );
    }
}
