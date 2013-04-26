/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                           Special clan module                            *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include "mud.h"

PLANET_DATA * first_planet = NULL;
PLANET_DATA * last_planet = NULL;

GUARD_DATA * first_guard = NULL;
GUARD_DATA * last_guard = NULL;

void fread_planet( PLANET_DATA *planet, FILE *fp );
bool load_planet_file( const char *planetfile );
void write_planet_list( void );

PLANET_DATA *get_planet( char *name )
{
  PLANET_DATA *planet;

  for ( planet = first_planet; planet; planet = planet->next )
    {
      if ( !str_cmp( name, planet->name ) )
        {
          return planet;
        }
    }

  return NULL;
}

void write_planet_list( )
{
  PLANET_DATA *tplanet;
  FILE *fpout;
  char filename[256];

  sprintf( filename, "%s%s", PLANET_DIR, PLANET_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open planet.lst for writing!\r\n", 0 );
      return;
    }

  for ( tplanet = first_planet; tplanet; tplanet = tplanet->next )
    {
      fprintf( fpout, "%s\n", tplanet->filename );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void save_planet( PLANET_DATA *planet )
{
  FILE *fp;
  char filename[256];
  char buf[MAX_STRING_LENGTH];

  if ( !planet )
    {
      bug( "save_planet: null planet pointer!", 0 );
      return;
    }

  if ( !planet->filename || planet->filename[0] == '\0' )
    {
      sprintf( buf, "save_planet: %s has no filename", planet->name );
      bug( buf, 0 );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, planet->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_planet: fopen", 0 );
      perror( filename );
    }
  else
    {
      AREA_DATA *pArea;

      fprintf( fp, "#PLANET\n" );
      fprintf( fp, "Name         %s~\n", planet->name        );
      fprintf( fp, "Filename     %s~\n", planet->filename    );
      fprintf( fp, "BaseValue    %ld\n", planet->base_value  );
      fprintf( fp, "Flags        %d\n",  planet->flags       );
      fprintf( fp, "PopSupport   %f\n",  planet->pop_support );

      if ( planet->spaceobject && planet->spaceobject->name )
        {
          fprintf( fp, "spaceobject   %s~\n", planet->spaceobject->name );
        }

      if ( planet->governed_by && planet->governed_by->name )
        {
          fprintf( fp, "GovernedBy   %s~\n", planet->governed_by->name );
        }

      for( pArea = planet->first_area; pArea; pArea = pArea->next_on_planet )
        {
          if (pArea->filename)
            {
              fprintf( fp, "Area         %s~\n", pArea->filename );
            }
        }

      fprintf( fp, "End\n\n" );
      fprintf( fp, "#END\n" );
    }

  fclose( fp );
}

void fread_planet( PLANET_DATA *planet, FILE *fp )
{
  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : fread_word( fp );
      bool fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'A':
          if ( !str_cmp( word, "Area" ) )
            {
              char aName[MAX_STRING_LENGTH];
              AREA_DATA *pArea;
              char *tmp = fread_string(fp);

              sprintf (aName, "%s", tmp);
              STRFREE(tmp);

              for( pArea = first_area; pArea; pArea = pArea->next )
                {
                  if (pArea->filename && !str_cmp(pArea->filename , aName ) )
                    {
                      pArea->planet = planet;
                      LINK( pArea, planet->first_area, planet->last_area,
                            next_on_planet, prev_on_planet);
                    }
                }

              fMatch = TRUE;
            }
          break;

	case 'B':
          KEY( "BaseValue", planet->base_value, fread_number( fp ) );
          break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if (!planet->name)
                {
                  planet->name = STRALLOC( "" );
                }

              return;
            }
          break;

        case 'F':
          KEY( "Filename", planet->filename, fread_string_nohash( fp ) );
          KEY( "Flags",    planet->flags,    fread_number( fp ) );
          break;

        case 'G':
          if ( !str_cmp( word, "GovernedBy" ) )
            {
              planet->governed_by = get_clan ( fread_string(fp) );
              fMatch = TRUE;
            }
          break;

        case 'N':
          KEY( "Name",  planet->name, fread_string( fp ) );
          break;

        case 'P':
          KEY( "PopSupport", planet->pop_support, fread_number( fp ) );
          break;

        case 'S':
          if ( !str_cmp( word, "spaceobject" ) )
            {
              char *tmp = fread_string(fp);

              planet->spaceobject = spaceobject_from_name( tmp );
              STRFREE(tmp);

	      if (planet->spaceobject)
                {
                  SPACE_DATA *spaceobject = planet->spaceobject;

                  spaceobject->planet = planet;
                }

              fMatch = TRUE;
            }
          break;

        case 'T':
          KEY( "Taxes", planet->base_value, fread_number( fp ) );
          break;
        }

      if ( !fMatch )
        {
          bug( "Fread_planet: no match: %s", word );
        }
    }
}

bool load_planet_file( const char *planetfile )
{
  char filename[256];
  PLANET_DATA *planet;
  FILE *fp;
  bool found = FALSE;

  CREATE( planet, PLANET_DATA, 1 );

  planet->governed_by = NULL;
  planet->next_in_system = NULL;
  planet->prev_in_system = NULL;
  planet->spaceobject = NULL ;
  planet->first_area = NULL;
  planet->last_area = NULL;
  planet->first_guard = NULL;
  planet->last_guard = NULL;

  sprintf( filename, "%s%s", PLANET_DIR, planetfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = TRUE;

      for ( ; ; )
        {
          const char *word = NULL;
          char letter = fread_letter( fp );

	  if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_planet_file: # not found." );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "PLANET" ) )
            {
              fread_planet( planet, fp );
              break;
            }
          else if ( !str_cmp( word, "END"  ) )
            {
              break;
            }
          else
            {
              bug( "Load_planet_file: bad section: %s.", word );
              break;
            }
        }

      fclose( fp );
    }

  if ( !found )
    {
      DISPOSE( planet );
    }
  else
    {
      LINK( planet, first_planet, last_planet, next, prev );
    }

  return found;
}

void load_planets( )
{
  FILE *fpList;
  char planetlist[256];

  log_string( "Loading planets..." );
  sprintf( planetlist, "%s%s", PLANET_DIR, PLANET_LIST );

  if ( ( fpList = fopen( planetlist, "r" ) ) == NULL )
    {
      perror( planetlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : fread_word( fpList );
      log_string( filename );

      if ( filename[0] == '$' )
        {
          break;
        }

      if ( !load_planet_file( filename ) )
        {
          bug( "Cannot load planet file: %s", filename );
        }
    }

  fclose( fpList );
  log_string(" Done planets " );
}

void do_setplanet( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  PLANET_DATA *planet;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: setplanet <planet> <field> [value]\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( " base_value flags\r\n", ch );
      send_to_char( " name filename spaceobject governed_by\r\n", ch );
      return;
    }

  planet = get_planet( arg1 );

  if ( !planet )
    {
      send_to_char( "No such planet.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      STRFREE( planet->name );
      planet->name = STRALLOC( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  if ( !str_cmp( arg2, "governed_by" ) )
    {
      CLAN_DATA *clan = get_clan( argument );

      if ( clan )
        {
          planet->governed_by = clan;
          send_to_char( "Done.\r\n", ch );
          save_planet( planet );
        }
      else
        {
          send_to_char( "No such clan.\r\n", ch );
        }

      return;
    }

  if ( !str_cmp( arg2, "spaceobject" ) )
    {
      if ( (planet->spaceobject = spaceobject_from_name(argument)) )
        {
          SPACE_DATA *spaceobject = planet->spaceobject;

          if (spaceobject != NULL)
            {
              spaceobject->planet = planet;
              send_to_char( "Done.\r\n", ch );
	      save_planet(planet);
            }
          else
            {
              send_to_char( "No such spaceobject.\r\n", ch );
            }
        }

      return;
    }

  if ( !str_cmp( arg2, "filename" ) )
    {
      DISPOSE( planet->filename );
      planet->filename = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      write_planet_list( );
      return;
    }

  if ( !str_cmp( arg2, "base_value" ) )
    {
      planet->base_value = atoi( argument );
      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      char farg[MAX_INPUT_LENGTH];

      argument = one_argument( argument, farg);

      if ( farg[0] == '\0' )
        {
          send_to_char( "Possible flags: nocapture\r\n", ch );
          return;
        }

      for ( ; farg[0] != '\0'; argument = one_argument( argument, farg) )
        {
          if ( !str_cmp( farg, "nocapture" ) )
            {
              TOGGLE_BIT( planet->flags, PLANET_NOCAPTURE );
	    }
          else
            {
              ch_printf( ch , "No such flag: %s\r\n" , farg );
            }
        }

      send_to_char( "Done.\r\n", ch );
      save_planet( planet );
      return;
    }

  do_setplanet( ch, "" );
}

void do_showplanet( CHAR_DATA *ch, char *argument )
{
  PLANET_DATA *planet;

  if ( IS_NPC( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showplanet <planet>\r\n", ch );
      return;
    }

  planet = get_planet( argument );

  if ( !planet )
    {
      send_to_char( "No such planet.\r\n", ch );
      return;
    }

  ch_printf( ch, "%s\r\nFilename: %s\r\nStarsystem: %s\r\n",
             planet->name,
             planet->filename,
             planet->spaceobject ? planet->spaceobject->name : "None");
}

void do_makeplanet( CHAR_DATA *ch, char *argument )
{
  char filename[256];
  PLANET_DATA *planet;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeplanet <planet name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", PLANET_DIR, strlower(argument) );

  CREATE( planet, PLANET_DATA, 1 );
  LINK( planet, first_planet, last_planet, next, prev );
  planet->governed_by = NULL;
  planet->next_in_system = NULL;
  planet->prev_in_system = NULL;
  planet->spaceobject = NULL ;
  planet->first_area = NULL;
  planet->last_area = NULL;
  planet->first_guard = NULL;
  planet->last_guard = NULL;
  planet->name          = STRALLOC( argument );
  planet->flags               = 0;
}

void do_planets( CHAR_DATA *ch, char *argument )
{
  PLANET_DATA *planet;
  int count = 0;
  AREA_DATA   *area;

  set_pager_color( AT_WHITE, ch );
  for ( planet = first_planet; planet; planet = planet->next )
    {
      pager_printf( ch, "&wPlanet: &G%-15s   &wGoverned By: &G%s %s\r\n",
                    planet->name ,
                    planet->governed_by ? planet->governed_by->name : "",
                    IS_SET(planet->flags, PLANET_NOCAPTURE ) ? "(permanent)" : "" );
      pager_printf( ch, "&WValue: &O%-10ld&W/&O%-10d   ",
                    get_taxes(planet) , planet->base_value);
      pager_printf( ch, "&WPopulation: &O%-5d   &W Pop Support: &R%.1f\r\n",
                    planet->population , planet->pop_support );
      if ( IS_IMMORTAL(ch) )
        {
          pager_printf( ch, "&WAreas: &G");
          for ( area = planet->first_area ; area ; area = area->next_on_planet )
            pager_printf( ch , "%s,  ", area->filename );
          pager_printf( ch, "\r\n" );
        }

      count++;
    }

  if ( !count )
    {
      set_char_color( AT_BLOOD, ch);
      send_to_char( "There are no planets currently formed.\r\n", ch );
    }
}

long get_taxes( PLANET_DATA *planet )
{
  long gain;

  gain = planet->base_value;
  gain += planet->base_value*planet->pop_support/100;
  gain += UMAX(0, planet->pop_support/10 * planet->population);

  return gain;
}
