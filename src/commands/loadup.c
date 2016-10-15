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

  if ( IsNullOrEmpty( name ) )
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
      d->Next = NULL;
      d->Previous = NULL;
      d->ConnectionState = CON_GET_NAME;
      d->OutSize = 2000;
      AllocateMemory( d->OutBuffer, char, d->OutSize );

      AddCharacter( d->Character );
      old_room_vnum = d->Character->InRoom->Vnum;
      CharacterToRoom( d->Character, ch->InRoom );

      if ( d->Character->PlayerHome != NULL )
        {
          char filename[256];
	  FILE *fph;
          Room *storeroom = d->Character->PlayerHome;
          Object *obj;
          Object *obj_next;

          for ( obj = storeroom->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->NextContent;
              ExtractObject( obj );
            }

          sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(d->Character->Name[0]),
                   Capitalize( d->Character->Name ) );
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
                      Bug( d->Character->Name, 0 );
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
                        Bug( d->Character->Name, 0 );
                        break;
                      }
                }

              fclose( fph );

              for ( tobj = supermob->FirstCarrying; tobj; tobj = tobj_next )
                {
                  tobj_next = tobj->NextContent;
                  ObjectFromCharacter( tobj );
                  if( tobj->item_type != ITEM_MONEY )
                    ObjectToRoom( tobj, storeroom );
                }

              ReleaseSupermob();

            }
        }


      if ( GetTrustLevel(d->Character) >= GetTrustLevel( ch ) )
        {
          do_say( d->Character, "Do *NOT* disturb me again!" );
          SendToCharacter( "I think you'd better leave that player alone!\r\n", ch );
          d->Character->Desc    = NULL;
          do_quit( d->Character, "" );
          return;
        }
      d->Character->Desc        = NULL;
      d->Character->ReTran    = old_room_vnum;
      d->Character              = NULL;
      FreeMemory( d->OutBuffer );
      FreeMemory( d );
      Echo(ch, "Player %s loaded from room %d.\r\n", Capitalize( name ),old_room_vnum );
      sprintf(buf, "%s appears from nowhere, eyes glazed over.\r\n", Capitalize( name ) );
      Act( AT_IMMORT, buf, ch, NULL, NULL, TO_ROOM );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  SendToCharacter( "No such player.\r\n", ch );
}
