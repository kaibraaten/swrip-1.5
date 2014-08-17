#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_loadup( Character *ch, char *argument )
{
  char fname[1024];
  char name[256];
  struct stat fst;
  Descriptor *d;
  int old_room_vnum;
  char buf[MAX_STRING_LENGTH];

  one_argument( argument, name );
  if ( name[0] == '\0' )
    {
      send_to_char( "Usage: loadup <playername>\r\n", ch );
      return;
    }

  name[0] = UPPER(name[0]);

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           capitalize( name ) );
  if ( stat( fname, &fst ) != -1 )
    {
      CREATE( d, Descriptor, 1 );
      d->next = NULL;
      d->prev = NULL;
      d->connection_state = CON_GET_NAME;
      d->outsize = 2000;
      CREATE( d->outbuf, char, d->outsize );

      add_char( d->character );
      old_room_vnum = d->character->in_room->vnum;
      char_to_room( d->character, ch->in_room );

      if ( d->character->plr_home != NULL )
        {
          char filename[256];
	  FILE *fph;
          Room *storeroom = d->character->plr_home;
          OBJ_DATA *obj;
          OBJ_DATA *obj_next;

          for ( obj = storeroom->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              extract_obj( obj );
            }

          sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(d->character->name[0]),
                   capitalize( d->character->name ) );
          if ( ( fph = fopen( filename, "r" ) ) != NULL )
            {
              OBJ_DATA *tobj, *tobj_next;

              rset_supermob(storeroom);

              for ( ; ; )
                {
                  char letter;
                  const char *word;

                  letter = fread_letter( fph );
                  if ( letter == '*' )
                    {
                      fread_to_eol( fph );
                      continue;
                    }

                  if ( letter != '#' )
                    {
                      bug( "Load_plr_home: # not found.", 0 );
                      bug( d->character->name, 0 );
                      break;
                    }

                  word = fread_word( fph );
                  if ( !str_cmp( word, "OBJECT" ) )     /* Objects      */
                    fread_obj  ( supermob, fph, OS_CARRY );
                  else
                    if ( !str_cmp( word, "END"    ) )   /* Done         */
                      break;
                    else
		      {
                        bug( "Load_plr_home: bad section.", 0 );
                        bug( d->character->name, 0 );
                        break;
                      }
                }

              fclose( fph );

              for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
                {
                  tobj_next = tobj->next_content;
                  obj_from_char( tobj );
                  if( tobj->item_type != ITEM_MONEY )
                    obj_to_room( tobj, storeroom );
                }

              release_supermob();

            }
        }


      if ( GetTrustLevel(d->character) >= GetTrustLevel( ch ) )
        {
          do_say( d->character, "Do *NOT* disturb me again!" );
          send_to_char( "I think you'd better leave that player alone!\r\n", ch );
          d->character->desc    = NULL;
          do_quit( d->character, "" );
          return;
        }
      d->character->desc        = NULL;
      d->character->retran    = old_room_vnum;
      d->character              = NULL;
      DISPOSE( d->outbuf );
      DISPOSE( d );
      ch_printf(ch, "Player %s loaded from room %d.\r\n", capitalize( name ),old_room_vnum );
      sprintf(buf, "%s appears from nowhere, eyes glazed over.\r\n", capitalize( name ) );
      act( AT_IMMORT, buf, ch, NULL, NULL, TO_ROOM );

      send_to_char( "Done.\r\n", ch );
      return;
    }

  send_to_char( "No such player.\r\n", ch );
}
