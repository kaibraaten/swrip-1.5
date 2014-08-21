/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _BSD_SOURCE
#endif

#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include "mud.h"
#include "shuttle.h"
#include "ships.h"

Shuttle *first_shuttle = NULL;
Shuttle *last_shuttle = NULL;

ShuttleStop *AllocateShuttleStop( void )
{
  ShuttleStop *stop = NULL;

  AllocateMemory( stop, ShuttleStop, 1);
  stop->room = INVALID_VNUM;

  return stop;
}

static Shuttle *AllocateShuttle( void )
{
  Shuttle *shuttle = NULL;

  AllocateMemory(shuttle, Shuttle, 1);
  shuttle->current_number = -1;
  shuttle->state          = SHUTTLE_STATE_LANDED;
  shuttle->first_stop     = shuttle->last_stop = NULL;
  shuttle->type           = SHUTTLE_TURBOCAR;
  shuttle->delay          = shuttle->current_delay = 2;
  shuttle->room.first     = shuttle->room.last = shuttle->room.entrance = ROOM_VNUM_LIMBO;

  return shuttle;
}

Shuttle *MakeShuttle( const char *filename, const char *name )
{
  Shuttle *shuttle   = AllocateShuttle();
  shuttle->name      = CopyString( name );
  shuttle->filename  = CopyString( filename );

  if (SaveShuttle( shuttle ))
    {
      LINK( shuttle, first_shuttle, last_shuttle, next, prev );
      WriteShuttleList();
    }
  else
    {
      FreeMemory(shuttle->name);
      FreeMemory(shuttle->filename);
      FreeMemory(shuttle);
      shuttle = NULL;
    }

  return shuttle;
}

Shuttle *GetShuttle(const char *name)
{
  Shuttle *shuttle = NULL;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      if ( !StrCmp( name, shuttle->name ) )
	{
	  return shuttle;
	}
    }

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      if ( NiftyIsNamePrefix( name, shuttle->name ) )
	{
	  return shuttle;
	}
    }

  return NULL;
}

void WriteShuttleList( void )
{
  const Shuttle *shuttle = NULL;
  FILE *fpout = NULL;
  char filename[256];

  snprintf( filename, 256,  "%s%s", SHUTTLE_DIR, SHUTTLE_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open shuttle.lst for writing!\r\n" );
      return;
    }

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      fprintf( fpout, "%s\n", shuttle->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

bool SaveShuttle( const Shuttle * shuttle )
{
  FILE *fp = NULL;
  char filename[256];
  const ShuttleStop *stop = NULL;

  if ( !shuttle )
    {
      Bug( "SaveShuttle: null shuttle pointer!" );
      return false;
    }

  if ( !shuttle->filename || shuttle->filename[0] == '\0' )
    {
      Bug( "SaveShuttle: %s has no filename", shuttle->name );
      return false;
    }

  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttle->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      Bug( "SaveShuttle: fopen" );
      perror( "SaveShuttle: fopen" );
      return false;
    }

  fprintf( fp, "#SHUTTLE\n" );
  fprintf( fp, "Name         %s~\n",    shuttle->name);
  fprintf( fp, "Filename     %s~\n",    shuttle->filename);
  fprintf( fp, "Delay        %d\n",     shuttle->delay);
  fprintf( fp, "CurrentDelay %d\n",     shuttle->current_delay);

  if (shuttle->current)
    {
      fprintf(fp, "Current      %d\n", shuttle->current_number);
    }

  fprintf( fp, "Type         %d\n",     shuttle->type);
  fprintf( fp, "State        %d\n",     shuttle->state);
  fprintf( fp, "StartRoom    %ld\n",     shuttle->room.first);
  fprintf( fp, "EndRoom      %ld\n",     shuttle->room.last);
  fprintf( fp, "Entrance     %ld\n",    shuttle->room.entrance);

  fprintf( fp, "End\n\n");

  for (stop = shuttle->first_stop; stop; stop = stop->next)
    {
      fprintf( fp, "#STOP\n");
      fprintf( fp, "StopName       %s~\n", stop->stop_name);
      fprintf( fp, "Room           %ld\n",  stop->room);
      fprintf( fp, "End\n\n");
    }

  fprintf( fp, "#END\n");
  fclose( fp );

  return true;
}

void ShuttleUpdate( void )
{
  char buf[MSL];
  Shuttle *shuttle = NULL;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      /* No Stops? Make sure we ignore */
      if (shuttle->first_stop == NULL)
	{
	  continue;
	}

      if (shuttle->current == NULL)
	{
	  shuttle->current = shuttle->first_stop;
	  continue;
	}

      if (--shuttle->current_delay <= 0)
        {
          vnum_t room = INVALID_VNUM;

          shuttle->current_delay = shuttle->delay;

          /* Probably some intermediate Stages in the middle ? */
          if (shuttle->state == SHUTTLE_STATE_TAKINGOFF)
            {
              /* Move to next spot */
              if (shuttle->current->next == NULL)
                {
                  shuttle->current = shuttle->first_stop;
                  shuttle->current_number = 1;
                }
              else
                {
                  shuttle->current = shuttle->current->next;
                  shuttle->current_number++;
                }

              /*
               * An electronic voice says, 'Preparing for launch.'
               * It continues, 'Next stop, Gamorr'
               *
               * The hatch slides shut.
               * The ship begins to launch.
               * Fix by Greven: have different message for turbocars, they don't launch
               */
              if ( shuttle->type == SHUTTLE_TURBOCAR )
		{
		  snprintf( buf, MSL,
			    "An electronic voice says, 'Preparing for departure.'\r\n"
			    "It continues, 'Next stop, %s'",
			    shuttle->current->stop_name);
		}
              else
		{
		  snprintf( buf, MSL,
			    "An electronic voice says, 'Preparing for launch.'\r\n"
			    "It continues, 'Next stop, %s'",
			    shuttle->current->stop_name);
		}

              for (room = shuttle->room.first; room <= shuttle->room.last; ++room)
                {
                  Room * iRoom = GetRoom(room);
                  EchoToRoom( AT_CYAN , iRoom , buf );

                  if (shuttle->type != SHUTTLE_TURBOCAR)
                    {
                      EchoToRoom( AT_YELLOW, iRoom, "The hatch slides shut.");
                      EchoToRoom( AT_YELLOW, iRoom, "The ship begins to launch.");
                    }
                }

              if (shuttle->type != SHUTTLE_TURBOCAR)
		{
		  snprintf(buf, MSL, "The hatch on %s closes and it begins to launch..", shuttle->name );
		}
              else
		{
		  snprintf(buf, MSL, "%s speeds out of the station.", shuttle->name );
		}

              EchoToRoom( AT_YELLOW , shuttle->in_room , buf );
              ExtractShuttle( shuttle );

              if (shuttle->type == SHUTTLE_TURBOCAR || shuttle->type == SHUTTLE_SPACE)
		{
		  shuttle->state = SHUTTLE_STATE_LANDING;
		}
              else if (shuttle->type == SHUTTLE_HYPERSPACE)
		{
		  shuttle->state = SHUTTLE_STATE_HYPERSPACE_LAUNCH;
		}
              else
		{
		  Bug("Shuttle '%s' is an unknown type", shuttle->name);
		}
            }
          else if (shuttle->state == SHUTTLE_STATE_HYPERSPACE_LAUNCH)
            {
              for (room = shuttle->room.first; room <= shuttle->room.last; ++room)
		{
		  EchoToRoom( AT_YELLOW, GetRoom(room),
				"The ship lurches slightly as it makes the jump to lightspeed.");
		}

              shuttle->state = SHUTTLE_STATE_HYPERSPACE_END;
              shuttle->current_delay *= 2;
            }
          else if (shuttle->state == SHUTTLE_STATE_HYPERSPACE_END)
            {
              for (room = shuttle->room.first; room <= shuttle->room.last; ++room)
		{
		  EchoToRoom( AT_YELLOW, GetRoom(room),
				"The ship lurches slightly as it comes out of hyperspace.");
		}

              shuttle->state = SHUTTLE_STATE_LANDING;
            }
          else if (shuttle->state == SHUTTLE_STATE_LANDING)
            {
              /* An electronic voice says, 'Welcome to Adari'
               * It continues, 'Please exit through the main ramp. Enjoy your stay.'
               *
               * You feel a slight thud as the ship sets down on the ground.
               * The hatch opens.
               */


              /* action_desc */
              snprintf( buf, MSL,
                        "An electronic voice says, 'Welcome to %s'\r\n"
                        "It continues, 'Please exit through the %s. Enjoy your stay.'",
                        shuttle->current->stop_name,
                        shuttle->type == SHUTTLE_TURBOCAR ? "doors" : "main ramp" );

              InsertShuttle(shuttle, GetRoom(shuttle->current->room));

              for (room = shuttle->room.first; room <= shuttle->room.last; ++room)
                {
                  Room * iRoom = GetRoom(room);
                  EchoToRoom( AT_CYAN , iRoom , buf );

                  if (shuttle->type != SHUTTLE_TURBOCAR)
		    {
		      EchoToRoom( AT_YELLOW , iRoom, "You feel a slight thud as the ship sets down on the ground.");
		      EchoToRoom( AT_YELLOW , iRoom , "The hatch opens." );
		    }
                }

              if (shuttle->type != SHUTTLE_TURBOCAR)
		{
		  snprintf(buf, MSL, "%s lands on the platform.", shuttle->name );
		}
              else
		{
		  snprintf(buf, MSL, "%s arrives at the station.", shuttle->name );
		}

              EchoToRoom( AT_YELLOW , shuttle->in_room , buf );

              if (shuttle->type != SHUTTLE_TURBOCAR)
                {
                  snprintf(buf, MSL, "The hatch on %s opens.", shuttle->name );
                  EchoToRoom( AT_YELLOW , shuttle->in_room , buf );
                }

              shuttle->state = SHUTTLE_STATE_LANDED;
            }
          else if (shuttle->state == SHUTTLE_STATE_LANDED)
            {
              /* Just for a delay between stops ? */
              shuttle->state = SHUTTLE_STATE_TAKINGOFF;
            }
          else
            {
              Bug("Shuttle '%s' has invalid state of %d",
                  shuttle->name, shuttle->state);
              continue;
            }
        }
    }
}

void ShowShuttlesToCharacter( const Shuttle *shuttle, Character *ch )
{
  while (shuttle)
    {
      SetCharacterColor( AT_SHIP, ch );
      Echo( ch , "%-35s", shuttle->name );

      if ( shuttle->next_in_room )
	{
	  shuttle = shuttle->next_in_room;
	  Echo( ch , "%-35s", shuttle->name );
	}

      shuttle = shuttle->next_in_room;
      SendToCharacter("\r\n&w", ch);
    }
}

bool ExtractShuttle( Shuttle * shuttle )
{
  Room *room = NULL;

  if ( ( room = shuttle->in_room ) != NULL )
    {
      UNLINK( shuttle, room->first_shuttle, room->last_shuttle, next_in_room, prev_in_room );
      shuttle->in_room = NULL;
    }

  return true;
}

bool InsertShuttle( Shuttle *shuttle, Room *room )
{
  if (room == NULL)
    {
      Bug("Insert_shuttle: %s Room: %ld", shuttle->name, room->vnum);
      return false;
    }

  if (shuttle->in_room)
    {
      ExtractShuttle(shuttle);
    }

  shuttle->in_room = room;
  LINK( shuttle, room->first_shuttle, room->last_shuttle, next_in_room, prev_in_room );
  return true;
}

/*
 * Load in all the ship files.
 */
void LoadShuttles( void )
{
  FILE *fpList = NULL;
  char shuttlelist[256];

  snprintf( shuttlelist, 256, "%s%s", SHUTTLE_DIR, SHUTTLE_LIST );

  if ( ( fpList = fopen( shuttlelist, "r" ) ) == NULL )
    {
      perror( shuttlelist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( filename[0] == '$' )
	{
	  break;
	}

      if ( !LoadShuttleFile( (char*)filename ) )
	{
	  Bug( "Cannot load shuttle file: %s", filename );
	}
    }

  fclose( fpList );
  LogPrintf("Done shuttles" );
}

/*
 * Load a ship file
 */

bool LoadShuttleFile( const char * shuttlefile )
{
  char filename[256];
  Shuttle *shuttle = AllocateShuttle();
  FILE *fp = NULL;
  bool found = false;

  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttlefile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;

      for ( ; ; )
        {
	  const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_shuttle_file: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SHUTTLE") )
            {
              ReadShuttle( shuttle, fp );

              if (shuttle->room.entrance == INVALID_VNUM)
		{
		  shuttle->room.entrance = shuttle->room.first;
		}

              shuttle->in_room = NULL;
              continue;
            }
          else if ( !StrCmp( word, "STOP") )
            {
              ShuttleStop * stop = AllocateShuttleStop();
              ReadShuttleStop( stop, fp );
              LINK( stop, shuttle->first_stop, shuttle->last_stop, next, prev );
              continue;
            }
          else if ( !StrCmp( word, "END" ) )
            {
              break;
            }
          else
            {
              Bug(  "Load_shuttle_file: bad section: %s.", word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !(found) )
    {
      FreeMemory( shuttle );
    }
  else
    {
      LINK( shuttle, first_shuttle, last_shuttle, next, prev );

      if (shuttle->current_number != -1)
        {
          int count = 0;
          ShuttleStop * stop = NULL;

          for (stop = shuttle->first_stop; stop; stop = stop->next)
            {
              count++;

              if (count == shuttle->current_number)
		{
		  shuttle->current = stop;
		}
            }
        }
      else
        {
          shuttle->current_number = 0;
          shuttle->current = shuttle->first_stop;
        }

      if (shuttle->current)
	{
	  InsertShuttle(shuttle, GetRoom(shuttle->current->room));
	}
    }

  return found;
}

void ReadShuttle( Shuttle *shuttle, FILE *fp )
{
  shuttle->delay = 2;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'C':
          KEY( "Current", shuttle->current_number, ReadInt(fp));
          KEY( "CurrentDelay", shuttle->current_delay, ReadInt(fp));
          break;

        case 'D':
          KEY( "Delay", shuttle->delay, ReadInt(fp));
          break;

        case 'E':
          KEY( "EndRoom", shuttle->room.last, ReadInt(fp));
          KEY( "Entrance", shuttle->room.entrance, ReadInt(fp));

          if ( !StrCmp( word, "End" ) )
            {
              shuttle->current_delay = shuttle->delay;
              return;
            }
          break;

        case 'F':
          KEY( "Filename", shuttle->filename, ReadStringToTilde(fp));
          break;

        case 'N':
          KEY( "Name",  shuttle->name, ReadStringToTilde(fp));
          break;

        case 'S':
          KEY( "StartRoom", shuttle->room.first, ReadInt(fp));
          KEY( "State", shuttle->state, ReadInt(fp));
          break;

        case 'T':
          KEY( "Type", shuttle->type, (SHUTTLE_CLASS) ReadInt(fp));
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_shuttle: no match: %s", word );
        }
    }
}

void ReadShuttleStop( ShuttleStop * stop, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              return;
            }
          break;

        case 'R':
          KEY( "Room",  stop->room, ReadInt(fp));
          break;

        case 'S':
          KEY( "StopName", stop->stop_name, ReadStringToTilde(fp));
          break;
        }

      if ( !fMatch )
        {
          Bug( "Fread_shuttle: no match: %s", word );
        }
    }
}

static void FreeShuttle( Shuttle *shuttle )
{
  ShuttleStop *stop = NULL;
  ShuttleStop *stop_next = NULL;

  for ( stop =  shuttle->first_stop; stop ; stop = stop_next)
    {
      stop_next = stop->next;

      if (stop->stop_name)
        {
          FreeMemory(stop->stop_name);
        }

      FreeMemory(stop);
    }

  if (shuttle->name)
    {
      FreeMemory(shuttle->name);
    }

  if (shuttle->filename)
    {
      FreeMemory(shuttle->filename);
    }

  FreeMemory(shuttle);
}

void DestroyShuttle(Shuttle *shuttle)
{
  UNLINK( shuttle, first_shuttle, last_shuttle, next, prev );

  if (shuttle->filename)
    {
      char buf[MSL];
      snprintf(buf, MSL, "%s/%s", SHUTTLE_DIR, shuttle->filename);
      unlink(buf);
      FreeMemory(shuttle->filename);
    }

  FreeShuttle( shuttle );

  WriteShuttleList();
}

Shuttle *GetShuttleInRoom( const Room *room, const char *name )
{
  Shuttle *shuttle = NULL;

  if ( !room )
    {
      return NULL;
    }

  for ( shuttle = room->first_shuttle ; shuttle ; shuttle = shuttle->next_in_room )
    {
      if ( !StrCmp( name, shuttle->name ) )
	{
	  return shuttle;
	}
    }

  for ( shuttle = room->first_shuttle ; shuttle ; shuttle = shuttle->next_in_room )
    {
      if ( NiftyIsNamePrefix( name, shuttle->name ) )
	{
	  return shuttle;
	}
    }

  return NULL;
}

Shuttle *GetShuttleFromEntrance( vnum_t vnum )
{
  Shuttle *shuttle = NULL;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      if ( vnum == shuttle->room.entrance )
	{
	  return shuttle;
	}
    }

  return NULL;
}
