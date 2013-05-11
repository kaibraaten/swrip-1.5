/***************************************************************************
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

#include <ctype.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "grub.h"

static short go_wear_ext (long arg)    /* extract bit set in arg ignoring pos 1 */
{
  short cou;

  if ( arg <= 1 ) return arg;

  for (cou=1; cou<=31; cou++)
    if ( arg & ( (unsigned long) 1 << cou ) )
      return cou + 1;

  return -1;
}

static int go_strcmp( const char *astr, const char *bstr )
{
  int i;
  for ( ; *astr || *bstr; astr++, bstr++ )
    {
      i=LOWER(*astr)-LOWER(*bstr);
      if ( i ) return i;
    }
  return 0;
}

static void go_init (void)
{
  int cou;

  for (cou=0; cou<GO_NUM_FIELDS; cou++)
    go_fd[cou].num=TRUE;
  go_fd[22].num=FALSE;
  go_fd[23].num=FALSE;

  strcpy(go_fd[ 0].nam, "count");
  strcpy(go_fd[ 1].nam, "vnum" );
  strcpy(go_fd[ 2].nam, "type" );
  strcpy(go_fd[ 3].nam, "level");
  strcpy(go_fd[ 4].nam, "wear" );
  strcpy(go_fd[ 5].nam, "avg"  );
  strcpy(go_fd[ 6].nam, "hr"   );
  strcpy(go_fd[ 7].nam, "dr"   );
  strcpy(go_fd[ 8].nam, "hp"   );
  strcpy(go_fd[ 9].nam, "mp"   );
  strcpy(go_fd[10].nam, "ac"   );
  strcpy(go_fd[11].nam, "str"  );
  strcpy(go_fd[12].nam, "dex"  );
  strcpy(go_fd[13].nam, "con"  );
  strcpy(go_fd[14].nam, "wis"  );
  strcpy(go_fd[15].nam, "int"  );
  strcpy(go_fd[16].nam, "luck" );
  strcpy(go_fd[17].nam, "sav0" );
  strcpy(go_fd[18].nam, "sav1" );
  strcpy(go_fd[19].nam, "sav2" );
  strcpy(go_fd[20].nam, "sav3" );
  strcpy(go_fd[21].nam, "sav4" );
  strcpy(go_fd[22].nam, "cname" );
  strcpy(go_fd[23].nam, "name" );
}

static const char *go_otype_to_disp (int arg)
{
  if ( arg==ITEM_LIGHT     ) return "lt";
  if ( arg==ITEM_SCROLL    ) return "sc";
  if ( arg==ITEM_WAND      ) return "wa";
  if ( arg==ITEM_STAFF     ) return "st";
  if ( arg==ITEM_WEAPON    ) return "wp";
  if ( arg==ITEM_TREASURE  ) return "tr";
  if ( arg==ITEM_ARMOR     ) return "ar";
  if ( arg==ITEM_FURNITURE ) return "fu";
  if ( arg==ITEM_TRASH     ) return "th";
  if ( arg==ITEM_POTION    ) return "po";
  if ( arg==ITEM_CONTAINER ) return "cn";
  if ( arg==ITEM_DRINK_CON ) return "dc";
  if ( arg==ITEM_POTION    ) return "po";
  if ( arg==ITEM_NOTE      ) return "no";
  if ( arg==ITEM_KEY       ) return "ky";
  if ( arg==ITEM_FOOD      ) return "fo";
  if ( arg==ITEM_CORPSE_PC ) return "pc";
  if ( arg==ITEM_CORPSE_NPC) return "mc";
  if ( arg==ITEM_PILL      ) return "pi";
  if ( arg==ITEM_BOOK      ) return "bk";
  if ( arg==ITEM_FOUNTAIN  ) return "fn";
  if ( arg==ITEM_AMMO      ) return "am";
  if ( arg==ITEM_SHOVEL    ) return "sh";
  if ( arg==ITEM_CRYSTAL   ) return "cr";
  if ( arg==ITEM_FABRIC    ) return "fb";
  if ( arg==ITEM_SPICE     ) return "sp";
  if ( arg==ITEM_GRENADE   ) return "gr";
  return NULL;
}

static const char *owear_to_disp (short arg)
{
  static char owear_disp[20][3] =
    { "??", "ta", "fi", "ne", "bo", "he", "le", "fe", "ha", "ar",
      "sh", "ab", "wa", "wr", "wi", "ho", "du", "ea", "ey", "mi" };

  arg = ( arg<0 || arg>20 ) ? 0 : arg;
  return owear_disp[ arg ];
}

static int owear_to_num (const char *arg)
{
  if ( !str_cmp( arg, "take"    ) ) return  1;
  if ( !str_cmp( arg, "finger"  ) ) return  2;
  if ( !str_cmp( arg, "neck"    ) ) return  3;
  if ( !str_cmp( arg, "body"    ) ) return  4;
  if ( !str_cmp( arg, "head"    ) ) return  5;
  if ( !str_cmp( arg, "legs"    ) ) return  6;
  if ( !str_cmp( arg, "feet"    ) ) return  7;
  if ( !str_cmp( arg, "hands"   ) ) return  8;
  if ( !str_cmp( arg, "arms"    ) ) return  9;
  if ( !str_cmp( arg, "shield"  ) ) return 10;
  if ( !str_cmp( arg, "about"   ) ) return 11;
  if ( !str_cmp( arg, "waist"   ) ) return 12;
  if ( !str_cmp( arg, "wrist"   ) ) return 13;
  if ( !str_cmp( arg, "wield"   ) ) return 14;
  if ( !str_cmp( arg, "hold"    ) ) return 15;
  if ( !str_cmp( arg, "dual"    ) ) return 16;
  if ( !str_cmp( arg, "ears"    ) ) return 17;
  if ( !str_cmp( arg, "eyes"    ) ) return 18;
  if ( !str_cmp( arg, "missile" ) ) return 19;
  return 0;
}

static int go_fnam_to_num( const char *arg )
{
  int cou;

  for (cou=0; cou<GO_NUM_FIELDS; cou++)
    if ( !str_cmp(arg, go_fd[cou].nam) )
      return cou;
  return -1;
}

/*
 * Generalized sort function.
 * Sorts either ascending or descending.
 * Sorts an array containing either numbers or strings.
 * 1st parm is a pointer to an array of structures.
 * 2nd parm indicates the starting position within the record
 * 3rd parm indicates the first record in the sort range
 * 4th parm indicates the last  record in the sort range
 *     e.g. the array may contain 100 records but we may wish to sort
 *     only the first fifty.
 * 5th parm is n_s - number/string - TRUE is number - FALSE is string
 * 6th parm is direction - TRUE is ascending - FALSE is descending
 */
static void go_sort( const CHAR_DATA *ch, GO_STRUCT **p,
		     int ind, int left, int right, bool n_s, bool sor_dir )
{
  GO_STRUCT *swap;
  int i=left, j=right, testn = 0;
  static char tests[ MAX_STRING_LENGTH ];

  if ( left < 0 || left >= right ) return;
  right = UMIN(right, MAX_DISPLAY_LINES - 1);

  if ( n_s )
    testn = p[left]->n[ind];
  else
    strcpy( tests, p[left]->s[ind] );

  do
    {
      if ( n_s )
        {
          if ( sor_dir )
            while (p[i]->n[ind] < testn) i++;
          else
            while (p[i]->n[ind] > testn) i++;
          if ( sor_dir )
            while (testn < p[j]->n[ind]) j--;
          else
            while (testn > p[j]->n[ind]) j--;
        }
      else
        {
          if ( sor_dir )
            while ( strcmp( p[i]->s[ind], tests) < 0 ) i++;
          else
            while ( strcmp( p[i]->s[ind], tests) > 0 ) i++;
          if ( sor_dir )
            while ( strcmp( tests, p[j]->s[ind]) < 0 ) j--;
          else
            while ( strcmp( tests, p[j]->s[ind]) > 0 ) j--;
        }

      if (i <= j) { swap=p[i]; p[i] = p[j]; p[j] = swap; i++; j--; }
    } while (i <= j);

  if (left < j)  go_sort (ch, p, ind, left,  j, n_s, sor_dir );
  if (i < right) go_sort (ch, p, ind, i, right, n_s, sor_dir );
}

static void go_accum_aff (GO_STRUCT *r, int loc, int mod)
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};

  switch (loc)
    {
    case APPLY_HITROLL       : {r->n[OHR]  += mod; break;}
    case APPLY_DAMROLL       : {r->n[ODR]  += mod; break;}
    case APPLY_HIT           : {r->n[OHP]  += mod; break;}
    case APPLY_MANA          : {r->n[OMP]  += mod; break;}
    case APPLY_AC            : {r->n[OAC]  += mod; break;}
    case APPLY_STR           : {r->n[OSTR] += mod; break;}
    case APPLY_DEX           : {r->n[ODEX] += mod; break;}
    case APPLY_CON           : {r->n[OCON] += mod; break;}
    case APPLY_WIS           : {r->n[OWIS] += mod; break;}
    case APPLY_INT           : {r->n[OINT] += mod; break;}
    case APPLY_LCK           : {r->n[OLUCK]+= mod; break;}
    case APPLY_SAVING_POISON : {r->n[OSAV0]+= mod; break;}
    case APPLY_SAVING_ROD    : {r->n[OSAV1]+= mod; break;}
    case APPLY_SAVING_PARA   : {r->n[OSAV2]+= mod; break;}
    case APPLY_SAVING_BREATH : {r->n[OSAV3]+= mod; break;}
    case APPLY_SAVING_SPELL  : {r->n[OSAV4]+= mod; break;}
    }
}

static void display_operand_table (CHAR_DATA *ch, int op_num)
{
  int cou;
  char opn[7][3] = {"eq", "ne", "su", "ge", "gt", "le", "lt"};

  pager_printf (ch, "OPERAND TABLE\r\n");
  for(cou=0; cou < op_num; cou++)
    if ( go_op[cou].num)
      pager_printf (ch,
                    "%2d %-7s %2s %10ld\r\n", cou+1, go_fd[go_op[cou].field].nam,
                    opn[go_op[cou].op], go_op[cou].nval);
    else
      pager_printf (ch, "%2d %-7s %2s %s\r\n",
                    cou+1, go_fd[go_op[cou].field].nam,
                    opn[go_op[cou].op], go_op[cou].sval);
}

/*
 *  Store operand's operator and value in operand table.
 */
static bool go_parse_operator (CHAR_DATA *ch, const char *pch, int *op_num)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  int  cou;
  char opstr [7][3] = { "=", "!=", "<>", ">=", ">", "<=", "<" };

  go_op[*op_num].op = -1;
  for (cou=0; cou<7; cou++)
    if ( !str_prefix(opstr[cou], pch) )
      {
        go_op[*op_num].op = cou;
        break;
      }
  if ( go_op[*op_num].op < 0 )
    {pager_printf(ch, "Invalid operator: %s\r\n", pch); return FALSE;}
  if ( go_op[*op_num].op==EQ || go_op[*op_num].op==GT
       ||   go_op[*op_num].op==LT )
    pch++;
  else pch+=2;                              /* advance to operand value */
  if ( *pch=='\0' )
    {pager_printf(ch, "Value is missing from operand.\r\n"); return FALSE;}

  if ( go_fd[ go_op[ *op_num ].field ].num )
    {
      go_op[*op_num].num  = TRUE;
      if ( isdigit(*pch) )                        /* user entered number */
        go_op[*op_num].nval = atoi ( pch );
      else
        if ( go_op[*op_num].field == OTYPE )
          go_op[*op_num].nval = get_objecttype( pch ); /* user entered token */
        else
          if ( go_op[*op_num].field == OWEAR )
            go_op[*op_num].nval = owear_to_num( pch ); /* user entered token */
    }
  else
    {
      go_op[*op_num].num  = FALSE;

      if ( strlen(pch) > MAX_FIELD_LENGTH )
        {
          pager_printf(ch, "Char string is too long:%s\r\n", pch);
          return FALSE;
        }
      strcpy ( go_op[*op_num].sval, pch );      /* store str value in table */
    }
  (*op_num)++;                            /* operand now stored in table */
  return TRUE;
}

/*
 * Store operand's field name in the operand table.
 */
static bool go_parse_operand (CHAR_DATA *ch, const char *arg, int *op_num, int *sor_ind,
                       bool *sor_dir, bool *or_sw, bool *np_sw, bool *nm_sw, bool *ng_sw,
                       bool *do_sw, bool *d2_sw)
{
  int cou;

  if ( !str_cmp(arg, "or"    ) ) return *or_sw    = TRUE;
  if ( !str_cmp(arg, "np"    ) ) return *np_sw    = TRUE;
  if ( !str_cmp(arg, "nm"    ) ) return *nm_sw    = TRUE;
  if ( !str_cmp(arg, "ng"    ) ) return *ng_sw    = TRUE;
  if ( !str_cmp(arg, "do"    ) ) return *do_sw    = TRUE;
  if ( !str_cmp(arg, "d2"    ) ) return *d2_sw = TRUE;

  if ( arg[0]=='+' || arg[0]=='-')
    {
      const char *pch = arg + 1;
      *sor_dir = (arg[0]=='+') ? TRUE : FALSE;

      if ( pch[0] == '\0')
        {
          pager_printf(ch, "Sorry. Missing sort field: %s\r\n", arg);
          return FALSE;
        }

      if ( (*sor_ind = go_fnam_to_num(pch)) == -1 )
        {
          pager_printf(ch, "Sorry. Invalid sort field: %s\r\n", arg);
          return FALSE;
        }
      return TRUE;
    }

  for (cou=0; cou<GO_NUM_FIELDS; cou++)           /* check field name    */
    if ( !str_prefix( go_fd[cou].nam, arg ) )
      {
        arg += strlen( go_fd[cou].nam );         /* advance to operator */
        go_op[ *op_num ].field = cou;
        /* store field enum */
        if ( !go_parse_operator (ch, arg, op_num) )
          return FALSE;
        return TRUE;
      }
  pager_printf(ch, "Sorry. Invalid field name: %s\r\n", arg);
  return FALSE;
}

/*
 * Evaluate one string criteria
 */
static bool go_eval_str (const char *lval, int op, const char *rval)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};
  switch (op)
    {
    case EQ: if ( !str_cmp(lval, rval) ) return TRUE;
      else return FALSE;
    case NE: if (  str_cmp(lval, rval) ) return TRUE;
      else return FALSE;
    case GT: if (  go_strcmp(lval, rval) >  0 ) return TRUE;
      else return FALSE;
    case GE: if (  go_strcmp(lval, rval) >= 0 ) return TRUE;
      else return FALSE;
    case LT: if (  go_strcmp(lval, rval) <  0 ) return TRUE;
      else return FALSE;
    case LE: if (  go_strcmp(lval, rval) <= 0 ) return TRUE;
      else return FALSE;
    case SU: if ( strstr(lval, rval) ) return TRUE;
      else return FALSE;
    }
  return FALSE;
}

/*
 * Evaluate one numeric criteria
 */
static bool go_eval_num (long lval, int op, long rval)
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
    default: return FALSE;
    }
}

/*
 * Evaluate one input record to see if it matches all search criteria
 */
static bool go_eval_and (CHAR_DATA *ch, GO_STRUCT *r, int op_num)
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  int  cou;

  for (cou=0; cou<op_num; cou++)
    {
      if ( go_op[cou].field <= OSAV4 )
        {
          if ( !go_eval_num
               (r->n[go_op[cou].field], go_op[cou].op, go_op[cou].nval) )
            return FALSE;
          else continue;
        }
      else
        {
          if ( !go_eval_str(
                            r->s[go_op[cou].field-OSAV4-1], go_op[cou].op,
                            go_op[cou].sval) )
            return FALSE;
          else continue;
        }
    }
  return TRUE;
}

/*
 * Evaluate one input record to see if it matches any search criteria
 */
static bool go_eval_or (CHAR_DATA *ch, GO_STRUCT *r, int op_num)
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  int  cou;
  for (cou=0; cou<op_num; cou++)
    {
      if ( go_op[cou].field <= OSAV4 )
        {
          if ( go_eval_num( r->n[ go_op[cou].field ], go_op[cou].op,
                            go_op[cou].nval ) )
            return TRUE;
          else continue;
        }
      else
        {
          if ( go_eval_str( r->s[go_op[cou].field-OSAV4-1], go_op[cou].op,
                            go_op[cou].sval) )
            return TRUE;
          else continue;
        }
    }
  return FALSE;
}

static void go_display( CHAR_DATA *ch, int dis_num, int tot_match, bool d2_sw,
			GO_STRUCT **p)
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  enum {CNAME, ONAME};

  GO_STRUCT r;
  int cou, lim;
  char pri_cname[MAX_NAME_LENGTH];
  char pri_oname[MAX_NAME_LENGTH];

  if ( tot_match > 0 && dis_num > 0 )          /* print title if app  */
    {
      if ( !d2_sw )
        pager_printf(ch,
                     "\r\n%-12s%3s %5s %2s %-12s %2s %2s %2s %2s %2s %3s %3s %3s "
                     "%11s\r\n",
                     "Character", "Cou", "OVnum", "Lv", "OName", "Ty", "We",
                     "Av", "Hr", "Dr", "Hp", "Mp", "AC", "S D C W I L");
      else
        pager_printf(ch,
                     "\r\n%-12s%3s %5s %2s %-12s %2s %2s %2s %2s %2s %3s %3s %2s "
                     "%2s %2s %2s %2s\r\n",
                     "Character", "Cou", "OVnum", "Lv", "OName", "Ty", "We",
                     "Av", "Hr", "Dr", "Hp", "Mp", "S0", "S1", "S2", "S3", "S4");
    }
  lim = UMIN(tot_match, dis_num);

  for ( cou=0; cou<lim; cou++)
    {
      r = *p[cou];
      strncpy( pri_cname, r.s[CNAME], MAX_NAME_LENGTH - 1);
      pri_cname[ MAX_NAME_LENGTH - 1] = '\0';
      strncpy( pri_oname, r.s[ONAME], MAX_NAME_LENGTH - 1);
      pri_oname[ MAX_NAME_LENGTH - 1] = '\0';
      if ( !d2_sw )
        pager_printf(ch,
                     "%-12s%3d %5d%3d %-12s %2s %2s%3d%3d%3d%4d%4d%4d"
                     "%2d%2d%2d%2d%2d%2d\r\n",
                     pri_cname, r.n[OCOUNT], r.n[OVNUM], r.n[OLEVEL],
                     pri_oname, go_otype_to_disp( r.n[OTYPE] ),
                     owear_to_disp( r.n[OWEAR] ),
                     r.n[OAVG], r.n[OHR], r.n[ODR],
                     r.n[OHP], r.n[OMP], r.n[OAC], r.n[OSTR], r.n[ODEX],
                     r.n[OCON], r.n[OWIS], r.n[OINT], r.n[OLUCK]);
      else
        pager_printf(ch,
                     "%-12s%3d %5d%3d %-12s %2s %2s%3d%3d%3d%4d%4d%3d"
                     "%3d%3d%3d%3d\r\n",
                     pri_cname, r.n[OCOUNT], r.n[OVNUM], r.n[OLEVEL],
                     pri_oname, go_otype_to_disp( r.n[OTYPE] ),
                     owear_to_disp( r.n[OWEAR] ),
                     r.n[OAVG], r.n[OHR], r.n[ODR],
                     r.n[OHP], r.n[OMP], r.n[OSAV0], r.n[OSAV1], r.n[OSAV2],
                     r.n[OSAV3], r.n[OSAV4]);
    }
  if (tot_match == 0 )
    pager_printf(ch, "Zero matches were found.\r\n");
  else pager_printf(ch,
                    "%5d matches in total.\r\n", tot_match);
}

/*
 * Find the name of the character and object and place in record
 * The name of the object is easy ... but the name of the character
 * proved to be one of the most difficult and frustrating aspects ot
 * this function. F.Y.I - if an object is not "carried_by" someone,
 * it could be on the ground ... but ... growl ... it could also be
 * in a container carried by someone - or in a container on the ground.
 */
static bool go_read_names( CHAR_DATA *ch, OBJ_DATA *po, GO_STRUCT *r, bool np_sw,
			   bool nm_sw, bool ng_sw )
{
  enum {CNAME, ONAME};
  OBJ_DATA *pt;
  const char *ground = "(none)";
  const char *ack    = "(error in data structure)";

  r->s[ONAME] = ( po->name ) ? po->name : ack;  /* set object name */

  if ( po->carried_by )                  /* it's being carried by a char */
    {
      if ( get_trust(ch) < po->carried_by->top_level ) return FALSE;
      if ( nm_sw &&  IS_NPC(po->carried_by) ) return FALSE;
      if ( np_sw && !IS_NPC(po->carried_by) ) return FALSE;
      r->s[CNAME] = po->carried_by->name;
    }
  else if ( po->in_obj )                 /* it's in a container          */
    {
      pt = po;
      while( pt->in_obj )
        pt=pt->in_obj;
      if ( pt->carried_by && get_trust(ch) < pt->carried_by->top_level )
        return FALSE;
      if ( pt->carried_by && nm_sw &&  IS_NPC(pt->carried_by) )
        return FALSE;
      if ( pt->carried_by && np_sw && !IS_NPC(pt->carried_by) )
        return FALSE;
      if ( pt->carried_by ) r->s[CNAME] = pt->carried_by->name;
      else
        {
          if ( ng_sw ) return FALSE;
          r->s[CNAME] = ground;
        }
    }
  else if ( !po->in_obj )                /* it's on the ground           */
    {
      if ( ng_sw ) return FALSE;
      r->s[CNAME] = ground;
    }
  return TRUE;
}

static bool go_read( CHAR_DATA *ch, int dis_num, int op_num, int sor_ind,
		     bool sor_dir, bool or_sw, bool np_sw, bool nm_sw, bool ng_sw,
		     bool d2_sw )
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  OBJ_INDEX_DATA  *px;
  OBJ_DATA        *po;
  AFFECT_DATA     *pa;
  GO_STRUCT         r;                 /* input (physical record)         */
  GO_STRUCT     a[MAX_DISPLAY_LINES];  /* array of records                */
  GO_STRUCT    *p[MAX_DISPLAY_LINES];  /* array of pointers to records    */
  bool ok_otype [255];                 /* we want to process these otypes */
  int  tot_match = 0;                  /* total records matched           */
  bool res;                            /* result of a boolean exp         */
  int ind;                             /* indicates the sort field        */

  memset(ok_otype, 0, sizeof ok_otype);
  ok_otype[ITEM_LIGHT] = ok_otype[ITEM_WAND] = ok_otype[ITEM_KEY] =
    ok_otype[ITEM_STAFF] = ok_otype[ITEM_WEAPON] = ok_otype[ITEM_ARMOR] =
    ok_otype[ITEM_CONTAINER] = TRUE;

  for (po=first_object; po; po=po->next)   /* Loop through all objects   */
    {
      if ( !ok_otype[po->item_type] )      /* don't process useless stuff*/
        continue;
      memset(&r, 0, sizeof r);
      if ( !go_read_names( ch, po, &r, np_sw, nm_sw, ng_sw ) )
        continue;
      px          = po->pIndexData;
      r.n[OCOUNT] = po->count;
      r.n[OVNUM]  = px->vnum;
      r.n[OTYPE]  = po->item_type;
      r.n[OLEVEL] = po->level;
      r.n[OWEAR]  = go_wear_ext( po->wear_flags );
      r.n[OAVG]   = (po->item_type == ITEM_WEAPON) ?
        (po->value[1] + po->value[2])/2 : 0;
      for (pa=px->first_affect; pa; pa=pa->next)
        go_accum_aff (&r, pa->location, pa->modifier);
      for (pa=po->first_affect; pa; pa=pa->next)
        go_accum_aff (&r, pa->location, pa->modifier);
      res = or_sw ? go_eval_or(ch, &r, op_num) : go_eval_and(ch, &r, op_num);

      if ( res )                             /* record is a match         */
        {
          if ( dis_num > 0 && tot_match < MAX_DISPLAY_LINES )
            {
              a[ tot_match ] = r;
              p[ tot_match ] = &a[ tot_match ];
            }
          tot_match++;
        }
    }
  ind = ( sor_ind<=OSAV4 ) ? sor_ind : sor_ind - OSAV4 - 1;

  if ( tot_match > 1 && dis_num > 0 )
    go_sort( ch, p, ind, 0, UMIN((tot_match - 1), MAX_DISPLAY_LINES - 1),
             ( sor_ind <= OSAV4 ), sor_dir );

  go_display( ch, dis_num, tot_match, d2_sw, p );
  return TRUE;
}

/*
  The following code is intended to replace the static arrays "a" and "p"
  with dynamically allocated ones. But I'm confused as to why. If the
  user asks to display 10 lines, but selects 10,000 ... then the arrays
  must be allocated to hold 10,000 so that they may be sorted. Once they
  are sorted, we display only 10 - but - that don't change the fact that
  we have to sort all 10,000 - sigh - arg! - Gorog

  GO_STRUCT        *a;
  GO_STRUCT       **p;
  a = (GO_STRUCT  *) calloc( UMIN(dis_num, MAX_DISPLAY_LINES), sizeof *a);
  if (!a)
  {
  pager_printf(ch, "Sorry. There is currently insufficient memory avail"
  " to service your request. Try later or speak to a coder.\r\n");
  return FALSE;
  }
  p = (GO_STRUCT **) calloc( UMIN(dis_num, MAX_DISPLAY_LINES), sizeof *p);
  if (!p)
  {
  pager_printf(ch, "Sorry. There is currently insufficient memory avail"
  " to service your request. Try later or speak to a coder.\r\n");
  return FALSE;
  }
  free(p); free(a);
*/

void do_ogrub (CHAR_DATA *ch, char *argument)
{
  enum {OCOUNT, OVNUM, OTYPE, OLEVEL, OWEAR, OAVG, OHR, ODR, OHP, OMP, OAC,
        OSTR, ODEX, OCON, OWIS, OINT, OLUCK,
        OSAV0, OSAV1, OSAV2, OSAV3, OSAV4};
  char arg1[MAX_STRING_LENGTH];
  int  dis_num;                            /* display lines requested     */
  int  op_num = 0;                         /* num of operands on cmd line */
  int  sor_ind  = OVNUM;                   /* sort indicator              */
  bool or_sw    = FALSE;                   /* or search criteria          */
  bool sor_dir  = 1;                       /* sort indicator              */
  bool np_sw    = FALSE;                   /* no players                  */
  bool nm_sw    = FALSE;                   /* no mobs                     */
  bool ng_sw    = FALSE;                   /* no ground objs              */
  bool do_sw    = FALSE;                   /* display operand table       */
  bool d2_sw    = FALSE;                   /* alternate display format    */

  go_init();                              /* initialize data structures  */
  argument = one_argument (argument, arg1);
  if ( !*arg1 )
    {
      pager_printf(ch, "Syntax: ogrub <num of lines> <sort order> [keywords] [operands].\r\n");
      return;
    }
  if ( isdigit(*arg1) )        /* first arg is number of display lines   */
    dis_num = atoi(arg1);
  else
    {
      pager_printf(ch, "You did not specify the number of display lines.\r\n");
      return;
    }
  if ( dis_num > MAX_DISPLAY_LINES )
    {
      pager_printf(ch, "Sorry. You have requested more than %d display "
                   "lines.\r\n", MAX_DISPLAY_LINES);
      return;
    }

  argument = one_argument (argument, arg1);
  while ( *arg1 )                      /* build the operand table        */
    {
      if ( op_num >= MAX_NUM_OPS )
        {
          pager_printf(ch, "Sorry. You have entered more than %d operands.\r\n",
                       MAX_NUM_OPS, MAX_NUM_OPS );
          return;
        }
      if ( !go_parse_operand (ch, arg1, &op_num, &sor_ind, &sor_dir,
                              &or_sw, &np_sw, &nm_sw, &ng_sw, &do_sw, &d2_sw ) )
        return;
      argument = one_argument (argument, arg1);
    }
  if (op_num <= 0)
    {
      pager_printf(ch, "Sorry. You did not include any valid operands.\r\n");
      return;
    }
  if ( do_sw )
    display_operand_table (ch, op_num);

  if ( !go_read(ch, dis_num, op_num, sor_ind,          /* future expansion*/
                sor_dir, or_sw, np_sw, nm_sw, ng_sw, d2_sw) )
    return;
}

char *gr_strc (char c)           /* convert a char to a str */
{
  static char s[2] = "s";
  s[0]=c;
  return s;
}

/*
 * Evaluate one input record to see if it matches all search criteria
 */
static bool gr_eval_and (GR_STRUCT r, int op_num)
{
  int cou;

  for (cou=0; cou<op_num; cou++)
    {
      switch (gr_op[cou].field)
        {
        case name:
          if ( !go_eval_str (r.name, gr_op[cou].op, gr_op[cou].sval) )
            return FALSE;
          else break;
        case sex:
          if ( !go_eval_num (r.sex, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case pclass:
          if ( !go_eval_num (r.pclass, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case race:
          if ( !go_eval_num (r.race, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case level:
          if ( !go_eval_num (r.level, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case room:
          if ( !go_eval_num (r.room, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case gold:
          if ( !go_eval_num (r.gold, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case clan:
          if ( !go_eval_num (r.clan, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case council:
          if ( !go_eval_num (r.council, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case site:
          if ( !go_eval_str (r.site, gr_op[cou].op, gr_op[cou].sval) )
            return FALSE;
          else break;
        case last:
          if ( !go_eval_num (r.last, gr_op[cou].op, gr_op[cou].nval) )
            return FALSE;
          else break;
        case pkill:
          if ( !go_eval_str (gr_strc(r.pkill), gr_op[cou].op, gr_op[cou].sval) )
            return FALSE;
          else break;
        }
    }
  return TRUE;
}

/*
 * Evaluate one input record to see if it matches any search criteria
 */
static bool gr_eval_or (GR_STRUCT r, int op_num)
{
  int cou;

  for (cou=0; cou<op_num; cou++)
    {
      switch (gr_op[cou].field)
        {
        case name:
          if ( go_eval_str (r.name, gr_op[cou].op, gr_op[cou].sval) )
            return TRUE;
          else break;
        case sex:
          if ( go_eval_num (r.sex, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case pclass:
          if ( go_eval_num (r.pclass, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case race:
          if ( go_eval_num (r.race, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case level:
          if ( go_eval_num (r.level, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case room:
          if ( go_eval_num (r.room, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case gold:
          if ( go_eval_num (r.gold, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case clan:
          if ( go_eval_num (r.clan, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case council:
          if ( go_eval_num (r.council, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case site:
          if ( go_eval_str (r.site, gr_op[cou].op, gr_op[cou].sval) )
            return TRUE;
          else break;
        case last:
          if ( go_eval_num (r.last, gr_op[cou].op, gr_op[cou].nval) )
            return TRUE;
          else break;
        case pkill:
          if ( go_eval_str (gr_strc(r.pkill), gr_op[cou].op, gr_op[cou].sval) )
            return TRUE;
          else break;

        }
    }
  return FALSE;
}

static void gr_init (void)
{
  strcpy(gr_fd[ 0].nam, "name"   ); gr_fd[0].num=FALSE;
  strcpy(gr_fd[ 1].nam, "sex"    ); gr_fd[ 1].num=TRUE;
  strcpy(gr_fd[ 2].nam, "class"  ); gr_fd[ 2].num=TRUE;
  strcpy(gr_fd[ 3].nam, "race"   ); gr_fd[ 3].num=TRUE;
  strcpy(gr_fd[ 4].nam, "level"  ); gr_fd[ 4].num=TRUE;
  strcpy(gr_fd[ 5].nam, "room"   ); gr_fd[ 5].num=TRUE;
  strcpy(gr_fd[ 6].nam, "gold"   ); gr_fd[ 6].num=TRUE;
  strcpy(gr_fd[ 7].nam, "clan"   ); gr_fd[ 7].num=TRUE;
  strcpy(gr_fd[ 8].nam, "council"); gr_fd[ 8].num=TRUE;
  strcpy(gr_fd[ 9].nam, "site"   ); gr_fd[ 9].num=FALSE;
  strcpy(gr_fd[10].nam, "last"   ); gr_fd[10].num=TRUE;
  strcpy(gr_fd[11].nam, "pkill"  ); gr_fd[11].num=FALSE;
}

/*
 *  Store operand's operator and value in operand table.
 */
static bool gr_parse_operator (CHAR_DATA *ch, const char *pch, int *op_num)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};
  int  cou;
  const char opstr [7][3] = { "=", "!=", "<>", ">=", ">", "<=", "<" };

  gr_op[*op_num].op = -1;
  for (cou=0; cou<7; cou++)
    if ( !str_prefix(opstr[cou], pch) )
      {
        gr_op[*op_num].op = cou;
        break;
      }

  if ( gr_op[*op_num].op < 0 )
    {ch_printf(ch, "Invalid operator: %s\r\n", pch); return FALSE;}

  if ( gr_op[*op_num].op==EQ || gr_op[*op_num].op==LT
       || gr_op[*op_num].op==GT )
    pch++;
  else pch+=2;                               /* advance to operand value */

  if ( *pch=='\0' )
    {ch_printf(ch, "Value is missing from operand.\r\n"); return FALSE;}

  if ( gr_fd[gr_op[*op_num].field].num )
    {
      gr_op[*op_num].num  = TRUE;
      gr_op[*op_num].nval = atol (pch);   /* store num operand value in table */
    }
  else
    {
      if ( strlen(pch) > MAX_FIELD_LENGTH )
        {ch_printf(ch, "Char string is too long:%s\r\n", pch); return FALSE;}
      gr_op[*op_num].num  = FALSE;
      strcpy (gr_op[*op_num].sval, pch);  /* store str operand value in table */
    }
  (*op_num)++;                         /* operand now stored in table      */
  return TRUE;
}

/*
 * Store operand's field name in the operand table.
 */
static bool gr_parse_operand (CHAR_DATA *ch, const char *arg, bool *or_sw, int *op_num)
{
  int cou;

  if ( !str_cmp(arg, "or") )
    return *or_sw = TRUE;

  for (cou=1; cou<=GR_NUM_FIELDS; cou++)          /* check field name    */
    if ( !str_prefix( gr_fd[cou-1].nam, arg ) )
      {
        arg += strlen( gr_fd[ cou-1 ].nam );     /* advance to operator */
        gr_op[ *op_num ].field = cou-1;          /* store field name    */
        if ( !gr_parse_operator (ch, arg, op_num) )
          return FALSE;
        return TRUE;
      }
  ch_printf(ch, "Sorry. Invalid field name: %s\r\n", arg);
  return FALSE;
}

/*
 * Read the input file to select records matching the search criteria
 */
static void gr_read( CHAR_DATA *ch, int op_num, bool or_sw, int dis_num)
{
  FILE *fp;
  bool res;                                 /* result of a boolean exp   */
  bool title_sw = FALSE;                    /* only print title once     */
  int  tot_match = 0;                       /* total records matched     */
  GR_STRUCT r;                              /* input (physical record)   */
  const char sex_map[]   = "NMF";                     /* convert sex to text       */
  const char class_map[] = "MCTWVDRAPN";              /* convert class to text     */
  const char race_map[][3] =                          /* convert race to text      */
    {"Hu", "El", "Dw", "Ha", "Px", "Va", "Og", "HO", "HT", "HE", "Gi",
     "Dr", "SE", "Li", "Gn"};
  const char clan_map[][4] = {
    "   ", "Gui", "DS ", "MS ", "RB ", "AR ", "Bru", "Las","Nos", "Tre",
    "Ven", "Inc", "Baa", "Rol"};
  const char council_map[][4] =
    {"   ", "CoE", "MC ", "NC ", "Pro", "PK ", "QC ", "Neo", "Cod", "AC ",
     "Sym", "VC "};

#ifdef WIN32
  if ( ( fp = fopen( "\\smaug\\grub.dat", "rb") ) == NULL )
#else
    if ( ( fp = fopen( "~/swr/grub.new", "r" ) ) == NULL )
#endif
      return;
  fread( &r, sizeof(r), 1, fp);
  while ( !feof(fp) )                       /* read each input record    */
    {
      if ( or_sw )                           /* is this an "or" search?   */
        res = gr_eval_or( r, op_num );
      else res = gr_eval_and( r, op_num );
      if ( res )                             /* record is a match         */
        {
          tot_match++;
          if ( !title_sw && dis_num > 0 )     /* print title if applicable */
            {
              ch_printf(ch,
                        "\r\n%-12s %-2s %1s %-2s %1s %3s %3s %5s %11s %-15s %-6s %s\r\n",
                        "Name", "Lv", "S", "R", "C", "Cln", "Cou", "Room", "Gold",
                        "Site", "Last", "Pk");
              title_sw = TRUE;
            }
          if ( tot_match <= dis_num )         /* print record if applicable */
            ch_printf(ch,
                      "%-12s %2hd %c %2s %c %3s %3s %5hd %11ld %-15s %6lu %c\r\n",
                      r.name, r.level, sex_map[(unsigned char) r.sex],
                      race_map[(unsigned char) r.race],
		      class_map[(unsigned char) r.pclass],
                      clan_map[(unsigned char) r.clan],
                      council_map[(unsigned char) r.council],
                      r.room, r.gold, r.site, r.last, r.pkill);
        }
      fread( &r, sizeof(r), 1, fp);
    }
  fclose (fp);
  if (tot_match == 0 )
    ch_printf(ch, "Zero matches were found.\r\n");
  else ch_printf(ch, "%5d matches in total\r\n", tot_match);
}

/*
 * GRUB (Gorog's Revenge on Unruly Bastards)
 *
 * This command is used by mud administrators to obtain info from the
 * player files - often to deal with unruly problem players.
 *
 * It works in two phases. The first phase processes the command line
 * entered by the user and stores each operand in an operand table.
 * Each entry in this table contains the field to be compared, the
 * the operation to be performed and the value to be compared to the
 * record's value.
 *
 * The second phase reads each input record - one record for each player.
 * It then compares the appropriate values from the input record to
 * each operand in the operand table.
 */
void do_grub (CHAR_DATA *ch, char *argument)
{
  char arg1[MAX_STRING_LENGTH];
  bool or_sw = FALSE;                       /* or search criteria           */
  int  dis_num;                             /* display lines requested      */
  int  op_num = 0;                          /* num of operands on cmd line  */

  gr_init();                                /* initialize data structures   */
  argument = one_argument (argument, arg1);
  if ( !*arg1 )
    {
      ch_printf(ch, "Syntax <max results> [keywords] [operands].\r\n");
      return;
    }
  if ( isdigit(*arg1) )        /* first argument is number of display lines */
    dis_num = atoi( arg1 );
  else
    {
      ch_printf(ch, "You did not specify the number of display lines.\r\n");
      return;
    }

  argument = one_argument (argument, arg1);
  while ( *arg1 )
    {                                           /* build the operand table */
      if ( !gr_parse_operand (ch, arg1, &or_sw, &op_num) )
        return;
      argument = one_argument (argument, arg1);
    }
  /*display_operand_table (op_num);*/
  gr_read( ch, op_num, or_sw, dis_num );      /* read the input file     */
}


/*
 * The "showlayers" command is used to list all layerable eq in the
 * mud so that we can keep track of it. It lists one line for each
 * piece of unique eq. If there are 1,000 shrouds in the game, it
 * doesn't list 1,000 lines for each shroud - just one line for the shroud.
 */

void do_showlayers( CHAR_DATA *ch, char *argument )
{
  OBJ_INDEX_DATA *pObj;
  char arg1[MAX_STRING_LENGTH];

  int hash;                                           /* hash counter */
  int cou = 0;                                        /* display counter */
  int display_limit;                                  /* display limit */

  argument = one_argument (argument, arg1);

  if ( !*arg1 )
    {
      send_to_char( "Syntax:\r\n", ch);
      send_to_char( "showlayers n  -  display maximum of n lines.\r\n", ch);
      return;
    }

  display_limit = atoi(arg1);
  pager_printf(ch, "      Vnum      Wear Layer   Description \r\n");
  for (hash = 0; hash < MAX_KEY_HASH; hash++) /* loop thru obj_index_hash */
    if ( obj_index_hash[hash] )
      for (pObj=obj_index_hash[hash]; pObj; pObj=pObj->next)
        if (pObj->layers > 0)
          {
            if (++cou <= display_limit)
              pager_printf(ch, "%4d&R&w %5d&R&w %9d&R&w %5d&R&w   %s&R&w\r\n",
                           cou, pObj->vnum, pObj->wear_flags, pObj->layers,
                           pObj->short_descr);
          }
}

/*
 * Sorts the arrays "vnums" and "count" based on the order in "count"
 */
static void zero_sort( int *vnums, int *count, int left, int right )
{
  int i=left, j=right, swap, test;
  test = count[(left + right) / 2];
  do {
    while (count[i] > test) i++;
    while (test > count[j]) j--;
    if (i <= j) {
      swap=count[i]; count[i] = count[j]; count[j] = swap;
      swap=vnums[i]; vnums[i] = vnums[j]; vnums[j] = swap;
      i++; j--;
    }
  }
  while (i <= j);
  if (left < j)  zero_sort (vnums, count, left, j);
  if (i < right) zero_sort (vnums, count, i, right);
}

static void diag_visit_obj( CHAR_DATA *ch, OBJ_DATA *obj )
{
  pager_printf(ch, "***obj=%s\r\n", obj->name );

  if ( obj->first_content )
    {
      diag_visit_obj( ch, obj->first_content );
      if ( obj->next_content )
        diag_visit_obj( ch, obj->next_content );
    }
  else
    if ( obj->next_content )
      diag_visit_obj( ch, obj->next_content );
    else
      return;
}

/*
 * Sort function used by diagnose "rf" to sort integers
 */

static int diag_int_comp(const void *i, const void *j)
{
  return *(int*)i - *(int*)j;
}

/*
 * Displays the help screen for the "diagnose" command
 */
static void diagnose_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "diagnose of n  -  object frequency top n objects\r\n", ch );
  send_to_char( "diagnose zero  -  count objects with zero weight\r\n", ch );
  send_to_char( "diagnose zero n - list n objects with zero weight\r\n", ch );
  send_to_char( "diagnose rf n lo hi - room flag search.\r\n"
                "   list room vnums between lo and hi that match n.\r\n", ch );
  send_to_char( "   e.g. diagnose rf 6 901 969 - list all rooms in Olympus\r\n"
                "      that are nomob and deathtraps.\r\n", ch );
  send_to_char( "   e.g. diagnose rf 2 - list all deathtraps.\r\n", ch );
  send_to_char( "diagnose mrc num racevnum1 vnum2 - mobs/race/class\r\n"
                "   display all mobs of a particular race/class combo.\r\n"
                "   e.g. diagnose mrc 50 0 3 7500 7534 - show 50 human warriors "
                " in Edo.\r\n", ch);
}

/*
 * Takes an object vnum and the count of the number of times
 * that object occurs and decides whether or not to include it in the
 * frequency table which contains the "top n" frequently occurring objects.
 */

static void diag_ins (OBJ_INDEX_DATA *p, int siz, OBJ_INDEX_DATA **f, CHAR_DATA *ch)
{
  int  cou =  0;                             /* temporary counter */
  int  ins = -1;                             /* insert pos in dynamic f array */

  if (!f[siz-1] || p->count>f[siz-1]->count) /* don't bother looping thru f */
    while ( cou<siz && ins<0 )              /* should this vnum be insertted? */
      if ( !f[cou++] || p->count > f[cou-1]->count )
        ins = cou-1;                      /* needs to go into pos "cou" */

  if ( ins>=0 )                              /* if vnum occurs more frequently */
    {
      for (cou = siz-1; cou > ins; cou--)     /* open a slot in the table */
        f[cou] = f[cou-1];
      f[ins] = p;                             /* insert pointer in empty slot */
    }
}

/*
 * The "diagnose" command is designed to be expandable and take different
 * parameters to handle different diagnostic routines.
 */

void do_diagnose( CHAR_DATA *ch, char *argument )
{
#define   DIAG_MAX_SIZE  1000
  OBJ_INDEX_DATA *pObj;
  OBJ_INDEX_DATA **freq;                        /* dynamic array of pointers */
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char arg4 [MAX_INPUT_LENGTH];
  char arg5 [MAX_INPUT_LENGTH];
  char arg6 [MAX_INPUT_LENGTH];
  int   num = 20;                               /* display lines requested */
  int   cou;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg4 );
  argument = one_argument( argument, arg5 );
  argument = one_argument( argument, arg6 );

  if (!*arg1) {                                 /* empty arg gets help screen */
    diagnose_help(ch);
    return;
  }

  if ( !str_cmp(arg1, "time") )
    {
      struct tm *t = localtime(&current_time);

      pager_printf( ch, "mon=%d day=%d hh=%d mm=%d\r\n",
                    t->tm_mon+1, t->tm_mday, t->tm_hour, t->tm_min);
      return;
    }

  if (!str_cmp(arg1, "rf"))
    {
#define DIAG_RF_MAX_SIZE 5000
      ROOM_INDEX_DATA *pRoom;
      int match, lo, hi, hit_cou, vnum[DIAG_RF_MAX_SIZE];

      if (!*arg2)                                   /* empty arg gets help scrn */
        {
          diagnose_help(ch);
          return;
        }
      else match = atoi (arg2);

      hit_cou = 0;                                 /* number of vnums found */
      lo = (*arg3) ? atoi (arg3) : 0;
      hi = (*arg4) ? atoi (arg4) : MAX_VNUM;

      ch_printf (ch, "\r\nRoom Vnums\r\n");
      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( room_index_hash[cou] )
            for (pRoom = room_index_hash[cou]; pRoom; pRoom = pRoom->next)
              {
                if (pRoom->vnum >= lo && pRoom->vnum <= hi)
                  {
                    if ( match == (match & pRoom->room_flags)
                         && hit_cou < DIAG_RF_MAX_SIZE)
                      vnum[hit_cou++] = pRoom->vnum;
                  }
              }
        }
      qsort(vnum, hit_cou, sizeof(int), diag_int_comp);      /* sort vnums    */
      for (cou=0; cou<hit_cou; cou++)
        ch_printf (ch, "%5d %6d\r\n", cou+1, vnum[cou]);   /* display vnums */
      return;
    }

  if (!str_cmp(arg1, "of")) {
    if (*arg2)                                    /* empty arg gets dft number */
      num = atoi (arg2);
    if (num > DIAG_MAX_SIZE  || num < 1) {        /* display num out of bounds */
      diagnose_help(ch);
      return;
    }
    CREATE(freq, OBJ_INDEX_DATA *, num);           /* dynamic freq array */
    for (cou = 0; cou < num; cou++)                /* initialize freq array */
      freq[cou] = NULL;                          /* to NULL pointers */
    for (cou = 0; cou < MAX_KEY_HASH; cou++) {     /* loop thru obj_index_hash */
      if ( obj_index_hash[cou] )                 /* safety check */
        for (pObj=obj_index_hash[cou];          /* loop thru all pObjInd */
             pObj; pObj=pObj->next)
          diag_ins (pObj, num, freq, ch);    /* insert pointer into list */
    }
    ch_printf (ch, "\r\nObject Frequencies\r\n");  /* send results to char */
    for (cou = 0; cou < num && freq[cou]; cou++)
      ch_printf(ch, "%3d%8d%8d\r\n", cou+1,freq[cou]->vnum,freq[cou]->count);
    DISPOSE(freq);
    return;
  }

  if (!str_cmp(arg1, "mm")) {
    DESCRIPTOR_DATA *d;
    CHAR_DATA *victim;

    if ( !*arg2 )
      return;

    if ( get_trust(ch) < LEVEL_SUB_IMPLEM )
      return;

    if ( ( victim = get_char_world( ch, arg2 ) ) == NULL )
      {
        send_to_char( "Not here.\r\n", ch );
        return;
      }

    if ( !victim->desc )
      {
        send_to_char( "No descriptor.\r\n", ch );
        return;
      }

    if ( victim == ch )
      {
        send_to_char( "Cancelling.\r\n", ch );
        for ( d = first_descriptor; d; d = d->next )
          if ( d->snoop_by == ch->desc )
            d->snoop_by = NULL;
        return;
      }

    if ( victim->desc->snoop_by )
      {
        send_to_char( "Busy.\r\n", ch );
        return;
      }

    if ( get_trust( victim ) >= get_trust( ch ) )
      {
        send_to_char( "Busy.\r\n", ch );
        return;
      }

    victim->desc->snoop_by = ch->desc;
    send_to_char( "Ok.\r\n", ch );
    return;
  }

  if (!str_cmp(arg1, "zero"))
    {
#define ZERO_MAX   1500
      int vnums[ZERO_MAX];
      int count[ZERO_MAX];
      int zero_obj_ind = 0;                        /* num of obj_ind's with 0 wt */
      int zero_obj     = 0;                        /* num of objs with 0 wt */
      int zero_num     = -1;                       /* num of lines requested */

      if (*arg2)
        zero_num = atoi (arg2);
      for (cou = 0; cou < MAX_KEY_HASH; cou++)     /* loop thru obj_index_hash */
        if ( obj_index_hash[cou] )
          for (pObj=obj_index_hash[cou]; pObj; pObj=pObj->next)
            if (pObj->weight == 0) {
              zero_obj_ind++;
              zero_obj += pObj->count;
              if (zero_obj_ind <= ZERO_MAX) {
                vnums[zero_obj_ind - 1] = pObj->vnum;
                count[zero_obj_ind - 1] = pObj->count;
              }
            }
      if (zero_num > 0) {
        zero_sort (vnums, count, 0, zero_obj_ind - 1);
        zero_num = UMIN (zero_num, ZERO_MAX);
        zero_num = UMIN (zero_num, zero_obj_ind);
        for (cou=0; cou<zero_num; cou++)
          ch_printf (ch, "%6d %6d %6d\r\n",
                     cou+1, vnums[cou], count[cou]);
      }
      ch_printf (ch, "%6d %6d\r\n", zero_obj_ind, zero_obj);
      return;
    }

  if (!str_cmp(arg1, "visit"))
    {
      diag_visit_obj( ch, ch->first_carrying);
      return;
    }


  if (!str_cmp(arg1, "xxxobxxx"))
    {
      OBJ_DATA       *po, *pt = NULL;
      int            i=0;
      char           buf[MAX_STRING_LENGTH];

      ch_printf(ch, "CHAR name=%s \r\n", ch->name);
      strcpy(buf, ch->first_carrying ? ch->first_carrying->name : "NULL");
      ch_printf(ch, "   first_carry=%s\r\n", buf);
      strcpy(buf, ch->last_carrying ? ch->last_carrying->name : "NULL");
      ch_printf(ch, "   last_carry=%s\r\n", buf);

      /*
        for (pa=ch->first_affect; pa; pa=pa->next)
        ch_printf(ch,
        "   type=%d duration=%d location=%d modifier=%d bitvector=%d\r\n",
        pa->type, pa->duration, pa->location, pa->modifier, pa->bitvector);
      */

      for (po=first_object; po; po=po->next)
        {
          i++;
          pt=NULL;
          if ( !po->carried_by && !po->in_obj ) continue;
          if ( !po->carried_by )
            {
              pt = po;
              while( pt->in_obj )           /* could be in a container on ground */
                pt=pt->in_obj;
            }
          if ( ch==po->carried_by || (pt && ch==pt->carried_by) )
            {
              ch_printf(ch, "\r\n%d OBJ name=%s \r\n", i, po->name);
              strcpy(buf, po->next_content ? po->next_content->name : "NULL");
              ch_printf(ch, "   next_content=%s\r\n", buf);
              strcpy(buf, po->prev_content ? po->prev_content->name : "NULL");
              ch_printf(ch, "   prev_content=%s\r\n", buf);
              strcpy(buf, po->first_content ? po->first_content->name : "NULL");
              ch_printf(ch, "   first_content=%s\r\n", buf);
              strcpy(buf, po->last_content ? po->last_content->name : "NULL");
              ch_printf(ch, "   last_content=%s\r\n", buf);
            }
        }
      return;
    }

  if (!str_cmp(arg1, "mrc"))
    {
      MOB_INDEX_DATA *pm;
      short race_num, dis_num, vnum1, vnum2, dis_cou = 0;

      if ( !*arg2 || !*arg3 || !*arg4 || !*arg5
           ||  !isdigit(*arg2) || !isdigit(*arg3) || !isdigit(*arg4)
           ||  !isdigit(*arg5))
        {
          send_to_char( "Sorry. Invalid format.\r\n\r\n", ch);
          diagnose_help(ch);
          return;
        }
      dis_num  = UMIN(atoi (arg2), DIAG_MAX_SIZE);
      race_num     = atoi (arg3);
      vnum1    = atoi (arg4);
      vnum2    = atoi (arg5);
      /*
        ch_printf(ch, "dis_num=%d race=%d class=%d vnum1=%d vnum2=%d\r\n",
        dis_num, race, class, vnum1, vnum2);
      */
      send_to_char("\r\n", ch);

      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( mob_index_hash[cou] )
            for (pm = mob_index_hash[cou]; pm; pm = pm->next)
              {
                if ( pm->vnum >= vnum1 && pm->vnum <= vnum2
                     &&   pm->race==race_num && dis_cou++ < dis_num )
                  pager_printf( ch, "%5d %s\r\n", pm->vnum, pm->player_name );
              }
        }
      return;
    }

  diagnose_help( ch );
}
