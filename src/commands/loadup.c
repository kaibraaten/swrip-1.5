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

  OneArgument( argument, name );
  if ( name[0] == '\0' )
    {
      SendToCharacter( "Usage: loadup <playername>\r\n", ch );
      return;
    }

  name[0] = CharToUppercase(name[0]);

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           Capitalize( name ) );
  if ( stat( fname, &fst ) != -1 )
    {
      AllocateMemory( d, Descriptor, 1 );
      d->next = NULL;
      d->prev = NULL;
      d->connection_state = CON_GET_NAME;
      d->outsize = 2000;
      AllocateMemory( d->outbuf, char, d->outsize );

      AddCharacter( d->character );
      old_room_vnum = d->character->in_room->vnum;
      CharacterToRoom( d->character, ch->in_room );

      if ( d->character->plr_home != NULL )
        {
          char filename[256];
	  FILE *fph;
          Room *storeroom = d->character->plr_home;
          Object *obj;
          Object *obj_next;

          for ( obj = storeroom->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              ExtractObject( obj );
            }

          sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(d->character->name[0]),
                   Capitalize( d->character->name ) );
          if ( ( fph = fopen( filename, "r" ) ) != NULL )
            {
              Object *tobj, *tobj_next;

              RoomProgSetSupermob(storeroom);

              for ( ; ; )
                {
                  char letter;
                  const char *word;

                  letter = ReadChar( fph );
                  if ( letter == '*' )
                    {
                      ReadToEndOfLine( fph );
                      continue;
                    }

                  if ( letter != '#' )
                    {
                      Bug( "Load_plr_home: # not found.", 0 );
                      Bug( d->character->name, 0 );
                      break;
                    }

                  word = ReadWord( fph );
                  if ( !StrCmp( word, "OBJECT" ) )     /* Objects      */
                    ReadObject  ( supermob, fph, OS_CARRY );
                  else
                    if ( !StrCmp( word, "END"    ) )   /* Done         */
                      break;
                    else
		      {
                        Bug( "Load_plr_home: bad section.", 0 );
                        Bug( d->character->name, 0 );
                        break;
                      }
                }

              fclose( fph );

              for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
                {
                  tobj_next = tobj->next_content;
                  ObjectFromCharacter( tobj );
                  if( tobj->item_type != ITEM_MONEY )
                    ObjectToRoom( tobj, storeroom );
                }

              ReleaseSupermob();

            }
        }


      if ( GetTrustLevel(d->character) >= GetTrustLevel( ch ) )
        {
          do_say( d->character, "Do *NOT* disturb me again!" );
          SendToCharacter( "I think you'd better leave that player alone!\r\n", ch );
          d->character->desc    = NULL;
          do_quit( d->character, "" );
          return;
        }
      d->character->desc        = NULL;
      d->character->retran    = old_room_vnum;
      d->character              = NULL;
      FreeMemory( d->outbuf );
      FreeMemory( d );
      ChPrintf(ch, "Player %s loaded from room %d.\r\n", Capitalize( name ),old_room_vnum );
      sprintf(buf, "%s appears from nowhere, eyes glazed over.\r\n", Capitalize( name ) );
      Act( AT_IMMORT, buf, ch, NULL, NULL, TO_ROOM );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  SendToCharacter( "No such player.\r\n", ch );
}
