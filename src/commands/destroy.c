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

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Destroy what player file?\r\n", ch );
      return;
    }

  for ( victim = first_char; victim; victim = victim->next )
    if ( !IsNpc(victim) && !StrCmp(victim->name, arg) )
      break;
  if ( !victim )
    {
      Descriptor *d;

      /* Make sure they aren't halfway logged in. */
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) && !IsNpc(victim) &&
	     !StrCmp(victim->name, arg) )
          break;
      if ( d )
        CloseSocket( d, true );
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
           Capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
           Capitalize( arg ) );
  if ( !rename( buf, buf2 ) )
    {
      Area *pArea;

      SetCharacterColor( AT_RED, ch );
      SendToCharacter( "Player destroyed.  Pfile saved in backup directory.\r\n", ch );
      sprintf( buf, "%s%s", GOD_DIR, Capitalize(arg) );
      if ( !remove( buf ) )
        SendToCharacter( "Player's immortal data destroyed.\r\n", ch );
      else if ( errno != ENOENT )
        {
          ChPrintf( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric.\r\n",
                     errno, strerror( errno ) );
          sprintf( buf2, "%s destroying %s", ch->name, buf );
          perror( buf2 );
        }

      sprintf( buf2, "%s.are", Capitalize(arg) );
      for ( pArea = first_build; pArea; pArea = pArea->next )
        if ( !StrCmp( pArea->filename, buf2 ) )
          {
            sprintf( buf, "%s%s", BUILD_DIR, buf2 );
            if ( IsBitSet( pArea->status, AREA_LOADED ) )
	      FoldArea( pArea, buf, false );
            CloseArea( pArea );
            sprintf( buf2, "%s.bak", buf );
            SetCharacterColor( AT_RED, ch ); /* Log message changes colors */
            if ( !rename( buf, buf2 ) )
              SendToCharacter( "Player's area data destroyed.  Area saved as backup.\r\n", ch );
            else if ( errno != ENOENT )
              {
                ChPrintf( ch, "Unknown error #%d - %s (area data).  Report to Thoric.\r\n",
                           errno, strerror( errno ) );
                sprintf( buf2, "%s destroying %s", ch->name, buf );
                perror( buf2 );
              }
          }
    }
  else if ( errno == ENOENT )
    {
      SetCharacterColor( AT_PLAIN, ch );
      SendToCharacter( "Player does not exist.\r\n", ch );
    }
  else
    {
      SetCharacterColor( AT_WHITE, ch );
      ChPrintf( ch, "Unknown error #%d - %s.  Report to Thoric.\r\n",
                 errno, strerror( errno ) );
      sprintf( buf, "%s destroying %s", ch->name, arg );
      perror( buf );
    }
}
