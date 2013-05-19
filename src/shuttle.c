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

SHUTTLE_DATA * first_shuttle = NULL;
SHUTTLE_DATA * last_shuttle = NULL;

STOP_DATA *create_stop( void )
{
  STOP_DATA * stop = NULL;
  CREATE( stop, STOP_DATA, 1);
  stop->next = NULL;
  stop->prev = NULL;
  stop->stop_name = NULL;
  stop->room = -1;
  return stop;
}

SHUTTLE_DATA * create_shuttle( )
{
  SHUTTLE_DATA * shuttle = NULL;
  CREATE(shuttle, SHUTTLE_DATA, 1);
  shuttle->name                 = NULL;
  shuttle->filename     = NULL;
  shuttle->next_in_room = NULL;
  shuttle->prev_in_room = NULL;
  shuttle->in_room      = NULL;
  shuttle->current      = NULL;
  shuttle->current_number = -1;
  shuttle->state                = SHUTTLE_STATE_LANDED;
  shuttle->first_stop   = shuttle->last_stop = NULL;
  shuttle->type         = SHUTTLE_TURBOCAR;
  shuttle->delay                = shuttle->current_delay = 2;
  shuttle->start_room   = shuttle->end_room = shuttle->entrance = ROOM_VNUM_LIMBO;
  /* Not used right now anyways */
  shuttle->takeoff_desc = NULL;
  shuttle->land_desc    = NULL;
  shuttle->approach_desc        = NULL;
  return shuttle;
}

SHUTTLE_DATA * make_shuttle( const char *filename, const char *name )
{
  SHUTTLE_DATA * shuttle = create_shuttle();
  shuttle->name         = STRALLOC( name );
  shuttle->filename     = STRALLOC( filename );
  if (save_shuttle( shuttle ))
    {
      LINK( shuttle, first_shuttle, last_shuttle, next, prev );
      write_shuttle_list( );
    }
  else
    {
      STRFREE(shuttle->name);
      STRFREE(shuttle->filename);
      DISPOSE(shuttle);
      shuttle = NULL;
    }

  return shuttle;
}

SHUTTLE_DATA * get_shuttle(const char * name)
{
  SHUTTLE_DATA *shuttle;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    if ( !str_cmp( name, shuttle->name ) )
      return shuttle;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    if ( nifty_is_name_prefix( name, shuttle->name ) )
      return shuttle;

  return NULL;
}

void write_shuttle_list( )
{
  SHUTTLE_DATA *shuttle;
  FILE *fpout;
  char filename[256];

  snprintf( filename, 256,  "%s%s", SHUTTLE_DIR, SHUTTLE_LIST );
  fpout = fopen( filename, "w" );
  if ( !fpout )
    {
      bug( "FATAL: cannot open shuttle.lst for writing!\r\n", 0 );
      return;
    }

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    fprintf( fpout, "%s\n", shuttle->filename );
  fprintf( fpout, "$\n" );
  fclose( fpout );
}

bool save_shuttle( SHUTTLE_DATA * shuttle )
{
  FILE *fp;
  char filename[256];
  STOP_DATA* stop;

  if ( !shuttle )
    {
      bug( "save_shuttle: null shuttle pointer!", 0 );
      return FALSE;
    }

  if ( !shuttle->filename || shuttle->filename[0] == '\0' )
    {
      bug( "save_shuttle: %s has no filename", shuttle->name );
      return FALSE;
    }

  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttle->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_shuttle: fopen", 0 );
      perror( "save_shuttle: fopen" );
      /* perror( filename ); */
      return FALSE;
    }

  fprintf( fp, "#SHUTTLE\n" );
  fprintf( fp, "Name         %s~\n",    shuttle->name);
  fprintf( fp, "Filename     %s~\n",    shuttle->filename);
  fprintf( fp, "Delay        %d\n",     shuttle->delay);
  fprintf( fp, "CurrentDelay %d\n",     shuttle->current_delay);
  if (shuttle->current)
    fprintf(fp, "Current      %d\n", shuttle->current_number);
  fprintf( fp, "Type         %d\n",     shuttle->type);
  fprintf( fp, "State        %d\n",     shuttle->state);
  fprintf( fp, "StartRoom    %d\n",     shuttle->start_room);
  fprintf( fp, "EndRoom      %d\n",     shuttle->end_room);
  fprintf( fp, "Entrance      %d\n",    shuttle->entrance);
  if (shuttle->takeoff_desc)
    fprintf( fp, "Takeoff      %s~\n",  shuttle->takeoff_desc);
  if (shuttle->land_desc)
    fprintf( fp, "Land         %s~\n",  shuttle->land_desc);
  if (shuttle->approach_desc)
    fprintf( fp, "Approach     %s~\n",  shuttle->approach_desc);


  fprintf( fp, "End\n\n");

  /* Rest Goes Here */
  for (stop = shuttle->first_stop; stop; stop = stop->next)
    {
      fprintf( fp, "#STOP\n");
      fprintf( fp, "StopName       %s~\n", stop->stop_name);
      fprintf( fp, "Room           %d\n",  stop->room);
      fprintf( fp, "End\n\n");
    }

  fprintf( fp, "#END\n");
  fclose( fp );

  return TRUE;
}

void update_shuttle()
{
  char buf[MSL];
  SHUTTLE_DATA * shuttle = NULL;
  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    {
      /* No Stops? Make sure we ignore */
      if (shuttle->first_stop == NULL) continue;
      if (shuttle->current == NULL) {
        shuttle->current = shuttle->first_stop;
        /* bug("Shuttle '%s' no current", shuttle->name); */
        continue;
      }
#ifdef DEBUG
      bug("Shuttle '%s' delay: %d", shuttle->name, shuttle->current_delay);
#endif
      if (--shuttle->current_delay <= 0)
        {
          int room = 0;

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
#ifdef DEBUG
              bug("Shuttle '%s' Taking Off.", shuttle->name);
#endif
              /*
               * An electronic voice says, 'Preparing for launch.'
               * It continues, 'Next stop, Gamorr'
               *
               * The hatch slides shut.
               * The ship begins to launch.
               * Fix by Greven: have different message for turbocars, they don't launch
               */
              if ( shuttle->type == SHUTTLE_TURBOCAR )
                snprintf( buf, MSL,
                          "An electronic voice says, 'Preparing for departure.'\r\n"
                          "It continues, 'Next stop, %s'",
                          shuttle->current->stop_name);
              else
                snprintf( buf, MSL,
                          "An electronic voice says, 'Preparing for launch.'\r\n"
                          "It continues, 'Next stop, %s'",
                          shuttle->current->stop_name);
              for (room = shuttle->start_room; room <= shuttle->end_room; ++room)
                {
                  ROOM_INDEX_DATA * iRoom = get_room_index(room);
                  echo_to_room( AT_CYAN , iRoom , buf );
                  if (shuttle->type != SHUTTLE_TURBOCAR)
                    {
                      echo_to_room( AT_YELLOW, iRoom, "The hatch slides shut.");
                      echo_to_room( AT_YELLOW, iRoom, "The ship begins to launch.");
                    }
                }

              /* FIXME - Sound to room */
              if (shuttle->type != SHUTTLE_TURBOCAR)
                snprintf(buf, MSL, "The hatch on %s closes and it begins to launch..", shuttle->name );
              else
                snprintf(buf, MSL, "%s speeds out of the station.", shuttle->name );
              echo_to_room( AT_YELLOW , shuttle->in_room , buf );

              extract_shuttle( shuttle );

              if (shuttle->type == SHUTTLE_TURBOCAR || shuttle->type == SHUTTLE_SPACE)
                shuttle->state = SHUTTLE_STATE_LANDING;
              else if (shuttle->type == SHUTTLE_HYPERSPACE)
                shuttle->state = SHUTTLE_STATE_HYPERSPACE_LAUNCH;
              else
                bug("Shuttle '%s' is an unknown type", shuttle->name);
            }
          else if (shuttle->state == SHUTTLE_STATE_HYPERSPACE_LAUNCH)
            {
              for (room = shuttle->start_room; room <= shuttle->end_room; ++room)
                echo_to_room( AT_YELLOW , get_room_index(room) , "The ship lurches slightly as it makes the jump to lightspeed.");
              shuttle->state = SHUTTLE_STATE_HYPERSPACE_END;
              shuttle->current_delay *= 2;
            }
          else if (shuttle->state == SHUTTLE_STATE_HYPERSPACE_END)
            {
              for (room = shuttle->start_room; room <= shuttle->end_room; ++room)
                echo_to_room( AT_YELLOW , get_room_index(room) , "The ship lurches slightly as it comes out of hyperspace.");
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

              insert_shuttle(shuttle, get_room_index(shuttle->current->room));

              for (room = shuttle->start_room; room <= shuttle->end_room; ++room)
                {
                  ROOM_INDEX_DATA * iRoom = get_room_index(room);
                  echo_to_room( AT_CYAN , iRoom , buf );
                  if (shuttle->type != SHUTTLE_TURBOCAR) {
                    echo_to_room( AT_YELLOW , iRoom, "You feel a slight thud as the ship sets down on the ground.");
                    echo_to_room( AT_YELLOW , iRoom , "The hatch opens." );
                  }
                }

              if (shuttle->type != SHUTTLE_TURBOCAR)
                snprintf(buf, MSL, "%s lands on the platform.", shuttle->name );
              else
                snprintf(buf, MSL, "%s arrives at the station.", shuttle->name );
              echo_to_room( AT_YELLOW , shuttle->in_room , buf );
              if (shuttle->type != SHUTTLE_TURBOCAR)
                {
                  snprintf(buf, MSL, "The hatch on %s opens.", shuttle->name );
                  echo_to_room( AT_YELLOW , shuttle->in_room , buf );
                  /* FIXME - Sound to room */
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
              bug("Shuttle '%s' has invalid state of %d",
                  shuttle->name, shuttle->state);
              continue;
            }
        }
    }
  return;
}

void show_shuttles_to_char( SHUTTLE_DATA *shuttle, CHAR_DATA *ch )
{
  while (shuttle)
    {
      set_char_color( AT_SHIP, ch );
      ch_printf( ch , "%-35s", shuttle->name );
      /* eww code dupliction */
      if ( shuttle->next_in_room ) {
        shuttle = shuttle->next_in_room;
        ch_printf( ch , "%-35s", shuttle->name );
      }
      shuttle = shuttle->next_in_room;
      send_to_char("\r\n&w", ch);
    }

  return;
}

bool extract_shuttle( SHUTTLE_DATA * shuttle )
{
  ROOM_INDEX_DATA *room;

  if ( ( room = shuttle->in_room ) != NULL )
    {
      UNLINK( shuttle, room->first_shuttle, room->last_shuttle, next_in_room, prev_in_room );
      shuttle->in_room = NULL;
    }
  return TRUE;
}

bool insert_shuttle( SHUTTLE_DATA * shuttle, ROOM_INDEX_DATA * room )
{
  if (room == NULL)
    {
      bug("Insert_shuttle: %s Room: %d", shuttle->name, room->vnum);
      return FALSE;
    }
  /* Error checking = GOOD */
  if (shuttle->in_room) extract_shuttle(shuttle);
  shuttle->in_room = room;
  LINK( shuttle, room->first_shuttle, room->last_shuttle, next_in_room, prev_in_room );
  return TRUE;
}


/*
 * Load in all the ship files.
 */
void load_shuttles( )
{
  FILE *fpList;
  const char *filename;
  char shuttlelist[256];

  first_shuttle = NULL;
  last_shuttle  = NULL;

  snprintf( shuttlelist, 256, "%s%s", SHUTTLE_DIR, SHUTTLE_LIST );

  if ( ( fpList = fopen( shuttlelist, "r" ) ) == NULL )
    {
      perror( shuttlelist );
      exit( 1 );
    }

  for ( ; ; )
    {
      filename = feof( fpList ) ? "$" : fread_word( fpList );

      if ( filename[0] == '$' )
        break;

      if ( !load_shuttle_file( (char*)filename ) )
        bug( "Cannot load shuttle file: %s", filename );
    }
  fclose( fpList );
  log_string("Done shuttles" );
}

/*
 * Load a ship file
 */

bool load_shuttle_file( const char * shuttlefile )
{
  char filename[256];
  SHUTTLE_DATA * shuttle;
  FILE *fp;
  bool found;

  shuttle = create_shuttle();

  found = FALSE;
  snprintf( filename, 256, "%s%s", SHUTTLE_DIR, shuttlefile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = TRUE;
      for ( ; ; )
        {
          char letter;
          char *word;

          letter = fread_letter( fp );
          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_shuttle_file: # not found.", 0 );
              break;
            }

          word = fread_word( fp );
          if ( !str_cmp( word, "SHUTTLE") )
            {
              fread_shuttle( shuttle, fp );
              if (shuttle->entrance == -1)
                shuttle->entrance = shuttle->start_room;
              shuttle->in_room = NULL;
              continue;
            }
          else if ( !str_cmp( word, "STOP") )
            {
              STOP_DATA * stop = create_stop();
              fread_stop( stop, fp );
              LINK( stop, shuttle->first_stop, shuttle->last_stop, next, prev );
              continue;
            }
          else if ( !str_cmp( word, "END"       ) )
            {
              break;
            }
          else
            {
              bug(  "Load_shuttle_file: bad section: %s.", word );
              break;
            }
        }
      fclose( fp );
    }
  if ( !(found) )
    {
      DISPOSE( shuttle );
    }
  else
    {
      LINK( shuttle, first_shuttle, last_shuttle, next, prev );
      if (shuttle->current_number != -1)
        {
          int count = 0;
          STOP_DATA * stop = NULL;
          for (stop = shuttle->first_stop; stop; stop = stop->next)
            {
              count++;
              if (count == shuttle->current_number)
                shuttle->current = stop;
            }
        }
      else
        {
          shuttle->current_number = 0;
          shuttle->current = shuttle->first_stop;
        }
      if (shuttle->current)
        insert_shuttle(shuttle, get_room_index(shuttle->current->room));
    }
  return found;
}

void fread_shuttle( SHUTTLE_DATA *shuttle, FILE *fp )
{
  const char *word;
  bool fMatch;

  shuttle->delay = 2;

  for ( ; ; )
    {
      word   = feof( fp ) ? "End" : fread_word( fp );

      fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;
        case 'A':
          KEY( "Approach", shuttle->approach_desc, fread_string_nohash(fp));
          break;

        case 'C':
          KEY( "Current", shuttle->current_number, fread_number(fp));
          KEY( "CurrentDelay", shuttle->current_delay, fread_number(fp));
          break;

        case 'D':
          KEY( "Delay", shuttle->delay, fread_number(fp));
          break;

        case 'E':
          KEY( "EndRoom", shuttle->end_room, fread_number(fp));
          KEY( "Entrance", shuttle->entrance, fread_number(fp));
          if ( !str_cmp( word, "End" ) )
            {
              shuttle->current_delay    = shuttle->delay;
              shuttle->next_in_room     = NULL;
              shuttle->prev_in_room     = NULL;
              shuttle->in_room  = NULL;
              shuttle->current  = NULL;
              shuttle->first_stop       = NULL;
              shuttle->last_stop        = NULL;
              return;
            }
          break;

        case 'F':
          KEY( "Filename", shuttle->filename, fread_string_nohash(fp));
          break;

        case 'L':
          KEY( "Land", shuttle->land_desc, fread_string_nohash(fp));
          break;

        case 'N':
          KEY( "Name",  shuttle->name, fread_string(fp));
          break;

        case 'S':
          KEY( "StartRoom", shuttle->start_room, fread_number(fp));
          KEY( "State", shuttle->state, fread_number(fp));
          break;

        case 'T':
          KEY( "Type", shuttle->type, (SHUTTLE_CLASS) fread_number(fp));
          KEY( "Takeoff", shuttle->takeoff_desc, fread_string_nohash(fp));
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_shuttle: no match: %s", word );
        }
    }
}

void fread_stop( STOP_DATA * stop, FILE *fp )
{
  const char *word;
  bool fMatch;

  for ( ; ; )
    {
      word   = feof( fp ) ? "End" : fread_word( fp );

      fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              return;
            }
          break;

        case 'R':
          KEY( "Room",  stop->room, fread_number(fp));
          break;

        case 'S':
          KEY( "StopName", stop->stop_name, fread_string_nohash(fp));
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_shuttle: no match: %s", word );
        }
    }
}

void destroy_shuttle(SHUTTLE_DATA * shuttle)
{
  STOP_DATA *stop, *stop_next;

  UNLINK( shuttle, first_shuttle, last_shuttle, next, prev );
  if (shuttle->filename)
    {
      char buf[MSL];
      snprintf(buf, MSL,  "%s/%s", SHUTTLE_DIR, shuttle->filename);
      unlink(buf);
      STRFREE(shuttle->filename);
    }

  for ( stop =  shuttle->first_stop; stop ; stop = stop_next)
    {
      stop_next = stop->next;
      if (stop->stop_name)
        STRFREE(stop->stop_name);
      DISPOSE(stop);
    }

  if (shuttle->name)
    STRFREE(shuttle->name);
  if (shuttle->takeoff_desc)
    STRFREE(shuttle->takeoff_desc);
  if (shuttle->filename)
    STRFREE(shuttle->filename);
  if (shuttle->approach_desc)
    STRFREE(shuttle->approach_desc);
  if (shuttle->land_desc)
    STRFREE(shuttle->land_desc);

  DISPOSE(shuttle);
  write_shuttle_list();

  return;
}

SHUTTLE_DATA * shuttle_in_room( ROOM_INDEX_DATA *room, const char *name )
{
  SHUTTLE_DATA *shuttle;

  if ( !room ) return NULL;

  for ( shuttle = room->first_shuttle ; shuttle ; shuttle = shuttle->next_in_room )
    if ( !str_cmp( name, shuttle->name ) )
      return shuttle;

  for ( shuttle = room->first_shuttle ; shuttle ; shuttle = shuttle->next_in_room )
    if ( nifty_is_name_prefix( name, shuttle->name ) )
      return shuttle;

  return NULL;
}

SHUTTLE_DATA *shuttle_from_entrance( int vnum )
{
  SHUTTLE_DATA *shuttle;

  for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
    if ( vnum == shuttle->entrance )
      return shuttle;
  return NULL;
}
