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
 * ------------------------------------------------------------------------ *
 *  The MUDprograms are heavily based on the original MOBprogram code that  *
 *  was written by N'Atas-ha.                                               *
 *  Much has been added, including the capability to put a "program" on     *
 *  rooms and objects, not to mention many more triggers and ifchecks, as   *
 *  well as "script" support.                                               *
 *                                                                          *
 *  Error reporting has been changed to specify whether the offending       *
 *  program is on a mob, a room or and object, along with the vnum.         *
 *                                                                          *
 *  Mudprog parsing has been rewritten (in mprog_driver). Mprog_process_if  *
 *  and mprog_process_cmnd have been removed, mprog_do_command is new.      *
 *  Full support for nested ifs is in.                                      *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"

/* Defines by Narn for new mudprog parsing, used as
   return values from mprog_do_command. */
#define COMMANDOK    1
#define IFtrue       2
#define IFfalse      3
#define ORtrue       4
#define ORfalse      5
#define FOUNDELSE    6
#define FOUNDENDIF   7
#define IFIGNORED    8
#define ORIGNORED    9

/* Ifstate defines, used to create and access ifstate array
   in mprog_driver. */
#define MAX_IFS     20          /* should always be generous */
#define IN_IF        0
#define IN_ELSE      1
#define DO_IF        2
#define DO_ELSE      3

#define MAX_PROG_NEST   20

bool MOBtrigger;

int mprog_do_command( char *cmnd, Character *mob, Character *actor,
                      Object *obj, void *vo, Character *rndm,
                      bool ignore, bool ignore_ors );

/*
 *  Mudprogram additions
 */
Character *supermob;
struct act_prog_data *room_act_list;
struct act_prog_data *obj_act_list;
struct act_prog_data *mob_act_list;

/*
 * Local function prototypes
 */

char *mprog_next_command( char* clist );
bool mprog_seval( const char* lhs, const char* opr, const char* rhs, Character *mob );
bool mprog_veval( int lhs, const char* opr, int rhs, Character *mob );
int mprog_do_ifcheck( const char* ifcheck, Character* mob, Character* actor,
		      Object* obj, void* vo, Character* rndm );
void mprog_translate( char ch, char* t, Character* mob,
		      Character* actor, Object* obj,
		      void* vo, Character* rndm );
void mprog_driver( char* com_list, Character* mob,
		   Character* actor, Object* obj,
		   void* vo, bool single_step );

bool mprog_keyword_check( const char *argu, const char *argl );


void oprog_wordlist_check( char *arg, Character *mob, Character *actor, Object *obj, void *vo, int type, Object *iobj );
void MudProgSetSupermob(Object *obj);
bool oprog_percent_check( Character *mob, Character *actor, Object *obj, void *vo, int type);
void rprog_percent_check( Character *mob, Character *actor, Object *obj, void *vo, int type);
void rprog_wordlist_check( char *arg, Character *mob, Character *actor,
                           Object *obj, void *vo, int type, Room *room );

/***************************************************************************
 * Local function code and brief comments.
 */

#define RID Room

void init_supermob()
{
  RID *office;

  supermob = CreateMobile(GetProtoMobile( MOB_VNUM_SUPERMOB ));
  office = GetRoom ( ROOM_VNUM_POLY );
  char_to_room( supermob, office );

#ifdef NOTDEFD
  AllocateMemory( supermob, Character, 1 );
  ClearCharacter( supermob );

  SetBit(supermob->act,ACT_IsNpc);
  supermob->name                = CopyString("supermob");
  supermob->short_descr         = CopyString(".");
  supermob->long_descr  = CopyString(".");

  AllocateMemory( supermob_index, ProtoMobile, 1 )
#endif
    }


#undef RID


/* Used to get sequential lines of a multi line string (separated by "\n\r")
 * Thus its like OneArgument(), but a trifle different. It is destructive
 * to the multi line string argument, and thus clist must not be shared.
 */
char *mprog_next_command( char *clist )
{

  char *pointer = clist;

  while ( *pointer != '\n' && *pointer != '\0' )
    pointer++;

  if ( *pointer == '\r' )
    *pointer++ = '\0';

  if ( *pointer == '\n' )
    *pointer++ = '\0';

  return pointer;
}

/* These two functions do the basic evaluation of ifcheck operators.
 *  It is important to note that the string operations are not what
 *  you probably expect.  Equality is exact and division is substring.
 *  remember that lhs has been stripped of leading space, but can
 *  still have trailing spaces so be careful when editing since:
 *  "guard" and "guard " are not equal.
 */
bool mprog_seval( const char *lhs, const char *opr,
		  const char *rhs, Character *mob )
{
  if ( !StrCmp( opr, "==" ) )
    return ( bool )( !StrCmp( lhs, rhs ) );

  if ( !StrCmp( opr, "!=" ) )
    return ( bool )( StrCmp( lhs, rhs ) );

  if ( !StrCmp( opr, "/" ) )
    return ( bool )( !StringInfix( rhs, lhs ) );

  if ( !StrCmp( opr, "!/" ) )
    return ( bool )( StringInfix( rhs, lhs ) );

  sprintf( log_buf, "Improper MOBprog operator '%s'", opr );
  ProgBug( log_buf, mob );
  return 0;
}

bool mprog_veval( int lhs, const char *opr, int rhs, Character *mob )
{
  if ( !StrCmp( opr, "==" ) )
    return ( lhs == rhs );

  if ( !StrCmp( opr, "!=" ) )
    return ( lhs != rhs );

  if ( !StrCmp( opr, ">" ) )
    return ( lhs > rhs );

  if ( !StrCmp( opr, "<" ) )
    return ( lhs < rhs );

  if ( !StrCmp( opr, "<=" ) )
    return ( lhs <= rhs );

  if ( !StrCmp( opr, ">=" ) )
    return ( lhs >= rhs );

  if ( !StrCmp( opr, "&" ) )
    return ( lhs & rhs );

  if ( !StrCmp( opr, "|" ) )
    return ( lhs | rhs );

  sprintf( log_buf, "Improper MOBprog operator '%s'", opr );
  ProgBug( log_buf, mob );

  return 0;
}

/* This function performs the evaluation of the if checks.  It is
 * here that you can add any ifchecks which you so desire. Hopefully
 * it is clear from what follows how one would go about adding your
 * own. The syntax for an if check is: ifcheck ( arg ) [opr val]
 * where the parenthesis are required and the opr and val fields are
 * optional but if one is there then both must be. The spaces are all
 * optional. The evaluation of the opr expressions is farmed out
 * to reduce the redundancy of the mammoth if statement list.
 * If there are errors, then return BERR otherwise return boolean 1,0
 * Redone by Altrag.. kill all that big copy-code that performs the
 * same action on each variable..
 */
int mprog_do_ifcheck( const char *ifcheck, Character *mob, Character *actor,
                      Object *obj, void *vo, Character *rndm )
{
  char cvar[MAX_INPUT_LENGTH];
  char chck[MAX_INPUT_LENGTH];
  char opr[MAX_INPUT_LENGTH];
  char rval[MAX_INPUT_LENGTH];
  const char *point = ifcheck;
  char *pchck = chck;
  Character *chkchar = NULL;
  Object *chkobj = NULL;
  int lhsvl = 0, rhsvl = 0;

  if ( !*point )
    {
      ProgBug( "Null ifcheck", mob );
      return BERR;
    }

  while ( *point == ' ' )
    point++;

  while ( *point != '(' )
    {
      if ( *point == '\0' )
	{
	  ProgBug( "Ifcheck syntax error", mob );
	  return BERR;
	}
      else if ( *point == ' ' )
	{
	  point++;
	}
      else
	{
	  *pchck++ = *point++;
	}
    }

  *pchck = '\0';
  point++;
  pchck = cvar;

  while ( *point != ')' )
    {
      if ( *point == '\0' )
	{
	  ProgBug( "Ifcheck syntax error", mob );
	  return BERR;
	}
      else if ( *point == ' ' )
	{
	  point++;
	}
      else
	{
	  *pchck++ = *point++;
	}
    }

  point++;
  *pchck = '\0';

  while ( *point == ' ' )
    {
      point++;
    }

  if ( !*point )
    {
      opr[0] = '\0';
      rval[0] = '\0';
    }
  else
    {
      pchck = opr;

      while ( *point != ' ' && !isalnum(*point) )
	{
	  if ( *point == '\0' )
	    {
	      ProgBug( "Ifcheck operator without value", mob );
	      return BERR;
	    }
	  else
	    {
	      *pchck++ = *point++;
	    }
	}

      *pchck = '\0';

      while ( *point == ' ' )
	{
	  point++;
	}

      pchck = rval;

      while ( *point != '\0' && *point != '\0' )
	{
	  *pchck++ = *point++;
	}

      *pchck = '\0';
    }

  /* chck contains check, cvar is the variable in the (), opr is the
   * operator if there is one, and rval is the value if there was an
   * operator.
   */
  if ( cvar[0] == '$' )
    {
      switch(cvar[1])
        {
        case 'i':
	  chkchar = mob;
	  break;

        case 'n':
	  chkchar = actor;
	  break;

        case 't':
	  chkchar = (Character *)vo;
	  break;

        case 'r':
	  chkchar = rndm;
	  break;

        case 'o':
	  chkobj = obj;
	  break;

        case 'p':
	  chkobj = (Object *)vo;
	  break;

        default:
          sprintf(rval, "Bad argument '%c' to '%s'", cvar[0], chck);
          ProgBug(rval, mob);
          return BERR;
        }

      if ( !chkchar && !chkobj )
	{
	  return BERR;
	}
    }

  if ( !StrCmp(chck, "rand") )
    {
      return (GetRandomPercent() <= atoi(cvar));
    }

  if ( !StrCmp(chck, "economy") )
    {
      int idx = atoi(cvar);
      Room *room = NULL;

      if ( !idx )
        {
          if ( !mob->in_room )
            {
              ProgBug( "'economy' ifcheck: mob in NULL room with no room vnum "
                       "argument", mob );
              return BERR;
            }

          room = mob->in_room;
        }
      else
	{
	  room = GetRoom(idx);
	}

      if ( !room )
        {
          ProgBug( "Bad room vnum passed to 'economy'", mob );
          return BERR;
        }

      return mprog_veval( ((room->area->high_economy > 0) ? 1000000000 : 0)
                          + room->area->low_economy, opr, atoi(rval), mob );
    }

  if ( !StrCmp(chck, "mobinroom") )
    {
      int vnum = atoi(cvar);
      Character *oMob = NULL;

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug( "Bad vnum to 'mobinroom'", mob );
          return BERR;
        }

      lhsvl = 0;

      for ( oMob = mob->in_room->first_person; oMob;
            oMob = oMob->next_in_room )
	{
	  if ( IsNpc(oMob) && oMob->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = atoi(rval);

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy( opr, "==" );
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "timeskilled") )
    {
      ProtoMobile *pMob = NULL;

      if ( chkchar )
	{
	  pMob = chkchar->Prototype;
	}
      else if ( !(pMob = GetProtoMobile(atoi(cvar))) )
        {
          ProgBug("TimesKilled ifcheck: bad vnum", mob);
          return BERR;
        }

      return mprog_veval(pMob->killed, opr, atoi(rval), mob);
    }

  if ( !StrCmp(chck, "ovnumhere") )
    {
      Object *pObj = NULL;
      int vnum = atoi(cvar);

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug("OvnumHere: bad vnum", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      for ( pObj = mob->in_room->first_content; pObj;
            pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "otypehere") )
    {
      Object *pObj = NULL;
      int type = 0;

      if ( IsNumber(cvar) )
        type = atoi(cvar);
      else
        type = GetObjectType(cvar);

      if ( type < 0 || type > MAX_ITEM_TYPE )
        {
          ProgBug("OtypeHere: bad type", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->item_type == type )
	    {
	      lhsvl++;
	    }
	}

      for ( pObj = mob->in_room->first_content; pObj;
            pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->item_type == type )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "ovnumroom") )
    {
      Object *pObj = NULL;
      int vnum = atoi(cvar);

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug("OvnumRoom: bad vnum", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->in_room->first_content; pObj;
            pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "otyperoom") )
    {
      Object *pObj = NULL;
      int type = 0;

      if ( IsNumber(cvar) )
	{
	  type = atoi(cvar);
	}
      else
	{
	  type = GetObjectType(cvar);
	}

      if ( type < 0 || type > MAX_ITEM_TYPE )
        {
          ProgBug("OtypeRoom: bad type", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->in_room->first_content; pObj;
            pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->item_type == type )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "ovnumcarry") )
    {
      Object *pObj = NULL;
      int vnum = atoi(cvar);

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug("OvnumCarry: bad vnum", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "otypecarry") )
    {
      Object *pObj = NULL;
      int type = 0;

      if ( IsNumber(cvar) )
	{
	  type = atoi(cvar);
	}
      else
	{
	  type = GetObjectType(cvar);
	}

      if ( type < 0 || type > MAX_ITEM_TYPE )
        {
          ProgBug("OtypeCarry: bad type", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
	{
	  if ( CanSeeObject(mob, pObj) && pObj->item_type == type )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }
  if ( !StrCmp(chck, "ovnumwear") )
    {
      Object *pObj;
      int vnum = atoi(cvar);

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug("OvnumWear: bad vnum", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
	{
	  if ( pObj->wear_loc != WEAR_NONE && CanSeeObject(mob, pObj) &&
	       pObj->Prototype->vnum == vnum )
	    {
	      lhsvl++;
	    }
	}

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
	{
	  rhsvl = 1;
	}

      if ( !*opr )
	{
	  strcpy(opr, "==");
	}

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "otypewear") )
    {
      Object *pObj;
      int type;

      if ( IsNumber(cvar) )
        type = atoi(cvar);
      else
        type = GetObjectType(cvar);
      if ( type < 0 || type > MAX_ITEM_TYPE )

        {
          ProgBug("OtypeWear: bad type", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
        if ( pObj->wear_loc != WEAR_NONE && CanSeeObject(mob, pObj) &&
             pObj->item_type == type )
          lhsvl++;

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
        rhsvl = 1;

      if ( !*opr )
        strcpy(opr, "==");

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "ovnuminv") )
    {
      Object *pObj;
      int vnum = atoi(cvar);

      if ( vnum < MIN_VNUM || vnum > MAX_VNUM )
        {
          ProgBug("OvnumInv: bad vnum", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
        if ( pObj->wear_loc == WEAR_NONE && CanSeeObject(mob, pObj) &&
             pObj->Prototype->vnum == vnum )
          lhsvl++;

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
        rhsvl = 1;

      if ( !*opr )
        strcpy(opr, "==");

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( !StrCmp(chck, "otypeinv") )
    {
      Object *pObj;
      int type;

      if ( IsNumber(cvar) )
        type = atoi(cvar);
      else
        type = GetObjectType(cvar);

      if ( type < 0 || type > MAX_ITEM_TYPE )
        {
          ProgBug("OtypeInv: bad type", mob);
          return BERR;
        }

      lhsvl = 0;

      for ( pObj = mob->first_carrying; pObj; pObj = pObj->next_content )
        if ( pObj->wear_loc == WEAR_NONE && CanSeeObject(mob, pObj) &&
             pObj->item_type == type )
          lhsvl++;

      rhsvl = IsNumber(rval) ? atoi(rval) : -1;

      if ( rhsvl < 1 )
        rhsvl = 1;

      if ( !*opr )
        strcpy(opr, "==");

      return mprog_veval(lhsvl, opr, rhsvl, mob);
    }

  if ( chkchar )
    {
      if ( !StrCmp(chck, "ismobinvis") )
        {
          return (IsNpc(chkchar) && IsBitSet(chkchar->act, ACT_MOBINVIS));
        }

      if ( !StrCmp(chck, "mobinvislevel") )
        {
          return (IsNpc(chkchar) ?
                  mprog_veval(chkchar->mobinvis, opr, atoi(rval), mob) : false);
        }

      if ( !StrCmp(chck, "ispc") )
        {
          return IsNpc(chkchar) ? false : true;
        }

      if ( !StrCmp(chck, "isnpc") )
        {
          return IsNpc(chkchar) ? true : false;
        }

      if ( !StrCmp(chck, "ismounted") )
        {
          return (chkchar->position == POS_MOUNTED);
        }

      if ( !StrCmp(chck, "isgood") )
        {
          return IsGood(chkchar) ? true : false;
        }

      if ( !StrCmp(chck, "isneutral") )
        {
          return IsNeutral(chkchar) ? true : false;
        }

      if ( !StrCmp(chck, "isevil") )
        {
          return IsEvil(chkchar) ? true : false;
        }

      if ( !StrCmp(chck, "isfight") )
        {
          return GetFightingOpponent(chkchar) ? true : false;
        }

      if ( !StrCmp(chck, "isimmort") )
        {
          return (GetTrustLevel(chkchar) >= LEVEL_IMMORTAL);
        }

      if ( !StrCmp(chck, "ischarmed") )
        {
          return IsAffectedBy(chkchar, AFF_CHARM) ? true : false;
        }

      if ( !StrCmp(chck, "isfollow") )
        {
          return (chkchar->master != NULL &&
                  chkchar->master->in_room == chkchar->in_room);
        }

      if ( !StrCmp(chck, "isaffected") )
        {
          int value = GetAffectedFlag(rval);

          if ( value < 0 || value > 31 )
            {
              ProgBug("Unknown affect being checked", mob);
              return BERR;
            }

          return IsAffectedBy(chkchar, 1 << value) ? true : false;
        }

      if ( !StrCmp(chck, "hitprcnt") )
        {
          return mprog_veval(chkchar->hit/chkchar->max_hit, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "inroom") )
        {
          return mprog_veval(chkchar->in_room->vnum, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "wasinroom") )
        {
          return mprog_veval(chkchar->was_in_room->vnum, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "norecall") )
        {
          /*    return IsBitSet(chkchar->in_room->room_flags, ROOM_NO_RECALL) ? true : false;
           */
          return false;
        }

      if ( !StrCmp(chck, "sex") )
        {
          return mprog_veval(chkchar->sex, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "position") )
        {
          return mprog_veval(chkchar->position, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "ishelled") )
        {
          return IsNpc(actor) ? false :
            mprog_veval(chkchar->pcdata->release_date, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "level") )
        {
          return mprog_veval(GetTrustLevel(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "goldamt") )
        {
          return mprog_veval(chkchar->gold, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "race") )
        {
          if ( IsNpc(chkchar) )
            return mprog_seval((char*)npc_race[chkchar->race], opr, rval, mob);

          return mprog_seval((char *)RaceTable[chkchar->race].race_name, opr,
                             rval, mob);
        }

      if ( !StrCmp(chck, "droid") )
        {
	  return IsDroid( chkchar );
        }

      if ( !StrCmp(chck, "clan") )
        {
          if ( IsNpc(chkchar) || !chkchar->pcdata->clan )
            return false;

          return mprog_seval(chkchar->pcdata->clan->name, opr, rval, mob);
        }

      if ( !StrCmp(chck, "class") )
        {
          if ( IsNpc(chkchar) )
            return false;

          return mprog_seval(npc_race[chkchar->race], opr, rval, mob);
        }

      if ( !StrCmp(chck, "clantype") )
        {
          if ( IsNpc(chkchar) || !chkchar->pcdata->clan )
            return false;

          return mprog_veval(chkchar->pcdata->clan->clan_type, opr, atoi(rval),
                             mob);
        }

      if ( !StrCmp(chck, "str") )
        {
          return mprog_veval(GetCurrentStrength(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "wis") )
        {
          return mprog_veval(GetCurrentWisdom(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "int") )
        {
          return mprog_veval(GetCurrentIntelligence(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "dex") )
        {
          return mprog_veval(GetCurrentDexterity(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "con") )
        {
          return mprog_veval(GetCurrentConstitution(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "cha") )
        {
          return mprog_veval(GetCurrentCharisma(chkchar), opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "lck") )
        {
          return mprog_veval(GetCurrentLuck(chkchar), opr, atoi(rval), mob);
        }

      if (!StrCmp(chck, "iscarrying"))
        {
          Object *pObj;
          int vnum = atoi(rval);

          if (vnum < 1 || vnum > 2097152000)
            {
              ProgBug("iscarrying: bad vnum", mob) ;
              return BERR ;
            }

          if (StrCmp(opr, "=="))
            {
              ProgBug("iscarrying: bad check: only == supported", mob) ;
              return BERR ;
            }

          for (pObj = chkchar->first_carrying; pObj; pObj = pObj->next_content)
            if (pObj->Prototype->vnum == vnum)
              return true ;

          return false ;
        }

      if ( !StrCmp(chck, "iswearing") )
	{
	  Object *pObj;
	  int vnum = atoi(rval);
	  int iWear;

	  if ( vnum < 1 || vnum > 2097152000 ) {
	    ProgBug("iswearing: bad vnum", mob);
	    return BERR;
	  }

        if (StrCmp(opr, "=="))
	  {
	    ProgBug("iswearing: bad check: only == supported", mob);
	    return BERR ;
	  }

        for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
	  {
	    for ( pObj = chkchar->first_carrying; pObj; pObj = pObj->next_content )
	      {
		if ( pObj->wear_loc == iWear )
		  {
		    if (pObj->Prototype->vnum == vnum)
		      {
			return true ;
		      }
		  }
	      }
	  }

        return false ;
      }
    }

  if ( chkobj )
    {
      if ( !StrCmp(chck, "objtype") )
        {
          return mprog_veval(chkobj->item_type, opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval0") )
        {
          return mprog_veval(chkobj->value[0], opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval1") )
        {
          return mprog_veval(chkobj->value[1], opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval2") )
        {
          return mprog_veval(chkobj->value[2], opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval3") )
        {
          return mprog_veval(chkobj->value[3], opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval4") )
        {
          return mprog_veval(chkobj->value[4], opr, atoi(rval), mob);
        }

      if ( !StrCmp(chck, "objval5") )
        {
          return mprog_veval(chkobj->value[5], opr, atoi(rval), mob);
        }
    }

  /* The following checks depend on the fact that cval[1] can only contain
     one character, and that NULL checks were made previously. */
  if ( !StrCmp(chck, "number") )
    {
      if ( chkchar )
        {
          if ( !IsNpc(chkchar) )
            return false;

          lhsvl = (chkchar == mob) ? chkchar->gold : chkchar->Prototype->vnum;
          return mprog_veval(lhsvl, opr, atoi(rval), mob);
        }

      return mprog_veval(chkobj->Prototype->vnum, opr, atoi(rval), mob);
    }

  if ( !StrCmp(chck, "name") )
    {
      if ( chkchar )
        return mprog_seval(chkchar->name, opr, rval, mob);

      return mprog_seval(chkobj->name, opr, rval, mob);
    }

  /* Ok... all the ifchecks are done, so if we didnt find ours then something
   * odd happened.  So report the bug and abort the MUDprogram (return error)
   */
  ProgBug( "Unknown ifcheck", mob );
  return BERR;
}


/* This routine handles the variables for command expansion.
 * If you want to add any go right ahead, it should be fairly
 * clear how it is done and they are quite easy to do, so you
 * can be as creative as you want. The only catch is to check
 * that your variables exist before you use them. At the moment,
 * using $t when the secondary target refers to an object
 * i.e. >prog_act drops~<nl>if ispc($t)<nl>sigh<nl>endif<nl>~<nl>
 * probably makes the mud crash (vice versa as well) The cure
 * would be to change Act() so that vo becomes vict & v_obj.
 * but this would require a lot of small changes all over the code.
 */

/*
 *  There's no reason to make the mud crash when a variable's
 *  fubared.  I added some ifs.  I'm willing to trade some
 *  performance for stability. -Haus
 *
 *  Narn's fubar ***ANNIHILATES*** you!  Hmm, could we add that
 *  as a weapon type? -Narn
 *
 *  Added char_died and obj_extracted checks    -Thoric
 */
void mprog_translate( char ch, char *t, Character *mob, Character *actor,
                      Object *obj, void *vo, Character *rndm )
{
  static char *he_she[] = { "it",  "he",  "she" };
  static char *him_her[] = { "it",  "him", "her" };
  static char *his_her[] = { "its", "his", "her" };
  Character   *vict = (Character *) vo;
  Object    *v_obj = (Object  *) vo;

  *t = '\0';
  switch ( ch ) {
  case 'i':
    if ( mob && !char_died(mob) )
      {
        if (mob->name)
          OneArgument( mob->name, t );

      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'I':
    if ( mob && !char_died(mob) )
      {
        if (mob->short_descr)
          {
            strcpy( t, mob->short_descr );
          } else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'n':
    if ( actor && !char_died(actor) )
      {
        OneArgument( actor->name, t );

        if ( !IsNpc( actor ) )
          *t = CharToUppercase( *t );
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'N':
    if( actor && !char_died( actor ) )
      {
	if( CanSeeCharacter( mob, actor ) )
	  {
	    if( IsNpc( actor ) )
	      {
		strcpy( t, actor->short_descr );
	      }
	    else
	      {
		strcpy( t, actor->name );
		strcat( t, actor->pcdata->title );
	      }
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 't':
    if ( vict && !char_died(vict) )
      {
        OneArgument( vict->name, t );

        if ( !IsNpc( vict ) )
	  {
	    *t = CharToUppercase( *t );
	  }
      }
    else
      {
	strcpy( t, "someone" );
      }

    break;

  case 'T':
    if ( vict && !char_died(vict) )
      {
        if ( CanSeeCharacter( mob, vict ) )
	  {
	    if ( IsNpc( vict ) )
	      {
		strcpy( t, vict->short_descr );
	      }
	    else
	      {
		strcpy( t, vict->name );
		strcat( t, " " );
		strcat( t, vict->pcdata->title );
	      }
	  }
        else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'r':
    if ( rndm && !char_died(rndm) )
      {
        OneArgument( rndm->name, t );

        if ( !IsNpc( rndm ) )
          {
            *t = CharToUppercase( *t );
          }
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'R':
    if ( rndm && !char_died(rndm) )
      {
        if ( CanSeeCharacter( mob, rndm ) )
	  {
	    if ( IsNpc( rndm ) )
	      {
		strcpy(t,rndm->short_descr);
	      }
	    else
	      {
		strcpy( t, rndm->name );
		strcat( t, " " );
		strcat( t, rndm->pcdata->title );
	      }
	  }
        else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "someone" );
      }
    break;

  case 'e':
    if ( actor && !char_died(actor) )
      {
        if( CanSeeCharacter( mob, actor ) )
	  {
	    strcpy( t, he_she[ actor->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'm':
    if ( actor && !char_died(actor) )
      {
        if( CanSeeCharacter( mob, actor ) )
	  {
	    strcpy( t, him_her[ actor->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 's':
    if ( actor && !char_died(actor) )
      {
        if( CanSeeCharacter( mob, actor ) )
	  {
	    strcpy( t, his_her[ actor->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone's" );
	  }
      }
    else
      {
	strcpy( t, "its'" );
      }
    break;

  case 'E':
    if ( vict && !char_died(vict) )
      {
        if( CanSeeCharacter( mob, vict ) )
	  {
	    strcpy( t, he_she[ vict->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'M':
    if ( vict && !char_died(vict) )
      {
        if( CanSeeCharacter( mob, vict ) )
	  {
	    strcpy( t, him_her[ vict->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'S':
    if ( vict && !char_died(vict) )
      {
        if( CanSeeCharacter( mob, vict ) )
	  {
	    strcpy( t, his_her[ vict->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone's" );
	  }
      }
    else
      {
	strcpy( t, "its'" );
      }
    break;

  case 'j':
    if (mob && !char_died(mob))
      {
        strcpy( t, he_she[ mob->sex ] );
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'k':
    if( mob && !char_died(mob) )
      {
        strcpy( t, him_her[ mob->sex ] );
      } else {
      strcpy( t, "it" );
    }
    break;

  case 'l':
    if( mob && !char_died(mob) )
      {
        strcpy( t, his_her[ mob->sex ] );
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'J':
    if ( rndm && !char_died(rndm) )
      {
        if( CanSeeCharacter( mob, rndm ) )
	  {
	    strcpy( t, he_she[ rndm->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "it" );
      }
    break;

  case 'K':
    if ( rndm && !char_died(rndm) )
      {
        if( CanSeeCharacter( mob, rndm ) )
	  {
	    strcpy( t, him_her[ rndm->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone's" );
	  }
      }
    else
      {
	strcpy( t, "its'" );
      }
    break;

  case 'L':
    if ( rndm && !char_died(rndm) )
      {
        if( CanSeeCharacter( mob, rndm ) )
	  {
	    strcpy( t, his_her[ rndm->sex ] );
	  }
	else
	  {
	    strcpy( t, "someone" );
	  }
      }
    else
      {
	strcpy( t, "its" );
      }
    break;

  case 'o':
    if ( obj && !obj_extracted(obj) )
      {
	if( CanSeeObject( mob, obj ) )
	  {
	    OneArgument( obj->name, t );
	  }
	else
	  {
	    strcpy( t, "something" );
	  }
      }
    else
      {
	strcpy( t, "something" );
      }
    break;

  case 'O':
    if ( obj && !obj_extracted(obj) )
      {
        if( CanSeeObject( mob, obj ) )
	  {
	    strcpy( t, obj->short_descr );
	  }
	else
	  {
	    strcpy( t, "something" );
	  }
      }
    else
      {
	strcpy( t, "something" );
      }
    break;

  case 'p':
    if ( v_obj && !obj_extracted(v_obj) )
      {
        if( CanSeeObject( mob, v_obj ) )
	  {
	    OneArgument( v_obj->name, t );
	  }
	else
	  {
	    strcpy( t, "something" );
	  }
      }
    else
      {
	strcpy( t, "something" );
      }
    break;

  case 'P':
    if ( v_obj && !obj_extracted(v_obj) )
      {
        if( CanSeeObject( mob, v_obj ) )
	  {
	    strcpy( t, v_obj->short_descr );
	  }
	else
	  {
	    strcpy( t, "something" );
	  }
      }
    else
      {
	strcpy( t, "something" );
      }
    break;

  case 'a':
    if ( obj && !obj_extracted(obj) )
      {
        strcpy( t, AOrAn(obj->name) );
      }
    else
      {
	strcpy( t, "a" );
      }
    break;

  case 'A':
    if ( v_obj && !obj_extracted(v_obj) )
      {
        strcpy( t, AOrAn(v_obj->name) );
      }
    else
      {
	strcpy( t, "a" );
      }
    break;

  case '$':
    strcpy( t, "$" );
    break;

  default:
    ProgBug( "Bad $var", mob );
    break;
  }
}

/*  The main focus of the MOBprograms.  This routine is called
 *  whenever a trigger is successful.  It is responsible for parsing
 *  the command list and figuring out what to do. However, like all
 *  complex procedures, everything is farmed out to the other guys.
 *
 *  This function rewritten by Narn for Realms of Despair, Dec/95.
 *
 */
void mprog_driver ( char *com_list, Character *mob, Character *actor,
                    Object *obj, void *vo, bool single_step)
{
  char tmpcmndlst[ MAX_STRING_LENGTH ];
  char *command_list = NULL;
  char *cmnd = NULL;
  Character *rndm  = NULL;
  Character *vch   = NULL;
  int count        = 0;
  int ignorelevel  = 0;
  int iflevel = 0, result = 0;
  bool ifstate[MAX_IFS][ DO_ELSE + 1 ];
  static int prog_nest = 0;

  if( IsAffectedBy( mob, AFF_CHARM ) )
    {
      return;
    }

  /* Next couple of checks stop program looping. -- Altrag */
  if ( mob == actor )
    {
      ProgBug( "triggering oneself.", mob );
      return;
    }

  if ( ++prog_nest > MAX_PROG_NEST )
    {
      ProgBug( "max_prog_nest exceeded.", mob );
      --prog_nest;
      return;
    }

  /* Make sure all ifstate bools are set to false */
  for ( iflevel = 0; iflevel < MAX_IFS; iflevel++ )
    {
      for ( count = 0; count < DO_ELSE; count++ )
        {
          ifstate[iflevel][count] = false;
        }
    }

  iflevel = 0;

  /*
   * get a random visible player who is in the room with the mob.
   *
   *  If there isn't a random player in the room, rndm stays NULL.
   *  If you do a $r, $R, $j, or $k with rndm = NULL, you'll crash
   *  in mprog_translate.
   *
   *  Adding appropriate error checking in mprog_translate.
   *    -Haus
   *
   * This used to ignore players MAX_LEVEL - 3 and higher (standard
   * Merc has 4 immlevels).  Thought about changing it to ignore all
   * imms, but decided to just take it out.  If the mob can see you,
   * you may be chosen as the random player. -Narn
   *
   */

  count = 0;

  for ( vch = mob->in_room->first_person; vch; vch = vch->next_in_room )
    if ( !IsNpc( vch ) )
      {
        if ( GetRandomNumberFromRange( 0, count ) == 0 )
          rndm = vch;
        count++;
      }

  strcpy( tmpcmndlst, com_list );
  command_list = tmpcmndlst;

  if ( single_step )
    {
      if ( mob->mprog.mpscriptpos > (int)strlen( tmpcmndlst ) )
	{
	  mob->mprog.mpscriptpos = 0;
	}
      else
	{
	  command_list += mob->mprog.mpscriptpos;
	}

      if ( *command_list == '\0' )
        {
          command_list = tmpcmndlst;
          mob->mprog.mpscriptpos = 0;
        }
    }

  /* From here on down, the function is all mine.  The original code
     did not support nested ifs, so it had to be redone.  The max
     logiclevel (MAX_IFS) is defined at the beginning of this file,
     use it to increase/decrease max allowed nesting.  -Narn
  */

  while ( true )
    {
      /* With these two lines, cmnd becomes the current line from the prog,
         and command_list becomes everything after that line. */
      cmnd         = command_list;
      command_list = mprog_next_command( command_list );

      /* Are we at the end? */
      if ( cmnd[0] == '\0' )
        {
          if ( ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE] )
            {
              ProgBug( "Missing endif", mob );
            }

          --prog_nest;
          return;
        }

      /* Evaluate/execute the command, check what happened. */
      result = mprog_do_command( cmnd, mob, actor, obj, vo, rndm,
                                 ( ifstate[iflevel][IN_IF] && !ifstate[iflevel][DO_IF] )
                                 || ( ifstate[iflevel][IN_ELSE] && !ifstate[iflevel][DO_ELSE] ),
                                 ( ignorelevel > 0 ) );

      /* Script prog support  -Thoric */
      if ( single_step )
        {
          mob->mprog.mpscriptpos = command_list - tmpcmndlst;
          --prog_nest;
          return;
        }

      /* This is the complicated part.  Act on the returned value from
         mprog_do_command according to the current logic state. */
      switch ( result )
        {
        case COMMANDOK:
          /* Ok, this one's a no-brainer. */
          continue;
          break;

        case IFtrue:
          /* An if was evaluated and found true.  Note that we are in an
             if section and that we want to execute it. */
          iflevel++;

          if ( iflevel == MAX_IFS )
            {
              ProgBug( "Maximum nested ifs exceeded", mob );
              --prog_nest;
              return;
            }

          ifstate[iflevel][IN_IF] = true;
          ifstate[iflevel][DO_IF] = true;
          break;

        case IFfalse:
          /* An if was evaluated and found false.  Note that we are in an
             if section and that we don't want to execute it unless we find
             an or that evaluates to true. */
          iflevel++;

          if ( iflevel == MAX_IFS )
            {
              ProgBug( "Maximum nested ifs exceeded", mob );
              --prog_nest;
              return;
            }

          ifstate[iflevel][IN_IF] = true;
          ifstate[iflevel][DO_IF] = false;
          break;

        case ORtrue:
          /* An or was evaluated and found true.  We should already be in an
             if section, so note that we want to execute it. */
          if ( !ifstate[iflevel][IN_IF] )
            {
              ProgBug( "Unmatched or", mob );
              --prog_nest;
              return;
            }

          ifstate[iflevel][DO_IF] = true;
          break;

        case ORfalse:
          /* An or was evaluated and found false.  We should already be in an
             if section, and we don't need to do much.  If the if was true or
             there were/will be other ors that evaluate(d) to true, they'll set
             do_if to true. */
          if ( !ifstate[iflevel][IN_IF] )
            {
              ProgBug( "Unmatched or", mob );
              --prog_nest;
              return;
            }

          continue;
          break;

        case FOUNDELSE:
          /* Found an else.  Make sure we're in an if section, bug out if not.
             If this else is not one that we wish to ignore, note that we're now
             in an else section, and look at whether or not we executed the if
             section to decide whether to execute the else section.  Ca marche
             bien. */
          if ( ignorelevel > 0 )
	    {
	      continue;
	    }

          if ( ifstate[iflevel][IN_ELSE] )
            {
              ProgBug( "Found else in an else section", mob );
              --prog_nest;
              return;
            }

          if ( !ifstate[iflevel][IN_IF] )
            {
              ProgBug( "Unmatched else", mob );
              --prog_nest;
              return;
            }

          ifstate[iflevel][IN_ELSE] = true;
          ifstate[iflevel][DO_ELSE] = !ifstate[iflevel][DO_IF];
          ifstate[iflevel][IN_IF]   = false;
          ifstate[iflevel][DO_IF]   = false;

          break;

        case FOUNDENDIF:
          /* Hmm, let's see... FOUNDENDIF must mean that we found an endif.
             So let's make sure we were expecting one, return if not.  If this
             endif matches the if or else that we're executing, note that we are
             now no longer executing an if.  If not, keep track of what we're
             ignoring. */
          if ( !( ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE] ) )
            {
              ProgBug( "Unmatched endif", mob );
              --prog_nest;
              return;
            }

          if ( ignorelevel > 0 )
            {
              ignorelevel--;
              continue;
            }

          ifstate[iflevel][IN_IF]   = false;
          ifstate[iflevel][DO_IF]   = false;
          ifstate[iflevel][IN_ELSE] = false;
          ifstate[iflevel][DO_ELSE] = false;

          iflevel--;
          break;

        case IFIGNORED:
          if ( !( ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE] ) )
            {
              ProgBug( "Parse error, ignoring if while not in if or else", mob );
              --prog_nest;
              return;
            }

          ignorelevel++;
          break;

        case ORIGNORED:
          if ( !( ifstate[iflevel][IN_IF] || ifstate[iflevel][IN_ELSE] ) )
            {
              ProgBug( "Unmatched or", mob );
              --prog_nest;
              return;
            }

          if ( ignorelevel == 0 )
            {
              ProgBug( "Parse error, mistakenly ignoring or", mob );
              --prog_nest;
              return;
            }

          break;

        case BERR:
          --prog_nest;
          return;
          break;
        }
    }

  --prog_nest;
}

/* This function replaces mprog_process_cmnd.  It is called from
 * mprog_driver, once for each line in a mud prog.  This function
 * checks what the line is, executes if/or checks and calls interpret
 * to perform the the commands.  Written by Narn, Dec 95.
 */
int mprog_do_command( char *cmnd, Character *mob, Character *actor,
                      Object *obj, void *vo, Character *rndm,
                      bool ignore, bool ignore_ors )
{
  char firstword[MAX_INPUT_LENGTH];
  char *ifcheck = NULL;
  char buf[ MAX_INPUT_LENGTH ];
  char tmp[ MAX_INPUT_LENGTH ];
  char *point = NULL, *str = NULL, *i = NULL;
  int validif = 0;

  /* Isolate the first word of the line, it gives us a clue what
     we want to do. */
  ifcheck = OneArgument( cmnd, firstword );

  if ( !StrCmp( firstword, "if" ) )
    {
      /* Ok, we found an if.  According to the boolean 'ignore', either
         ignore the ifcheck and report that back to mprog_driver or do
         the ifcheck and report whether it was successful. */
      if ( ignore )
        return IFIGNORED;
      else
        validif = mprog_do_ifcheck( ifcheck, mob, actor, obj, vo, rndm );

      if ( validif == 1 )
        return IFtrue;

      if ( validif == 0 )
        return IFfalse;

      return BERR;
    }

  if ( !StrCmp( firstword, "or" ) )
    {
      /* Same behavior as with ifs, but use the boolean 'ignore_ors' to
         decide which way to go. */
      if ( ignore_ors )
        return ORIGNORED;
      else
        validif = mprog_do_ifcheck( ifcheck, mob, actor, obj, vo, rndm );

      if ( validif == 1 )
        return ORtrue;

      if ( validif == 0 )
        return ORfalse;

      return BERR;
    }

  /* For else and endif, just report back what we found.  Mprog_driver
     keeps track of logiclevels. */
  if ( !StrCmp( firstword, "else" ) )
    {
      return FOUNDELSE;
    }

  if ( !StrCmp( firstword, "endif" ) )
    {
      return FOUNDENDIF;
    }

  /* Ok, didn't find an if, an or, an else or an endif.
     If the command is in an if or else section that is not to be
     performed, the boolean 'ignore' is set to true and we just
     return.  If not, we try to execute the command. */

  if ( ignore )
    return COMMANDOK;

  /* If the command is 'break', that's all folks. */
  if ( !StrCmp( firstword, "break" ) )
    return BERR;

  point   = buf;
  str     = cmnd;

  /* This chunk of code taken from mprog_process_cmnd. */
  while ( *str != '\0' )
    {
      if ( *str != '$' )
        {
          *point++ = *str++;
          continue;
        }

      str++;
      mprog_translate( *str, tmp, mob, actor, obj, vo, rndm );
      i = tmp;
      ++str;

      while ( ( *point = *i ) != '\0' )
        ++point, ++i;
    }

  *point = '\0';

  interpret( mob, buf );

  /* If the mob is mentally unstable and does things like fireball
     itself, let's make sure it's still alive. */
  if ( char_died( mob ) )
    {
      return BERR;
    }

  return COMMANDOK;
}

/***************************************************************************
 * Global function code and brief comments.
 */

bool mprog_keyword_check( const char *argu, const char *argl )
{
  char word[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  size_t i = 0;
  char *arg = NULL, *arglist = NULL;
  char *start = NULL, *end = NULL;

  strcpy( arg1, StringToLowercase( argu ) );
  arg = arg1;
  strcpy( arg2, StringToLowercase( argl ) );
  arglist = arg2;

  for ( i = 0; i < strlen( arglist ); i++ )
    arglist[i] = CharToLowercase( arglist[i] );

  for ( i = 0; i < strlen( arg ); i++ )
    arg[i] = CharToLowercase( arg[i] );

  if ( ( arglist[0] == 'p' ) && ( arglist[1] == ' ' ) )
    {
      arglist += 2;

      while ( ( start = strstr( arg, arglist ) ) )
	{
	  if ( (start == arg || *(start-1) == ' ' )
	       && ( *(end = start + strlen( arglist ) ) == ' '
		    || *end == '\n'
		    || *end == '\r'
		    || *end == '\0' ) )
	    {
	      return true;
	    }
	  else
	    {
	      arg = start + 1;
	    }
	}
    }
  else
    {
      arglist = OneArgument( arglist, word );

      for ( ; word[0] != '\0'; arglist = OneArgument( arglist, word ) )
	{
	  while ( ( start = strstr( arg, word ) ) )
	    {
	      if ( ( start == arg || *(start-1) == ' ' )
		   && ( *(end = start + strlen( word ) ) == ' '
			|| *end == '\n'
			|| *end == '\r'
			|| *end == '\0' ) )
		{
		  return true;
		}
	      else
		{
		  arg = start +1;
		}
	    }
	}
    }

  return false;
}


/* The next two routines are the basic trigger types. Either trigger
 *  on a certain percent, or trigger on a keyword or word phrase.
 *  To see how this works, look at the various trigger routines..
 */
void MudProgWordlistCheck( char *arg, Character *mob, Character *actor,
                           Object *obj, void *vo, int type )
{

  char        temp1[ MAX_STRING_LENGTH ];
  char        temp2[ MAX_INPUT_LENGTH ];
  char        word[ MAX_INPUT_LENGTH ];
  MPROG_DATA *mprg = NULL;
  char       *list = NULL;
  char       *start = NULL;
  char       *dupl = NULL;
  char       *end = NULL;
  size_t      i = 0;

  for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( mprg->type & type )
	{
	  strcpy( temp1, mprg->arglist );
	  list = temp1;

	  for ( i = 0; i < strlen( list ); i++ )
	    {
	      list[i] = CharToLowercase( list[i] );
	    }

	  strcpy( temp2, arg );
	  dupl = temp2;

	  for ( i = 0; i < strlen( dupl ); i++ )
	    {
	      dupl[i] = CharToLowercase( dupl[i] );
	    }

	  if ( ( list[0] == 'p' ) && ( list[1] == ' ' ) )
	    {
	      list += 2;

	      while ( ( start = strstr( dupl, list ) ) )
		{
		  if ( (start == dupl || *(start-1) == ' ' )
		       && ( *(end = start + strlen( list ) ) == ' '
			    || *end == '\n'
			    || *end == '\r'
			    || *end == '\0' ) )
		    {
		      mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
		      break;
		    }
		  else
		    {
		      dupl = start + 1;
		    }
		}
	    }
	  else
	    {
	      list = OneArgument( list, word );

	      for( ; word[0] != '\0'; list = OneArgument( list, word ) )
		{
		  while ( ( start = strstr( dupl, word ) ) )
		    {
		      if ( ( start == dupl || *(start-1) == ' ' )
			   && ( *(end = start + strlen( word ) ) == ' '
				|| *end == '\n'
				|| *end == '\r'
				|| *end == '\0' ) )
			{
			  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
			  break;
			}
		      else
			{
			  dupl = start+1;
			}
		    }
		}
	    }
	}
    }
}

void MudProgPercentCheck( Character *mob, Character *actor, Object *obj,
                          void *vo, int type)
{
  MPROG_DATA * mprg;

  for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( ( mprg->type & type )
	   && ( GetRandomPercent( ) <= atoi( mprg->arglist ) ) )
	{
	  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
	  
	  if ( type != GREET_PROG && type != ALL_GREET_PROG )
	    break;
	}
    }
}

void mprog_time_check( Character *mob, Character *actor, Object *obj,
                       void *vo, int type)
{
  MPROG_DATA * mprg;

  for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      bool trigger_time = ( time_info.hour == atoi( mprg->arglist ) );

      if ( !trigger_time )
        {
          if ( mprg->triggered )
            mprg->triggered = false;

          continue;
        }

      if ( ( mprg->type & type )
           && ( ( !mprg->triggered ) || ( mprg->type && HOUR_PROG ) ) )
        {
          mprg->triggered = true;
          mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
        }
    }
}

void mob_act_add( Character *mob )
{
  struct act_prog_data *runner;

  for ( runner = mob_act_list; runner; runner = runner->next )
    {
      if ( runner->vo == mob )
	{
	  return;
	}
    }

  AllocateMemory(runner, struct act_prog_data, 1);
  runner->vo = mob;
  runner->next = mob_act_list;
  mob_act_list = runner;
}

/* The triggers.. These are really basic, and since most appear only
 * once in the code (hmm. i think they all do) it would be more efficient
 * to substitute the code in and make the mprog_xxx_check routines global.
 * However, they are all here in one nice place at the moment to make it
 * easier to see what they look like. If you do substitute them back in,
 * make sure you remember to modify the variable names to the ones in the
 * trigger calls.
 */
void MobProgActTrigger( char *buf, Character *mob, Character *ch,
                        Object *obj, void *vo)
{
  MPROG_ACT_LIST * tmp_act = NULL;
  MPROG_DATA *mprg = NULL;
  bool found = false;

  if ( IsNpc( mob )
       && IsBitSet( mob->Prototype->mprog.progtypes, ACT_PROG ) )
    {
      /* Don't let a mob trigger itself, nor one instance of a mob
         trigger another instance. */
      if ( IsNpc( ch ) && ch->Prototype == mob->Prototype )
        return;

      /* make sure this is a matching trigger */
      for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( mprg->type & ACT_PROG
	       && mprog_keyword_check( buf, mprg->arglist ) )
	    {
	      found = true;
	      break;
	    }
	}

      if ( !found )
        return;

      AllocateMemory( tmp_act, MPROG_ACT_LIST, 1 );

      if ( mob->mprog.mpactnum > 0 )
        tmp_act->next = mob->mprog.mpact;
      else
        tmp_act->next = NULL;

      mob->mprog.mpact      = tmp_act;
      mob->mprog.mpact->buf = CopyString( buf );
      mob->mprog.mpact->ch  = ch;
      mob->mprog.mpact->obj = obj;
      mob->mprog.mpact->vo  = vo;
      mob->mprog.mpactnum++;
      mob_act_add( mob );
    }
}

void MobProgBribeTrigger( Character *mob, Character *ch, int amount )
{

  char buf[ MAX_STRING_LENGTH ];
  MPROG_DATA *mprg = NULL;
  Object   *obj = NULL;

  if ( IsNpc( mob )
       && ( mob->Prototype->mprog.progtypes & BRIBE_PROG ) )
    {
      /* Don't let a mob trigger itself, nor one instance of a mob
         trigger another instance. */
      if ( IsNpc( ch ) && ch->Prototype == mob->Prototype )
        return;

      obj = CreateObject( GetProtoObject( OBJ_VNUM_MONEY_SOME ), 0 );
      sprintf( buf, obj->short_descr, amount );
      FreeMemory( obj->short_descr );
      obj->short_descr = CopyString( buf );
      obj->value[OVAL_MONEY_AMOUNT] = amount;
      obj = obj_to_char( obj, mob );
      mob->gold -= amount;

      for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( ( mprg->type & BRIBE_PROG )
	       && ( amount >= atoi( mprg->arglist ) ) )
	    {
	      mprog_driver( mprg->comlist, mob, ch, obj, NULL, false );
	      break;
	    }
	}
    }
}

void MobProgDeathTrigger( Character *killer, Character *mob )
{
  if ( IsNpc( mob ) && killer != mob
       && ( mob->Prototype->mprog.progtypes & DEATH_PROG ) )
    {
      MudProgPercentCheck( mob, killer, NULL, NULL, DEATH_PROG );
    }
}

void MobProgEntryTrigger( Character *mob )
{
  if ( IsNpc( mob )
       && ( mob->Prototype->mprog.progtypes & ENTRY_PROG ) )
    {
      MudProgPercentCheck( mob, NULL, NULL, NULL, ENTRY_PROG );
    }
}

void MobProgFightTrigger( Character *mob, Character *ch )
{
  if ( IsNpc( mob )
       && ( mob->Prototype->mprog.progtypes & FIGHT_PROG ) )
    {
      MudProgPercentCheck( mob, ch, NULL, NULL, FIGHT_PROG );
    }
}

void MobProgGiveTrigger( Character *mob, Character *ch, Object *obj )
{
  char buf[MAX_INPUT_LENGTH];
  MPROG_DATA *mprg = NULL;

  if ( IsNpc( mob )
       && ( mob->Prototype->mprog.progtypes & GIVE_PROG ) )
    {
      /* Don't let a mob trigger itself, nor one instance of a mob
         trigger another instance. */
      if ( IsNpc( ch ) && ch->Prototype == mob->Prototype )
	{
	  return;
	}

      for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
        {
          OneArgument( mprg->arglist, buf );

          if ( ( mprg->type & GIVE_PROG )
               && ( ( !StrCmp( obj->name, mprg->arglist ) )
                    || ( !StrCmp( "all", buf ) ) ) )
            {

              mprog_driver( mprg->comlist, mob, ch, obj, NULL, false );
              break;
            }
        }
    }
}

void MobProgGreetTrigger( Character *ch )
{
  Character *vmob = NULL, *vmob_next = NULL;

  for ( vmob = ch->in_room->first_person; vmob; vmob = vmob_next )
    {
      vmob_next = vmob->next_in_room;

      if ( !IsNpc( vmob )
           || vmob->fighting
           || !IsAwake( vmob ) )
	{
	  continue;
	}

      /* Don't let a mob trigger itself, nor one instance of a mob
         trigger another instance. */
      if ( IsNpc( ch ) && ch->Prototype == vmob->Prototype )
	{
	  continue;
	}

      if ( vmob->Prototype->mprog.progtypes & GREET_PROG )
	{
	  MudProgPercentCheck( vmob, ch, NULL, NULL, GREET_PROG );
	}
      else if ( vmob->Prototype->mprog.progtypes & ALL_GREET_PROG )
	{
	  MudProgPercentCheck(vmob,ch,NULL,NULL,ALL_GREET_PROG);
	}
    }
}

void MobProgHitPercentTrigger( Character *mob, Character *ch)
{

  MPROG_DATA *mprg;

  if ( IsNpc( mob )
       && ( mob->Prototype->mprog.progtypes & HITPRCNT_PROG ) )
    {
      for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( ( mprg->type & HITPRCNT_PROG )
	       && ( ( 100*mob->hit / mob->max_hit ) < atoi( mprg->arglist ) ) )
	    {
	      mprog_driver( mprg->comlist, mob, ch, NULL, NULL, false );
	      break;
	    }
	}
    }
}

void MobProgRandomTrigger( Character *mob )
{
  if ( mob->Prototype->mprog.progtypes & RAND_PROG)
    MudProgPercentCheck(mob,NULL,NULL,NULL,RAND_PROG);
}

void MobProgTimeTrigger( Character *mob )
{
  if ( mob->Prototype->mprog.progtypes & TIME_PROG)
    mprog_time_check(mob,NULL,NULL,NULL,TIME_PROG);
}

void MobProgHourTrigger( Character *mob )
{
  if ( mob->Prototype->mprog.progtypes & HOUR_PROG)
    mprog_time_check(mob,NULL,NULL,NULL,HOUR_PROG);
}

void MobProgSpeechTrigger( char *txt, Character *actor )
{
  Character *vmob;

  for ( vmob = actor->in_room->first_person; vmob; vmob = vmob->next_in_room )
    {
      if ( IsNpc( vmob ) && ( vmob->Prototype->mprog.progtypes & SPEECH_PROG ) )
        {
          if ( IsNpc( actor ) && actor->Prototype == vmob->Prototype )
            continue;

          MudProgWordlistCheck( txt, vmob, actor, NULL, NULL, SPEECH_PROG );
        }
    }
}

void MobProgScriptTrigger( Character *mob )
{
  MPROG_DATA * mprg;

  if ( mob->Prototype->mprog.progtypes & SCRIPT_PROG)
    {
      for ( mprg = mob->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( ( mprg->type & SCRIPT_PROG ) )
	    {
	      if ( mprg->arglist[0] == '\0'
		   || mob->mprog.mpscriptpos != 0
		   || atoi( mprg->arglist ) == time_info.hour )
		mprog_driver( mprg->comlist, mob, NULL, NULL, NULL, true );
	    }
	}
    }
}

void oprog_script_trigger( Object *obj )
{
  MPROG_DATA * mprg;

  if ( obj->Prototype->mprog.progtypes & SCRIPT_PROG)
    {
      for ( mprg = obj->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( ( mprg->type & SCRIPT_PROG ) )
	    {
	      if ( mprg->arglist[0] == '\0'
		   || obj->mprog.mpscriptpos != 0
		   || atoi( mprg->arglist ) == time_info.hour )
		{
		  MudProgSetSupermob( obj );
		  mprog_driver( mprg->comlist, supermob, NULL, NULL, NULL, true );
		  obj->mprog.mpscriptpos = supermob->mprog.mpscriptpos;
		  ReleaseSupermob();
		}
	    }
	}
    }
}

void rprog_script_trigger( Room *room )
{
  MPROG_DATA * mprg;

  if ( room->mprog.progtypes & SCRIPT_PROG)
    {
      for ( mprg = room->mprog.mudprogs; mprg; mprg = mprg->next )
	{
	  if ( ( mprg->type & SCRIPT_PROG ) )
	    {
	      if ( mprg->arglist[0] == '\0'
		   || room->mprog.mpscriptpos != 0
		   || atoi( mprg->arglist ) == time_info.hour )
		{
		  RoomProgSetSupermob( room );
		  mprog_driver( mprg->comlist, supermob, NULL, NULL, NULL, true );
		  room->mprog.mpscriptpos = supermob->mprog.mpscriptpos;
		  ReleaseSupermob();
		}
	    }
	}
    }
}


/*
 *  Mudprogram additions begin here
 */
void MudProgSetSupermob( Object *obj)
{
  Room *room;
  Object *in_obj;
  char buf[200];

  if ( !supermob )
    supermob = CreateMobile(GetProtoMobile( MOB_VNUM_SUPERMOB ));

  if(!obj)
    return;

  for ( in_obj = obj; in_obj->in_obj; in_obj = in_obj->in_obj )
    ;

  if ( in_obj->carried_by )
    {
      room = in_obj->carried_by->in_room;
    }
  else
    {
      room = obj->in_room;
    }

  if(!room)
    return;

  if (supermob->short_descr)
    FreeMemory(supermob->short_descr);

  supermob->short_descr = CopyString(obj->short_descr);
  supermob->mprog.mpscriptpos = obj->mprog.mpscriptpos;

  /* Added by Jenny to allow bug messages to show the vnum
     of the object, and not just supermob's vnum */
  sprintf( buf, "Object #%ld", obj->Prototype->vnum );
  FreeMemory( supermob->description );
  supermob->description = CopyString( buf );

  if(room != NULL)
    {
      char_from_room (supermob );
      char_to_room( supermob, room);
    }
}

void ReleaseSupermob( )
{
  char_from_room( supermob );
  char_to_room( supermob, GetRoom( ROOM_VNUM_POLY ) );
}

bool oprog_percent_check( Character *mob, Character *actor, Object *obj,
                          void *vo, int type)
{
  MPROG_DATA * mprg;
  bool executed = false;

  for ( mprg = obj->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( ( mprg->type & type )
	   && ( GetRandomPercent( ) <= atoi( mprg->arglist ) ) )
	{
	  executed = true;
	  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );

	  if ( type != GREET_PROG )
	    break;
	}
    }

  return executed;
}

/*
 * Triggers follow
 */

void oprog_greet_trigger( Character *ch )
{
  Object *vobj;

  for ( vobj=ch->in_room->first_content; vobj; vobj = vobj->next_content )
    {
      if  ( vobj->Prototype->mprog.progtypes & GREET_PROG )
	{
	  MudProgSetSupermob( vobj );  /* not very efficient to do here */
	  oprog_percent_check( supermob, ch, vobj, NULL, GREET_PROG );
	  ReleaseSupermob();
	}
    }
}

void oprog_speech_trigger( char *txt, Character *ch )
{
  Object *vobj;

  /* supermob is set and released in oprog_wordlist_check */
  for ( vobj=ch->in_room->first_content; vobj; vobj = vobj->next_content )
    {
      if  ( vobj->Prototype->mprog.progtypes & SPEECH_PROG )
	{
	  oprog_wordlist_check( txt, supermob, ch, vobj, NULL, SPEECH_PROG, vobj );
	}
    }
}

/*
 * Called at top of obj_update
 * make sure to put an if(!obj) continue
 * after it
 */
void oprog_random_trigger( Object *obj )
{
  if (!obj || !obj->Prototype)
    return;

  if ( obj->Prototype->mprog.progtypes & RAND_PROG)
    {
      MudProgSetSupermob( obj );
      oprog_percent_check(supermob,NULL,obj,NULL,RAND_PROG);
      ReleaseSupermob();
    }
}

/*
 * in wear_obj, between each successful EquipCharacter
 * the subsequent return
 */
void oprog_wear_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & WEAR_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, WEAR_PROG );
      ReleaseSupermob();
    }
}

bool oprog_use_trigger( Character *ch, Object *obj, Character *vict,
                        Object *targ, void *vo )
{
  bool executed = false;

  if ( obj->Prototype->mprog.progtypes & USE_PROG )
    {
      MudProgSetSupermob( obj );

      if ( obj->item_type == ITEM_STAFF )
        {
          if ( vict )
	    {
	      executed = oprog_percent_check( supermob, ch, obj, vict, USE_PROG );
	    }
          else
	    {
	      executed = oprog_percent_check( supermob, ch, obj, targ, USE_PROG );
	    }
        }
      else
        {
          executed = oprog_percent_check( supermob, ch, obj, NULL, USE_PROG );
        }

      ReleaseSupermob();
    }

  return executed;
}

/*
 * call in RemoveObject, right after UnequipCharacter
 * do a if(!ch) return right after, and return true (?)
 * if !ch
 */
void oprog_remove_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & REMOVE_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, REMOVE_PROG );
      ReleaseSupermob();
    }
}

/*
 * call in do_sac, right before extract_obj
 */
void oprog_sac_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & SAC_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, SAC_PROG );
      ReleaseSupermob();
    }
}

/*
 * call in do_get, right before check_for_trap
 * do a if(!ch) return right after
 */
void oprog_get_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & GET_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, GET_PROG );
      ReleaseSupermob();
    }
}

/*
 * called in DamageObject in act_obj.c
 */
void oprog_damage_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & DAMAGE_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, DAMAGE_PROG );
      ReleaseSupermob();
    }
}

/*
 * called in do_repair in shops.c
 */
void oprog_repair_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & REPAIR_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, REPAIR_PROG );
      ReleaseSupermob();
    }
}

/*
 * call twice in do_drop, right after the Act( AT_ACTION,...)
 * do a if(!ch) return right after
 */
void oprog_drop_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & DROP_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, DROP_PROG );
      ReleaseSupermob();
    }
}

/*
 * call towards end of do_examine, right before check_for_trap
 */
void oprog_examine_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & EXA_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, EXA_PROG );
      ReleaseSupermob();
    }
}

/*
 * call in fight.c, group_gain, after (?) the obj_to_room
 */
void oprog_zap_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & ZAP_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, ZAP_PROG );
      ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void oprog_pull_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & PULL_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, PULL_PROG );
      ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void oprog_push_trigger( Character *ch, Object *obj )
{
  if ( obj->Prototype->mprog.progtypes & PUSH_PROG )
    {
      MudProgSetSupermob( obj );
      oprog_percent_check( supermob, ch, obj, NULL, PUSH_PROG );
      ReleaseSupermob();
    }
}

void obj_act_add( Object *obj );

void oprog_act_trigger( char *buf, Object *mobj, Character *ch,
                        Object *obj, void *vo )
{
  if ( mobj->Prototype->mprog.progtypes & ACT_PROG )
    {
      MPROG_ACT_LIST *tmp_act;

      AllocateMemory(tmp_act, MPROG_ACT_LIST, 1);

      if ( mobj->mprog.mpactnum > 0 )
        tmp_act->next = mobj->mprog.mpact;
      else
        tmp_act->next = NULL;

      mobj->mprog.mpact = tmp_act;
      mobj->mprog.mpact->buf = CopyString(buf);
      mobj->mprog.mpact->ch = ch;
      mobj->mprog.mpact->obj = obj;
      mobj->mprog.mpact->vo = vo;
      mobj->mprog.mpactnum++;
      obj_act_add(mobj);
    }
}

void oprog_wordlist_check( char *arg, Character *mob, Character *actor,
                           Object *obj, void *vo, int type, Object *iobj )
{
  MPROG_DATA *mprg;

  for ( mprg = iobj->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( mprg->type & type )
	{
	  char temp1[ MAX_STRING_LENGTH ];
	  char temp2[ MAX_INPUT_LENGTH ];
	  char *list = NULL;
	  char *start = NULL;
	  char *dupl = NULL;
	  const char *end = NULL;
	  size_t i = 0;

	  strcpy( temp1, mprg->arglist );
	  list = temp1;

	  for ( i = 0; i < strlen( list ); i++ )
	    {
	      list[i] = CharToLowercase( list[i] );
	    }

	  strcpy( temp2, arg );
	  dupl = temp2;

	  for ( i = 0; i < strlen( dupl ); i++ )
	    {
	      dupl[i] = CharToLowercase( dupl[i] );
	    }

	  if ( ( list[0] == 'p' ) && ( list[1] == ' ' ) )
	    {
	      list += 2;

	      while ( ( start = strstr( dupl, list ) ) )
		{
		  if ( (start == dupl || *(start-1) == ' ' )
		       && ( *(end = start + strlen( list ) ) == ' '
			    || *end == '\n'
			    || *end == '\r'
			    || *end == '\0' ) )
		    {
		      MudProgSetSupermob( iobj );
		      mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
		      ReleaseSupermob() ;
		      break;
		    }
		  else
		    {
		      dupl = start + 1;
		    }
		}
	    }
	  else
	    {
	      char word[MAX_INPUT_LENGTH];

	      list = OneArgument( list, word );

	      for( ; word[0] != '\0'; list = OneArgument( list, word ) )
		{
		  while ( ( start = strstr( dupl, word ) ) )
		    {
		      if ( ( start == dupl || *(start-1) == ' ' )
			   && ( *(end = start + strlen( word ) ) == ' '
				|| *end == '\n'
				|| *end == '\r'
				|| *end == '\0' ) )
			{
			  MudProgSetSupermob( iobj );
			  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
			  ReleaseSupermob();
			  break;
			}
		      else
			{
			  dupl = start + 1;
			}
		    }
		}
	    }
	}
    }
}

/*
 *  room_prog support starts here
 *
 */
void RoomProgSetSupermob( Room *room)
{
  char buf[200];

  if (room)
    {
      FreeMemory(supermob->short_descr);
      supermob->short_descr = CopyString(room->name);
      FreeMemory(supermob->name);
      supermob->name        = CopyString(room->name);

      supermob->mprog.mpscriptpos = room->mprog.mpscriptpos;

      /* Added by Jenny to allow bug messages to show the vnum
         of the room, and not just supermob's vnum */
      sprintf( buf, "Room #%ld", room->vnum );
      FreeMemory( supermob->description );
      supermob->description = CopyString( buf );

      char_from_room (supermob );
      char_to_room( supermob, room);
    }
}

void rprog_percent_check( Character *mob, Character *actor, Object *obj,
                          void *vo, int type)
{
  MPROG_DATA * mprg;

  if(!mob->in_room)
    return;

  for ( mprg = mob->in_room->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( ( mprg->type & type )
	   && ( GetRandomPercent( ) <= atoi( mprg->arglist ) ) )
	{
	  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );

	  if(type!=ENTER_PROG)
	    break;
	}
    }
}

/*
 * Triggers follow
 */


/*
 *  Hold on this
 * Unhold. -- Alty
 */
void room_act_add( Room *room );
void rprog_act_trigger( char *buf, Room *room, Character *ch,
                        Object *obj, void *vo )
{
  if ( room->mprog.progtypes & ACT_PROG )
    {
      MPROG_ACT_LIST *tmp_act;

      AllocateMemory(tmp_act, MPROG_ACT_LIST, 1);

      if ( room->mprog.mpactnum > 0 )
        tmp_act->next = room->mprog.mpact;
      else
        tmp_act->next = NULL;

      room->mprog.mpact = tmp_act;
      room->mprog.mpact->buf = CopyString(buf);
      room->mprog.mpact->ch = ch;
      room->mprog.mpact->obj = obj;
      room->mprog.mpact->vo = vo;
      room->mprog.mpactnum++;
      room_act_add(room);
    }
}

/*
 *
 */
void rprog_leave_trigger( Character *ch )
{
  if( ch->in_room->mprog.progtypes & LEAVE_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, LEAVE_PROG );
      ReleaseSupermob();
    }
}

void rprog_enter_trigger( Character *ch )
{
  if( ch->in_room->mprog.progtypes & ENTER_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, ENTER_PROG );
      ReleaseSupermob();
    }
}

void rprog_sleep_trigger( Character *ch )
{
  if( ch->in_room->mprog.progtypes & SLEEP_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, SLEEP_PROG );
      ReleaseSupermob();
    }
}

void rprog_rest_trigger( Character *ch )
{
  if( ch->in_room->mprog.progtypes & REST_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, REST_PROG );
      ReleaseSupermob();
    }
}

void rprog_rfight_trigger( Character *ch )
{
  if( ch->in_room->mprog.progtypes & RFIGHT_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, RFIGHT_PROG );
      ReleaseSupermob();
    }
}

void rprog_death_trigger( Character *killer, Character *ch )
{
  if( ch->in_room->mprog.progtypes & RDEATH_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check( supermob, ch, NULL, NULL, RDEATH_PROG );
      ReleaseSupermob();
    }
}

void rprog_speech_trigger( char *txt, Character *ch )
{
  if( ch->in_room->mprog.progtypes & SPEECH_PROG )
    {
      /* supermob is set and released in rprog_wordlist_check */
      rprog_wordlist_check( txt, supermob, ch, NULL, NULL, SPEECH_PROG, ch->in_room );
    }
}

void rprog_random_trigger( Character *ch )
{

  if ( ch->in_room->mprog.progtypes & RAND_PROG)
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_percent_check(supermob,ch,NULL,NULL,RAND_PROG);
      ReleaseSupermob();
    }
}

void rprog_wordlist_check( char *arg, Character *mob, Character *actor,
                           Object *obj, void *vo, int type, Room *room )
{
  MPROG_DATA *mprg;

  if ( actor && !char_died(actor) && actor->in_room )
    {
      room = actor->in_room;
    }

  for ( mprg = room->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      if ( mprg->type & type )
	{
	  char temp1[ MAX_STRING_LENGTH ];
	  char temp2[ MAX_INPUT_LENGTH ];
	  char *list = NULL;
	  char *start = NULL;
	  char *dupl = NULL;
	  const char *end = NULL;
	  size_t i = 0;

	  strcpy( temp1, mprg->arglist );
	  list = temp1;

	  for ( i = 0; i < strlen( list ); i++ )
	    {
	      list[i] = CharToLowercase( list[i] );
	    }

	  strcpy( temp2, arg );
	  dupl = temp2;

	  for ( i = 0; i < strlen( dupl ); i++ )
	    {
	      dupl[i] = CharToLowercase( dupl[i] );
	    }

	  if ( ( list[0] == 'p' ) && ( list[1] == ' ' ) )
	    {
	      list += 2;

	      while ( ( start = strstr( dupl, list ) ) )
		{
		  if ( (start == dupl || *(start-1) == ' ' )
		       && ( *(end = start + strlen( list ) ) == ' '
			    || *end == '\n'
			    || *end == '\r'
			    || *end == '\0' ) )
		    {
		      RoomProgSetSupermob( room );
		      mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
		      ReleaseSupermob() ;
		      break;
		    }
		  else
		    {
		      dupl = start + 1;
		    }
		}
	    }
	  else
	    {
	      char word[ MAX_INPUT_LENGTH ];

	      list = OneArgument( list, word );

	      for( ; word[0] != '\0'; list = OneArgument( list, word ) )
		{
		  while ( ( start = strstr( dupl, word ) ) )
		    {
		      if ( ( start == dupl || *(start-1) == ' ' )
			   && ( *(end = start + strlen( word ) ) == ' '
				|| *end == '\n'
				|| *end == '\r'
				|| *end == '\0' ) )
			{
			  RoomProgSetSupermob( room );
			  mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
			  ReleaseSupermob();
			  break;
			}
		      else
			{
			  dupl = start + 1;
			}
		    }
		}
	    }
	}
    }
}

void rprog_time_check( Character *mob, Character *actor, Object *obj,
                       void *vo, int type )
{
  Room * room = (Room *) vo;
  MPROG_DATA * mprg;

  for ( mprg = room->mprog.mudprogs; mprg; mprg = mprg->next )
    {
      bool trigger_time = ( time_info.hour == atoi( mprg->arglist ) );

      if ( !trigger_time )
        {
          if ( mprg->triggered )
            mprg->triggered = false;

          continue;
        }

      if ( ( mprg->type & type )
           && ( ( !mprg->triggered ) || ( mprg->type & HOUR_PROG ) ) )
        {
          mprg->triggered = true;
          mprog_driver( mprg->comlist, mob, actor, obj, vo, false );
        }
    }
}

void rprog_time_trigger( Character *ch )
{
  if ( ch->in_room->mprog.progtypes & TIME_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_time_check( supermob, NULL, NULL, ch->in_room, TIME_PROG );
      ReleaseSupermob();
    }
}

void rprog_hour_trigger( Character *ch )
{
  if ( ch->in_room->mprog.progtypes & HOUR_PROG )
    {
      RoomProgSetSupermob( ch->in_room );
      rprog_time_check( supermob, NULL, NULL, ch->in_room, HOUR_PROG );
      ReleaseSupermob();
    }
}

/* Written by Jenny, Nov 29/95 */
void ProgBug( const char *str, const Character *mob )
{
  /* Check if we're dealing with supermob, which means the bug occurred
     in a room or obj prog. */
  if ( mob->Prototype->vnum == MOB_VNUM_SUPERMOB )
    {
      /* It's supermob.  In MudProgSetSupermob and RoomProgSetSupermob, the description
         was set to indicate the object or room, so we just need to show
         the description in the bug message. */
      Bug( "%s, %s.", str,
	   mob->description == NULL ? "(unknown)" : mob->description );
    }
  else
    {
      Bug( "%s, Mob #%ld.", str, mob->Prototype->vnum );
    }
}


/* Room act prog updates.  Use a separate list cuz we dont really wanna go
   thru 5-10000 rooms every pulse.. can we say lag? -- Alty */

void room_act_add( Room *room )
{
  struct act_prog_data *runner;

  for ( runner = room_act_list; runner; runner = runner->next )
    {
      if ( runner->vo == room )
	{
	  return;
	}
    }

  AllocateMemory(runner, struct act_prog_data, 1);
  runner->vo = room;
  runner->next = room_act_list;
  room_act_list = runner;
}

void room_act_update( void )
{
  struct act_prog_data *runner;

  while ( (runner = room_act_list) != NULL )
    {
      Room *room = (Room*)runner->vo;
      MPROG_ACT_LIST *mpact;

      while ( (mpact = room->mprog.mpact) != NULL )
        {
          if ( mpact->ch->in_room == room )
	    {
	      rprog_wordlist_check(mpact->buf, supermob, mpact->ch, mpact->obj,
				   mpact->vo, ACT_PROG, room);
	    }

          room->mprog.mpact = mpact->next;
          FreeMemory(mpact->buf);
          FreeMemory(mpact);
        }

      room->mprog.mpact = NULL;
      room->mprog.mpactnum = 0;
      room_act_list = runner->next;
      FreeMemory(runner);
    }
}

void obj_act_add( Object *obj )
{
  struct act_prog_data *runner;

  for ( runner = obj_act_list; runner; runner = runner->next )
    {
      if ( runner->vo == obj )
	{
	  return;
	}
    }

  AllocateMemory(runner, struct act_prog_data, 1);
  runner->vo = obj;
  runner->next = obj_act_list;
  obj_act_list = runner;
}

void obj_act_update( void )
{
  struct act_prog_data *runner;

  while ( (runner = obj_act_list) != NULL )
    {
      Object *obj = (Object*)runner->vo;
      MPROG_ACT_LIST *mpact;

      while ( (mpact = obj->mprog.mpact) != NULL )
        {
          oprog_wordlist_check(mpact->buf, supermob, mpact->ch, mpact->obj,
                               mpact->vo, ACT_PROG, obj);
          obj->mprog.mpact = mpact->next;
          FreeMemory(mpact->buf);
          FreeMemory(mpact);
        }

      obj->mprog.mpact = NULL;
      obj->mprog.mpactnum = 0;
      obj_act_list = runner->next;
      FreeMemory(runner);
    }
}

const char *MudProgTypeToName( int type )
{
  switch ( type )
    {
    case IN_FILE_PROG:
      return "in_file_prog";

    case ACT_PROG:
      return "act_prog";

    case SPEECH_PROG:
      return "speech_prog";

    case RAND_PROG:
      return "rand_prog";

    case FIGHT_PROG:
      return "fight_prog";

    case HITPRCNT_PROG:
      return "hitprcnt_prog";

    case DEATH_PROG:
      return "death_prog";

    case ENTRY_PROG:
      return "entry_prog";

    case GREET_PROG:
      return "greet_prog";

    case ALL_GREET_PROG:
      return "all_greet_prog";

    case GIVE_PROG:
      return "give_prog";

    case BRIBE_PROG:
      return "bribe_prog";

    case HOUR_PROG:
      return "hour_prog";

    case TIME_PROG:
      return "time_prog";

    case WEAR_PROG:
      return "wear_prog";

    case REMOVE_PROG:
      return "remove_prog";

    case SAC_PROG:
      return "sac_prog";

    case LOOK_PROG:
      return "look_prog";

    case EXA_PROG:
      return "exa_prog";

    case ZAP_PROG:
      return "zap_prog";

    case GET_PROG:
      return "get_prog";

    case DROP_PROG:
      return "drop_prog";

    case REPAIR_PROG:
      return "repair_prog";

    case DAMAGE_PROG:
      return "damage_prog";

    case PULL_PROG:
      return "pull_prog";

    case PUSH_PROG:
      return "push_prog";

    case SCRIPT_PROG:
      return "script_prog";

    case SLEEP_PROG:
      return "sleep_prog";

    case REST_PROG:
      return "rest_prog";

    case LEAVE_PROG:
      return "leave_prog";

    case USE_PROG:
      return "use_prog";

    default:
      return "ERROR_PROG";
    }
}

Character *GetCharacterInRoomMudProg( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *rch = NULL;
  int count = 0;
  vnum_t vnum = INVALID_VNUM;
  int number = NumberArgument( argument, arg );

  if ( !StrCmp( arg, "self" ) )
    {
      return ch;
    }

  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    {
      vnum = atoi( arg );
    }

  count  = 0;

  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( (NiftyIsName( arg, rch->name )
	    ||  (IsNpc(rch) && vnum == rch->Prototype->vnum)) )
	{
	  if ( number == 0 && !IsNpc(rch) )
	    {
	      return rch;
	    }
	  else if ( ++count == number )
	    {
	      return rch;
	    }
	}
    }

  if ( vnum != INVALID_VNUM )
    {
      return NULL;
    }

  count = 0;

  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( !NiftyIsNamePrefix( arg, rch->name ) )
	{
	  continue;
	}

      if ( number == 0 && !IsNpc(rch) )
	{
	  return rch;
	}
      else if ( ++count == number )
	{
	  return rch;
	}
    }

  return NULL;
}
