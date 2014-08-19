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

#include <ctype.h>
#include "mud.h"
#include "vector3_aux.h"

Spaceobject *first_spaceobject = NULL;
Spaceobject *last_spaceobject = NULL;

/* local routines */
void fread_spaceobject( Spaceobject *spaceobject, FILE *fp );
bool load_one_spaceobject( const char *spaceobjectfile );

void SpaceobjectUpdate( void )
{
  Spaceobject *spaceobj = NULL;

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      MoveSpaceobject( spaceobj );

      if( spaceobj->pos.x > MAX_COORD )
        spaceobj->pos.x = -MAX_COORD_S;

      if( spaceobj->pos.y > MAX_COORD )
        spaceobj->pos.y = -MAX_COORD_S;

      if( spaceobj->pos.z > MAX_COORD )
        spaceobj->pos.z = -MAX_COORD_S;

      if( spaceobj->pos.x < -MAX_COORD )
        spaceobj->pos.x = MAX_COORD_S;

      if( spaceobj->pos.y < -MAX_COORD )
        spaceobj->pos.y = MAX_COORD_S;

      if( spaceobj->pos.z < -MAX_COORD )
        spaceobj->pos.z = MAX_COORD_S;
    }
}

/*
 * Get pointer to space structure from spaceobject name.
 */
Spaceobject *GetSpaceobjectFromName( const char *name )
{
  Spaceobject *spaceobject = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !StrCmp( name, spaceobject->name ) )
      return spaceobject;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if ( !StringPrefix( name, spaceobject->name ) )
      return spaceobject;

  return NULL;
}

/*
 * Get pointer to space structure from the dock vnun.
 */
Spaceobject *GetSpaceobjectFromVnum( vnum_t vnum )
{
  Spaceobject *spaceobject = NULL;
  Ship *ship = NULL;

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if ( vnum == spaceobject->landing_site.doca ||
	   vnum == spaceobject->landing_site.docb ||
	   vnum == spaceobject->landing_site.docc )
	{
	  return spaceobject;
	}
    }

  for ( ship = first_ship; ship; ship = ship->next )
    {
      if ( vnum == ship->room.hanger )
	{
	  if( !(ship->bayopen) )
	    {
	      return NULL;
	    }

	  return ship->spaceobject;
	}
    }

  return NULL;
}

/*
 * Save a spaceobject's data to its data file
 */
void SaveSpaceobject( Spaceobject *spaceobject )
{
  FILE *fp = NULL;
  char filename[256];

  if ( !spaceobject )
    {
      bug( "%s: null pointer!", __FUNCTION__ );
      return;
    }

  if ( !spaceobject->filename || spaceobject->filename[0] == '\0' )
    {
      bug( "%s: %s has no filename", __FUNCTION__, spaceobject->name );
      return;
    }

  sprintf( filename, "%s%s", SPACE_DIR, spaceobject->filename );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( filename );
    }
  else
    {
      fprintf( fp, "#SPACE\n" );
      fprintf( fp, "Name         %s~\n",  spaceobject->name                   );
      fprintf( fp, "Filename     %s~\n",  spaceobject->filename               );
      fprintf( fp, "Type         %d\n",   spaceobject->type                   );
      fprintf( fp, "Locationa    %s~\n",  spaceobject->landing_site.locationa );
      fprintf( fp, "Locationb    %s~\n",  spaceobject->landing_site.locationb );
      fprintf( fp, "Locationc    %s~\n",  spaceobject->landing_site.locationc );
      fprintf( fp, "Doca         %ld\n",  spaceobject->landing_site.doca      );
      fprintf( fp, "Docb         %ld\n",  spaceobject->landing_site.docb      );
      fprintf( fp, "Docc         %ld\n",  spaceobject->landing_site.docc      );
      fprintf( fp, "Seca         %d\n",   spaceobject->landing_site.seca      );
      fprintf( fp, "Secb         %d\n",   spaceobject->landing_site.secb      );
      fprintf( fp, "Secc         %d\n",   spaceobject->landing_site.secc      );
      fprintf( fp, "Gravity      %d\n",   spaceobject->gravity                );
      fprintf( fp, "Xpos         %.0f\n", spaceobject->pos.x                  );
      fprintf( fp, "Ypos         %.0f\n", spaceobject->pos.y                  );
      fprintf( fp, "Zpos         %.0f\n", spaceobject->pos.z                  );
      fprintf( fp, "HX           %.0f\n", spaceobject->head.x                 );
      fprintf( fp, "HY           %.0f\n", spaceobject->head.y                 );
      fprintf( fp, "HZ           %.0f\n", spaceobject->head.z                 );
      fprintf( fp, "SP           %d\n",   spaceobject->speed                  );
      fprintf( fp, "Trainer      %d\n",   spaceobject->trainer                );
      fprintf( fp, "End\n\n"                                                  );
      fprintf( fp, "#END\n"                                                   );
    }

  fclose( fp );
}

/*
 * Read in actual spaceobject data.
 */
void fread_spaceobject( Spaceobject *spaceobject, FILE *fp )
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

        case 'D':
          KEY( "Doca",  spaceobject->landing_site.doca,          ReadInt( fp ) );
          KEY( "Docb",  spaceobject->landing_site.docb,          ReadInt( fp ) );
          KEY( "Docc",  spaceobject->landing_site.docc,          ReadInt( fp ) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if (!spaceobject->name)
                spaceobject->name               = CopyString( "" );
              if (!spaceobject->landing_site.locationa)
                spaceobject->landing_site.locationa            = CopyString( "" );
              if (!spaceobject->landing_site.locationb)
                spaceobject->landing_site.locationb            = CopyString( "" );
              if (!spaceobject->landing_site.locationc)
                spaceobject->landing_site.locationc            = CopyString( "" );
              return;
            }
          break;

        case 'F':
          KEY( "Filename",      spaceobject->filename,          ReadStringToTilde( fp ) );
          break;

        case 'G':
          KEY( "Gravity",  spaceobject->gravity,     ReadInt( fp ) );
          break;

        case 'H':
          KEY( "HX",  spaceobject->head.x,     ReadInt( fp ) );
          KEY( "HY",  spaceobject->head.y,     ReadInt( fp ) );
          KEY( "HZ",  spaceobject->head.z,     ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Locationa",     spaceobject->landing_site.locationa,         ReadStringToTilde( fp ) );
          KEY( "Locationb",     spaceobject->landing_site.locationb,         ReadStringToTilde( fp ) );
          KEY( "Locationc",     spaceobject->landing_site.locationc,         ReadStringToTilde( fp ) );
          break;

        case 'N':
          KEY( "Name",  spaceobject->name,              ReadStringToTilde( fp ) );
          break;

        case 'S':
          KEY( "Seca", spaceobject->landing_site.seca,               ReadInt( fp ) );
          KEY( "Secb", spaceobject->landing_site.secb,               ReadInt( fp ) );
          KEY( "Secc", spaceobject->landing_site.secc,               ReadInt( fp ) );
          KEY( "SP", spaceobject->speed,                ReadInt( fp ) );

        case 'T':
          KEY( "Trainer",  spaceobject->trainer,     ReadInt( fp ) );
          KEY( "Type",  spaceobject->type,             ReadInt( fp ) );

        case 'X':
          KEY( "Xpos",  spaceobject->pos.x,     ReadInt( fp ) );

        case 'Y':
          KEY( "Ypos",  spaceobject->pos.y,     ReadInt( fp ) );

        case 'Z':
          KEY( "Zpos",  spaceobject->pos.z,     ReadInt( fp ) );

        }

      if ( !fMatch )
        {
          bug( "Fread_spaceobject: no match: %s", word );
        }
    }
}

/*
 * Load a spaceobject file
 */
bool load_one_spaceobject( const char *spaceobjectfile )
{
  char filename[256];
  Spaceobject *spaceobject = NULL;
  FILE *fp = NULL;
  bool found = false;

  AllocateMemory( spaceobject, Spaceobject, 1 );
  sprintf( filename, "%s%s", SPACE_DIR, spaceobjectfile );

  if ( ( fp = fopen( filename, "r" ) ) != NULL )
    {
      found = true;
      LINK( spaceobject, first_spaceobject, last_spaceobject, next, prev );

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
              bug( "Load_spaceobject_file: # not found.", 0 );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SPACE"  ) )
            {
              fread_spaceobject( spaceobject, fp );
              break;
            }
          else if ( !StrCmp( word, "END"  ) )
	    {
              break;
	    }
	  else
	    {
	      bug( "Load_spaceobject_file: bad section: %s.", word );
	      break;
	    }
        }
      fclose( fp );
    }

  if ( !(found) )
    FreeMemory( spaceobject );

  return found;
}

/*
 * Load in all the spaceobject files.
 */
void LoadSpaceobjects( void )
{
  FILE *fpList = NULL;
  char spaceobjectlist[256];

  log_string( "Loading spaceobjects..." );
  sprintf( spaceobjectlist, "%s%s", SPACE_DIR, SPACE_LIST );

  if ( ( fpList = fopen( spaceobjectlist, "r" ) ) == NULL )
    {
      perror( spaceobjectlist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *filename = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( filename[0] == '$' )
        break;

      if ( !load_one_spaceobject( filename ) )
        {
          bug( "Cannot load spaceobject file: %s", filename );
        }
    }

  fclose( fpList );
  log_string(" Done spaceobjects " );
}
