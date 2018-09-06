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
#include "grub.hpp"
#include "mud.hpp"

static int go_strcmp( const std::string &stl_astr, const std::string &stl_bstr )
{
  const char *astr = stl_astr.c_str();
  const char *bstr = stl_bstr.c_str();
  
  for ( ; *astr || *bstr; astr++, bstr++ )
    {
      int i = CharToLowercase(*astr) - CharToLowercase(*bstr);

      if( i )
        {
          return i;
        }
    }

  return 0;
}

/*
 * Evaluate one string criteria
 */
bool go_eval_str(const std::string &lval, int op, const std::string &rval)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};

  switch (op)
    {
    case EQ: if ( !StrCmp(lval, rval) ) return true;
      else return false;
    case NE: if (  StrCmp(lval, rval) ) return true;
      else return false;
    case GT: if (  go_strcmp(lval, rval) >  0 ) return true;
      else return false;
    case GE: if (  go_strcmp(lval, rval) >= 0 ) return true;
      else return false;
    case LT: if (  go_strcmp(lval, rval) <  0 ) return true;
      else return false;
    case LE: if (  go_strcmp(lval, rval) <= 0 ) return true;
      else return false;
    case SU: if ( strstr(lval.c_str(), rval.c_str()) ) return true;
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

