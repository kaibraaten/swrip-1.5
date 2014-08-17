/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * -----------------------------------------------------------|   (0...0)   *
 * SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    *
 * -----------------------------------------------------------|    {o o}    *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~*
 * Tricops and Fireblade                                      |             *
 * ------------------------------------------------------------------------ *
 *                      Gorog's Revenge on Unruly Bastards                  *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "grub.h"
#include "mud.h"

static int go_strcmp( const char *astr, const char *bstr )
{
  int i;

  for ( ; *astr || *bstr; astr++, bstr++ )
    {
      i=CharToLowercase(*astr)-CharToLowercase(*bstr);

      if( i )
	return i;
    }

  return 0;
}

/*
 * Evaluate one string criteria
 */
bool go_eval_str (const char *lval, int op, const char *rval)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};

  switch (op)
    {
    case EQ: if ( !str_cmp(lval, rval) ) return true;
      else return false;
    case NE: if (  str_cmp(lval, rval) ) return true;
      else return false;
    case GT: if (  go_strcmp(lval, rval) >  0 ) return true;
      else return false;
    case GE: if (  go_strcmp(lval, rval) >= 0 ) return true;
      else return false;
    case LT: if (  go_strcmp(lval, rval) <  0 ) return true;
      else return false;
    case LE: if (  go_strcmp(lval, rval) <= 0 ) return true;
      else return false;
    case SU: if ( strstr(lval, rval) ) return true;
      else return false;
    }
  return false;
}

/*
 * Evaluate one numeric criteria
 */
bool go_eval_num (long lval, int op, long rval)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};
  switch (op)
    {
    case EQ: return lval == rval;
    case NE: return lval != rval;
    case GE: return lval >= rval;
    case GT: return lval >  rval;
    case LE: return lval <= rval;
    case LT: return lval <  rval;
    default: return false;
    }
}
