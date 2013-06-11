#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "grub.h"
#include "character.h"

static struct operand_struct go_op[MAX_NUM_OPS];
static struct field_struct go_fd[GO_NUM_FIELDS];

static void go_init (void);
static void display_operand_table (Character *ch, int op_num);
static bool go_parse_operand (Character *ch, const char *arg, int *op_num, int *sor_ind,
			      bool *sor_dir, bool *or_sw, bool *np_sw, bool *nm_sw, bool *ng_sw,
			      bool *do_sw, bool *d2_sw);
static int go_fnam_to_num( const char *arg );
static bool go_parse_operator (Character *ch, const char *pch, int *op_num);
static int owear_to_num (const char *arg);
static bool go_read( Character *ch, int dis_num, int op_num, int sor_ind,
                     bool sor_dir, bool or_sw, bool np_sw, bool nm_sw, bool ng_sw,
                     bool d2_sw );
static short go_wear_ext (long arg);
static void go_sort( const Character *ch, GO_STRUCT **p,
                     int ind, int left, int right, bool n_s, bool sor_dir );
static void go_accum_aff (GO_STRUCT *r, int loc, int mod);
static bool go_eval_and (Character *ch, GO_STRUCT *r, int op_num);
static bool go_eval_or (Character *ch, GO_STRUCT *r, int op_num);
static void go_display( Character *ch, int dis_num, int tot_match, bool d2_sw, GO_STRUCT **p);
static const char *go_otype_to_disp (int arg);
static const char *owear_to_disp (short arg);
static bool go_read_names( Character *ch, OBJ_DATA *po, GO_STRUCT *r, bool np_sw,
                           bool nm_sw, bool ng_sw );

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

void do_ogrub (Character *ch, char *argument)
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

static void display_operand_table (Character *ch, int op_num)
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
 * Store operand's field name in the operand table.
 */
static bool go_parse_operand (Character *ch, const char *arg, int *op_num, int *sor_ind,
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

static int go_fnam_to_num( const char *arg )
{
  int cou;

  for (cou=0; cou<GO_NUM_FIELDS; cou++)
    if ( !str_cmp(arg, go_fd[cou].nam) )
      return cou;
  return -1;
}

/*
 *  Store operand's operator and value in operand table.
 */
static bool go_parse_operator (Character *ch, const char *pch, int *op_num)
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

static bool go_read( Character *ch, int dis_num, int op_num, int sor_ind,
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

static short go_wear_ext (long arg)    /* extract bit set in arg ignoring pos 1 */
{
  short cou;

  if ( arg <= 1 ) return arg;

  for (cou=1; cou<=31; cou++)
    if ( arg & ( (unsigned long) 1 << cou ) )
      return cou + 1;

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
static void go_sort( const Character *ch, GO_STRUCT **p,
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

/*
 * Evaluate one input record to see if it matches all search criteria
 */
static bool go_eval_and (Character *ch, GO_STRUCT *r, int op_num)
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
static bool go_eval_or (Character *ch, GO_STRUCT *r, int op_num)
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

static void go_display( Character *ch, int dis_num, int tot_match, bool d2_sw,
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

/*
 * Find the name of the character and object and place in record
 * The name of the object is easy ... but the name of the character
 * proved to be one of the most difficult and frustrating aspects ot
 * this function. F.Y.I - if an object is not "carried_by" someone,
 * it could be on the ground ... but ... growl ... it could also be
 * in a container carried by someone - or in a container on the ground.
 */
static bool go_read_names( Character *ch, OBJ_DATA *po, GO_STRUCT *r, bool np_sw,
                           bool nm_sw, bool ng_sw )
{
  enum {CNAME, ONAME};
  OBJ_DATA *pt;
  const char *ground = "(none)";
  const char *ack    = "(error in data structure)";

  r->s[ONAME] = ( po->name ) ? po->name : ack;  /* set object name */

  if ( po->carried_by )                  /* it's being carried by a char */
    {
      if ( GetTrustedLevel(ch) < po->carried_by->top_level ) return FALSE;
      if ( nm_sw &&  IsNpc(po->carried_by) ) return FALSE;
      if ( np_sw && !IsNpc(po->carried_by) ) return FALSE;
      r->s[CNAME] = po->carried_by->name;
    }
  else if ( po->in_obj )                 /* it's in a container          */
    {
      pt = po;
      while( pt->in_obj )
        pt=pt->in_obj;
      if ( pt->carried_by && GetTrustedLevel(ch) < pt->carried_by->top_level )
        return FALSE;
      if ( pt->carried_by && nm_sw &&  IsNpc(pt->carried_by) )
        return FALSE;
      if ( pt->carried_by && np_sw && !IsNpc(pt->carried_by) )
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
