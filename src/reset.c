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

static bool IsRoomReset( const Reset *pReset, const Room *aRoom, const Area *pArea );
static void AddObjectReset( Area *pArea, char cm, Object *obj, int v2, int v3 );
static void DeleteReset( Area *pArea, Reset *pReset );
static Reset *FindReset( const Area *pArea, const Room *pRoom, int num );
static void ListResets( const Character *ch, const Area *pArea,
			const Room *pRoom, int start, int end );
static Reset *FindObjectReset(const Character *ch, const Area *pArea,
                              const Room *pRoom, const char *name);
static Reset *FindMobileReset(const Character *ch, const Area *pArea,
                              const Room *pRoom, const char *name);
static int GenerateItemLevel( const Area *pArea, const ProtoObject *pObjIndex );

static Reset *FindReset( const Area *pArea, const Room *pRoom, int numb )
{
  Reset *pReset = NULL;
  int num = 0;

  for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
    if ( IsRoomReset(pReset, pRoom, pArea) && ++num >= numb )
      return pReset;

  return NULL;
}

/* This is one loopy function.  Ugh. -- Altrag */
static bool IsRoomReset( const Reset *pReset, const Room *aRoom, const Area *pArea )
{
  const Room *pRoom = NULL;
  const Reset *reset = NULL;
  int pr = 0;

  if ( !aRoom )
    {
      return true;
    }

  switch( pReset->command )
    {
    case 'M':
    case 'O':
      pRoom = GetRoom( pReset->arg3 );

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
	       (!pr || pr == reset->arg1) && GetProtoObject(reset->arg1) )
	    {
	      break;
	    }
	}

      if ( reset && IsRoomReset(reset, aRoom, pArea) )
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
	      if ( reset->command == 'M' && GetProtoMobile(reset->arg1) )
		{
		  break;
		}
	    }

          if ( reset && IsRoomReset(reset, aRoom, pArea) )
	    {
	      return true;
	    }

          return false;

        case BIT_RESET_OBJECT:
          for ( reset = pReset->prev; reset; reset = reset->prev )
            if ( (reset->command == 'O' || reset->command == 'P' ||
                  reset->command == 'G' || reset->command == 'E') &&
                 (!pReset->arg1 || pReset->arg1 == reset->arg1) &&
                 GetProtoObject(reset->arg1) )
	      {
		break;
	      }

          if ( reset && IsRoomReset(reset, aRoom, pArea) )
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
	  if ( reset->command == 'M' && GetProtoMobile(reset->arg1) )
	    {
	      break;
	    }
	}

      if ( reset && IsRoomReset(reset, aRoom, pArea) )
	{
	  return true;
	}

      return false;

    case 'D':
    case 'R':
      pRoom = GetRoom( pReset->arg1 );

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

Room *FindRoom( const Character *ch, char *argument, Room *pRoom )
{
  char arg[MAX_INPUT_LENGTH];

  if ( pRoom )
    {
      return pRoom;
    }

  OneArgument(argument, arg);

  if ( !IsNumber(arg) && arg[0] != '\0' )
    {
      SendToCharacter( "Reset to which room?\r\n", ch );
      return NULL;
    }

  if ( arg[0] == '\0' )
    {
      pRoom = ch->in_room;
    }
  else
    {
      pRoom = GetRoom(atoi(arg));
    }

  if ( !pRoom )
    {
      SendToCharacter( "Room does not exist.\r\n", ch );
      return NULL;
    }

  return pRoom;
}

/* Separate function for recursive purposes */
#define DEL_RESET(area, reset, rprev)           \
  do {                                          \
    rprev = reset->prev;                        \
    DeleteReset(area, reset);                  \
    reset = rprev;                              \
    continue;                                   \
  } while(0)

static void DeleteReset( Area *pArea, Reset *pReset )
{
  Reset *reset = NULL;
  Reset *reset_prev = NULL;

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
  FreeMemory(pReset);
}
#undef DEL_RESET

static Reset *FindObjectReset(const Character *ch, const Area *pArea,
			      const Room *pRoom, const char *name)
{
  Reset *reset = NULL;

  if ( !*name )
    {
      for ( reset = pArea->last_reset; reset; reset = reset->prev )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
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
	  SendToCharacter( "No object resets in list.\r\n", ch );
	}

      return reset;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      int cnt = 0, num = NumberArgument(name, arg);
      ProtoObject *pObjTo = NULL;

      for ( reset = pArea->first_reset; reset; reset = reset->next )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
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

          if ( (pObjTo = GetProtoObject(reset->arg1)) &&
               IsName(arg, pObjTo->name) && ++cnt == num )
	    {
	      break;
	    }
        }

      if ( !pObjTo || !reset )
        {
          SendToCharacter( "To object not in reset list.\r\n", ch );
          return NULL;
        }
    }

  return reset;
}

static Reset *FindMobileReset(const Character *ch, const Area *pArea,
			      const Room *pRoom, const char *name)
{
  Reset *reset = NULL;

  if ( !*name )
    {
      for ( reset = pArea->last_reset; reset; reset = reset->prev )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
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
	  SendToCharacter( "No mobile resets in list.\r\n", ch );
	}

      return reset;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      int cnt = 0, num = NumberArgument(name, arg);
      ProtoMobile *pMob = NULL;

      for ( reset = pArea->first_reset; reset; reset = reset->next )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
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

          if ( (pMob = GetProtoMobile(reset->arg1)) &&
               IsName(arg, pMob->player_name) && ++cnt == num )
	    {
	      break;
	    }
        }

      if ( !pMob || !reset )
        {
          SendToCharacter( "Mobile not in reset list.\r\n", ch );
          return NULL;
        }
    }

  return reset;
}

void EditReset( Character *ch, char *argument, Area *pArea, Room *aRoom )
{
  char arg[MAX_INPUT_LENGTH];
  Reset *pReset = NULL;
  Reset *reset = NULL;
  ProtoMobile *pMob = NULL;
  Room *pRoom = NULL;
  ProtoObject *pObj = NULL;
  int num = 0;
  vnum_t vnum = INVALID_VNUM;
  char *origarg = argument;

  argument = OneArgument(argument, arg);

  if ( !*arg || !StrCmp(arg, "?") )
    {
      const char *nm = (ch->substate == SUB_REPEATCMD ? "" : (aRoom ? "rreset "
                                                        : "reset "));
      const char *rn = (aRoom ? "" : " [room#]");
      Echo(ch, "Syntax: %s<list|edit|delete|add|insert|place%s>\r\n",
                nm, (aRoom ? "" : "|area"));
      Echo( ch, "Syntax: %sremove <#>\r\n", nm );
      Echo( ch, "Syntax: %smobile <mob#> [limit]%s\r\n", nm, rn );
      Echo( ch, "Syntax: %sobject <obj#> [limit [room%s]]\r\n", nm, rn );
      Echo( ch, "Syntax: %sobject <obj#> give <mob name> [limit]\r\n", nm );
      Echo( ch, "Syntax: %sobject <obj#> equip <mob name> <location> "
                 "[limit]\r\n", nm );
      Echo( ch, "Syntax: %sobject <obj#> put <to_obj name> [limit]\r\n",
                 nm );
      Echo( ch, "Syntax: %shide <obj name>\r\n", nm );
      Echo( ch, "Syntax: %strap <obj name> <type> <charges> <flags>\r\n",
                 nm );
      Echo( ch, "Syntax: %strap room <type> <charges> <flags>\r\n", nm );
      Echo( ch, "Syntax: %sbit <set|toggle|remove> door%s <dir> "
                 "<exit flags>\r\n", nm, rn );
      Echo( ch, "Syntax: %sbit <set|toggle|remove> object <obj name> "
                 "<extra flags>\r\n", nm );
      Echo( ch, "Syntax: %sbit <set|toggle|remove> mobile <mob name> "
                 "<affect flags>\r\n", nm );
      Echo( ch, "Syntax: %sbit <set|toggle|remove> room%s <room flags>"
                 "\r\n", nm, rn );
      Echo( ch, "Syntax: %srandom <last dir>%s\r\n", nm, rn );

      if ( !aRoom )
        {
          SendToCharacter( "\r\n[room#] will default to the room you are in, "
                        "if unspecified.\r\n", ch );
        }

      return;
    }

  if ( !StrCmp(arg, "on") )
    {
      ch->substate = SUB_REPEATCMD;
      ch->dest_buf = (aRoom ? (void *)aRoom : (void *)pArea);
      SendToCharacter( "Reset mode on.\r\n", ch );
      return;
    }

  if ( !aRoom && !StrCmp(arg, "area") )
    {
      if ( !pArea->first_reset )
        {
          SendToCharacter( "You don't have any resets defined.\r\n", ch );
          return;
        }

      num = pArea->nplayer;
      pArea->nplayer = 0;
      ResetArea(pArea);
      pArea->nplayer = num;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "list") )
    {
      int start = 0, end = 0;

      argument = OneArgument(argument, arg);
      start = IsNumber(arg) ? atoi(arg) : -1;

      argument = OneArgument(argument, arg);
      end = IsNumber(arg) ? atoi(arg) : -1;

      ListResets(ch, pArea, aRoom, start, end);
      return;
    }

  if ( !StrCmp(arg, "edit") )
    {
      argument = OneArgument(argument, arg);

      if ( !*arg || !IsNumber(arg) )
        {
          SendToCharacter( "Usage: reset edit <number> <command>\r\n", ch );
          return;
        }

      if ( !(pReset = FindReset(pArea, aRoom, num)) )
        {
          SendToCharacter( "Reset not found.\r\n", ch );
          return;
        }

      if ( !(reset = ParseReset(pArea, argument, ch)) )
        {
          SendToCharacter( "Error in reset. Reset not changed.\r\n", ch );
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

      FreeMemory(pReset);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "add") )
    {
      if ( (pReset = ParseReset(pArea, argument, ch)) == NULL )
        {
          SendToCharacter( "Error in reset. Reset not added.\r\n", ch );
          return;
        }

      AddReset(pArea, pReset->command, pReset->extra, pReset->arg1,
                pReset->arg2, pReset->arg3);
      FreeMemory(pReset);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "place") )
    {
      if ( (pReset = ParseReset(pArea, argument, ch)) == NULL )
        {
          SendToCharacter( "Error in reset. Reset not added.\r\n", ch );
          return;
        }

      PlaceReset(pArea, pReset->command, pReset->extra, pReset->arg1,
                  pReset->arg2, pReset->arg3);
      FreeMemory(pReset);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "insert") )
    {
      argument = OneArgument(argument, arg);

      if ( !*arg || !IsNumber(arg) )
        {
          SendToCharacter( "Usage: reset insert <number> <command>\r\n", ch );
          return;
        }

      num = atoi(arg);

      if ( (reset = FindReset(pArea, aRoom, num)) == NULL )
        {
          SendToCharacter( "Reset not found.\r\n", ch );
          return;
        }

      if ( (pReset = ParseReset(pArea, argument, ch)) == NULL )
        {
          SendToCharacter( "Error in reset.  Reset not inserted.\r\n", ch );
          return;
        }

      INSERT(pReset, reset, pArea->first_reset, next, prev);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "delete") )
    {
      int start = 0, end = 0;
      bool found = false;

      if ( !*argument )
        {
          SendToCharacter( "Usage: reset delete <start> [end]\r\n", ch );
          return;
        }

      argument = OneArgument(argument, arg);
      start = IsNumber(arg) ? atoi(arg) : -1;
      end   = IsNumber(arg) ? atoi(arg) : -1;
      num = 0;

      for ( pReset = pArea->first_reset; pReset; pReset = reset )
        {
          reset = pReset->next;

          if ( !IsRoomReset(pReset, aRoom, pArea) )
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

          FreeMemory(pReset);
          top_reset--;
          found = true;
        }

      if ( !found )
	{
	  SendToCharacter( "Reset not found.\r\n", ch );
	}
      else
	{
	  SendToCharacter( "Done.\r\n", ch );
	}

      return;
    }

  if ( !StrCmp(arg, "remove") )
    {
      int iarg = 0;

      argument = OneArgument(argument, arg);

      if ( arg[0] == '\0' || !IsNumber(arg) )
        {
          SendToCharacter( "Delete which reset?\r\n", ch );
          return;
        }

      iarg = atoi(arg);

      for ( pReset = pArea->first_reset; pReset; pReset = pReset->next )
        {
          if ( IsRoomReset( pReset, aRoom, pArea ) && ++num == iarg )
	    {
	      break;
	    }
        }

      if ( !pReset )
        {
          SendToCharacter( "Reset does not exist.\r\n", ch );
          return;
        }

      DeleteReset( pArea, pReset );
      SendToCharacter( "Reset deleted.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "mobile" ) )
    {
      argument = OneArgument(argument, arg);

      if ( arg[0] == '\0' || !IsNumber(arg) )
        {
          SendToCharacter( "Reset which mobile vnum?\r\n", ch );
          return;
        }

      if ( !(pMob = GetProtoMobile(atoi(arg))) )
        {
          SendToCharacter( "Mobile does not exist.\r\n", ch );
          return;
        }

      argument = OneArgument(argument, arg);

      if ( arg[0] == '\0' )
	{
	  num = 1;
	}
      else if ( !IsNumber(arg) )
        {
          SendToCharacter( "Reset how many mobiles?\r\n", ch );
          return;
        }
      else
	{
	  num = atoi(arg);
	}

      if ( !(pRoom = FindRoom(ch, argument, aRoom)) )
	{
	  return;
	}

      pReset = MakeReset('M', 0, pMob->vnum, num, pRoom->vnum);
      LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
      SendToCharacter( "Mobile reset added.\r\n", ch );
      return;
    }

  if ( !StringPrefix(arg, "object") )
    {
      argument = OneArgument(argument, arg);

      if ( arg[0] == '\0' || !IsNumber(arg) )
        {
          SendToCharacter( "Reset which object vnum?\r\n", ch );
          return;
        }

      if ( !(pObj = GetProtoObject(atoi(arg))) )
        {
          SendToCharacter( "Object does not exist.\r\n", ch );
          return;
        }

      argument = OneArgument(argument, arg);

      if ( arg[0] == '\0' )
        strcpy(arg, "room");

      if ( !StringPrefix( arg, "put" ) )
        {
          argument = OneArgument(argument, arg);

          if ( !(reset = FindObjectReset(ch, pArea, aRoom, arg)) )
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

          argument = OneArgument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('P', reset->extra+1, pObj->vnum, vnum, 0);
          /* Grumble.. insert puts pReset before reset, and we need it after,
             so we make a hackup and reverse all the list params.. :P.. */
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          SendToCharacter( "Object reset in object created.\r\n", ch );
          return;
        }

      if ( !StringPrefix( arg, "give" ) )
        {
          argument = OneArgument(argument, arg);

          if ( !(reset = FindMobileReset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          while ( reset->next && reset->next->command == 'B' )
	    {
	      reset = reset->next;
	    }

          argument = OneArgument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('G', 1, pObj->vnum, vnum, 0);
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          SendToCharacter( "Object reset to mobile created.\r\n", ch );
          return;
        }

      if ( !StringPrefix( arg, "equip" ) )
        {
          argument = OneArgument(argument, arg);

          if ( !(reset = FindMobileReset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          while ( reset->next && reset->next->command == 'B' )
	    {
	      reset = reset->next;
	    }

          num = GetWearLocation(argument);

          if ( num < 0 )
            {
              SendToCharacter( "Reset object to which location?\r\n", ch );
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
                  SendToCharacter( "Mobile already has an item equipped there.\r\n", ch);
                  return;
                }
            }

          argument = OneArgument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('E', 1, pObj->vnum, vnum, num);
          INSERT(pReset, reset, pArea->last_reset, prev, next);
          SendToCharacter( "Object reset equipped by mobile created.\r\n", ch );
          return;
        }

      if ( arg[0] == '\0' || !(num = (int)StrCmp(arg, "room"))
	   || IsNumber(arg) )
        {
          if ( !(bool)num )
	    {
	      argument = OneArgument(argument, arg);
	    }

          if ( !(pRoom = FindRoom(ch, argument, aRoom)) )
	    {
	      return;
	    }

          if ( pRoom->area != pArea )
            {
              SendToCharacter( "Cannot reset objects to other areas.\r\n", ch );
              return;
            }

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('O', 0, pObj->vnum, vnum, pRoom->vnum);
          LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
          SendToCharacter( "Object reset added.\r\n", ch );
          return;
        }

      SendToCharacter( "Reset object to where?\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "random") )
    {
      DirectionType direction = DIR_INVALID;

      argument = OneArgument(argument, arg);
      direction = GetDirection( arg );

      if ( direction <= DIR_INVALID || direction > DIR_SOUTHWEST )
        {
          SendToCharacter( "Reset which random doors?\r\n", ch );
          return;
        }

      if ( direction == DIR_NORTH )
        {
          SendToCharacter( "There is no point in randomizing one door.\r\n", ch );
          return;
        }

      pRoom = FindRoom(ch, argument, aRoom);

      if ( pRoom->area != pArea )
        {
          SendToCharacter( "Cannot randomize doors in other areas.\r\n", ch );
          return;
        }

      pReset = MakeReset('R', 0, pRoom->vnum, direction, 0);
      LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);
      SendToCharacter( "Reset random doors created.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "trap") )
    {
      char oname[MAX_INPUT_LENGTH];
      int chrg, value, extra = 0;
      bool isobj;

      argument = OneArgument(argument, oname);
      argument = OneArgument(argument, arg);
      num = IsNumber(arg) ? atoi(arg) : -1;
      argument = OneArgument(argument, arg);
      chrg = IsNumber(arg) ? atoi(arg) : -1;
      isobj = IsName(argument, "obj");

      if ( isobj == IsName(argument, "room") )
        {
          SendToCharacter( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
          return;
        }

      if ( !StrCmp(oname, "room") && !isobj )
        {
          vnum = (aRoom ? aRoom->vnum : ch->in_room->vnum);
          extra = TRAP_ROOM;
        }
      else
        {
          if ( IsNumber(oname) && !isobj )
            {
              vnum = atoi(oname);
              if ( !GetRoom(vnum) )
                {
                  SendToCharacter( "Reset: TRAP: no such room\r\n", ch );
                  return;
                }
              reset = NULL;
              extra = TRAP_ROOM;
            }
          else
            {
              if ( !(reset = FindObjectReset(ch, pArea, aRoom, oname)) )
                return;
              /*        vnum = reset->arg1;*/
              vnum = 0;
              extra = TRAP_OBJ;
            }
        }

      if ( num < 1 || num > MAX_TRAPTYPE )
        {
          SendToCharacter( "Reset: TRAP: invalid trap type\r\n", ch );
          return;
        }

      if ( chrg < 0 || chrg > 10000 )
        {
          SendToCharacter( "Reset: TRAP: invalid trap charges\r\n", ch );
          return;
        }

      while ( *argument )
        {
          argument = OneArgument(argument, arg);
          value = GetTrapFlag(arg);

          if ( value < 0 || value > 31 )
            {
              SendToCharacter( "Reset: TRAP: bad flag\r\n", ch );
              return;
            }

          SetBit(extra, 1 << value);
        }

      pReset = MakeReset('T', extra, num, chrg, vnum);

      if ( reset )
        INSERT(pReset, reset, pArea->last_reset, prev, next);
      else
        LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);

      SendToCharacter( "Trap created.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "bit") )
    {
      int (*flfunc)(const char *type);
      int flags = 0;
      char option[MAX_INPUT_LENGTH];
      char *parg;

      argument = OneArgument(argument, option);

      if ( !*option )
        {
          SendToCharacter( "You must specify SET, REMOVE, or TOGGLE.\r\n", ch );
          return;
        }

      num = 0;

      if ( !StringPrefix(option, "set") )
	{
	  SetBit(num, BIT_RESET_SET);
	}
      else if ( !StringPrefix(option, "toggle") )
	{
	  SetBit(num, BIT_RESET_TOGGLE);
	}
      else if ( StringPrefix(option, "remove") )
        {
          SendToCharacter( "You must specify SET, REMOVE, or TOGGLE.\r\n", ch );
          return;
        }

      argument = OneArgument(argument, option);
      parg = argument;
      argument = OneArgument(argument, arg);

      if ( !*option )
        {
          SendToCharacter( "Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n", ch );
          return;
        }

      if ( !StringPrefix(option, "door") )
        {
          SetBit(num, BIT_RESET_DOOR);

          if ( aRoom )
            {
              pRoom = aRoom;
              argument = parg;
            }
          else if ( !IsNumber(arg) )
            {
              pRoom = ch->in_room;
              argument = parg;
            }
          else if ( !(pRoom = FindRoom(ch, arg, aRoom)) )
	    {
	      return;
	    }

          argument = OneArgument(argument, arg);

          if ( !*arg )
            {
              SendToCharacter( "Must specify direction.\r\n", ch );
              return;
            }

          vnum = GetDirection(arg);
          SetBit(num, vnum << BIT_RESET_DOOR_THRESHOLD);
          vnum = pRoom->vnum;
          flfunc = &GetExitFlag;
          reset = NULL;
        }
      else if ( !StringPrefix(option, "object") )
        {
          SetBit(num, BIT_RESET_OBJECT);
          vnum = 0;
          flfunc = &GetObjectFlag;

          if ( !(reset = FindObjectReset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }
        }
      else if ( !StringPrefix(option, "mobile") )
        {
          SetBit(num, BIT_RESET_MOBILE);
          vnum = 0;
          flfunc = &GetAffectedFlag;

          if ( !(reset = FindMobileReset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }
        }
      else if ( !StringPrefix(option, "room") )
        {
          SetBit(num, BIT_RESET_ROOM);

          if ( aRoom )
            {
              pRoom = aRoom;
              argument = parg;
            }
          else if ( !IsNumber(arg) )
            {
              pRoom = ch->in_room;
              argument = parg;
            }
          else if ( !(pRoom = FindRoom(ch, arg, aRoom)) )
	    {
	      return;
	    }

          vnum = pRoom->vnum;
          flfunc = &GetRoomFlag;
          reset = NULL;
        }
      else
        {
          SendToCharacter( "Must specify OBJECT, MOBILE, ROOM, or DOOR.\r\n", ch );
          return;
        }

      while ( *argument )
        {
          int value;
          argument = OneArgument(argument, arg);
          value = flfunc(arg);

          if ( value < 0 || value > 31 )
            {
              SendToCharacter( "Reset: BIT: bad flag\r\n", ch );
              return;
            }

          SetBit(flags, 1 << value);
        }

      if ( !flags )
        {
          SendToCharacter( "Set which flags?\r\n", ch );
          return;
        }

      pReset = MakeReset('B', 1, vnum, num, flags);

      if ( reset )
        INSERT(pReset, reset, pArea->last_reset, prev, next);
      else
        LINK(pReset, pArea->first_reset, pArea->last_reset, next, prev);

      SendToCharacter( "Bitvector reset created.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "hide") )
    {
      argument = OneArgument(argument, arg);

      if ( !(reset = FindObjectReset(ch, pArea, aRoom, arg)) )
        return;

      pReset = MakeReset('H', 1, 0, 0, 0);
      INSERT(pReset, reset, pArea->last_reset, prev, next);
      SendToCharacter( "Object hide reset created.\r\n", ch );
      return;
    }

  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_NONE;
      Interpret(ch, origarg);
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = (aRoom ? do_rreset : do_reset);
    }
  else
    {
      EditReset(ch, "", pArea, aRoom);
    }
}

static void AddObjectReset( Area *pArea, char cm, Object *obj, int v2, int v3 )
{
  Object *inobj;
  static int iNest;

  if ( (cm == 'O' || cm == 'P') && obj->Prototype->vnum == OBJ_VNUM_TRAP )
    {
      if ( cm == 'O' )
	{
	  AddReset(pArea, 'T', obj->value[OVAL_TRAP_FLAGS], obj->value[OVAL_TRAP_TYPE], obj->value[OVAL_TRAP_CHARGE], v3);
	}

      return;
    }

  AddReset( pArea, cm, (cm == 'P' ? iNest : 1), obj->Prototype->vnum,
             v2, v3 );

  /* Only add hide for in-room objects that are hidden and cant be moved, as
     hide is an update reset, not a load-only reset. */
  if ( cm == 'O' && IS_OBJ_STAT(obj, ITEM_HIDDEN) &&
       !IsBitSet(obj->wear_flags, ITEM_TAKE) )
    {
      AddReset(pArea, 'H', 1, 0, 0, 0);
    }

  for ( inobj = obj->first_content; inobj; inobj = inobj->next_content )
    {
      if ( inobj->Prototype->vnum == OBJ_VNUM_TRAP )
	{
	  AddObjectReset(pArea, 'O', inobj, 0, 0);
	}
    }

  if ( cm == 'P' )
    {
      iNest++;
    }

  for ( inobj = obj->first_content; inobj; inobj = inobj->next_content )
    {
      AddObjectReset( pArea, 'P', inobj, 1, 0 );
    }

  if ( cm == 'P' )
    {
      iNest--;
    }
}

void InstallRoom( Area *pArea, Room *pRoom, bool dodoors )
{
  Character *rch = NULL;
  Object *obj = NULL;

  for ( rch = pRoom->first_person; rch; rch = rch->next_in_room )
    {
      if ( !IsNpc(rch) )
	{
	  continue;
	}

      AddReset( pArea, 'M', 1, rch->Prototype->vnum, rch->Prototype->count,
                 pRoom->vnum );

      for ( obj = rch->first_carrying; obj; obj = obj->next_content )
        {
          if ( obj->wear_loc == WEAR_NONE )
	    {
	      AddObjectReset( pArea, 'G', obj, 1, 0 );
	    }
          else
	    {
	      AddObjectReset( pArea, 'E', obj, 1, obj->wear_loc );
	    }
        }
    }

  for ( obj = pRoom->first_content; obj; obj = obj->next_content )
    {
      if ( obj->item_type == ITEM_SPACECRAFT )
	{
	  continue;
	}

      AddObjectReset( pArea, 'O', obj, 1, pRoom->vnum );
    }

  if ( dodoors )
    {
      Exit *pexit = NULL;

      for ( pexit = pRoom->first_exit; pexit; pexit = pexit->next )
        {
          int state = 0;

          if ( !IsBitSet( pexit->exit_info, EX_ISDOOR ) )
	    {
	      continue;
	    }

          if ( IsBitSet( pexit->exit_info, EX_CLOSED ) )
            {
              if ( IsBitSet( pexit->exit_info, EX_LOCKED ) )
		{
		  state = 2;
		}
              else
		{
		  state = 1;
		}
            }

          AddReset( pArea, 'D', 0, pRoom->vnum, pexit->vdir, state );
        }
    }
}

void WipeResets( Area *pArea, Room *pRoom )
{
  Reset *pReset = NULL;

  for ( pReset = pArea->first_reset; pReset; )
    {
      if ( pReset->command != 'R' && IsRoomReset( pReset, pRoom, pArea ) )
        {
          /* Resets always go forward, so we can safely use the previous reset,
             providing it exists, or first_reset if it doesnt.  -- Altrag */
          Reset *prev = pReset->prev;

          DeleteReset(pArea, pReset);
          pReset = (prev ? prev->next : pArea->first_reset);
        }
      else
	{
	  pReset = pReset->next;
	}
    }
}

static int GenerateItemLevel( const Area *pArea, const ProtoObject *pObjIndex )
{
  int olevel = 0;
  int min = umax(pArea->low_soft_range, 1);
  int max = umin(pArea->hi_soft_range, min + 15);

  if ( pObjIndex->level > 0 )
    {
      olevel = umin(pObjIndex->level, MAX_LEVEL);
    }
  else
    {
      switch ( pObjIndex->item_type )
	{
	default:
          olevel = 0;
	  break;

	case ITEM_PILL:
	  olevel = GetRandomNumberFromRange( min, max );
	  break;

	case ITEM_POTION:
	  olevel = GetRandomNumberFromRange( min, max );
	  break;

	case ITEM_DEVICE:
	  olevel = GetRandomNumberFromRange( min, max );
	  break;

	case ITEM_ARMOR:
	  olevel = GetRandomNumberFromRange( min+4, max+1 );
	  break;

	case ITEM_WEAPON:
	  olevel = GetRandomNumberFromRange( min+4, max+1 );
	  break;
	}
    }

  return olevel;
}

/*
 * Reset one area.
 */
void ResetArea( Area *pArea )
{
  Reset *pReset = NULL;
  Reset *next_reset = NULL;
  Character *mob = NULL;
  Object *obj = NULL;
  Object *lastobj = NULL;
  Room *pRoomIndex = NULL;
  ProtoMobile *pMobIndex = NULL;
  ProtoObject *pObjIndex = NULL;
  ProtoObject *pObjToIndex = NULL;
  Exit *pexit = NULL;
  Object *to_obj = NULL;
  int level = 0;
  int *plc = 0;

  if ( !pArea )
    {
      Bug( "ResetArea: NULL pArea" );
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
          Bug( "%s: Reset_area: bad command %c.", pArea->filename, pReset->command );
          break;

        case 'M':
          if ( !(pMobIndex = GetProtoMobile(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'M': bad mob vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = GetRoom(pReset->arg3)) )
            {
              Bug( "%s: Reset_area: 'M': bad room vnum %d.", pArea->filename, pReset->arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( pMobIndex->count >= pReset->arg2 )
            {
              mob = NULL;
              break;
            }

          mob = CreateMobile(pMobIndex);

          {
            Room *pRoomPrev = GetRoom(pReset->arg3 - 1);

            if ( pRoomPrev && IsBitSet(pRoomPrev->room_flags, ROOM_PET_SHOP) )
	      {
		SetBit(mob->act, ACT_PET);
	      }
          }

          if ( IsRoomDark(pRoomIndex) )
	    {
	      SetBit(mob->affected_by, AFF_INFRARED);
	    }

          CharacterToRoom(mob, pRoomIndex);
          EconomizeMobileGold(mob);
          level = urange(0, mob->top_level - 2, LEVEL_AVATAR);

          if ( mob->vip_flags != 0 && pArea->planet )
	    {
	      pArea->planet->population++;
	    }

          break;

        case 'G':
        case 'E':
          if ( !(pObjIndex = GetProtoObject(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'E' or 'G': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !mob )
            {
              lastobj = NULL;
              break;
            }

          if ( mob->Prototype->pShop )
            {
              int olevel = GenerateItemLevel( pArea, pObjIndex );
              obj = CreateObject(pObjIndex, olevel);
              SetBit(obj->extra_flags, ITEM_INVENTORY);
            }
          else
	    {
	      obj = CreateObject(pObjIndex, NumberFuzzy(level));
	    }

          obj->level = urange(0, obj->level, LEVEL_AVATAR);
          obj = ObjectToCharacter(obj, mob);

          if ( pReset->command == 'E' )
	    {
	      EquipCharacter(mob, obj, pReset->arg3);
	    }

          lastobj = obj;
          break;

        case 'O':
          if ( !(pObjIndex = GetProtoObject(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'O': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = GetRoom(pReset->arg3)) )
            {
              Bug( "%s: Reset_area: 'O': bad room vnum %d.", pArea->filename, pReset->arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( CountOccurancesOfObjectInList(pObjIndex, pRoomIndex->first_content) > 0 )
            {
              obj = NULL;
              lastobj = NULL;
              break;
            }

          obj = CreateObject(pObjIndex, NumberFuzzy(GenerateItemLevel(pArea, pObjIndex)));
          obj->level = umin(obj->level, LEVEL_AVATAR);
          obj->cost = 0;
          ObjectToRoom(obj, pRoomIndex);
          lastobj = obj;
          break;

        case 'P':
          if ( !(pObjIndex = GetProtoObject(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'P': bad obj vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( pReset->arg3 > 0 )
            {
              if ( !(pObjToIndex = GetProtoObject(pReset->arg3)) )
                {
                  Bug( "%s: Reset_area: 'P': bad objto vnum %d.", pArea->filename, pReset->arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                   !to_obj->in_room ||
                   CountOccurancesOfObjectInList(pObjIndex, to_obj->first_content) > 0 )
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
		      Bug( "%s: Reset_area: 'P': Invalid nesting obj %d.", pArea->filename, pReset->arg1 );
		      iNest = -1;
		      break;
		    }
		}

              if ( iNest < 0 )
		{
		  continue;
		}
            }

          obj = CreateObject(pObjIndex, NumberFuzzy(umax(GenerateItemLevel(pArea, pObjIndex),to_obj->level)));
          obj->level = umin(obj->level, LEVEL_AVATAR);
          ObjectToObject(obj, to_obj);
          break;

        case 'T':
          if ( IsBitSet(pReset->extra, TRAP_OBJ) )
            {
              /* We need to preserve obj for future 'T' and 'H' checks */
              Object *pobj = NULL;

              if ( pReset->arg3 > 0 )
                {
                  if ( !(pObjToIndex = GetProtoObject(pReset->arg3)) )
                    {
                      Bug( "%s: Reset_area: 'T': bad objto vnum %d.", pArea->filename, pReset->arg3 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                          FreeMemory( pReset );
                        }

                      continue;
                    }

                  if ( pArea->nplayer > 0 ||
                       !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                       (to_obj->carried_by && !IsNpc(to_obj->carried_by)) ||
                       IsObjectTrapped(to_obj) )
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

              pobj = MakeTrap( pReset->arg2, pReset->arg1,
                                NumberFuzzy(to_obj->level), pReset->extra );
              ObjectToObject(pobj, to_obj);
            }
          else
            {
              if ( !(pRoomIndex = GetRoom(pReset->arg3)) )
                {
                  Bug( "%s: Reset_area: 'T': bad room %d.", pArea->filename, pReset->arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   CountOccurancesOfObjectInList(GetProtoObject(OBJ_VNUM_TRAP),
                                  pRoomIndex->first_content) > 0 )
		{
		  break;
		}

              to_obj = MakeTrap(pReset->arg1, pReset->arg1, 10, pReset->extra);
              ObjectToRoom(to_obj, pRoomIndex);
            }

          break;

        case 'H':
          if ( pReset->arg1 > 0 )
            {
              if ( !(pObjToIndex = GetProtoObject(pReset->arg1)) )
                {
                  Bug( "%s: Reset_area: 'H': bad objto vnum %d.", pArea->filename, pReset->arg1 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->nplayer > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
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

          SetBit(to_obj->extra_flags, ITEM_HIDDEN);
          break;

        case 'B':
          switch(pReset->arg2 & BIT_RESET_TYPE_MASK)
            {
            case BIT_RESET_DOOR:
              {
                int doornum = 0;

                if ( !(pRoomIndex = GetRoom(pReset->arg1)) )
                  {
                    Bug( "%s: Reset_area: 'B': door: bad room vnum %d.", pArea->filename, pReset->arg1 );
                    if( !bootup )
                      {
                        UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                        FreeMemory( pReset );
                      }

                    continue;
                  }

                doornum = (pReset->arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD;

                if ( !(pexit = GetExit(pRoomIndex, doornum)) )
		  {
		    break;
		  }

                plc = &pexit->exit_info;
              }

              break;

            case BIT_RESET_ROOM:
              if ( !(pRoomIndex = GetRoom(pReset->arg1)) )
                {
                  Bug( "%s: Reset_area: 'B': room: bad room vnum %d.", pArea->filename, pReset->arg1 );
                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              plc = &pRoomIndex->room_flags;
              break;

            case BIT_RESET_OBJECT:
              if ( pReset->arg1 > 0 )
                {
                  if ( !(pObjToIndex = GetProtoObject(pReset->arg1)) )
                    {
                      Bug( "%s: Reset_area: 'B': object: bad objto vnum %d.", pArea->filename, pReset->arg1 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                          FreeMemory( pReset );
                        }

                      continue;
                    }

                  if ( !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
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
              Bug( "%s: Reset_area: 'B': bad options %d.", pArea->filename, pReset->arg2 );
              continue;
            }

          if ( IsBitSet(pReset->arg2, BIT_RESET_SET) )
	    {
	      SetBit(*plc, pReset->arg3);
	    }
          else if ( IsBitSet(pReset->arg2, BIT_RESET_TOGGLE) )
	    {
	      ToggleBit(*plc, pReset->arg3);
	    }
          else
	    {
	      RemoveBit(*plc, pReset->arg3);
	    }

          break;

        case 'D':
          if ( !(pRoomIndex = GetRoom(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'D': bad room vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pexit = GetExit(pRoomIndex, pReset->arg2)) )
	    {
	      break;
	    }

          switch( pReset->arg3 )
            {
            case 0:
              RemoveBit( pexit->exit_info, EX_CLOSED );
              RemoveBit( pexit->exit_info, EX_LOCKED );
              break;

            case 1:
              SetBit( pexit->exit_info, EX_CLOSED );
              RemoveBit( pexit->exit_info, EX_LOCKED );

              if ( IsBitSet( pexit->exit_info, EX_xSEARCHABLE ) )
		{
		  SetBit( pexit->exit_info, EX_SECRET );
		}
              break;

            case 2:
              SetBit( pexit->exit_info, EX_CLOSED );
              SetBit( pexit->exit_info, EX_LOCKED );

              if ( IsBitSet( pexit->exit_info, EX_xSEARCHABLE ) )
                SetBit( pexit->exit_info, EX_SECRET );

              break;

            }
          break;

        case 'R':
          if ( !(pRoomIndex = GetRoom(pReset->arg1)) )
            {
              Bug( "%s: Reset_area: 'R': bad room vnum %d.", pArea->filename, pReset->arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->first_reset, pArea->last_reset, next, prev );
                  FreeMemory( pReset );
                }

              continue;
            }

          RandomizeExits(pRoomIndex, pReset->arg2-1);
          break;
        }
    }
}

static void ListResets( const Character *ch, const Area *pArea, const Room *pRoom,
			int start, int end )
{
  Reset *pReset = NULL;
  const Room *room = NULL;
  const ProtoMobile *mob = NULL;
  const ProtoObject *obj = NULL;
  const ProtoObject *obj2 = NULL;
  const ProtoObject *lastobj = NULL;
  const Reset *lo_reset = NULL;
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

      if ( !IsRoomReset(pReset, pRoom, pArea) )
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
          if ( !(mob = GetProtoMobile(pReset->arg1)) )
            mname = "Mobile: *BAD VNUM*";
          else
            mname = mob->player_name;

          if ( !(room = GetRoom(pReset->arg3)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->name;

          sprintf( pbuf, "%s (%d) -> %s (%d) [%d]", mname, pReset->arg1, rname,
                   pReset->arg3, pReset->arg2 );

          if ( !room )
            mob = NULL;

          if ( (room = GetRoom(pReset->arg3-1)) &&
               IsBitSet(room->room_flags, ROOM_PET_SHOP) )
            strcat( buf, " (pet)\r\n" );
          else
            strcat( buf, "\r\n" );

          break;

        case 'G':
        case 'E':
          if ( !mob )
            mname = "* ERROR: NO MOBILE! *";

          if ( !(obj = GetProtoObject(pReset->arg1)) )
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
          if ( !(obj = GetProtoObject(pReset->arg1)) )
            oname = "Object: *BAD VNUM*";
          else
            oname = obj->name;

          if ( !(room = GetRoom(pReset->arg3)) )
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
          if ( !(obj = GetProtoObject(pReset->arg1)) )
            oname = "Object1: *BAD VNUM*";
          else
            oname = obj->name;

          obj2 = NULL;

          if ( pReset->arg3 > 0 )
            {
              obj2 = GetProtoObject(pReset->arg3);
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
              Reset *reset = lo_reset->next;

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
              else if ( !(obj2 = GetProtoObject(reset->arg1)) )
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
                  pReset->arg2, pReset->arg3, FlagString(pReset->extra, trap_flags));
          break;

        case 'H':
          if ( pReset->arg1 > 0 )
            if ( !(obj2 = GetProtoObject(pReset->arg1)) )
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

            if ( IsBitSet(pReset->arg2, BIT_RESET_SET) )
              {
                strcpy(pbuf, "Set: ");
                pbuf += 5;
              }
            else if ( IsBitSet(pReset->arg2, BIT_RESET_TOGGLE) )
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

                  if ( !(room = GetRoom(pReset->arg1)) )
                    rname = "Room: *BAD VNUM*";
                  else
                    rname = room->name;
                  door = (pReset->arg2 & BIT_RESET_DOOR_MASK)
                    >> BIT_RESET_DOOR_THRESHOLD;
                  door = urange(0, door, MAX_DIR+1);
                  sprintf(pbuf, "Exit %s%s (%d), Room %s (%d)",
			  GetDirectionName(door),
                          (room && GetExit(room, door) ? "" : " (NO EXIT!)"), door,
                          rname, pReset->arg1);
                }
                flagarray = exit_flags;
                break;

              case BIT_RESET_ROOM:
                if ( !(room = GetRoom(pReset->arg1)) )
                  rname = "Room: *BAD VNUM*";
                else
                  rname = room->name;

                sprintf(pbuf, "Room %s (%d)", rname, pReset->arg1);
                flagarray = room_flags;
                break;

              case BIT_RESET_OBJECT:
                if ( pReset->arg1 > 0 )
                  if ( !(obj2 = GetProtoObject(pReset->arg1)) )
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

                    if ( !(mob2 = GetProtoMobile(pReset->arg1)) )
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
                      FlagString(pReset->arg3, flagarray), pReset->arg3);
            else
              sprintf(pbuf, "; flags %d\r\n", pReset->arg3);
          }
          break;

        case 'D':
          {
            const char *ef_name;

            pReset->arg2 = urange(0, pReset->arg2, MAX_DIR+1);

            if ( !(room = GetRoom(pReset->arg1)) )
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
                    pReset->arg3, GetDirectionName(pReset->arg2),
                    (room && GetExit(room, pReset->arg2) ? "" : " (NO EXIT!)"),
                    pReset->arg2, rname, pReset->arg1);
          }
          break;

        case 'R':
          if ( !(room = GetRoom(pReset->arg1)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->name;

          sprintf(pbuf, "Randomize exits 0 to %d -> %s (%d)\r\n", pReset->arg2,
                  rname, pReset->arg1);
          break;
        }

      if ( start == -1 || num >= start )
        SendToCharacter( buf, ch );

      if ( end != -1 && num >= end )
        break;
    }

  if ( num == 0 )
    SendToCharacter( "You don't have any resets defined.\r\n", ch );
}

/* Setup put nesting levels, regardless of whether or not the resets will
   actually reset, or if they're bugged. */
void RenumberPutResets( Area *pArea )
{
  Reset *pReset = NULL, *lastobj = NULL;

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
Reset *MakeReset( char letter, int extra, int arg1, int arg2, int arg3 )
{
  Reset *pReset = NULL;

  AllocateMemory( pReset, Reset, 1 );
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
Reset *AddReset( Area *tarea, char letter, int extra, int arg1, int arg2, int arg3 )
{
  Reset *pReset = NULL;

  if ( !tarea )
    {
      Bug( "AddReset: NULL area!", 0 );
      return NULL;
    }

  letter = CharToUppercase(letter);
  pReset = MakeReset( letter, extra, arg1, arg2, arg3 );

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
      if ( IsBitSet( extra, TRAP_OBJ ) && arg1 == 0)
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
Reset *PlaceReset( Area *tarea, char letter, int extra, int arg1, int arg2, int arg3 )
{
  Reset *pReset = NULL;
  Reset *tmp = NULL;
  Reset *tmp2 = NULL;

  if ( !tarea )
    {
      Bug( "PlaceReset: NULL area!", 0 );
      return NULL;
    }

  letter = CharToUppercase(letter);
  pReset = MakeReset( letter, extra, arg1, arg2, arg3 );

  if ( letter == 'M' )
    {
      tarea->last_mob_reset = pReset;
    }

  if ( tarea->first_reset )
    {
      switch( letter )
        {
        default:
          Bug( "PlaceReset: Bad reset type %c", letter );
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
                ||    (letter == 'T' && IsBitSet(extra, TRAP_OBJ) && arg1 == 0)
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

char *SPrintReset( const Character *ch, Reset *pReset, short num, bool rlist )
{
  static char buf[MAX_STRING_LENGTH];
  char mobname[MAX_STRING_LENGTH];
  char roomname[MAX_STRING_LENGTH];
  char objname[MAX_STRING_LENGTH];
  static Room *room = NULL;
  static ProtoObject *obj = NULL, *obj2 = NULL;
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
      mob = GetProtoMobile( pReset->arg1 );
      room = GetRoom( pReset->arg3 );

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

      if ( (obj = GetProtoObject( pReset->arg1 )) == NULL )
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
           &&  (obj = GetProtoObject( pReset->arg1 )) == NULL )
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

      if ( (obj = GetProtoObject( pReset->arg1 )) == NULL )
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
      if ( (obj = GetProtoObject( pReset->arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->name );

      room = GetRoom( pReset->arg3 );

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
      if ( (obj2 = GetProtoObject( pReset->arg1 )) == NULL )
        strcpy( objname, "Object1: *BAD VNUM*" );
      else
        strcpy( objname, obj2->name );

      if ( pReset->arg3 > 0
           &&  (obj = GetProtoObject( pReset->arg3 )) == NULL )
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

      if ( (room = GetRoom( pReset->arg1 )) == NULL )
        {
          strcpy( roomname, "Room: *BAD VNUM*" );
          sprintf( objname, "%s (no exit)",
                   GetDirectionName(pReset->arg2) );
        }
      else
        {
          strcpy( roomname, room->name );
          sprintf( objname, "%s%s",
                   GetDirectionName(pReset->arg2),
                   GetExit(room,pReset->arg2) ? "" : " (NO EXIT!)" );
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
      if ( (room = GetRoom( pReset->arg1 )) == NULL )
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
               FlagString(pReset->extra, trap_flags) );
      break;
    }

  if ( rlist && (!room || (room && room->vnum != rvnum)) )
    return NULL;

  return buf;
}
