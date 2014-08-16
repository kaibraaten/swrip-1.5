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

/*
 * This file relies heavily on the fact that your linked lists are correct,
 * and that pArea->reset_first is the first reset in pArea.  Likewise,
 * pArea->reset_last *MUST* be the last reset in pArea.  Weird and
 * wonderful things will happen if any of your lists are messed up, none
 * of them good.  The most important are your pRoom->contents,
 * pRoom->people, rch->carrying, obj->contains, and pArea->reset_first ..
 * pArea->reset_last.  -- Altrag
 */

#include <string.h>
#include <ctype.h>
#include "reset.h"
#include "mud.h"
#include "character.h"

/* Externals */
RESET_DATA *parse_reset( Area *tarea, char *argument, Character *ch );

bool is_room_reset( RESET_DATA *pReset, ROOM_INDEX_DATA *aRoom,
		    Area *pArea );
void add_obj_reset( Area *pArea, char cm, OBJ_DATA *obj, int v2, int v3 );
void delete_reset( Area *pArea, RESET_DATA *pReset );
RESET_DATA *find_reset( Area *pArea, ROOM_INDEX_DATA *pRoom, int num );
void list_resets( Character *ch, Area *pArea,
		  ROOM_INDEX_DATA *pRoom, int start, int end );

RESET_DATA *find_reset(Area *pArea, ROOM_INDEX_DATA *pRoom, int numb)
{
  RESET_DATA *pReset = NULL;
  int num = 0;

  for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
    if ( is_room_reset(pReset, pRoom, pArea) && ++num >= numb )
      return pReset;

  return NULL;
}

/* This is one loopy function.  Ugh. -- Altrag */
bool is_room_reset( RESET_DATA *pReset, ROOM_INDEX_DATA *aRoom,
                    Area *pArea )
{
  ROOM_INDEX_DATA *pRoom = NULL;
  RESET_DATA *reset = NULL;
  int pr = 0;

  if ( !aRoom )
    {
      return true;
    }

  switch( pReset->command )
    {
    case 'M':
    case 'O':
      pRoom = get_room_index( pReset->arg3 );

      if ( !pRoom || pRoom != aRoom )
	{
	  return false;
	}

      return true;

    case 'P':
    case 'T':
    case 'H':
      if ( pReset->command == 'H' )
	{
	  pr = pReset->arg1;
	}
      else
	{
	  pr = pReset->arg3;
	}

      for ( reset = pReset->prev; reset; reset = reset->prev )
	{
	  if ( (reset->command == 'O' || reset->command == 'P' ||
		reset->command == 'G' || reset->command == 'E') &&
	       (!pr || pr == reset->arg1) && get_obj_index(reset->arg1) )
	    {
	      break;
	    }
	}

      if ( reset && is_room_reset(reset, aRoom, pArea) )
	{
	  return true;
	}

      return false;

    case 'B':
      switch(pReset->arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
        case BIT_RESET_ROOM:
          return (aRoom->vnum == pReset->arg1);

        case BIT_RESET_MOBILE:
          for ( reset = pReset->prev; reset; reset = reset->prev )
	    {
	      if ( reset->command == 'M' && get_mob_index(reset->arg1) )
		{
		  break;
		}
	    }

          if ( reset && is_room_reset(reset, aRoom, pArea) )
	    {
	      return true;
	    }

          return false;

        case BIT_RESET_OBJECT:
          for ( reset = pReset->prev; reset; reset = reset->prev )
            if ( (reset->command == 'O' || reset->command == 'P' ||
                  reset->command == 'G' || reset->command == 'E') &&
                 (!pReset->arg1 || pReset->arg1 == reset->arg1) &&
                 get_obj_index(reset->arg1) )
	      {
		break;
	      }

          if ( reset && is_room_reset(reset, aRoom, pArea) )
	    {
	      return true;
	    }

          return false;
        }

      return false;

    case 'G':
    case 'E':
      for ( reset = pReset->prev; reset; reset = reset->prev )
	{
	  if ( reset->command == 'M' && get_mob_index(reset->arg1) )
	    {
	      break;
	    }
	}

      if ( reset && is_room_reset(reset, aRoom, pArea) )
	{
	  return true;
	}

      return false;

    case 'D':
    case 'R':
      pRoom = get_room_index( pReset->arg1 );

      if ( !pRoom || pRoom->area != pArea || (aRoom && pRoom != aRoom) )
	{
	  return false;
	}

      return true;

    default:
      return false;
    }

  return false;
}

ROOM_INDEX_DATA *find_room( Character *ch, char *argument,
                            ROOM_INDEX_DATA *pRoom )
{
  char arg[MAX_INPUT_LENGTH];

  if ( pRoom )
    {
      return pRoom;
    }

  one_argument(argument, arg);

  if ( !is_number(arg) && arg[0] != '\0' )
    {
      send_to_char( "Reset to which room?\r\n", ch );
      return NULL;
    }

  if ( arg[0] == '\0' )
    {
      pRoom = ch->in_room;
    }
  else
    {
      pRoom = get_room_index(atoi(arg));
    }

  if ( !pRoom )
    {
      send_to_char( "Room does not exist.\r\n", ch );
      return NULL;
    }

  return pRoom;
}

/* Separate function for recursive purposes */
#define DEL_RESET(area, reset, rprev)           \
  do {                                          \
    rprev = reset->prev;                        \
    delete_reset(area, reset);                  \
    reset = rprev;                              \
    continue;                                   \
  } while(0)

void delete_reset( Area *pArea, RESET_DATA *pReset )
{
  RESET_DATA *reset = NULL;
  RESET_DATA *reset_prev = NULL;

  if ( pReset->command == 'M' )
    {
      for ( reset = pReset->next; reset; reset = reset->next )
        {
          /* Break when a new mob found */
          if ( reset->command == 'M' )
	    {
	      break;
	    }

          /* Delete anything mob is holding */
          if ( reset->command == 'G' || reset->command == 'E' )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->command == 'B' &&
               (reset->arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_MOBILE &&
               (!reset->arg1 || reset->arg1 == pReset->arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }
        }
    }
  else if ( pReset->command == 'O' || pReset->command == 'P' ||
            pReset->command == 'G' || pReset->command == 'E' )
    {
      for ( reset = pReset->next; reset; reset = reset->next )
        {
          if ( reset->command == 'T' &&
               (!reset->arg3 || reset->arg3 == pReset->arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->command == 'H' &&
               (!reset->arg1 || reset->arg1 == pReset->arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          /* Delete nested objects, even if they are the same object. */
          if ( reset->command == 'P'
	       && (reset->arg3 > 0 || pReset->command != 'P' || reset->extra-1 == pReset->extra)
	       && (!reset->arg3 || reset->arg3 == pReset->arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->command == 'B' &&
               (reset->arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_OBJECT &&
               (!reset->arg1 || reset->arg1 == pReset->arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          /* Break when a new object of same type is found */
          if ( (reset->command == 'O' || reset->command == 'P' ||
                reset->command == 'G' || reset->command == 'E') &&
               reset->arg1 == pReset->arg1 )
	    {
	      break;
	    }
        }
    }

  if ( pReset == pArea->last_mob_reset )
    {
      pArea->last_mob_reset = NULL;
    }

  if ( pReset == pArea->last_obj_reset )
    {
      pArea->last_obj_reset = NULL;
    }

  UNLINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
  DISPOSE(pReset);
}
#undef DEL_RESET

RESET_DATA *find_oreset(Character *ch, Area *pArea,
                        ROOM_INDEX_DATA *pRoom, char *name)
{
  RESET_DATA *reset = NULL;

  if ( !*name )
    {
      for ( reset = pArea->last_reset; reset; reset = reset->prev )
        {
          if ( !is_room_reset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->command)
            {
            default:
              continue;

            case 'O':
	    case 'E':
	    case 'G':
	    case 'P':
              break;
            }

          break;
        }

      if ( !reset )
	{
	  send_to_char( "No object resets in list.\r\n", ch );
	}

      return reset;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      int cnt = 0, num = number_argument(name, arg);
      OBJ_INDEX_DATA *pObjTo = NULL;

      for ( reset = pArea->first_reset; reset; reset = reset->next )
        {
          if ( !is_room_reset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->command)
            {
            default:
              continue;

            case 'O':
	    case 'E':
	    case 'G':
	    case 'P':
              break;
            }

          if ( (pObjTo = get_obj_index(reset->arg1)) &&
               is_name(arg, pObjTo->name) && ++cnt == num )
	    {
	      break;
	    }
        }

      if ( !pObjTo || !reset )
        {
          send_to_char( "To object not in reset list.\r\n", ch );
          return NULL;
        }
    }

  return reset;
}

RESET_DATA *find_mreset(Character *ch, Area *pArea,
                        ROOM_INDEX_DATA *pRoom, char *name)
{
  RESET_DATA *reset = NULL;

  if ( !*name )
    {
      for ( reset = pArea->last_reset; reset; reset = reset->prev )
        {
          if ( !is_room_reset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->command)
            {
            default:
              continue;
            case 'M':
              break;
            }

          break;
        }

      if ( !reset )
	{
	  send_to_char( "No mobile resets in list.\r\n", ch );
	}

      return reset;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      int cnt = 0, num = number_argument(name, arg);
      ProtoMobile *pMob = NULL;

      for ( reset = pArea->first_reset; reset; reset = reset->next )
        {
          if ( !is_room_reset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->command)
            {
            default:
              continue;

            case 'M':
              break;
            }

          if ( (pMob = get_mob_index(reset->arg1)) &&
               is_name(arg, pMob->player_name) && ++cnt == num )
	    {
	      break;
	    }
        }

      if ( !pMob || !reset )
        {
          send_to_char( "Mobile not in reset list.\r\n", ch );
          return NULL;
        }
    }

  return reset;
}

void edit_reset( Character *ch, char *argument, Area *pArea, ROOM_INDEX_DATA *aRoom )
{
  char arg[MAX_INPUT_LENGTH];
  RESET_DATA *pReset = NULL;
  RESET_DATA *reset = NULL;
  ProtoMobile *pMob = NULL;
  ROOM_INDEX_DATA *pRoom = NULL;
  OBJ_INDEX_DATA *pObj = NULL;
  int num = 0;
  vnum_t vnum = INVALID_VNUM;
  char *origarg = argument;

  argument = one_argument(argument, arg);

  if ( !*arg || !str_cmp(arg, "?") )
    {
      const char *nm = (ch->substate == SUB_REPEATCMD ? "" : (aRoom ? "rreset "
                                                        : "reset "));
      const char *rn = (aRoom ? "" : " [room#]");
      ch_printf(ch, "Syntax: %s<list|edit|delete|add|insert|place%s>\r\n",
                nm, (aRoom ? "" : "|area"));
      ch_printf( ch, "Syntax: %sremove <#>\r\n", nm );
      ch_printf( ch, "Syntax: %smobile <mob#> [limit]%s\r\n", nm, rn );
      ch_printf( ch, "Syntax: %sobject <obj#> [limit [room%s]]\r\n", nm, rn );
      ch_printf( ch, "Syntax: %sobject <obj#> give <mob name> [limit]\r\n", nm );
      ch_printf( ch, "Syntax: %sobject <obj#> equip <mob name> <location> "
                 "[limit]\r\n", nm );
      ch_printf( ch, "Syntax: %sobject <obj#> put <to_obj name> [limit]\r\n",
                 nm );
      ch_printf( ch, "Syntax: %shide <obj name>\r\n", nm );
      ch_printf( ch, "Syntax: %strap <obj name> <type> <charges> <flags>\r\n",
                 nm );
      ch_printf( ch, "Syntax: %strap room <type> <charges> <flags>\r\n", nm );
      ch_printf( ch, "Syntax: %sbit <set|toggle|remove> door%s <dir> "
                 "<exit flags>\r\n", nm, rn );
      ch_printf( ch, "Syntax: %sbit <set|toggle|remove> object <obj name> "
                 "<extra flags>\r\n", nm );
      ch_printf( ch, "Syntax: %sbit <set|toggle|remove> mobile <mob name> "
                 "<affect flags>\r\n", nm );
      ch_printf( ch, "Syntax: %sbit <set|toggle|remove> room%s <room flags>"
                 "\r\n", nm, rn );
      ch_printf( ch, "Syntax: %srandom <last dir>%s\r\n", nm, rn );

      if ( !aRoom )
        {
          send_to_char( "\r\n[room#] will default to the room you are in, "
                        "if unspecified.\r\n", ch );
        }

      return;
    }

  if ( !str_cmp(arg, "on") )
    {
      ch->substate = SUB_REPEATCMD;
      ch->dest_buf = (aRoom ? (void *)aRoom : (void *)pArea);
      send_to_char( "Reset mode on.\r\n", ch );
      return;
    }

  if ( !aRoom && !str_cmp(arg, "area") )
    {
      if ( !pArea->first_reset )
        {
          send_to_char( "You don't have any resets defined.\r\n", ch );
          return;
        }

      num = pArea->nplayer;
      pArea->nplayer = 0;
      reset_area(pArea);
      pArea->nplayer = num;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "list") )
    {
      int start = 0, end = 0;

      argument = one_argument(argument, arg);
      start = is_number(arg) ? atoi(arg) : -1;

      argument = one_argument(argument, arg);
      end = is_number(arg) ? atoi(arg) : -1;

      list_resets(ch, pArea, aRoom, start, end);
      return;
    }

  if ( !str_cmp(arg, "edit") )
    {
      argument = one_argument(argument, arg);

      if ( !*arg || !is_number(arg) )
        {
          send_to_char( "Usage: reset edit <number> <command>\r\n", ch );
          return;
        }

      if ( !(pReset = find_reset(pArea, aRoom, num)) )
        {
          send_to_char( "Reset not found.\r\n", ch );
          return;
        }

      if ( !(reset = parse_reset(pArea, argument, ch)) )
        {
          send_to_char( "Error in reset. Reset not changed.\r\n", ch );
          return;
        }

      reset->prev = pReset->prev;
      reset->next = pReset->next;

      if ( !pReset->prev )
	{
	  pArea->first_reset = reset;
	}
      else
	{
	  pReset->prev->next = reset;
	}

      if ( !pReset->next )
	{
	  pArea->last_reset  = reset;
	}
      else
	{
	  pReset->next->prev = reset;
	}

      DISPOSE(pReset);
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "add") )
    {
      if ( (pReset = parse_reset(pArea, argument, ch)) == NULL )
        {
          send_to_char( "Error in reset. Reset not added.\r\n", ch );
          return;
        }

      add_reset(pArea, pReset->command, pReset->extra, pReset->arg1,
                pReset->arg2, pReset->arg3);
      DISPOSE(pReset);
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "place") )
    {
      if ( (pReset = parse_reset(pArea, argument, ch)) == NULL )
        {
          send_to_char( "Error in reset. Reset not added.\r\n", ch );
          return;
        }

      place_reset(pArea, pReset->command, pReset->extra, pReset->arg1,
                  pReset->arg2, pReset->arg3);
      DISPOSE(pReset);
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "insert") )
    {
      argument = one_argument(argument, arg);

      if ( !*arg || !is_number(arg) )
        {
          send_to_char( "Usage: reset insert <number> <command>\r\n", ch );
          return;
        }

      num = atoi(arg);

      if ( (reset = find_reset(pArea, aRoom, num)) == NULL )
        {
          send_to_char( "Reset not found.\r\n", ch );
          return;
        }

      if ( (pReset = parse_reset(pArea, argument, ch)) == NULL )
        {
          send_to_char( "Error in reset.  Reset not inserted.\r\n", ch );
          return;
        }

      INSERT(pReset, reset, pArea->first_reset, next, prev);
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "delete") )
    {
      int start = 0, end = 0;
      bool found = false;

      if ( !*argument )
        {
          send_to_char( "Usage: reset delete <start> [end]\r\n", ch );
          return;
        }

      argument = one_argument(argument, arg);
      start = is_number(arg) ? atoi(arg) : -1;
      end   = is_number(arg) ? atoi(arg) : -1;
      num = 0;

      for ( pReset = pArea->first_reset; pReset; pReset = reset )
        {
          reset = pReset->next;

          if ( !is_room_reset(pReset, aRoom, pArea) )
	    {
	      continue;
	    }

          if ( start > ++num )
	    {
	      continue;
	    }

          if ( (end != -1 && num > end) || (end == -1 && found) )
	    {
	      return;
	    }

          UNLINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);

          if ( pReset == pArea->last_mob_reset )
	    {
	      pArea->last_mob_reset = NULL;
	    }

          DISPOSE(pReset);
          top_reset--;
          found = true;
        }

      if ( !found )
	{
	  send_to_char( "Reset not found.\r\n", ch );
	}
      else
	{
	  send_to_char( "Done.\r\n", ch );
	}

      return;
    }

  if ( !str_cmp(arg, "remove") )
    {
      int iarg = 0;

      argument = one_argument(argument, arg);

      if ( arg[0] == '\0' || !is_number(arg) )
        {
          send_to_char( "Delete which reset?\r\n", ch );
          return;
        }

      iarg = atoi(arg);

      for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
        {
          if ( is_room_reset( pReset, aRoom, pArea ) && ++num == iarg )
	    {
	      break;
	    }
        }

      if ( !pReset )
        {
          send_to_char( "Reset does not exist.\r\n", ch );
          return;
        }

      delete_reset( pArea, pReset );
      send_to_char( "Reset deleted.\r\n", ch );
      return;
    }

  if ( !str_prefix( arg, "mobile" ) )
    {
      argument = one_argument(argument, arg);

      if ( arg[0] == '\0' || !is_number(arg) )
        {
          send_to_char( "Reset which mobile vnum?\r\n", ch );
          return;
        }

      if ( !(pMob = get_mob_index(atoi(arg))) )
        {
          send_to_char( "Mobile does not exist.\r\n", ch );
          return;
        }

      argument = one_argument(argument, arg);

      if ( arg[0] == '\0' )
	{
	  num = 1;
	}
      else if ( !is_number(arg) )
        {
          send_to_char( "Reset how many mobiles?\r\n", ch );
          return;
        }
      else
	{
	  num = atoi(arg);
	}

      if ( !(pRoom = find_room(ch, argument, aRoom)) )
	{
	  return;
	}

      pReset = make_reset('M', 0, pMob->vnum, num, pRoom->vnum);
      LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
      send_to_char( "Mobile reset added.\r\n", ch );
      return;
    }

  if ( !str_prefix(arg, "object") )
    {
      argument = one_argument(argument, arg);

      if ( arg[0] == '\0' || !is_number(arg) )
        {
          send_to_char( "Reset which object vnum?\r\n", ch );
          return;
        }

      if ( !(pObj = get_obj_index(atoi(arg))) )
        {
          send_to_char( "Object does not exist.\r\n", ch );
          return;
        }

      argument = one_argument(argument, arg);

      if ( arg[0] == '\0' )
        strcpy(arg, "room");

      if ( !str_prefix( arg, "put" ) )
        {
          argument = one_argument(argument, arg);

          if ( !(reset = find_oreset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          /* Put in_objects after hide and trap resets */
          while ( reset->next && (reset->next->command == 'H'
                                  || reset->next->command == 'T'
				  || reset->next->command == 'B') )
	    {
	      reset = reset->next;
	    }

          argument = one_argument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = make_reset('P', reset->extra+1, pObj->vnum, vnum, 0);
          /* Grumble.. insert puts pReset before reset, and we need it after,
             so we make a hackup and reverse all the list params.. :P.. */
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          send_to_char( "Object reset in object created.\r\n", ch );
          return;
        }

      if ( !str_prefix( arg, "give" ) )
        {
          argument = one_argument(argument, arg);

          if ( !(reset = find_mreset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          while ( reset->next && reset->next->command == 'B' )
	    {
	      reset = reset->next;
	    }

          argument = one_argument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = make_reset('G', 1, pObj->vnum, vnum, 0);
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          send_to_char( "Object reset to mobile created.\r\n", ch );
          return;
        }

      if ( !str_prefix( arg, "equip" ) )
        {
          argument = one_argument(argument, arg);

          if ( !(reset = find_mreset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          while ( reset->next && reset->next->command == 'B' )
	    {
	      reset = reset->next;
	    }

          num = get_wearloc(argument);

          if ( num < 0 )
            {
              send_to_char( "Reset object to which location?\r\n", ch );
              return;
            }

          for ( pReset = reset->next; pReset; pReset = pReset->next )
            {
              if ( pReset->command == 'M' )
		{
		  break;
		}

              if ( pReset->command == 'E' && pReset->arg3 == num )
                {
                  send_to_char( "Mobile already has an item equipped there.\r\n", ch);
                  return;
                }
            }

          argument = one_argument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = make_reset('E', 1, pObj->vnum, vnum, num);
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          send_to_char( "Object reset equipped by mobile created.\r\n", ch );
          return;
        }

      if ( arg[0] == '\0' || !(num = (int)str_cmp(arg, "room"))
	   || is_number(arg) )
        {
          if ( !(bool)num )
	    {
	      argument = one_argument(argument, arg);
	    }

          if ( !(pRoom = find_room(ch, argument, aRoom)) )
	    {
	      return;
	    }

          if ( pRoom->area != pArea )
            {
              send_to_char( "Cannot reset objects to other areas.\r\n", ch );
              return;
            }

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = make_reset('O', 0, pObj->vnum, vnum, pRoom->vnum);
          LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
          send_to_char( "Object reset added.\r\n", ch );
          return;
        }

      send_to_char( "Reset object to where?\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "random") )
    {
      DirectionType direction = DIR_INVALID;

      argument = one_argument(argument, arg);
      direction = get_dir( arg );

      if ( direction <= DIR_INVALID || direction > DIR_SOUTHWEST )
        {
          send_to_char( "Reset which random doors?\r\n", ch );
          return;
        }

      if ( direction == DIR_NORTH )
        {
          send_to_char( "There is no point in randomizing one door.\r\n", ch );
          return;
        }

      pRoom = find_room(ch, argument, aRoom);

      if ( pRoom->area != pArea )
        {
          send_to_char( "Cannot randomize doors in other areas.\r\n", ch );
          return;
        }

      pReset = make_reset('R', 0, pRoom->vnum, direction, 0);
      LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
      send_to_char( "Reset random doors created.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "trap") )
    {
      char oname[MAX_INPUT_LENGTH];
      int chrg, value, extra = 0;
      bool isobj;

      argument = one_argument(argument, oname);
      argument = one_argument(argument, arg);
      num = is_number(arg) ? atoi(arg) : -1;
      argument = one_argument(argument, arg);
      chrg = is_number(arg) ? atoi(arg) : -1;
      isobj = is_name(argument, "obj");

      if ( isobj == is_name(argument, "room") )
        {
          send_to_char( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
          return;
        }

      if ( !str_cmp(oname, "room") && !isobj )
        {
          vnum = (aRoom ? aRoom->vnum : ch->in_room->vnum);
          extra = TRAP_ROOM;
        }
      else
        {
          if ( is_number(oname) && !isobj )
            {
              vnum = atoi(oname);
              if ( !get_room_index(vnum) )
                {
                  send_to_char( "Reset: TRAP: no such room\r\n", ch );
                  return;
                }
              reset = NULL;
              extra = TRAP_ROOM;
            }
          else
            {
              if ( !(reset = find_oreset(ch, pArea, aRoom, oname)) )
                return;
              /*        vnum = reset->arg1;*/
              vnum = 0;
              extra = TRAP_OBJ;
            }
        }

      if ( num < 1 || num > MAX_TRAPTYPE )
        {
          send_to_char( "Reset: TRAP: invalid trap type\r\n", ch );
          return;
        }

      if ( chrg < 0 || chrg > 10000 )
        {
          send_to_char( "Reset: TRAP: invalid trap charges\r\n", ch );
          return;
        }

      while ( *argument )
        {
          argument = one_argument(argument, arg);
          value = get_trapflag(arg);

          if ( value < 0 || value > 31 )
            {
              send_to_char( "Reset: TRAP: bad flag\r\n", ch );
              return;
            }

          SET_BIT(extra, 1 << value);
        }

      pReset = make_reset('T', extra, num, chrg, vnum);

      if ( reset )
        INSERT(pReset, reset, pArea->last_reset, prev, next);
      else
        LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);

      send_to_char( "Trap created.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "bit") )
    {
      int (*flfunc)(const char *type);
      int flags = 0;
      char option[MAX_INPUT_LENGTH];
      char *parg;

      argument = one_argument(argument, option);

      if ( !*option )
        {
          send_to_char( "You must specify SET, REMOVE, or TOGGLE.\r\n", ch );
          return;
        }

      num = 0;

      if ( !str_prefix(option, "set") )
	{
	  SET_BIT(num, BIT_RESET_SET);
	}
      else if ( !str_prefix(option, "toggle") )
	{
	  SET_BIT(num, BIT_RESET_TOGGLE);
	}
      else if ( str_prefix(option, "remove") )
        {
          send_to_char( "You must specify SET, REMOVE, or TOGGLE.\r\n", ch );
          return;
        }

      argument = one_argument(argument, option);
      parg = argument;
      argument = one_argument(argument, arg);

      if ( !*option )
        {
          send_to_char( "Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n", ch );
          return;
        }

      if ( !str_prefix(option, "door") )
        {
          SET_BIT(num, BIT_RESET_DOOR);

          if ( aRoom )
            {
              pRoom = aRoom;
              argument = parg;
            }
          else if ( !is_number(arg) )
            {
              pRoom = ch->in_room;
              argument = parg;
            }
          else if ( !(pRoom = find_room(ch, arg, aRoom)) )
	    {
	      return;
	    }

          argument = one_argument(argument, arg);

          if ( !*arg )
            {
              send_to_char( "Must specify direction.\r\n", ch );
              return;
            }

          vnum = get_dir(arg);
          SET_BIT(num, vnum << BIT_RESET_DOOR_THRESHOLD);
          vnum = pRoom->vnum;
          flfunc = &get_exitflag;
          reset = NULL;
        }
      else if ( !str_prefix(option, "object") )
        {
          SET_BIT(num, BIT_RESET_OBJECT);
          vnum = 0;
          flfunc = &get_objectflag;

          if ( !(reset = find_oreset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }
        }
      else if ( !str_prefix(option, "mobile") )
        {
          SET_BIT(num, BIT_RESET_MOBILE);
          vnum = 0;
          flfunc = &get_affectedflag;

          if ( !(reset = find_mreset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }
        }
      else if ( !str_prefix(option, "room") )
        {
          SET_BIT(num, BIT_RESET_ROOM);

          if ( aRoom )
            {
              pRoom = aRoom;
              argument = parg;
            }
          else if ( !is_number(arg) )
            {
              pRoom = ch->in_room;
              argument = parg;
            }
          else if ( !(pRoom = find_room(ch, arg, aRoom)) )
	    {
	      return;
	    }

          vnum = pRoom->vnum;
          flfunc = &get_roomflag;
          reset = NULL;
        }
      else
        {
          send_to_char( "Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n", ch );
          return;
        }

      while ( *argument )
        {
          int value;
          argument = one_argument(argument, arg);
          value = flfunc(arg);

          if ( value < 0 || value > 31 )
            {
              send_to_char( "Reset: BIT: bad flag\r\n", ch );
              return;
            }

          SET_BIT(flags, 1 << value);
        }

      if ( !flags )
        {
          send_to_char( "Set which flags?\r\n", ch );
          return;
        }

      pReset = make_reset('B', 1, vnum, num, flags);

      if ( reset )
        INSERT(pReset, reset, pArea->last_reset, prev, next);
      else
        LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);

      send_to_char( "Bitvector reset created.\r\n", ch );
      return;
    }

  if ( !str_cmp(arg, "hide") )
    {
      argument = one_argument(argument, arg);

      if ( !(reset = find_oreset(ch, pArea, aRoom, arg)) )
        return;

      pReset = make_reset('H', 1, 0, 0, 0);
      INSERT(pReset, reset, pArea->last_reset, prev, next);
      send_to_char( "Object hide reset created.\r\n", ch );
      return;
    }

  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_NONE;
      interpret(ch, origarg);
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = (aRoom ? do_rreset : do_reset);
    }
  else
    {
      edit_reset(ch, "", pArea, aRoom);
    }
}

void add_obj_reset( Area *pArea, char cm, OBJ_DATA *obj, int v2, int v3 )
{
  OBJ_DATA *inobj;
  static int iNest;

  if ( (cm == 'O' || cm == 'P') && obj->pIndexData->vnum == OBJ_VNUM_TRAP )
    {
      if ( cm == 'O' )
	{
	  add_reset(pArea, 'T', obj->value[OVAL_TRAP_FLAGS], obj->value[OVAL_TRAP_TYPE], obj->value[OVAL_TRAP_CHARGE], v3);
	}

      return;
    }

  add_reset( pArea, cm, (cm == 'P' ? iNest : 1), obj->pIndexData->vnum,
             v2, v3 );

  /* Only add hide for in-room objects that are hidden and cant be moved, as
     hide is an update reset, not a load-only reset. */
  if ( cm == 'O' && IS_OBJ_STAT(obj, ITEM_HIDDEN) &&
       !IS_SET(obj->wear_flags, ITEM_TAKE) )
    {
      add_reset(pArea, 'H', 1, 0, 0, 0);
    }

  for ( inobj = obj->first_content; inobj; inobj = inobj->next_content )
    {
      if ( inobj->pIndexData->vnum == OBJ_VNUM_TRAP )
	{
	  add_obj_reset(pArea, 'O', inobj, 0, 0);
	}
    }

  if ( cm == 'P' )
    {
      iNest++;
    }

  for ( inobj = obj->first_content; inobj; inobj = inobj->next_content )
    {
      add_obj_reset( pArea, 'P', inobj, 1, 0 );
    }

  if ( cm == 'P' )
    {
      iNest--;
    }
}

void instaroom( Area *pArea, ROOM_INDEX_DATA *pRoom, bool dodoors )
{
  Character *rch = NULL;
  OBJ_DATA *obj = NULL;

  for ( rch = pRoom->first_person; rch; rch = rch->next_in_room )
    {
      if ( !is_npc(rch) )
	{
	  continue;
	}

      add_reset( pArea, 'M', 1, rch->pIndexData->vnum, rch->pIndexData->count,
                 pRoom->vnum );

      for ( obj = rch->first_carrying; obj; obj = obj->next_content )
        {
          if ( obj->wear_loc == WEAR_NONE )
	    {
	      add_obj_reset( pArea, 'G', obj, 1, 0 );
	    }
          else
	    {
	      add_obj_reset( pArea, 'E', obj, 1, obj->wear_loc );
	    }
        }
    }

  for ( obj = pRoom->first_content; obj; obj = obj->next_content )
    {
      if ( obj->item_type == ITEM_SPACECRAFT )
	{
	  continue;
	}

      add_obj_reset( pArea, 'O', obj, 1, pRoom->vnum );
    }

  if ( dodoors )
    {
      Exit *pexit = NULL;

      for ( pexit = pRoom->first_exit; pexit; pexit = pexit->next )
        {
          int state = 0;

          if ( !IS_SET( pexit->exit_info, EX_ISDOOR ) )
	    {
	      continue;
	    }

          if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
            {
              if ( IS_SET( pexit->exit_info, EX_LOCKED ) )
		{
		  state = 2;
		}
              else
		{
		  state = 1;
		}
            }

          add_reset( pArea, 'D', 0, pRoom->vnum, pexit->vdir, state );
        }
    }
}

void wipe_resets( Area *pArea, ROOM_INDEX_DATA *pRoom )
{
  RESET_DATA *pReset = NULL;

  for ( pReset = pArea->first_reset; pReset; )
    {
      if ( pReset->command != 'R' && is_room_reset( pReset, pRoom, pArea ) )
        {
          /* Resets always go forward, so we can safely use the previous reset,
             providing it exists, or first_reset if it doesnt.  -- Altrag */
          RESET_DATA *prev = pReset->prev;

          delete_reset(pArea, pReset);
          pReset = (prev ? prev->next : pArea->first_reset);
        }
      else
	{
	  pReset = pReset->next;
	}
    }
}

int generate_itemlevel( Area *pArea, OBJ_INDEX_DATA *pObjIndex )
{
  int olevel = 0;
  int min = UMAX(pArea->low_soft_range, 1);
  int max = UMIN(pArea->hi_soft_range, min + 15);

  if ( pObjIndex->level > 0 )
    {
      olevel = UMIN(pObjIndex->level, MAX_LEVEL);
    }
  else
    {
      switch ( pObjIndex->item_type )
	{
	default:
          olevel = 0;
	  break;

	case ITEM_PILL:
	  olevel = number_range(  min, max );
	  break;

	case ITEM_POTION:
	  olevel = number_range(  min, max );
	  break;

	case ITEM_DEVICE:
	  olevel = number_range(  min, max );
	  break;

	case ITEM_ARMOR:
	  olevel = number_range( min+4, max+1 );
	  break;

	case ITEM_WEAPON:
	  olevel = number_range( min+4, max+1 );
	  break;
	}
    }

  return olevel;
}

/*
 * Reset one area.
 */
void reset_area( Area *pArea )
{
  RESET_DATA *pReset = NULL;
  RESET_DATA *next_reset = NULL;
  Character *mob = NULL;
  OBJ_DATA *obj = NULL;
  OBJ_DATA *lastobj = NULL;
  ROOM_INDEX_DATA *pRoomIndex = NULL;
  ProtoMobile *pMobIndex = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  OBJ_INDEX_DATA *pObjToIndex = NULL;
  Exit *pexit = NULL;
  OBJ_DATA *to_obj = NULL;
  int level = 0;
  int *plc = 0;

  if ( !pArea )
    {
      bug( "reset_area: NULL pArea" );
      return;
    }

  if ( !pArea->first_reset )
    {
      return;
    }

  for ( pReset = pArea->first_reset; pReset; pReset = next_reset )
    {
      next_reset = pReset->next;

      switch( pReset->command )
        {
        default:
          bug( "%s: Reset_area: bad command %c.", pArea->filename, pReset->command );
          break;

        case 'M':
          if ( !(pMobIndex = get_mob_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'M': bad mob vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = get_room_index(pReset->arg3)) )
            {
              bug( "%s: Reset_area: 'M': bad room vnum %d.", pArea->filename, pReset->arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( pMobIndex->count >= pReset->arg2 )
            {
              mob = NULL;
              break;
            }

          mob = create_mobile(pMobIndex);

          {
            ROOM_INDEX_DATA *pRoomPrev = get_room_index(pReset->arg3 - 1);

            if ( pRoomPrev && IS_SET(pRoomPrev->room_flags, ROOM_PET_SHOP) )
	      {
		SET_BIT(mob->act, ACT_PET);
	      }
          }

          if ( room_is_dark(pRoomIndex) )
	    {
	      SET_BIT(mob->affected_by, AFF_INFRARED);
	    }

          char_to_room(mob, pRoomIndex);
          economize_mobgold(mob);
          level = URANGE(0, mob->top_level - 2, LEVEL_AVATAR);

          if ( mob->vip_flags != 0 && pArea->planet )
	    {
	      pArea->planet->population++;
	    }

          break;

        case 'G':
        case 'E':
          if ( !(pObjIndex = get_obj_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'E' or 'G': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( !mob )
            {
              lastobj = NULL;
              break;
            }

          if ( mob->pIndexData->pShop )
            {
              int olevel = generate_itemlevel( pArea, pObjIndex );
              obj = create_object(pObjIndex, olevel);
              SET_BIT(obj->extra_flags, ITEM_INVENTORY);
            }
          else
	    {
	      obj = create_object(pObjIndex, number_fuzzy(level));
	    }

          obj->level = URANGE(0, obj->level, LEVEL_AVATAR);
          obj = obj_to_char(obj, mob);

          if ( pReset->command == 'E' )
	    {
	      equip_char(mob, obj, pReset->arg3);
	    }

          lastobj = obj;
          break;

        case 'O':
          if ( !(pObjIndex = get_obj_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'O': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = get_room_index(pReset->arg3)) )
            {
              bug( "%s: Reset_area: 'O': bad room vnum %d.", pArea->filename, pReset->arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( count_obj_list(pObjIndex, pRoomIndex->first_content) > 0 )
            {
              obj = NULL;
              lastobj = NULL;
              break;
            }

          obj = create_object(pObjIndex, number_fuzzy(generate_itemlevel(pArea, pObjIndex)));
          obj->level = UMIN(obj->level, LEVEL_AVATAR);
          obj->cost = 0;
          obj_to_room(obj, pRoomIndex);
          lastobj = obj;
          break;

        case 'P':
          if ( !(pObjIndex = get_obj_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'P': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( pReset->arg3 > 0 )
            {
              if ( !(pObjToIndex = get_obj_index(pReset->arg3)) )
                {
                  bug( "%s: Reset_area: 'P': bad objto vnum %d.", pArea->filename, pReset->arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      DISPOSE( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   !(to_obj = get_obj_type(pObjToIndex)) ||
                   !to_obj->in_room ||
                   count_obj_list(pObjIndex, to_obj->first_content) > 0 )
                {
                  obj = NULL;
                  break;
                }

              lastobj = to_obj;
            }
          else
            {
              int iNest = 0;

              if ( !lastobj )
                break;

              to_obj = lastobj;

              for ( iNest = 0; iNest < pReset->extra; iNest++ )
		{
		  if ( !(to_obj = to_obj->last_content) )
		    {
		      bug( "%s: Reset_area: 'P': Invalid nesting obj %d.", pArea->filename, pReset->arg1 );
		      iNest = -1;
		      break;
		    }
		}

              if ( iNest < 0 )
		{
		  continue;
		}
            }

          obj = create_object(pObjIndex, number_fuzzy(UMAX(generate_itemlevel(pArea, pObjIndex),to_obj->level)));
          obj->level = UMIN(obj->level, LEVEL_AVATAR);
          obj_to_obj(obj, to_obj);
          break;

        case 'T':
          if ( IS_SET(pReset->extra, TRAP_OBJ) )
            {
              /* We need to preserve obj for future 'T' and 'H' checks */
              OBJ_DATA *pobj = NULL;

              if ( pReset->arg3 > 0 )
                {
                  if ( !(pObjToIndex = get_obj_index(pReset->arg3)) )
                    {
                      bug( "%s: Reset_area: 'T': bad objto vnum %d.", pArea->filename, pReset->arg3 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                          DISPOSE( pReset );
                        }

                      continue;
                    }

                  if ( pArea->nplayer > 0 ||
                       !(to_obj = get_obj_type(pObjToIndex)) ||
                       (to_obj->carried_by && !is_npc(to_obj->carried_by)) ||
                       is_trapped(to_obj) )
		    {
		      break;
		    }
                }
              else
                {
                  if ( !lastobj || !obj )
		    {
		      break;
		    }

                  to_obj = obj;
                }

              pobj = make_trap( pReset->arg2, pReset->arg1,
                                number_fuzzy(to_obj->level), pReset->extra );
              obj_to_obj(pobj, to_obj);
            }
          else
            {
              if ( !(pRoomIndex = get_room_index(pReset->arg3)) )
                {
                  bug( "%s: Reset_area: 'T': bad room %d.", pArea->filename, pReset->arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      DISPOSE( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   count_obj_list(get_obj_index(OBJ_VNUM_TRAP),
                                  pRoomIndex->first_content) > 0 )
		{
		  break;
		}

              to_obj = make_trap(pReset->arg1, pReset->arg1, 10, pReset->extra);
              obj_to_room(to_obj, pRoomIndex);
            }

          break;

        case 'H':
          if ( pReset->arg1 > 0 )
            {
              if ( !(pObjToIndex = get_obj_index(pReset->arg1)) )
                {
                  bug( "%s: Reset_area: 'H': bad objto vnum %d.", pArea->filename, pReset->arg1 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      DISPOSE( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   !(to_obj = get_obj_type(pObjToIndex)) ||
                   !to_obj->in_room ||
                   to_obj->in_room->area != pArea ||
                   IS_OBJ_STAT(to_obj, ITEM_HIDDEN) )
		{
		  break;
		}
            }
          else
            {
              if ( !lastobj || !obj )
		{
		  break;
		}

              to_obj = obj;
            }

          SET_BIT(to_obj->extra_flags, ITEM_HIDDEN);
          break;

        case 'B':
          switch(pReset->arg2 & BIT_RESET_TYPE_MASK)
            {
            case BIT_RESET_DOOR:
              {
                int doornum = 0;

                if ( !(pRoomIndex = get_room_index(pReset->arg1)) )
                  {
                    bug( "%s: Reset_area: 'B': door: bad room vnum %d.", pArea->filename, pReset->arg1 );
                    if( !bootup )
                      {
                        UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                        DISPOSE( pReset );
                      }

                    continue;
                  }

                doornum = (pReset->arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD;

                if ( !(pexit = get_exit(pRoomIndex, doornum)) )
		  {
		    break;
		  }

                plc = &pexit->exit_info;
              }

              break;

            case BIT_RESET_ROOM:
              if ( !(pRoomIndex = get_room_index(pReset->arg1)) )
                {
                  bug( "%s: Reset_area: 'B': room: bad room vnum %d.", pArea->filename, pReset->arg1 );
                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      DISPOSE( pReset );
                    }

                  continue;
                }

              plc = &pRoomIndex->room_flags;
              break;

            case BIT_RESET_OBJECT:
              if ( pReset->arg1 > 0 )
                {
                  if ( !(pObjToIndex = get_obj_index(pReset->arg1)) )
                    {
                      bug( "%s: Reset_area: 'B': object: bad objto vnum %d.", pArea->filename, pReset->arg1 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                          DISPOSE( pReset );
                        }

                      continue;
                    }

                  if ( !(to_obj = get_obj_type(pObjToIndex)) ||
                       !to_obj->in_room ||
                       to_obj->in_room->area != pArea )
		    {
		      continue;
		    }
                }
              else
                {
                  if ( !lastobj || !obj )
		    {
		      continue;
		    }

                  to_obj = obj;
                }

              plc = &to_obj->extra_flags;
              break;

            case BIT_RESET_MOBILE:
              if ( !mob )
		{
		  continue;
		}

              plc = &mob->affected_by;
              break;

            default:
              bug( "%s: Reset_area: 'B': bad options %d.", pArea->filename, pReset->arg2 );
              continue;
            }

          if ( IS_SET(pReset->arg2, BIT_RESET_SET) )
	    {
	      SET_BIT(*plc, pReset->arg3);
	    }
          else if ( IS_SET(pReset->arg2, BIT_RESET_TOGGLE) )
	    {
	      TOGGLE_BIT(*plc, pReset->arg3);
	    }
          else
	    {
	      REMOVE_BIT(*plc, pReset->arg3);
	    }

          break;

        case 'D':
          if ( !(pRoomIndex = get_room_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'D': bad room vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          if ( !(pexit = get_exit(pRoomIndex, pReset->arg2)) )
	    {
	      break;
	    }

          switch( pReset->arg3 )
            {
            case 0:
              REMOVE_BIT( pexit->exit_info, EX_CLOSED );
              REMOVE_BIT( pexit->exit_info, EX_LOCKED );
              break;

            case 1:
              SET_BIT( pexit->exit_info, EX_CLOSED );
              REMOVE_BIT( pexit->exit_info, EX_LOCKED );

              if ( IS_SET( pexit->exit_info, EX_xSEARCHABLE ) )
		{
		  SET_BIT( pexit->exit_info, EX_SECRET );
		}
              break;

            case 2:
              SET_BIT( pexit->exit_info, EX_CLOSED );
              SET_BIT( pexit->exit_info, EX_LOCKED );

              if ( IS_SET( pexit->exit_info, EX_xSEARCHABLE ) )
                SET_BIT( pexit->exit_info, EX_SECRET );

              break;

            }
          break;

        case 'R':
          if ( !(pRoomIndex = get_room_index(pReset->arg1)) )
            {
              bug( "%s: Reset_area: 'R': bad room vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  DISPOSE( pReset );
                }

              continue;
            }

          randomize_exits(pRoomIndex, pReset->arg2-1);
          break;
        }
    }
}

void list_resets( Character *ch, Area *pArea, ROOM_INDEX_DATA *pRoom,
                  int start, int end )
{
  RESET_DATA *pReset = NULL;
  ROOM_INDEX_DATA *room = NULL;
  ProtoMobile *mob = NULL;
  OBJ_INDEX_DATA *obj = NULL;
  OBJ_INDEX_DATA *obj2 = NULL;
  OBJ_INDEX_DATA *lastobj = NULL;
  RESET_DATA *lo_reset = NULL;
  int num = 0;
  const char *rname = NULL;
  const char *mname = NULL;
  const char *oname = NULL;

  if ( !ch || !pArea )
    {
      return;
    }

  for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
    {
      char *pbuf = NULL;
      char buf[256];

      if ( !is_room_reset(pReset, pRoom, pArea) )
	{
	  continue;
	}

      ++num;
      sprintf(buf, "%2d) ", num);
      pbuf = buf + strlen(buf);

      switch( pReset->command )
        {
        default:
          sprintf(pbuf, "*** BAD RESET: %c %d %d %d %d ***\r\n",
                  pReset->command, pReset->extra, pReset->arg1, pReset->arg2,
                  pReset->arg3);
          break;

        case 'M':
          if ( !(mob = get_mob_index(pReset->arg1)) )
            mname = "Mobile: *BAD VNUM*";
          else
            mname = mob->player_name;

          if ( !(room = get_room_index(pReset->arg3)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->name;

          sprintf( pbuf, "%s (%d) -> %s (%d) [%d]", mname, pReset->arg1, rname,
                   pReset->arg3, pReset->arg2 );

          if ( !room )
            mob = NULL;

          if ( (room = get_room_index(pReset->arg3-1)) &&
               IS_SET(room->room_flags, ROOM_PET_SHOP) )
            strcat( buf, " (pet)\r\n" );
          else
            strcat( buf, "\r\n" );

          break;

        case 'G':
        case 'E':
          if ( !mob )
            mname = "* ERROR: NO MOBILE! *";

          if ( !(obj = get_obj_index(pReset->arg1)) )
            oname = "Object: *BAD VNUM*";
          else
            oname = obj->name;

          sprintf( pbuf, "%s (%d) -> %s (%s) [%d]", oname, pReset->arg1, mname,
                   (pReset->command == 'G' ? "carry" : wear_locs[pReset->arg3]),
                   pReset->arg2 );

          if ( mob && mob->pShop )
            strcat( buf, " (shop)\r\n" );
          else
            strcat( buf, "\r\n" );

          lastobj = obj;
          lo_reset = pReset;
          break;

        case 'O':
          if ( !(obj = get_obj_index(pReset->arg1)) )
            oname = "Object: *BAD VNUM*";
          else
            oname = obj->name;

          if ( !(room = get_room_index(pReset->arg3)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->name;

          sprintf( pbuf, "(object) %s (%d) -> %s (%d) [%d]\r\n", oname,
                   pReset->arg1, rname, pReset->arg3, pReset->arg2 );

          if ( !room )
            obj = NULL;

          lastobj = obj;
          lo_reset = pReset;
          break;

        case 'P':
          if ( !(obj = get_obj_index(pReset->arg1)) )
            oname = "Object1: *BAD VNUM*";
          else
            oname = obj->name;

          obj2 = NULL;

          if ( pReset->arg3 > 0 )
            {
              obj2 = get_obj_index(pReset->arg3);
              rname = (obj2 ? obj2->name : "Object2: *BAD VNUM*");
              lastobj = obj2;
            }
          else if ( !lastobj )
	    {
	      rname = "Object2: *NULL obj*";
	    }
          else if ( pReset->extra == 0 )
            {
              rname = lastobj->name;
              obj2 = lastobj;
            }
          else
            {
              int iNest;
              RESET_DATA *reset = lo_reset->next;

              for ( iNest = 0; iNest < pReset->extra; iNest++ )
                {
                  for ( ; reset; reset = reset->next )
                    if ( reset->command == 'O' || reset->command == 'G' ||
                         reset->command == 'E' || (reset->command == 'P' &&
                                                   !reset->arg3 && reset->extra == iNest) )
                      break;

                  if ( !reset || reset->command != 'P' )
                    break;
                }

              if ( !reset )
                rname = "Object2: *BAD NESTING*";
              else if ( !(obj2 = get_obj_index(reset->arg1)) )
                rname = "Object2: *NESTED BAD VNUM*";
              else
                rname = obj2->name;
            }

          sprintf( pbuf, "(Put) %s (%d) -> %s (%ld) [%d] {nest %d}\r\n", oname,
                   pReset->arg1, rname, (obj2 ? obj2->vnum : pReset->arg3),
                   pReset->arg2, pReset->extra );
          break;

        case 'T':
          sprintf(pbuf, "TRAP: %d %d %d %d (%s)\r\n", pReset->extra, pReset->arg1,
                  pReset->arg2, pReset->arg3, flag_string(pReset->extra, trap_flags));
          break;

        case 'H':
          if ( pReset->arg1 > 0 )
            if ( !(obj2 = get_obj_index(pReset->arg1)) )
              rname = "Object: *BAD VNUM*";
            else
              rname = obj2->name;
          else if ( !obj )
            rname = "Object: *NULL obj*";
          else
            rname = oname;
          sprintf(pbuf, "Hide %s (%ld)\r\n", rname,
                  (pReset->arg1 > 0 ? pReset->arg1 : obj ? obj->vnum : 0));
          break;

        case 'B':
          {
            const char * const * flagarray;

            strcpy(pbuf, "BIT: ");
            pbuf += 5;

            if ( IS_SET(pReset->arg2, BIT_RESET_SET) )
              {
                strcpy(pbuf, "Set: ");
                pbuf += 5;
              }
            else if ( IS_SET(pReset->arg2, BIT_RESET_TOGGLE) )
              {
                strcpy(pbuf, "Toggle: ");
                pbuf += 8;
              }
            else
              {
                strcpy(pbuf, "Remove: ");
                pbuf += 8;
              }

            switch(pReset->arg2 & BIT_RESET_TYPE_MASK)
              {
              case BIT_RESET_DOOR:
                {
                  int door;

                  if ( !(room = get_room_index(pReset->arg1)) )
                    rname = "Room: *BAD VNUM*";
                  else
                    rname = room->name;
                  door = (pReset->arg2 & BIT_RESET_DOOR_MASK)
                    >> BIT_RESET_DOOR_THRESHOLD;
                  door = URANGE(0, door, MAX_DIR+1);
                  sprintf(pbuf, "Exit %s%s (%d), Room %s (%d)",
			  get_dir_name(door),
                          (room && get_exit(room, door) ? "" : " (NO EXIT!)"), door,
                          rname, pReset->arg1);
                }
                flagarray = exit_flags;
                break;

              case BIT_RESET_ROOM:
                if ( !(room = get_room_index(pReset->arg1)) )
                  rname = "Room: *BAD VNUM*";
                else
                  rname = room->name;

                sprintf(pbuf, "Room %s (%d)", rname, pReset->arg1);
                flagarray = room_flags;
                break;

              case BIT_RESET_OBJECT:
                if ( pReset->arg1 > 0 )
                  if ( !(obj2 = get_obj_index(pReset->arg1)) )
                    rname = "Object: *BAD VNUM*";
                  else
                    rname = obj2->name;
                else if ( !obj )
                  rname = "Object: *NULL obj*";
                else
                  rname = oname;
                sprintf(pbuf, "Object %s (%ld)", rname,
                        (pReset->arg1 > 0 ? pReset->arg1 : obj ? obj->vnum : 0));
                flagarray = object_flags;
                break;

              case BIT_RESET_MOBILE:
                if ( pReset->arg1 > 0 )
                  {
                    ProtoMobile *mob2;

                    if ( !(mob2 = get_mob_index(pReset->arg1)) )
                      rname = "Mobile: *BAD VNUM*";
                    else
                      rname = mob2->player_name;
                  }
                else if ( !mob )
                  rname = "Mobile: *NULL mob*";
                else
                  rname = mname;
                sprintf(pbuf, "Mobile %s (%ld)", rname,
                        (pReset->arg1 > 0 ? pReset->arg1 : mob ? mob->vnum : 0));
                flagarray = affected_flags;
                break;

              default:
                sprintf(pbuf, "bad type %d", pReset->arg2 & BIT_RESET_TYPE_MASK);
                flagarray = NULL;
                break;
              }

            pbuf += strlen(pbuf);

            if ( flagarray )
              sprintf(pbuf, "; flags: %s [%d]\r\n",
                      flag_string(pReset->arg3, flagarray), pReset->arg3);
            else
              sprintf(pbuf, "; flags %d\r\n", pReset->arg3);
          }
          break;

        case 'D':
          {
            const char *ef_name;

            pReset->arg2 = URANGE(0, pReset->arg2, MAX_DIR+1);

            if ( !(room = get_room_index(pReset->arg1)) )
              rname = "Room: *BAD VNUM*";
            else
              rname = room->name;

            switch(pReset->arg3)
              {
              default:
		ef_name = "(* ERROR *)";
		break;

              case 0:
		ef_name = "Open";
		break;

              case 1:
		ef_name = "Close";
		break;

              case 2:
		ef_name = "Close and lock";
		break;
              }

            sprintf(pbuf, "%s [%d] the %s%s [%d] door %s (%d)\r\n", ef_name,
                    pReset->arg3, get_dir_name(pReset->arg2),
                    (room && get_exit(room, pReset->arg2) ? "" : " (NO EXIT!)"),
                    pReset->arg2, rname, pReset->arg1);
          }
          break;

        case 'R':
          if ( !(room = get_room_index(pReset->arg1)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->name;

          sprintf(pbuf, "Randomize exits 0 to %d -> %s (%d)\r\n", pReset->arg2,
                  rname, pReset->arg1);
          break;
        }

      if ( start == -1 || num >= start )
        send_to_char( buf, ch );

      if ( end != -1 && num >= end )
        break;
    }

  if ( num == 0 )
    send_to_char( "You don't have any resets defined.\r\n", ch );
}

/* Setup put nesting levels, regardless of whether or not the resets will
   actually reset, or if they're bugged. */
void renumber_put_resets( Area *pArea )
{
  RESET_DATA *pReset = NULL, *lastobj = NULL;

  for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
    {
      switch(pReset->command)
        {
        default:
          break;

        case 'G':
	case 'E':
	case 'O':
          lastobj = pReset;
          break;

        case 'P':
          if ( pReset->arg3 == 0 )
            {
              if ( !lastobj )
                pReset->extra = 1000000;
              else if ( lastobj->command != 'P' || lastobj->arg3 > 0 )
                pReset->extra = 0;
              else
                pReset->extra = lastobj->extra+1;

              lastobj = pReset;
            }
        }
    }
}

/*
 * Create a new reset (for online building)                     -Thoric
 */
RESET_DATA *make_reset( char letter, int extra, int arg1, int arg2, int arg3 )
{
  RESET_DATA *pReset = NULL;

  CREATE( pReset, RESET_DATA, 1 );
  pReset->command       = letter;
  pReset->extra = extra;
  pReset->arg1  = arg1;
  pReset->arg2  = arg2;
  pReset->arg3  = arg3;
  top_reset++;

  return pReset;
}

/*
 * Add a reset to an area                               -Thoric
 */
RESET_DATA *add_reset( Area *tarea, char letter, int extra, int arg1, int arg2, int arg3 )
{
  RESET_DATA *pReset = NULL;

  if ( !tarea )
    {
      bug( "add_reset: NULL area!", 0 );
      return NULL;
    }

  letter = UPPER(letter);
  pReset = make_reset( letter, extra, arg1, arg2, arg3 );

  switch( letter )
    {
    case 'M':
      tarea->last_mob_reset = pReset;
      break;

    case 'H':
      if ( arg1 > 0 )
	{
	  break;
	}

    case 'E':
    case 'G':
    case 'P':
    case 'O':
      tarea->last_obj_reset = pReset;
    break;

    case 'T':
      if ( IS_SET( extra, TRAP_OBJ ) && arg1 == 0)
	{
	  tarea->last_obj_reset = pReset;
	}

      break;
    }

  LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );
  return pReset;
}

/*
 * Place a reset into an area, insert sorting it                -Thoric
 */
RESET_DATA *place_reset( Area *tarea, char letter, int extra, int arg1, int arg2, int arg3 )
{
  RESET_DATA *pReset = NULL;
  RESET_DATA *tmp = NULL;
  RESET_DATA *tmp2 = NULL;

  if ( !tarea )
    {
      bug( "place_reset: NULL area!", 0 );
      return NULL;
    }

  letter = UPPER(letter);
  pReset = make_reset( letter, extra, arg1, arg2, arg3 );

  if ( letter == 'M' )
    {
      tarea->last_mob_reset = pReset;
    }

  if ( tarea->first_reset )
    {
      switch( letter )
        {
        default:
          bug( "place_reset: Bad reset type %c", letter );
          return NULL;

        case 'D':
	case 'R':
          for ( tmp = tarea->last_reset; tmp; tmp = tmp->prev )
            if ( tmp->command == letter )
              break;

          if ( tmp )    /* organize by location */
            for ( ; tmp && tmp->command == letter && tmp->arg1 > arg1; tmp = tmp->prev );

          if ( tmp )    /* organize by direction */
            for ( ; tmp && tmp->command == letter && tmp->arg1 == tmp->arg1 && tmp->arg2 > arg2; tmp = tmp->prev );

          if ( tmp )
            INSERT( pReset, tmp, tarea->first_reset, next, prev );
          else
            LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );

          return pReset;

        case 'M':       case 'O':
          /* find last reset of same type */
          for ( tmp = tarea->last_reset; tmp; tmp = tmp->prev )
            if ( tmp->command == letter )
              break;

          tmp2 = tmp ? tmp->next : NULL;

          /* organize by location */
          for ( ; tmp; tmp = tmp->prev )
            if ( tmp->command == letter && tmp->arg3 <= arg3 )
              {
                tmp2 = tmp->next;

                /* organize by vnum */
                if ( tmp->arg3 == arg3 )
                  for ( ; tmp; tmp = tmp->prev )
                    if ( tmp->command == letter
                         &&   tmp->arg3 == tmp->arg3
                         &&   tmp->arg1 <= arg1 )
                      {
                        tmp2 = tmp->next;
                        break;
                      }

                break;
              }

          /* skip over E or G for that mob */
          if ( tmp2 && letter == 'M' )
            {
              for ( ; tmp2; tmp2 = tmp2->next )
                if ( tmp2->command != 'E' && tmp2->command != 'G' )
                  break;
            }
          else
            /* skip over P, T or H for that obj */
            if ( tmp2 && letter == 'O' )
              {
                for ( ; tmp2; tmp2 = tmp2->next )
                  if ( tmp2->command != 'P' && tmp2->command != 'T'
                       &&   tmp2->command != 'H' )
                    break;
              }

          if ( tmp2 )
            INSERT( pReset, tmp2, tarea->first_reset, next, prev );
          else
            LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );

          return pReset;

        case 'G':
	case 'E':
          /* find the last mob */
          if ( (tmp=tarea->last_mob_reset) != NULL )
            {
              /*
               * See if there are any resets for this mob yet,
               * put E before G and organize by vnum
               */
              if ( tmp->next )
                {
                  tmp = tmp->next;

                  if ( tmp && tmp->command == 'E' )
                    {
                      if ( letter == 'E' )
                        for ( ; tmp && tmp->command == 'E' && tmp->arg1 < arg1; tmp = tmp->next );
                      else
                        for ( ; tmp && tmp->command == 'E'; tmp = tmp->next );
                    }
                  else
                    if ( tmp && tmp->command == 'G' && letter == 'G' )
                      for ( ; tmp && tmp->command == 'G' && tmp->arg1 < arg1; tmp = tmp->next );

                  if ( tmp )
                    INSERT( pReset, tmp, tarea->first_reset, next, prev );
                  else
                    LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );
                }
              else
                LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );

              return pReset;
            }
          break;

        case 'P':       case 'T':   case 'H':
          /* find the object in question */
          if ( ((letter == 'P' && arg3 == 0)
                ||    (letter == 'T' && IS_SET(extra, TRAP_OBJ) && arg1 == 0)
                ||    (letter == 'H' && arg1 == 0))
               &&    (tmp=tarea->last_obj_reset) != NULL )
            {
              if ( (tmp=tmp->next) != NULL )
                INSERT( pReset, tmp, tarea->first_reset, next, prev );
              else
                LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );

              return pReset;
            }

          for ( tmp = tarea->last_reset; tmp; tmp = tmp->prev )
            if ( (tmp->command == 'O' || tmp->command == 'G'
                  || tmp->command == 'E' || tmp->command == 'P')
                 && tmp->arg1 == arg3 )
              {
                /*
                 * See if there are any resets for this object yet,
                 * put P before H before T and organize by vnum
                 */
                if ( tmp->next )
                  {
                    tmp = tmp->next;

                    if ( tmp && tmp->command == 'P' )
                      {
                        if ( letter == 'P' && tmp->arg3 == arg3 )
			  {
			    for ( ; tmp && tmp->command == 'P'
				    && tmp->arg3 == arg3
				    && tmp->arg1 < arg1;
				  tmp = tmp->next )
			      {
				;
			      }
			  }
                        else if ( letter != 'T' )
			  {
                            for ( ; tmp
				    && tmp->command == 'P'
				    && tmp->arg3 == arg3;
				  tmp = tmp->next )
			      {
				;
			      }
			  }
                      }
                    else if ( tmp && tmp->command == 'H' )
		      {
			if ( letter == 'H' && tmp->arg3 == arg3 )
			  {
			    for ( ; tmp
				    && tmp->command == 'H'
				    && tmp->arg3 == arg3
				    && tmp->arg1 < arg1;
				  tmp = tmp->next )
			      {
				;
			      }
			  }
			else if ( letter != 'H' )
			  {
			    for ( ; tmp
				    && tmp->command == 'H'
				    && tmp->arg3 == arg3;
				  tmp = tmp->next )
			      {
				;
			      }
			  }
		      }
		    else if ( tmp && tmp->command == 'T' && letter == 'T' )
		      {
			for ( ; tmp
				&& tmp->command == 'T'
				&& tmp->arg3 == arg3
				&& tmp->arg1 < arg1;
			      tmp = tmp->next )
			  {
			    ;
			  }
		      }

                    if ( tmp )
		      {
			INSERT( pReset, tmp, tarea->first_reset, next, prev );
		      }
                    else
		      {
			LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );
		      }
                  }
                else
		  {
		    LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );
		  }

                return pReset;
              }

          break;
        }
      /* likely a bad reset if we get here... add it anyways */
    }

  LINK( pReset, tarea->first_reset, tarea->last_reset, next, prev );
  return pReset;
}

char *sprint_reset( Character *ch, RESET_DATA *pReset, short num, bool rlist )
{
  static char buf[MAX_STRING_LENGTH];
  char mobname[MAX_STRING_LENGTH];
  char roomname[MAX_STRING_LENGTH];
  char objname[MAX_STRING_LENGTH];
  static ROOM_INDEX_DATA *room = NULL;
  static OBJ_INDEX_DATA *obj = NULL, *obj2 = NULL;
  static ProtoMobile *mob = NULL;
  vnum_t rvnum = INVALID_VNUM;

  if ( ch->in_room )
    {
      rvnum = ch->in_room->vnum;
    }

  if ( num == 1 )
    {
      room = NULL;
      obj  = NULL;
      obj2 = NULL;
      mob  = NULL;
    }

  switch( pReset->command )
    {
    default:
      sprintf( buf, "%2d) *** BAD RESET: %c %d %d %d %d ***\r\n",
               num,
               pReset->command,
               pReset->extra,
               pReset->arg1,
               pReset->arg2,
               pReset->arg3 );
      break;

    case 'M':
      mob = get_mob_index( pReset->arg1 );
      room = get_room_index( pReset->arg3 );

      if ( mob )
        strcpy( mobname, mob->player_name );
      else
        strcpy( mobname, "Mobile: *BAD VNUM*" );

      if ( room )
        strcpy( roomname, room->name );
      else
        strcpy( roomname, "Room: *BAD VNUM*" );

      sprintf( buf, "%2d) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               mobname,
               pReset->arg1,
               roomname,
               pReset->arg3,
               pReset->arg2 );
      break;

    case 'E':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );

      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );

      sprintf( buf, "%2d) %s (%d) -> %s (%s) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               mobname,
               wear_locs[pReset->arg3],
               pReset->arg2 );
      break;

    case 'H':
      if ( pReset->arg1 > 0
           &&  (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else if ( !obj )
	strcpy( objname, "Object: *NULL obj*" );

      sprintf( buf, "%2d) Hide %s (%ld)\r\n",
               num,
               objname,
               obj ? obj->vnum : pReset->arg1 );
      break;

    case 'G':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );

      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );

      sprintf( buf, "%2d) %s (%d) -> %s (carry) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               mobname,
               pReset->arg2 );
      break;

    case 'O':
      if ( (obj = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );

      room = get_room_index( pReset->arg3 );

      if ( !room )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->name );

      sprintf( buf, "%2d) (object) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               objname,
               pReset->arg1,
               roomname,
               pReset->arg3,
               pReset->arg2 );
      break;

    case 'P':
      if ( (obj2 = get_obj_index( pReset->arg1 )) == NULL )
        strcpy( objname, "Object1: *BAD VNUM*" );
      else
        strcpy( objname, obj2->name );

      if ( pReset->arg3 > 0
           &&  (obj = get_obj_index( pReset->arg3 )) == NULL )
        strcpy( roomname, "Object2: *BAD VNUM*" );
      else if ( !obj )
	strcpy( roomname, "Object2: *NULL obj*" );
      else
	strcpy( roomname, obj->name );

      sprintf( buf, "%2d) (Put) %s (%d) -> %s (%ld) [%d]\r\n",
	       num,
               objname,
               pReset->arg1,
               roomname,
               obj ? obj->vnum : pReset->arg3,
               pReset->arg2 );
      break;

    case 'D':
      if ( pReset->arg2 < 0 || pReset->arg2 > MAX_DIR+1 )
        pReset->arg2 = 0;

      if ( (room = get_room_index( pReset->arg1 )) == NULL )
        {
          strcpy( roomname, "Room: *BAD VNUM*" );
          sprintf( objname, "%s (no exit)",
                   get_dir_name(pReset->arg2) );
        }
      else
        {
          strcpy( roomname, room->name );
          sprintf( objname, "%s%s",
                   get_dir_name(pReset->arg2),
                   get_exit(room,pReset->arg2) ? "" : " (NO EXIT!)" );
        }

      switch( pReset->arg3 )
        {
        default:
	  strcpy( mobname, "(* ERROR *)" );
	  break;

        case 0:
	  strcpy( mobname, "Open" );
	  break;

        case 1:
	  strcpy( mobname, "Close" );
	  break;

        case 2:
	  strcpy( mobname, "Close and lock" );
	  break;
        }

      sprintf( buf, "%2d) %s [%d] the %s [%d] door %s (%d)\r\n",
               num,
               mobname,
               pReset->arg3,
               objname,
               pReset->arg2,
               roomname,
               pReset->arg1 );
      break;

    case 'R':
      if ( (room = get_room_index( pReset->arg1 )) == NULL )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->name );

      sprintf( buf, "%2d) Randomize exits 0 to %d -> %s (%d)\r\n",
	       num,
               pReset->arg2,
               roomname,
               pReset->arg1 );
      break;

    case 'T':
      sprintf( buf, "%2d) TRAP: %d %d %d %d (%s)\r\n",
               num,
               pReset->extra,
               pReset->arg1,
               pReset->arg2,
               pReset->arg3,
               flag_string(pReset->extra, trap_flags) );
      break;
    }

  if ( rlist && (!room || (room && room->vnum != rvnum)) )
    return NULL;

  return buf;
}
