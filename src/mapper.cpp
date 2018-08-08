/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <string.h>
#include "mud.hpp"
#include "character.hpp"

/* Size of the map and depth of recursion to undertake */
#define MAPX     10
#define MAPY      8
#define MAXDEPTH  4

/* Ensure coord is on the map */
#define BOUNDARY(x, y) (((x) < 0) || ((y) < 0) ||       \
                        ((x) > MAPX) || ((y) > MAPY))

/* Structure for the map itself */
struct map_type
{
  /* Character to print at this map coord */
  char mapch;
  /* Room this coord represents */
  int vnum;
  /* Recursive depth this coord was found at */
  int depth;
  int info;
  bool CanSeeCharacter;
};

/* Chars for each of the four compass direction exits */
char map_chars[] = "|-|-";
/* The map itself */
struct map_type map[MAPX + 1][MAPY + 1];

static void GetExitDirection( DirectionType dir, int *x, int *y, int xorig, int yorig );
static void ClearCoordinate( int x, int y );
static void ClearExitsForRoom( int x, int y );
static void MapExits( const Character *ch, const Room *pRoom, int x, int y, int depth );
static void ShowMapToCharacter( const Character *ch, const char *text );

/* Take care of some repetitive code for later */
static void GetExitDirection( DirectionType dir, int *x, int *y, int xorig, int yorig )
{
  /* Get the next coord based on direction */
  switch( dir )
    {
      /* North */
    case DIR_NORTH:
      *x = xorig;
      *y = yorig - 1;
      break;

      /* East */
    case DIR_EAST:
      *x = xorig + 1;
      *y = yorig;
      break;

      /* South */
    case DIR_SOUTH:
      *x = xorig;
      *y = yorig + 1;
      break;

      /* West */
    case DIR_WEST:
      *x = xorig - 1;
      *y = yorig;
      break;

    case DIR_NORTHEAST:
      *x = xorig + 1;
      *y = yorig - 1;
      break;

    case DIR_NORTHWEST:
      *x = xorig - 1;
      *y = yorig - 1;
      break;

    case DIR_SOUTHEAST:
      *x = xorig + 1;
      *y = yorig + 1;
      break;

    case DIR_SOUTHWEST:
      *x = xorig - 1;
      *y = yorig + 1;
      break;

    default:
      *x = -1;
      *y = -1;
      break;
    }
}

/* Clear one map coord */
static void ClearCoordinate( int x, int y )
{
  map[x][y].mapch = ' ';
  map[x][y].vnum = 0;
  map[x][y].depth = 0;
  map[x][y].info = 0;
  map[x][y].CanSeeCharacter = true;
}

/* Clear all exits for one room */
static void ClearExitsForRoom( int x, int y )
{
  DirectionType dir = DIR_INVALID;

  /* Cycle through the four directions */
  for( dir = DIR_NORTH; dir < DIR_SOMEWHERE; dir = (DirectionType)(dir + 1) )
    {
      int exitx = 0;
      int exity = 0;

      /* Find next coord in this direction */
      GetExitDirection( dir, &exitx, &exity, x, y );

      /* If coord is valid, clear it */
      if ( !BOUNDARY( exitx, exity ) )
        ClearCoordinate( exitx, exity );
    }
}

/* This function is recursive, ie it calls itself */
static void MapExits( const Character *ch, const Room *pRoom, int x, int y, int depth )
{
  DirectionType door = DIR_INVALID;

  /* Setup this coord as a room */
  map[x][y].mapch = 'O';
  map[x][y].vnum = pRoom->Vnum;
  map[x][y].depth = depth;
  map[x][y].info = pRoom->Flags;
  map[x][y].CanSeeCharacter = IsRoomDark( pRoom );

  /* Limit recursion */
  if ( depth > MAXDEPTH )
    return;

  /* This room is done, deal with it's exits */
  for( door = DIR_NORTH; door < DIR_SOMEWHERE; door = (DirectionType)(door + 1) )
    {
      int exitx = 0, exity = 0;
      int roomx = 0, roomy = 0;
      const Exit *pExit = NULL;

      /* Skip if there is no exit in this direction */
      if ( ( pExit = GetExit( pRoom, door ) )== NULL )
        continue;

      /* Get the coords for the next exit and room in this direction */
      GetExitDirection( door, &exitx, &exity, x, y );
      GetExitDirection( door, &roomx, &roomy, exitx, exity );

      /* Skip if coords fall outside map */
      if ( BOUNDARY( exitx, exity ) || BOUNDARY( roomx, roomy ) )
        continue;

      /* Skip if there is no room beyond this exit */
      if ( pExit->ToRoom == NULL )
        continue;

      /* Ensure there are no clashes with previously defined rooms */
      if ( ( map[roomx][roomy].vnum != 0 ) &&
           ( map[roomx][roomy].vnum != pExit->ToRoom->Vnum ) )
        {
          /* Use the new room if the depth is higher */
          if ( map[roomx][roomy].depth <= depth )
            continue;

          /* It is so clear the old room */
          ClearExitsForRoom( roomx, roomy );
        }

      /* No exits at MAXDEPTH */
      if ( depth == MAXDEPTH )
        continue;

      /* No need for exits that are already mapped */
      if ( map[exitx][exity].depth > 0 )
        continue;

      /* Fill in exit */
      map[exitx][exity].depth = depth;
      map[exitx][exity].vnum = pExit->ToRoom->Vnum;
      map[exitx][exity].info = pExit->Flags;
      /* sprintf( buf, "%c", map_chars[door] ); */
      map[exitx][exity].mapch = map_chars[door];

      /* Place Marker 1 - referred to later */

      /* More to do? If so we recurse */
      if ( ( depth < MAXDEPTH ) &&
           ( ( map[roomx][roomy].vnum == pExit->ToRoom->Vnum )
             || ( map[roomx][roomy].vnum == 0 ) ) )
        {
          /* Depth increases by one each time */
          MapExits( ch, pExit->ToRoom, roomx, roomy, depth + 1 );
        }
    }
}

/* Display the map to the player */
static void ShowMapToCharacter( const Character *ch, const char *text )
{
  char buf[MAX_STRING_LENGTH * 2];
  int y = 0;

  /* Place Marker 2 - referred to later */

  /* Top of map frame */
  sprintf( buf, "+-----------+ " );
  /* First line of text */
  strcat( buf, "\r\n" );

  /* Write out the main map area with text */
  for( y = 0; y <= MAPY; y++ )
    {
      int x = 0;

      strcat( buf, "|" );

      for( x = 0; x <= MAPX; x++ )
	{
	  /* Choose a color based on map contents here */

	  /* Write the map character */
	  sprintf( buf + strlen( buf ), "%c", map[x][y].mapch );
	}

      strcat( buf, "| \r\n" );
      /* Add the text, if necessary */
    }

  /* Finish off map area */
  strcat( buf, "+-----------+ " );

  /* Deal with any leftover text */

  /* Act can also be used here, as can SendToCharacter if desired */
  ch->Echo("%s", buf);
}

/* Clear, generate and display the map */
void DrawMap( const Character *ch, const char *desc )
{
  int x = 0, y = 0;
  static char buf[MAX_STRING_LENGTH];
  Object *device = NULL;

  if ( ( device = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL )
    {
      ch->Echo( "You must have a scanner to draw a map of the surrounding area.\r\n" );
      return;
    }

  if ( device->ItemType != ITEM_DEVICE )
    {
      ch->Echo( "You must have a scanner to draw a map of the surrounding area.\r\n" );
      return;
    }

  if (device->Value[OVAL_DEVICE_SPELL] != 52 )
    {
      ch->Echo( "You must have a scanner to draw a map of the surrounding area.\r\n" );
      return;
    }

  if ( device->Value[OVAL_DEVICE_CHARGES] <= 0 )
    {
      ch->Echo( "Your scanner has no more charge left." );
      return;
    }

  device->Value[OVAL_DEVICE_CHARGES]--;

  /* Clear map */
  for( y = 0; y <= MAPY; y++ )
    {
      for( x = 0; x <= MAPX; x++ )
	{
	  ClearCoordinate( x, y );
	}
    }

  /* Start with players pos at centre of map */
  x = MAPX / 2;
  y = MAPY / 2;

  map[x][y].vnum = ch->InRoom->Vnum;
  map[x][y].depth = 0;

  /* Generate the map */
  MapExits( ch, ch->InRoom, x, y, 0 );

  /* Current position should be a "X" */
  map[x][y].mapch = 'X';
  /* Send the map */
  ShowMapToCharacter( ch, buf );
}

