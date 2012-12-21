#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _BSD_SOURCE
#endif

#include <unistd.h>
#include <stdio.h>
#include <ctype.h>
#include "mud.h"
#include "shuttle.h"

SHUTTLE_DATA * first_shuttle = NULL;
SHUTTLE_DATA * last_shuttle = NULL;

STOP_DATA * create_stop( )
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
  /* Just so we don't duplicate code when the time comes */
  return shuttle;
}
void do_showshuttle (CHAR_DATA * ch, char * argument)
{
  STOP_DATA * stop = NULL;
  int count = 0;
  SHUTTLE_DATA * shuttle = get_shuttle(argument);

  if ( !shuttle )
    {
      if ( first_shuttle == NULL )
        {
          set_char_color( AT_RED, ch );
          send_to_char("There are no shuttles currently formed.\r\n", ch);
          return;
        }
      set_char_color( AT_RED, ch );
      send_to_char("No such shuttle.\r\nValid shuttles:\r\n", ch);
      set_char_color( AT_SHIP, ch );
      for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
        ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
                  shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
                  shuttle->type == SHUTTLE_SPACE ? "Space" :
                  shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
      return;
    }
  set_char_color( AT_YELLOW, ch );
  ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
            shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->type == SHUTTLE_SPACE ? "Space" :
            shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  ch_printf(ch, "Filename: %s\t\tDelay: %d\r\n", shuttle->filename, shuttle->delay );

  ch_printf(ch, "Start Room: %d\tEnd Room: %d\t\tEntrance: %d\r\n",
            shuttle->start_room, shuttle->end_room,
            shuttle->entrance);

  send_to_char("Stops:\r\n", ch);
  for (stop = shuttle->first_stop; stop; stop = stop->next)
    {
      count += 1;
      ch_printf(ch, "\tStop # %d\r\n", count );
      ch_printf(ch, "\t\tStop Name: %s (%d)\r\n", stop->stop_name, stop->room );
    }
  return;
}

void do_makeshuttle (CHAR_DATA * ch, char * argument)
{
  SHUTTLE_DATA * shuttle;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( !argument || arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeshuttle <filename> <shuttle name>\r\n", ch );
      return;
    }
  shuttle = make_shuttle(arg, argument);
  if (shuttle)
    send_to_char( "Shuttle Created", ch);
  else
    send_to_char( "Shuttle Failed to create", ch);
}

void do_setshuttle(CHAR_DATA * ch, char * argument)
{
  SHUTTLE_DATA * shuttle;
  char arg1[MIL];
  char arg2[MIL];
  int value;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0')
    {
      send_to_char( "Usage: setshuttle <shuttle name> <field> <value>\r\n", ch);
      send_to_char( "Fields:\r\n\tstart_room, last_room, entrance, delay\r\n", ch);
      send_to_char( "\tname, filename, type, stop, remove shuttle\r\n", ch);\
      send_to_char("\tsetshuttle <shuttle> stop <add>\r\n",ch);
      send_to_char("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
      send_to_char("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
      return;
    }

  shuttle = get_shuttle(arg1);
  if ( !shuttle ) {
    set_char_color( AT_RED, ch );
    send_to_char("No such shuttle.\r\nValid shuttles:\r\n", ch);
    set_char_color( AT_YELLOW, ch );
    for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
      ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
                shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
                shuttle->type == SHUTTLE_SPACE ? "Space" :
                shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
    return;
  }

  value = is_number( argument ) ? atoi( argument ) : -1;

  if (!str_cmp(arg2, "start_room"))
    {
      if (value > shuttle->end_room)
        {
          send_to_char("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }
      shuttle->start_room = value;
    }
  else if (!str_cmp(arg2, "last_room"))
    {
      if (value < shuttle->start_room)
        {
          send_to_char("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }
      shuttle->end_room = value;
    }
  else if (!str_cmp(arg2, "entrance"))
    {
      if (value > shuttle->end_room
          || value < shuttle->start_room )
        {
          send_to_char("Not within valid range.\r\n", ch);
          return;
        }
      shuttle->entrance = value;
    }

  else if (!str_cmp(arg2, "delay"))
    {
      shuttle->delay = value;
      shuttle->current_delay = shuttle->delay;
    }
  else if (!str_cmp(arg2, "name"))
    {
      if (shuttle->name)
        STRFREE(shuttle->name);
      shuttle->name = STRALLOC(argument);
    }
  else if (!str_cmp(arg2, "filename"))
    {
      if (shuttle->filename && shuttle->filename[0] != '\0')
        {
          char filename[MSL];
          snprintf(filename, MSL, "%s/%s", SHUTTLE_DIR, shuttle->filename);
          unlink(filename);
          STRFREE(shuttle->filename);
        }
      shuttle->filename = STRALLOC(argument);
      write_shuttle_list();
    }
  else if (!str_cmp(arg2, "type"))
    {
      if (!str_cmp(argument, "turbocar"))
        shuttle->type = SHUTTLE_TURBOCAR;
      else if (!str_cmp(argument, "space"))
        shuttle->type = SHUTTLE_SPACE;
      else if (!str_cmp(argument, "hyperspace"))
        shuttle->type = SHUTTLE_HYPERSPACE;
      else
        {
          send_to_char("Types are: turbocar, space, hyperspace.\r\n", ch);
          return;
        }
    }
  else if (!str_cmp(arg2, "remove"))
    {
      destroy_shuttle(shuttle);
      send_to_char("Shuttle Removed.\r\n", ch);
      return;
    }
  else if (!str_cmp(arg2, "stop"))
    {
      STOP_DATA * stop = NULL;
      argument = one_argument(argument, arg1);
      if (arg1[0] == '\0' || argument[0] == '\0')
        {
          send_to_char("Usage: \r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <add>\r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
          return;
        }

      if (!str_cmp(arg1, "add"))
        {
          stop = create_stop();
          if ( stop->stop_name )
            STRFREE( stop->stop_name );
          stop->stop_name = STRALLOC("Stopless Name");
          stop->room = 2;
          LINK( stop, shuttle->first_stop, shuttle->last_stop, next, prev );
          if (shuttle->current == NULL)
            shuttle->current = shuttle->first_stop;
        }
      else {
        int count = 0;
        if (arg1[0] == '\0' || argument[0] == '\0')
          {
            send_to_char("Invalid Param.\r\n", ch);
            return;
          }
        value = is_number( arg1 ) ? atoi( arg1 ) : -1;

        for (stop = shuttle->first_stop; stop; stop = stop->next)
          {
            count++;
            if (value == count) break;
          }

        if ( stop == NULL)
          {
            send_to_char("Invalid Stop\r\n", ch);
            return;
          }

        argument = one_argument(argument, arg2);
        if (!str_cmp(arg2, "name"))
          {
            if (stop->stop_name)
              STRFREE(stop->stop_name);
            stop->stop_name = STRALLOC(argument);
          }
        else if (!str_cmp(arg2, "room"))
          {
            value = is_number( argument ) ? atoi( argument ) : -1;
            stop->room = value;
          }
        else if (!str_cmp(arg2, "remove"))
          {
            UNLINK(stop, shuttle->first_stop, shuttle->last_stop, next, prev);
            if (stop->stop_name)
              STRFREE(stop->stop_name);
            DISPOSE(stop);
            send_to_char("Stop removed.\r\n", ch);
            return;
          } else {
          send_to_char("Invalid Option.\r\n", ch);
          return;
        }
      }
    }
  else
    {
      send_to_char("Unknown field", ch);
      return;
    }
  save_shuttle(shuttle);
  send_to_char("Ok.\r\n", ch);
  return;
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

void output_shuttle(CHAR_DATA * ch, SHUTTLE_DATA * shuttle)
{
  STOP_DATA * stop = NULL;
  int itt = 0;

  if (shuttle == NULL) return;
  if (shuttle->current == NULL) return;
  if (shuttle->first_stop == NULL) return;

  set_char_color(AT_SHIP, ch);
  ch_printf(ch, "%s Schedule Information:\r\n", shuttle->name );

  stop = shuttle->current;
  /* current port */
  if ( shuttle->state == SHUTTLE_STATE_LANDING || shuttle->state == SHUTTLE_STATE_LANDED )
    {
      ch_printf( ch, "Currently docked at %s.\r\n", shuttle->current->stop_name );
      stop = stop->next;
    }

  send_to_char( "Next stops: ", ch);
  /* Safety Check */
  if ( stop == NULL)
    stop = shuttle->first_stop;

  itt = 0;
  while (1)
    {
      itt++;
      /* No stops i guess */
      if (stop == NULL) break;

      /* WTF BUT IT CRASHES */
      if (shuttle == NULL)
        {
          bug ("SHUTTLE IS NULLLLLL", 0);
          return;
        }

      if (itt > 4) break;
      if ( stop->stop_name )
        ch_printf( ch, "%s  ", stop->stop_name );
      else
        send_to_char("(unnamed)  ", ch);
      if ( (stop = stop->next) == NULL)
        stop = shuttle->first_stop;
    }
  send_to_char( "\r\n", ch );
}

void do_pluogus( CHAR_DATA *ch, char *argument )
{
  SHUTTLE_DATA * shuttle = NULL;
  bool ch_comlink = FALSE;
  OBJ_DATA *obj;
  argument = NULL;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->pIndexData->item_type == ITEM_COMLINK)
        ch_comlink = TRUE;
    }

  if ( !ch_comlink )
    {
      send_to_char( "You need a comlink to do that!\r\n", ch);
      return;
    }

  if ((shuttle = get_shuttle("Serin Pluogus")) != NULL)
    {
      output_shuttle(ch, shuttle);
      send_to_char("\r\n", ch);
    }

  if ((shuttle = get_shuttle("Serin Tocca")) != NULL)
    {
      output_shuttle(ch, shuttle);
      send_to_char("\r\n", ch);
    }

}

void do_board( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *fromroom;
  ROOM_INDEX_DATA *toroom;
  SHIP_DATA *ship;
  char * name = NULL;
  SHUTTLE_DATA *shuttle;

  if ( !argument || argument[0] == '\0')
    {
      send_to_char( "Board what?\r\n", ch );
      return;
    }

  if ( IS_SET( ch->act, ACT_MOUNTED ) && IS_NPC(ch))
    {
      act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
      return;
    }

  fromroom = ch->in_room;
  if ( ( ship = ship_in_room( ch->in_room , argument ) ) != NULL )
    {

      if ( ( toroom = get_room_index( ship->entrance ) ) == NULL )
        {
          send_to_char("That ship has no entrance!\r\n", ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          send_to_char( "&RThe hatch is closed!\r\n", ch);
          return;
        }

      if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
        {
          send_to_char("&rThat ship has already started launching!\r\n",ch);
          return;
        }

      name = ship->name;

    }
  else if ( ( shuttle = shuttle_in_room( ch->in_room , argument ) ) != NULL )
    {
      name = shuttle->name;
      if ( ( toroom = get_room_index( shuttle->entrance ) ) == NULL )
        {
          send_to_char("That ship has no entrance!\r\n", ch);
          return;
        }
    }
  else
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }
  if ( toroom == NULL )
    {
      send_to_char ("Error", ch);
      return;
    }

  if ( toroom->tunnel > 0 )
    {
      CHAR_DATA *ctmp;
      int count = 0;

      for ( ctmp = toroom->first_person; ctmp; ctmp = ctmp->next_in_room )
        {
          if ( ++count >= toroom->tunnel )
            {
              send_to_char( "There is no room for you in there.\r\n", ch );
              return;
            }
        }
    }

  act( AT_PLAIN, "$n enters $T.", ch, NULL, name , TO_ROOM );
  act( AT_PLAIN, "You enter $T.", ch, NULL, name , TO_CHAR );
  char_from_room( ch );
  char_to_room( ch , toroom );
  act( AT_PLAIN, "$n enters the ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}

void do_leaveship( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *fromroom = NULL;
  ROOM_INDEX_DATA *toroom = NULL;
  SHIP_DATA *ship = NULL;
  SHUTTLE_DATA * shuttle = NULL;
  argument = NULL;
  fromroom = ch->in_room;

  if  ( (ship = ship_from_entrance(fromroom->vnum)) != NULL )
    {
      if  ( ship->sclass == SHIP_PLATFORM )
        {
          send_to_char( "You can't do that here.\r\n" , ch );
          return;
        }

      if ( ship->lastdoc != ship->location )
        {
          send_to_char("&rMaybe you should wait until the ship lands.\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_DOCKED && ship->shipstate != SHIP_DISABLED )
        {
          send_to_char("&rPlease wait till the ship is properly docked.\r\n",ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          send_to_char("&RYou need to open the hatch first" , ch );
          return;
        }

      if ( ( toroom = get_room_index( ship->location ) ) == NULL )
        {
          send_to_char ( "The exit doesn't seem to be working properly.\r\n", ch );
          return;
        }
    }
  else if  ( (shuttle = shuttle_from_entrance(fromroom->vnum)) != NULL )
    {
      if ( !shuttle->in_room || ( toroom = get_room_index( shuttle->in_room->vnum ) ) == NULL )
        {
          send_to_char ( "The ship hasn't landed yet. Do you want to kill yourself?\r\n", ch );
          return;
        }
    }
  else
    {
      send_to_char( "I see no exit here.\r\n" , ch );
      return;
    }

  act( AT_PLAIN, "$n exits the ship.", ch, NULL, NULL, TO_ROOM );
  act( AT_PLAIN, "You exit the ship.", ch, NULL, NULL, TO_CHAR );
  char_from_room( ch );
  char_to_room( ch , toroom );
  act( AT_PLAIN, "$n steps out of a ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
