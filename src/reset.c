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
#include "planet.h"
#include "area.h"

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

  for ( pReset = pArea->FirstReset; pReset; pReset = pReset->Next )
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

  switch( pReset->Command )
    {
    case 'M':
    case 'O':
      pRoom = GetRoom( pReset->Arg3 );

      if ( !pRoom || pRoom != aRoom )
	{
	  return false;
	}

      return true;

    case 'P':
    case 'T':
    case 'H':
      if ( pReset->Command == 'H' )
	{
	  pr = pReset->Arg1;
	}
      else
	{
	  pr = pReset->Arg3;
	}

      for ( reset = pReset->Previous; reset; reset = reset->Previous )
	{
	  if ( (reset->Command == 'O' || reset->Command == 'P' ||
		reset->Command == 'G' || reset->Command == 'E') &&
	       (!pr || pr == reset->Arg1) && GetProtoObject(reset->Arg1) )
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
      switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
        {
        case BIT_RESET_DOOR:
        case BIT_RESET_ROOM:
          return (aRoom->Vnum == pReset->Arg1);

        case BIT_RESET_MOBILE:
          for ( reset = pReset->Previous; reset; reset = reset->Previous )
	    {
	      if ( reset->Command == 'M' && GetProtoMobile(reset->Arg1) )
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
          for ( reset = pReset->Previous; reset; reset = reset->Previous )
            if ( (reset->Command == 'O' || reset->Command == 'P' ||
                  reset->Command == 'G' || reset->Command == 'E') &&
                 (!pReset->Arg1 || pReset->Arg1 == reset->Arg1) &&
                 GetProtoObject(reset->Arg1) )
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
      for ( reset = pReset->Previous; reset; reset = reset->Previous )
	{
	  if ( reset->Command == 'M' && GetProtoMobile(reset->Arg1) )
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
      pRoom = GetRoom( pReset->Arg1 );

      if ( !pRoom || pRoom->Area != pArea || (aRoom && pRoom != aRoom) )
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

  if ( !IsNumber(arg) && !IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Reset to which room?\r\n", ch );
      return NULL;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      pRoom = ch->InRoom;
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
    rprev = reset->Previous;                        \
    DeleteReset(area, reset);                  \
    reset = rprev;                              \
    continue;                                   \
  } while(0)

static void DeleteReset( Area *pArea, Reset *pReset )
{
  Reset *reset = NULL;
  Reset *reset_prev = NULL;

  if ( pReset->Command == 'M' )
    {
      for ( reset = pReset->Next; reset; reset = reset->Next )
        {
          /* Break when a new mob found */
          if ( reset->Command == 'M' )
	    {
	      break;
	    }

          /* Delete anything mob is holding */
          if ( reset->Command == 'G' || reset->Command == 'E' )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->Command == 'B' &&
               (reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_MOBILE &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }
        }
    }
  else if ( pReset->Command == 'O' || pReset->Command == 'P' ||
            pReset->Command == 'G' || pReset->Command == 'E' )
    {
      for ( reset = pReset->Next; reset; reset = reset->Next )
        {
          if ( reset->Command == 'T' &&
               (!reset->Arg3 || reset->Arg3 == pReset->Arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->Command == 'H' &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          /* Delete nested objects, even if they are the same object. */
          if ( reset->Command == 'P'
	       && (reset->Arg3 > 0 || pReset->Command != 'P' || reset->MiscData-1 == pReset->MiscData)
	       && (!reset->Arg3 || reset->Arg3 == pReset->Arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          if ( reset->Command == 'B' &&
               (reset->Arg2 & BIT_RESET_TYPE_MASK) == BIT_RESET_OBJECT &&
               (!reset->Arg1 || reset->Arg1 == pReset->Arg1) )
	    {
	      DEL_RESET(pArea, reset, reset_prev);
	    }

          /* Break when a new object of same type is found */
          if ( (reset->Command == 'O' || reset->Command == 'P' ||
                reset->Command == 'G' || reset->Command == 'E') &&
               reset->Arg1 == pReset->Arg1 )
	    {
	      break;
	    }
        }
    }

  if ( pReset == pArea->LastMobReset )
    {
      pArea->LastMobReset = NULL;
    }

  if ( pReset == pArea->LastObjectReset )
    {
      pArea->LastObjectReset = NULL;
    }

  UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
  FreeMemory(pReset);
}
#undef DEL_RESET

static Reset *FindObjectReset(const Character *ch, const Area *pArea,
			      const Room *pRoom, const char *name)
{
  Reset *reset = NULL;

  if ( !*name )
    {
      for ( reset = pArea->LastReset; reset; reset = reset->Previous )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->Command)
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

      for ( reset = pArea->FirstReset; reset; reset = reset->Next )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->Command)
            {
            default:
              continue;

            case 'O':
	    case 'E':
	    case 'G':
	    case 'P':
              break;
            }

          if ( (pObjTo = GetProtoObject(reset->Arg1)) &&
               IsName(arg, pObjTo->Name) && ++cnt == num )
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
      for ( reset = pArea->LastReset; reset; reset = reset->Previous )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->Command)
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

      for ( reset = pArea->FirstReset; reset; reset = reset->Next )
        {
          if ( !IsRoomReset(reset, pRoom, pArea) )
	    {
	      continue;
	    }

          switch(reset->Command)
            {
            default:
              continue;

            case 'M':
              break;
            }

          if ( (pMob = GetProtoMobile(reset->Arg1)) &&
               IsName(arg, pMob->Name) && ++cnt == num )
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
      const char *nm = (ch->SubState == SUB_REPEATCMD ? "" : (aRoom ? "rreset "
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
      ch->SubState = SUB_REPEATCMD;
      ch->dest_buf = (aRoom ? (void *)aRoom : (void *)pArea);
      SendToCharacter( "Reset mode on.\r\n", ch );
      return;
    }

  if ( !aRoom && !StrCmp(arg, "area") )
    {
      if ( !pArea->FirstReset )
        {
          SendToCharacter( "You don't have any resets defined.\r\n", ch );
          return;
        }

      num = pArea->NumberOfPlayers;
      pArea->NumberOfPlayers = 0;
      ResetArea(pArea);
      pArea->NumberOfPlayers = num;
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

      reset->Previous = pReset->Previous;
      reset->Next = pReset->Next;

      if ( !pReset->Previous )
	{
	  pArea->FirstReset = reset;
	}
      else
	{
	  pReset->Previous->Next = reset;
	}

      if ( !pReset->Next )
	{
	  pArea->LastReset  = reset;
	}
      else
	{
	  pReset->Next->Previous = reset;
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

      AddReset(pArea, pReset->Command, pReset->MiscData, pReset->Arg1,
                pReset->Arg2, pReset->Arg3);
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

      PlaceReset(pArea, pReset->Command, pReset->MiscData, pReset->Arg1,
                  pReset->Arg2, pReset->Arg3);
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

      INSERT(pReset, reset, pArea->FirstReset, Next, Previous);
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

      for ( pReset = pArea->FirstReset; pReset; pReset = reset )
        {
          reset = pReset->Next;

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

          UNLINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);

          if ( pReset == pArea->LastMobReset )
	    {
	      pArea->LastMobReset = NULL;
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

      if ( IsNullOrEmpty( arg ) || !IsNumber(arg) )
        {
          SendToCharacter( "Delete which reset?\r\n", ch );
          return;
        }

      iarg = atoi(arg);

      for ( pReset = pArea->FirstReset; pReset; pReset = pReset->Next )
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

      if ( IsNullOrEmpty( arg ) || !IsNumber(arg) )
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

      if ( IsNullOrEmpty( arg ))
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

      pReset = MakeReset('M', 0, pMob->Vnum, num, pRoom->Vnum);
      LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
      SendToCharacter( "Mobile reset added.\r\n", ch );
      return;
    }

  if ( !StringPrefix(arg, "object") )
    {
      argument = OneArgument(argument, arg);

      if ( IsNullOrEmpty( arg ) || !IsNumber(arg) )
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

      if ( IsNullOrEmpty( arg ) )
        strcpy(arg, "room");

      if ( !StringPrefix( arg, "put" ) )
        {
          argument = OneArgument(argument, arg);

          if ( !(reset = FindObjectReset(ch, pArea, aRoom, arg)) )
	    {
	      return;
	    }

          /* Put in_objects after hide and trap resets */
          while ( reset->Next && (reset->Next->Command == 'H'
                                  || reset->Next->Command == 'T'
				  || reset->Next->Command == 'B') )
	    {
	      reset = reset->Next;
	    }

          argument = OneArgument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('P', reset->MiscData+1, pObj->Vnum, vnum, 0);
          /* Grumble.. insert puts pReset before reset, and we need it after,
             so we make a hackup and reverse all the list params.. :P.. */
          INSERT(pReset, reset, pArea->LastReset, Previous, Next);
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

          while ( reset->Next && reset->Next->Command == 'B' )
	    {
	      reset = reset->Next;	    }

          argument = OneArgument(argument, arg);

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('G', 1, pObj->Vnum, vnum, 0);
          INSERT(pReset, reset, pArea->LastReset, Previous, Next);
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

          while ( reset->Next && reset->Next->Command == 'B' )
	    {
	      reset = reset->Next;
	    }

          num = GetWearLocation(argument);

          if ( num < 0 )
            {
              SendToCharacter( "Reset object to which location?\r\n", ch );
              return;
            }

          for ( pReset = reset->Next; pReset; pReset = pReset->Next )
            {
              if ( pReset->Command == 'M' )
		{
		  break;
		}

              if ( pReset->Command == 'E' && pReset->Arg3 == num )
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

          pReset = MakeReset('E', 1, pObj->Vnum, vnum, num);
          INSERT(pReset, reset, pArea->LastReset, Previous, Next);
          SendToCharacter( "Object reset equipped by mobile created.\r\n", ch );
          return;
        }

      if ( IsNullOrEmpty( arg ) || !(num = (int)StrCmp(arg, "room"))
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

          if ( pRoom->Area != pArea )
            {
              SendToCharacter( "Cannot reset objects to other areas.\r\n", ch );
              return;
            }

          if ( (vnum = atoi(arg)) < 1 )
	    {
	      vnum = 1;
	    }

          pReset = MakeReset('O', 0, pObj->Vnum, vnum, pRoom->Vnum);
          LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
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

      if ( pRoom->Area != pArea )
        {
          SendToCharacter( "Cannot randomize doors in other areas.\r\n", ch );
          return;
        }

      pReset = MakeReset('R', 0, pRoom->Vnum, direction, 0);
      LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);
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
          vnum = (aRoom ? aRoom->Vnum : ch->InRoom->Vnum);
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
              /*        vnum = reset->Arg1;*/
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
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
      else
        LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);

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
              pRoom = ch->InRoom;
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
          vnum = pRoom->Vnum;
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
          flfunc = &GetAffectFlag;

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
              pRoom = ch->InRoom;
              argument = parg;
            }
          else if ( !(pRoom = FindRoom(ch, arg, aRoom)) )
	    {
	      return;
	    }

          vnum = pRoom->Vnum;
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
        INSERT(pReset, reset, pArea->LastReset, Previous, Next);
      else
        LINK(pReset, pArea->FirstReset, pArea->LastReset, Next, Previous);

      SendToCharacter( "Bitvector reset created.\r\n", ch );
      return;
    }

  if ( !StrCmp(arg, "hide") )
    {
      argument = OneArgument(argument, arg);

      if ( !(reset = FindObjectReset(ch, pArea, aRoom, arg)) )
        return;

      pReset = MakeReset('H', 1, 0, 0, 0);
      INSERT(pReset, reset, pArea->LastReset, Previous, Next);
      SendToCharacter( "Object hide reset created.\r\n", ch );
      return;
    }

  if ( ch->SubState == SUB_REPEATCMD )
    {
      ch->SubState = SUB_NONE;
      Interpret(ch, origarg);
      ch->SubState = SUB_REPEATCMD;
      ch->LastCommand = (aRoom ? do_rreset : do_reset);
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

  if ( (cm == 'O' || cm == 'P') && obj->Prototype->Vnum == OBJ_VNUM_TRAP )
    {
      if ( cm == 'O' )
	{
	  AddReset(pArea, 'T', obj->Value[OVAL_TRAP_FLAGS], obj->Value[OVAL_TRAP_TYPE], obj->Value[OVAL_TRAP_CHARGE], v3);
	}

      return;
    }

  AddReset( pArea, cm, (cm == 'P' ? iNest : 1), obj->Prototype->Vnum,
             v2, v3 );

  /* Only add hide for in-room objects that are hidden and cant be moved, as
     hide is an update reset, not a load-only reset. */
  if ( cm == 'O' && IS_OBJ_STAT(obj, ITEM_HIDDEN) &&
       !IsBitSet(obj->WearFlags, ITEM_TAKE) )
    {
      AddReset(pArea, 'H', 1, 0, 0, 0);
    }

  for ( inobj = obj->FirstContent; inobj; inobj = inobj->NextContent )
    {
      if ( inobj->Prototype->Vnum == OBJ_VNUM_TRAP )
	{
	  AddObjectReset(pArea, 'O', inobj, 0, 0);
	}
    }

  if ( cm == 'P' )
    {
      iNest++;
    }

  for ( inobj = obj->FirstContent; inobj; inobj = inobj->NextContent )
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

  for ( rch = pRoom->FirstPerson; rch; rch = rch->NextInRoom )
    {
      if ( !IsNpc(rch) )
	{
	  continue;
	}

      AddReset( pArea, 'M', 1, rch->Prototype->Vnum, rch->Prototype->Count,
                 pRoom->Vnum );

      for ( obj = rch->FirstCarrying; obj; obj = obj->NextContent )
        {
          if ( obj->WearLoc == WEAR_NONE )
	    {
	      AddObjectReset( pArea, 'G', obj, 1, 0 );
	    }
          else
	    {
	      AddObjectReset( pArea, 'E', obj, 1, obj->WearLoc );
	    }
        }
    }

  for ( obj = pRoom->FirstContent; obj; obj = obj->NextContent )
    {
      if ( obj->ItemType == ITEM_SPACECRAFT )
	{
	  continue;
	}

      AddObjectReset( pArea, 'O', obj, 1, pRoom->Vnum );
    }

  if ( dodoors )
    {
      Exit *pexit = NULL;

      for ( pexit = pRoom->FirstExit; pexit; pexit = pexit->Next )
        {
          int state = 0;

          if ( !IsBitSet( pexit->Flags, EX_ISDOOR ) )
	    {
	      continue;
	    }

          if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
            {
              if ( IsBitSet( pexit->Flags, EX_LOCKED ) )
		{
		  state = 2;
		}
              else
		{
		  state = 1;
		}
            }

          AddReset( pArea, 'D', 0, pRoom->Vnum, pexit->Direction, state );
        }
    }
}

void WipeResets( Area *pArea, Room *pRoom )
{
  Reset *pReset = NULL;

  for ( pReset = pArea->FirstReset; pReset; )
    {
      if ( pReset->Command != 'R' && IsRoomReset( pReset, pRoom, pArea ) )
        {
          /* Resets always go forward, so we can safely use the previous reset,
             providing it exists, or first_reset if it doesnt.  -- Altrag */
          Reset *prev = pReset->Previous;

          DeleteReset(pArea, pReset);
          pReset = (prev ? prev->Next : pArea->FirstReset);
        }
      else
	{
	  pReset = pReset->Next;
	}
    }
}

static int GenerateItemLevel( const Area *pArea, const ProtoObject *pObjIndex )
{
  int olevel = 0;
  int min = umax(pArea->LevelRanges.Soft.Low, 1);
  int max = umin(pArea->LevelRanges.Soft.High, min + 15);

  if ( pObjIndex->Level > 0 )
    {
      olevel = umin(pObjIndex->Level, MAX_LEVEL);
    }
  else
    {
      switch ( pObjIndex->ItemType )
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
      Bug( "%s: NULL pArea", __FUNCTION__ );
      return;
    }

  if ( !pArea->FirstReset )
    {
      return;
    }

  for ( pReset = pArea->FirstReset; pReset; pReset = next_reset )
    {
      next_reset = pReset->Next;

      switch( pReset->Command )
        {
        default:
          Bug( "%s: %s: bad command %c.", pArea->Filename, __FUNCTION__, pReset->Command );
          break;

        case 'M':
          if ( !(pMobIndex = GetProtoMobile(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'M': bad mob vnum %d.", pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = GetRoom(pReset->Arg3)) )
            {
              Bug( "%s: %s: 'M': bad room vnum %d.", pArea->Filename, __FUNCTION__, pReset->Arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( pMobIndex->Count >= pReset->Arg2 )
            {
              mob = NULL;
              break;
            }

          mob = CreateMobile(pMobIndex);

          {
            Room *pRoomPrev = GetRoom(pReset->Arg3 - 1);

            if ( pRoomPrev && IsBitSet(pRoomPrev->Flags, ROOM_PET_SHOP) )
	      {
		SetBit(mob->Flags, ACT_PET);
	      }
          }

          if ( IsRoomDark(pRoomIndex) )
	    {
	      SetBit(mob->AffectedBy, AFF_INFRARED);
	    }

          CharacterToRoom(mob, pRoomIndex);
          EconomizeMobileGold(mob);
          level = urange(0, mob->TopLevel - 2, LEVEL_AVATAR);

          if ( mob->VipFlags != 0 && pArea->Planet )
	    {
	      pArea->Planet->Population++;
	    }

          break;

        case 'G':
        case 'E':
          if ( !(pObjIndex = GetProtoObject(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'E' or 'G': bad obj vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !mob )
            {
              lastobj = NULL;
              break;
            }

          if ( mob->Prototype->Shop )
            {
              int olevel = GenerateItemLevel( pArea, pObjIndex );
              obj = CreateObject(pObjIndex, olevel);
              SetBit(obj->Flags, ITEM_INVENTORY);
            }
          else
	    {
	      obj = CreateObject(pObjIndex, NumberFuzzy(level));
	    }

          obj->Level = urange(0, obj->Level, LEVEL_AVATAR);
          obj = ObjectToCharacter(obj, mob);

          if ( pReset->Command == 'E' )
	    {
	      EquipCharacter(mob, obj, (WearLocation)pReset->Arg3);
	    }

          lastobj = obj;
          break;

        case 'O':
          if ( !(pObjIndex = GetProtoObject(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'O': bad obj vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pRoomIndex = GetRoom(pReset->Arg3)) )
            {
              Bug( "%s: %s: 'O': bad room vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg3 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( CountOccurancesOfObjectInList(pObjIndex, pRoomIndex->FirstContent) > 0 )
            {
              obj = NULL;
              lastobj = NULL;
              break;
            }

          obj = CreateObject(pObjIndex, NumberFuzzy(GenerateItemLevel(pArea, pObjIndex)));
          obj->Level = umin(obj->Level, LEVEL_AVATAR);
          obj->Cost = 0;
          ObjectToRoom(obj, pRoomIndex);
          lastobj = obj;
          break;

        case 'P':
          if ( !(pObjIndex = GetProtoObject(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'P': bad obj vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( pReset->Arg3 > 0 )
            {
              if ( !(pObjToIndex = GetProtoObject(pReset->Arg3)) )
                {
                  Bug( "%s: %s: 'P': bad objto vnum %d.",
		       pArea->Filename, __FUNCTION__, pReset->Arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->NumberOfPlayers > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                   !to_obj->InRoom ||
                   CountOccurancesOfObjectInList(pObjIndex, to_obj->FirstContent) > 0 )
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

              for ( iNest = 0; iNest < pReset->MiscData; iNest++ )
		{
		  if ( !(to_obj = to_obj->LastContent) )
		    {
		      Bug( "%s: %s: 'P': Invalid nesting obj %d.",
			   pArea->Filename, __FUNCTION__, pReset->Arg1 );
		      iNest = -1;
		      break;
		    }
		}

              if ( iNest < 0 )
		{
		  continue;
		}
            }

          obj = CreateObject(pObjIndex, NumberFuzzy(umax(GenerateItemLevel(pArea, pObjIndex),to_obj->Level)));
          obj->Level = umin(obj->Level, LEVEL_AVATAR);
          ObjectToObject(obj, to_obj);
          break;

        case 'T':
          if ( IsBitSet(pReset->MiscData, TRAP_OBJ) )
            {
              /* We need to preserve obj for future 'T' and 'H' checks */
              Object *pobj = NULL;

              if ( pReset->Arg3 > 0 )
                {
                  if ( !(pObjToIndex = GetProtoObject(pReset->Arg3)) )
                    {
                      Bug( "%s: %s: 'T': bad objto vnum %d.",
			   pArea->Filename, __FUNCTION__, pReset->Arg3 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                          FreeMemory( pReset );
                        }

                      continue;
                    }

                  if ( pArea->NumberOfPlayers > 0 ||
                       !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                       (to_obj->CarriedBy && !IsNpc(to_obj->CarriedBy)) ||
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

              pobj = MakeTrap( pReset->Arg2, pReset->Arg1,
                                NumberFuzzy(to_obj->Level), pReset->MiscData );
              ObjectToObject(pobj, to_obj);
            }
          else
            {
              if ( !(pRoomIndex = GetRoom(pReset->Arg3)) )
                {
                  Bug( "%s: %s: 'T': bad room %d.",
		       pArea->Filename, __FUNCTION__, pReset->Arg3 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->NumberOfPlayers > 0 ||
                   CountOccurancesOfObjectInList(GetProtoObject(OBJ_VNUM_TRAP),
                                  pRoomIndex->FirstContent) > 0 )
		{
		  break;
		}

              to_obj = MakeTrap(pReset->Arg1, pReset->Arg1, 10, pReset->MiscData);
              ObjectToRoom(to_obj, pRoomIndex);
            }

          break;

        case 'H':
          if ( pReset->Arg1 > 0 )
            {
              if ( !(pObjToIndex = GetProtoObject(pReset->Arg1)) )
                {
                  Bug( "%s: %s: 'H': bad objto vnum %d.",
		       pArea->Filename, __FUNCTION__, pReset->Arg1 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              if ( pArea->NumberOfPlayers > 0 ||
                   !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                   !to_obj->InRoom ||
                   to_obj->InRoom->Area != pArea ||
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

          SetBit(to_obj->Flags, ITEM_HIDDEN);
          break;

        case 'B':
          switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
            {
            case BIT_RESET_DOOR:
              {
                DirectionType doornum = DIR_INVALID;

                if ( !(pRoomIndex = GetRoom(pReset->Arg1)) )
                  {
                    Bug( "%s: %s: 'B': door: bad room vnum %d.",
			 pArea->Filename, __FUNCTION__, pReset->Arg1 );

                    if( !bootup )
                      {
                        UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                        FreeMemory( pReset );
                      }

                    continue;
                  }

                doornum = (DirectionType)((pReset->Arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD);

                if ( !(pexit = GetExit(pRoomIndex, doornum)) )
		  {
		    break;
		  }

                plc = &pexit->Flags;
              }

              break;

            case BIT_RESET_ROOM:
              if ( !(pRoomIndex = GetRoom(pReset->Arg1)) )
                {
                  Bug( "%s: %s: 'B': room: bad room vnum %d.",
		       pArea->Filename, __FUNCTION__, pReset->Arg1 );

                  if( !bootup )
                    {
                      UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                      FreeMemory( pReset );
                    }

                  continue;
                }

              plc = &pRoomIndex->Flags;
              break;

            case BIT_RESET_OBJECT:
              if ( pReset->Arg1 > 0 )
                {
                  if ( !(pObjToIndex = GetProtoObject(pReset->Arg1)) )
                    {
                      Bug( "%s: %s: 'B': object: bad objto vnum %d.",
			   pArea->Filename, __FUNCTION__, pReset->Arg1 );
                      if( !bootup )
                        {
                          UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                          FreeMemory( pReset );
                        }

                      continue;
                    }

                  if ( !(to_obj = GetInstanceOfObject(pObjToIndex)) ||
                       !to_obj->InRoom ||
                       to_obj->InRoom->Area != pArea )
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

              plc = &to_obj->Flags;
              break;

            case BIT_RESET_MOBILE:
              if ( !mob )
		{
		  continue;
		}

              plc = &mob->AffectedBy;
              break;

            default:
              Bug( "%s: %s: 'B': bad options %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg2 );
              continue;
            }

          if ( IsBitSet(pReset->Arg2, BIT_RESET_SET) )
	    {
	      SetBit(*plc, pReset->Arg3);
	    }
          else if ( IsBitSet(pReset->Arg2, BIT_RESET_TOGGLE) )
	    {
	      ToggleBit(*plc, pReset->Arg3);
	    }
          else
	    {
	      RemoveBit(*plc, pReset->Arg3);
	    }

          break;

        case 'D':
          if ( !(pRoomIndex = GetRoom(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'D': bad room vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          if ( !(pexit = GetExit(pRoomIndex, (DirectionType)pReset->Arg2)) )
	    {
	      break;
	    }

          switch( pReset->Arg3 )
            {
            case 0:
              RemoveBit( pexit->Flags, EX_CLOSED );
              RemoveBit( pexit->Flags, EX_LOCKED );
              break;

            case 1:
              SetBit( pexit->Flags, EX_CLOSED );
              RemoveBit( pexit->Flags, EX_LOCKED );

              if ( IsBitSet( pexit->Flags, EX_xSEARCHABLE ) )
		{
		  SetBit( pexit->Flags, EX_SECRET );
		}
              break;

            case 2:
              SetBit( pexit->Flags, EX_CLOSED );
              SetBit( pexit->Flags, EX_LOCKED );

              if ( IsBitSet( pexit->Flags, EX_xSEARCHABLE ) )
                SetBit( pexit->Flags, EX_SECRET );

              break;

            }
          break;

        case 'R':
          if ( !(pRoomIndex = GetRoom(pReset->Arg1)) )
            {
              Bug( "%s: %s: 'R': bad room vnum %d.",
		   pArea->Filename, __FUNCTION__, pReset->Arg1 );

              if( !bootup )
                {
                  UNLINK( pReset, pArea->FirstReset, pArea->LastReset, Next, Previous );
                  FreeMemory( pReset );
                }

              continue;
            }

          RandomizeExits(pRoomIndex, pReset->Arg2-1);
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

  for ( pReset = pArea->FirstReset; pReset; pReset = pReset->Next )
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

      switch( pReset->Command )
        {
        default:
          sprintf(pbuf, "*** BAD RESET: %c %d %d %d %d ***\r\n",
                  pReset->Command, pReset->MiscData, pReset->Arg1, pReset->Arg2,
                  pReset->Arg3);
          break;

        case 'M':
          if ( !(mob = GetProtoMobile(pReset->Arg1)) )
            mname = "Mobile: *BAD VNUM*";
          else
            mname = mob->Name;

          if ( !(room = GetRoom(pReset->Arg3)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->Name;

          sprintf( pbuf, "%s (%d) -> %s (%d) [%d]", mname, pReset->Arg1, rname,
                   pReset->Arg3, pReset->Arg2 );

          if ( !room )
            mob = NULL;

          if ( (room = GetRoom(pReset->Arg3-1)) &&
               IsBitSet(room->Flags, ROOM_PET_SHOP) )
            strcat( buf, " (pet)\r\n" );
          else
            strcat( buf, "\r\n" );

          break;

        case 'G':
        case 'E':
          if ( !mob )
            mname = "* ERROR: NO MOBILE! *";

          if ( !(obj = GetProtoObject(pReset->Arg1)) )
            oname = "Object: *BAD VNUM*";
          else
            oname = obj->Name;

          sprintf( pbuf, "%s (%d) -> %s (%s) [%d]", oname, pReset->Arg1, mname,
                   (pReset->Command == 'G' ? "carry" : WearLocations[pReset->Arg3]),
                   pReset->Arg2 );

          if ( mob && mob->Shop )
            strcat( buf, " (shop)\r\n" );
          else
            strcat( buf, "\r\n" );

          lastobj = obj;
          lo_reset = pReset;
          break;

        case 'O':
          if ( !(obj = GetProtoObject(pReset->Arg1)) )
            oname = "Object: *BAD VNUM*";
          else
            oname = obj->Name;

          if ( !(room = GetRoom(pReset->Arg3)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->Name;

          sprintf( pbuf, "(object) %s (%d) -> %s (%d) [%d]\r\n", oname,
                   pReset->Arg1, rname, pReset->Arg3, pReset->Arg2 );

          if ( !room )
            obj = NULL;

          lastobj = obj;
          lo_reset = pReset;
          break;

        case 'P':
          if ( !(obj = GetProtoObject(pReset->Arg1)) )
            oname = "Object1: *BAD VNUM*";
          else
            oname = obj->Name;

          obj2 = NULL;

          if ( pReset->Arg3 > 0 )
            {
              obj2 = GetProtoObject(pReset->Arg3);
              rname = (obj2 ? obj2->Name : "Object2: *BAD VNUM*");
              lastobj = obj2;
            }
          else if ( !lastobj )
	    {
	      rname = "Object2: *NULL obj*";
	    }
          else if ( pReset->MiscData == 0 )
            {
              rname = lastobj->Name;
              obj2 = lastobj;
            }
          else
            {
              int iNest;
              Reset *reset = lo_reset->Next;

              for ( iNest = 0; iNest < pReset->MiscData; iNest++ )
                {
                  for ( ; reset; reset = reset->Next )
                    if ( reset->Command == 'O' || reset->Command == 'G' ||
                         reset->Command == 'E' || (reset->Command == 'P' &&
                                                   !reset->Arg3 && reset->MiscData == iNest) )
                      break;

                  if ( !reset || reset->Command != 'P' )
                    break;
                }

              if ( !reset )
                rname = "Object2: *BAD NESTING*";
              else if ( !(obj2 = GetProtoObject(reset->Arg1)) )
                rname = "Object2: *NESTED BAD VNUM*";
              else
                rname = obj2->Name;
            }

          sprintf( pbuf, "(Put) %s (%d) -> %s (%ld) [%d] {nest %d}\r\n", oname,
                   pReset->Arg1, rname, (obj2 ? obj2->Vnum : pReset->Arg3),
                   pReset->Arg2, pReset->MiscData );
          break;

        case 'T':
          sprintf(pbuf, "TRAP: %d %d %d %d (%s)\r\n", pReset->MiscData, pReset->Arg1,
                  pReset->Arg2, pReset->Arg3, FlagString(pReset->MiscData, TrapFlags));
          break;

        case 'H':
          if ( pReset->Arg1 > 0 )
            if ( !(obj2 = GetProtoObject(pReset->Arg1)) )
              rname = "Object: *BAD VNUM*";
            else
              rname = obj2->Name;
          else if ( !obj )
            rname = "Object: *NULL obj*";
          else
            rname = oname;
          sprintf(pbuf, "Hide %s (%ld)\r\n", rname,
                  (pReset->Arg1 > 0 ? pReset->Arg1 : obj ? obj->Vnum : 0));
          break;

        case 'B':
          {
            const char * const * flagarray;

            strcpy(pbuf, "BIT: ");
            pbuf += 5;

            if ( IsBitSet(pReset->Arg2, BIT_RESET_SET) )
              {
                strcpy(pbuf, "Set: ");
                pbuf += 5;
              }
            else if ( IsBitSet(pReset->Arg2, BIT_RESET_TOGGLE) )
              {
                strcpy(pbuf, "Toggle: ");
                pbuf += 8;
              }
            else
              {
                strcpy(pbuf, "Remove: ");
                pbuf += 8;
              }

            switch(pReset->Arg2 & BIT_RESET_TYPE_MASK)
              {
              case BIT_RESET_DOOR:
                {
                  DirectionType door;

                  if ( !(room = GetRoom(pReset->Arg1)) )
                    rname = "Room: *BAD VNUM*";
                  else
                    rname = room->Name;

                  door = (DirectionType)((pReset->Arg2 & BIT_RESET_DOOR_MASK) >> BIT_RESET_DOOR_THRESHOLD);
                  door = (DirectionType)urange(0, door, MAX_DIR+ 1);
                  sprintf(pbuf, "Exit %s%s (%d), Room %s (%d)",
			  GetDirectionName(door),
                          (room && GetExit(room, door) ? "" : " (NO EXIT!)"), door,
                          rname, pReset->Arg1);
                }
                flagarray = ExitFlags;
                break;

              case BIT_RESET_ROOM:
                if ( !(room = GetRoom(pReset->Arg1)) )
                  rname = "Room: *BAD VNUM*";
                else
                  rname = room->Name;

                sprintf(pbuf, "Room %s (%d)", rname, pReset->Arg1);
                flagarray = RoomFlags;
                break;

              case BIT_RESET_OBJECT:
                if ( pReset->Arg1 > 0 )
                  if ( !(obj2 = GetProtoObject(pReset->Arg1)) )
                    rname = "Object: *BAD VNUM*";
                  else
                    rname = obj2->Name;
                else if ( !obj )
                  rname = "Object: *NULL obj*";
                else
                  rname = oname;
                sprintf(pbuf, "Object %s (%ld)", rname,
                        (pReset->Arg1 > 0 ? pReset->Arg1 : obj ? obj->Vnum : 0));
                flagarray = ObjectFlags;
                break;

              case BIT_RESET_MOBILE:
                if ( pReset->Arg1 > 0 )
                  {
                    ProtoMobile *mob2;

                    if ( !(mob2 = GetProtoMobile(pReset->Arg1)) )
                      rname = "Mobile: *BAD VNUM*";
                    else
                      rname = mob2->Name;
                  }
                else if ( !mob )
                  rname = "Mobile: *NULL mob*";
                else
                  rname = mname;
                sprintf(pbuf, "Mobile %s (%ld)", rname,
                        (pReset->Arg1 > 0 ? pReset->Arg1 : mob ? mob->Vnum : 0));
                flagarray = AffectFlags;
                break;

              default:
                sprintf(pbuf, "bad type %d", pReset->Arg2 & BIT_RESET_TYPE_MASK);
                flagarray = NULL;
                break;
              }

            pbuf += strlen(pbuf);

            if ( flagarray )
              sprintf(pbuf, "; flags: %s [%d]\r\n",
                      FlagString(pReset->Arg3, flagarray), pReset->Arg3);
            else
              sprintf(pbuf, "; flags %d\r\n", pReset->Arg3);
          }
          break;

        case 'D':
          {
            const char *ef_name;

            pReset->Arg2 = urange(0, pReset->Arg2, MAX_DIR+1);

            if ( !(room = GetRoom(pReset->Arg1)) )
              rname = "Room: *BAD VNUM*";
            else
              rname = room->Name;

            switch(pReset->Arg3)
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
                    pReset->Arg3, GetDirectionName((DirectionType)pReset->Arg2),
                    (room && GetExit(room, (DirectionType)pReset->Arg2) ? "" : " (NO EXIT!)"),
                    pReset->Arg2, rname, pReset->Arg1);
          }
          break;

        case 'R':
          if ( !(room = GetRoom(pReset->Arg1)) )
            rname = "Room: *BAD VNUM*";
          else
            rname = room->Name;

          sprintf(pbuf, "Randomize exits 0 to %d -> %s (%d)\r\n", pReset->Arg2,
                  rname, pReset->Arg1);
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

  for ( pReset = pArea->FirstReset; pReset; pReset = pReset->Next )
    {
      switch(pReset->Command)
        {
        default:
          break;

        case 'G':
	case 'E':
	case 'O':
          lastobj = pReset;
          break;

        case 'P':
          if ( pReset->Arg3 == 0 )
            {
              if ( !lastobj )
                pReset->MiscData = 1000000;
              else if ( lastobj->Command != 'P' || lastobj->Arg3 > 0 )
                pReset->MiscData = 0;
              else
                pReset->MiscData = lastobj->MiscData + 1;

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
  pReset->Command       = letter;
  pReset->MiscData = extra;
  pReset->Arg1  = arg1;
  pReset->Arg2  = arg2;
  pReset->Arg3  = arg3;
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
      Bug( "%s: NULL area!", __FUNCTION__ );
      return NULL;
    }

  letter = CharToUppercase(letter);
  pReset = MakeReset( letter, extra, arg1, arg2, arg3 );

  switch( letter )
    {
    case 'M':
      tarea->LastMobReset = pReset;
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
      tarea->LastObjectReset = pReset;
    break;

    case 'T':
      if ( IsBitSet( extra, TRAP_OBJ ) && arg1 == 0)
	{
	  tarea->LastObjectReset = pReset;
	}

      break;
    }

  LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );
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
      Bug( "%s: NULL area!", __FUNCTION__ );
      return NULL;
    }

  letter = CharToUppercase(letter);
  pReset = MakeReset( letter, extra, arg1, arg2, arg3 );

  if ( letter == 'M' )
    {
      tarea->LastMobReset = pReset;
    }

  if ( tarea->FirstReset )
    {
      switch( letter )
        {
        default:
          Bug( "%s: Bad reset type %c", __FUNCTION__, letter );
          return NULL;

        case 'D':
	case 'R':
          for ( tmp = tarea->LastReset; tmp; tmp = tmp->Previous )
            if ( tmp->Command == letter )
              break;

          if ( tmp )    /* organize by location */
	    {
	      for ( ; tmp && tmp->Command == letter && tmp->Arg1 > arg1; tmp = tmp->Previous )
		{
		  ;
		}
	    }
	  
          if ( tmp )    /* organize by direction */
	    {
	      for ( ; tmp && tmp->Command == letter && tmp->Arg1 == /*tmp->*/ arg1 && tmp->Arg2 > arg2; tmp = tmp->Previous )
		{
		  ;
		}
	    }
	  
          if ( tmp )
            INSERT( pReset, tmp, tarea->FirstReset, Next, Previous );
          else
            LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );

          return pReset;

        case 'M':       case 'O':
          /* find last reset of same type */
          for ( tmp = tarea->LastReset; tmp; tmp = tmp->Previous )
            if ( tmp->Command == letter )
              break;

          tmp2 = tmp ? tmp->Next : NULL;

          /* organize by location */
          for ( ; tmp; tmp = tmp->Previous )
            if ( tmp->Command == letter && tmp->Arg3 <= arg3 )
              {
                tmp2 = tmp->Next;

                /* organize by vnum */
                if ( tmp->Arg3 == arg3 )
                  for ( ; tmp; tmp = tmp->Previous )
                    if ( tmp->Command == letter
                         &&   tmp->Arg3 == /*tmp->*/ arg3
                         &&   tmp->Arg1 <= arg1 )
                      {
                        tmp2 = tmp->Next;
                        break;
                      }

                break;
              }

          /* skip over E or G for that mob */
          if ( tmp2 && letter == 'M' )
            {
              for ( ; tmp2; tmp2 = tmp2->Next )
                if ( tmp2->Command != 'E' && tmp2->Command != 'G' )
                  break;
            }
          else
            /* skip over P, T or H for that obj */
            if ( tmp2 && letter == 'O' )
              {
                for ( ; tmp2; tmp2 = tmp2->Next )
                  if ( tmp2->Command != 'P' && tmp2->Command != 'T'
                       &&   tmp2->Command != 'H' )
                    break;
              }

          if ( tmp2 )
            INSERT( pReset, tmp2, tarea->FirstReset, Next, Previous );
          else
            LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );

          return pReset;

        case 'G':
	case 'E':
          /* find the last mob */
          if ( (tmp=tarea->LastMobReset) != NULL )
            {
              /*
               * See if there are any resets for this mob yet,
               * put E before G and organize by vnum
               */
              if ( tmp->Next )
                {
                  tmp = tmp->Next;

                  if ( tmp && tmp->Command == 'E' )
                    {
                      if ( letter == 'E' )
                        for ( ; tmp && tmp->Command == 'E' && tmp->Arg1 < arg1; tmp = tmp->Next );
                      else
                        for ( ; tmp && tmp->Command == 'E'; tmp = tmp->Next );
                    }
                  else
                    if ( tmp && tmp->Command == 'G' && letter == 'G' )
                      for ( ; tmp && tmp->Command == 'G' && tmp->Arg1 < arg1; tmp = tmp->Next );

                  if ( tmp )
                    INSERT( pReset, tmp, tarea->FirstReset, Next, Previous );
                  else
                    LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );
                }
              else
                LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );

              return pReset;
            }
          break;

        case 'P':       case 'T':   case 'H':
          /* find the object in question */
          if ( ((letter == 'P' && arg3 == 0)
                ||    (letter == 'T' && IsBitSet(extra, TRAP_OBJ) && arg1 == 0)
                ||    (letter == 'H' && arg1 == 0))
               &&    (tmp=tarea->LastObjectReset) != NULL )
            {
              if ( (tmp=tmp->Next) != NULL )
                INSERT( pReset, tmp, tarea->FirstReset, Next, Previous );
              else
                LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );

              return pReset;
            }

          for ( tmp = tarea->LastReset; tmp; tmp = tmp->Previous )
            if ( (tmp->Command == 'O' || tmp->Command == 'G'
                  || tmp->Command == 'E' || tmp->Command == 'P')
                 && tmp->Arg1 == arg3 )
              {
                /*
                 * See if there are any resets for this object yet,
                 * put P before H before T and organize by vnum
                 */
                if ( tmp->Next )
                  {
                    tmp = tmp->Next;

                    if ( tmp && tmp->Command == 'P' )
                      {
                        if ( letter == 'P' && tmp->Arg3 == arg3 )
			  {
			    for ( ; tmp && tmp->Command == 'P'
				    && tmp->Arg3 == arg3
				    && tmp->Arg1 < arg1;
				  tmp = tmp->Next )
			      {
				;
			      }
			  }
                        else if ( letter != 'T' )
			  {
                            for ( ; tmp
				    && tmp->Command == 'P'
				    && tmp->Arg3 == arg3;
				  tmp = tmp->Next )
			      {
				;
			      }
			  }
                      }
                    else if ( tmp && tmp->Command == 'H' )
		      {
			if ( letter == 'H' && tmp->Arg3 == arg3 )
			  {
			    for ( ; tmp
				    && tmp->Command == 'H'
				    && tmp->Arg3 == arg3
				    && tmp->Arg1 < arg1;
				  tmp = tmp->Next )
			      {
				;
			      }
			  }
			else if ( letter != 'H' )
			  {
			    for ( ; tmp
				    && tmp->Command == 'H'
				    && tmp->Arg3 == arg3;
				  tmp = tmp->Next )
			      {
				;
			      }
			  }
		      }
		    else if ( tmp && tmp->Command == 'T' && letter == 'T' )
		      {
			for ( ; tmp
				&& tmp->Command == 'T'
				&& tmp->Arg3 == arg3
				&& tmp->Arg1 < arg1;
			      tmp = tmp->Next )
			  {
			    ;
			  }
		      }

                    if ( tmp )
		      {
			INSERT( pReset, tmp, tarea->FirstReset, Next, Previous );
		      }
                    else
		      {
			LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );
		      }
                  }
                else
		  {
		    LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );
		  }

                return pReset;
              }

          break;
        }
      /* likely a bad reset if we get here... add it anyways */
    }

  LINK( pReset, tarea->FirstReset, tarea->LastReset, Next, Previous );
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

  if ( ch->InRoom )
    {
      rvnum = ch->InRoom->Vnum;
    }

  if ( num == 1 )
    {
      room = NULL;
      obj  = NULL;
      obj2 = NULL;
      mob  = NULL;
    }

  switch( pReset->Command )
    {
    default:
      sprintf( buf, "%2d) *** BAD RESET: %c %d %d %d %d ***\r\n",
               num,
               pReset->Command,
               pReset->MiscData,
               pReset->Arg1,
               pReset->Arg2,
               pReset->Arg3 );
      break;

    case 'M':
      mob = GetProtoMobile( pReset->Arg1 );
      room = GetRoom( pReset->Arg3 );

      if ( mob )
        strcpy( mobname, mob->Name );
      else
        strcpy( mobname, "Mobile: *BAD VNUM*" );

      if ( room )
        strcpy( roomname, room->Name );
      else
        strcpy( roomname, "Room: *BAD VNUM*" );

      sprintf( buf, "%2d) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               mobname,
               pReset->Arg1,
               roomname,
               pReset->Arg3,
               pReset->Arg2 );
      break;

    case 'E':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );

      if ( (obj = GetProtoObject( pReset->Arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->Name );

      sprintf( buf, "%2d) %s (%d) -> %s (%s) [%d]\r\n",
               num,
               objname,
               pReset->Arg1,
               mobname,
               WearLocations[pReset->Arg3],
               pReset->Arg2 );
      break;

    case 'H':
      if ( pReset->Arg1 > 0
           &&  (obj = GetProtoObject( pReset->Arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else if ( !obj )
	strcpy( objname, "Object: *NULL obj*" );

      sprintf( buf, "%2d) Hide %s (%ld)\r\n",
               num,
               objname,
               obj ? obj->Vnum : pReset->Arg1 );
      break;

    case 'G':
      if ( !mob )
        strcpy( mobname, "* ERROR: NO MOBILE! *" );

      if ( (obj = GetProtoObject( pReset->Arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->Name );

      sprintf( buf, "%2d) %s (%d) -> %s (carry) [%d]\r\n",
               num,
               objname,
               pReset->Arg1,
               mobname,
               pReset->Arg2 );
      break;

    case 'O':
      if ( (obj = GetProtoObject( pReset->Arg1 )) == NULL )
        strcpy( objname, "Object: *BAD VNUM*" );
      else
        strcpy( objname, obj->Name );

      room = GetRoom( pReset->Arg3 );

      if ( !room )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->Name );

      sprintf( buf, "%2d) (object) %s (%d) -> %s (%d) [%d]\r\n",
               num,
               objname,
               pReset->Arg1,
               roomname,
               pReset->Arg3,
               pReset->Arg2 );
      break;

    case 'P':
      if ( (obj2 = GetProtoObject( pReset->Arg1 )) == NULL )
        strcpy( objname, "Object1: *BAD VNUM*" );
      else
        strcpy( objname, obj2->Name );

      if ( pReset->Arg3 > 0
           &&  (obj = GetProtoObject( pReset->Arg3 )) == NULL )
        strcpy( roomname, "Object2: *BAD VNUM*" );
      else if ( !obj )
	strcpy( roomname, "Object2: *NULL obj*" );
      else
	strcpy( roomname, obj->Name );

      sprintf( buf, "%2d) (Put) %s (%d) -> %s (%ld) [%d]\r\n",
	       num,
               objname,
               pReset->Arg1,
               roomname,
               obj ? obj->Vnum : pReset->Arg3,
               pReset->Arg2 );
      break;

    case 'D':
      if ( pReset->Arg2 < 0 || pReset->Arg2 > MAX_DIR+1 )
        pReset->Arg2 = 0;

      if ( (room = GetRoom( pReset->Arg1 )) == NULL )
        {
          strcpy( roomname, "Room: *BAD VNUM*" );
          sprintf( objname, "%s (no exit)", GetDirectionName((DirectionType)pReset->Arg2) );
        }
      else
        {
          strcpy( roomname, room->Name );
          sprintf( objname, "%s%s",
                   GetDirectionName((DirectionType)pReset->Arg2),
                   GetExit(room, (DirectionType)pReset->Arg2) ? "" : " (NO EXIT!)" );
        }

      switch( pReset->Arg3 )
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
               pReset->Arg3,
               objname,
               pReset->Arg2,
               roomname,
               pReset->Arg1 );
      break;

    case 'R':
      if ( (room = GetRoom( pReset->Arg1 )) == NULL )
        strcpy( roomname, "Room: *BAD VNUM*" );
      else
        strcpy( roomname, room->Name );

      sprintf( buf, "%2d) Randomize exits 0 to %d -> %s (%d)\r\n",
	       num,
               pReset->Arg2,
               roomname,
               pReset->Arg1 );
      break;

    case 'T':
      sprintf( buf, "%2d) TRAP: %d %d %d %d (%s)\r\n",
               num,
               pReset->MiscData,
               pReset->Arg1,
               pReset->Arg2,
               pReset->Arg3,
               FlagString(pReset->MiscData, TrapFlags) );
      break;
    }

  if ( rlist && (!room || (room && room->Vnum != rvnum)) )
    return NULL;

  return buf;
}
