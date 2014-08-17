#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "grub.h"

static struct operand_struct gr_op[MAX_NUM_OPS];
static struct field_struct gr_fd[GR_NUM_FIELDS];

static char *gr_strc (char c);
static bool gr_eval_and (GR_STRUCT r, int op_num);
static bool gr_eval_or (GR_STRUCT r, int op_num);
static bool gr_parse_operator (Character *ch, const char *pch, int *op_num);
static void gr_init (void);
static bool gr_parse_operand (Character *ch, const char *arg, bool *or_sw, int *op_num);
static void gr_read( Character *ch, int op_num, bool or_sw, int dis_num);

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
void do_grub (Character *ch, char *argument)
{
  char arg1[MAX_STRING_LENGTH];
  bool or_sw = false;                       /* or search criteria           */
  int  dis_num;                             /* display lines requested      */
  int  op_num = 0;                          /* num of operands on cmd line  */

  gr_init();                                /* initialize data structures   */
  argument = OneArgument (argument, arg1);
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

  argument = OneArgument (argument, arg1);
  while ( *arg1 )
    {                                           /* build the operand table */
      if ( !gr_parse_operand (ch, arg1, &or_sw, &op_num) )
        return;
      argument = OneArgument (argument, arg1);
    }
  /*display_operand_table (op_num);*/
  gr_read( ch, op_num, or_sw, dis_num );      /* read the input file     */
}

static char *gr_strc (char c)           /* convert a char to a str */
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
            return false;
          else break;
        case sex:
          if ( !go_eval_num (r.sex, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case pclass:
          if ( !go_eval_num (r.pclass, gr_op[cou].op, gr_op[cou].nval) )
	    return false;
          else break;
        case race:
          if ( !go_eval_num (r.race, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case level:
          if ( !go_eval_num (r.level, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case room:
          if ( !go_eval_num (r.room, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case gold:
          if ( !go_eval_num (r.gold, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case clan:
          if ( !go_eval_num (r.clan, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case council:
          if ( !go_eval_num (r.council, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case site:
          if ( !go_eval_str (r.site, gr_op[cou].op, gr_op[cou].sval) )
            return false;
          else break;
        case last:
          if ( !go_eval_num (r.last, gr_op[cou].op, gr_op[cou].nval) )
            return false;
          else break;
        case pkill:
          if ( !go_eval_str (gr_strc(r.pkill), gr_op[cou].op, gr_op[cou].sval) )
            return false;
          else break;
        }
    }
  return true;
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
            return true;
          else break;
        case sex:
          if ( go_eval_num (r.sex, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case pclass:
          if ( go_eval_num (r.pclass, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case race:
          if ( go_eval_num (r.race, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case level:
          if ( go_eval_num (r.level, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case room:
          if ( go_eval_num (r.room, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case gold:
          if ( go_eval_num (r.gold, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case clan:
          if ( go_eval_num (r.clan, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case council:
          if ( go_eval_num (r.council, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
	case site:
          if ( go_eval_str (r.site, gr_op[cou].op, gr_op[cou].sval) )
            return true;
          else break;
        case last:
          if ( go_eval_num (r.last, gr_op[cou].op, gr_op[cou].nval) )
            return true;
          else break;
        case pkill:
          if ( go_eval_str (gr_strc(r.pkill), gr_op[cou].op, gr_op[cou].sval) )
            return true;
          else break;

        }
    }
  return false;
}

static void gr_init (void)
{
  strcpy(gr_fd[ 0].nam, "name"   ); gr_fd[0].num=false;
  strcpy(gr_fd[ 1].nam, "sex"    ); gr_fd[ 1].num=true;
  strcpy(gr_fd[ 2].nam, "class"  ); gr_fd[ 2].num=true;
  strcpy(gr_fd[ 3].nam, "race"   ); gr_fd[ 3].num=true;
  strcpy(gr_fd[ 4].nam, "level"  ); gr_fd[ 4].num=true;
  strcpy(gr_fd[ 5].nam, "room"   ); gr_fd[ 5].num=true;
  strcpy(gr_fd[ 6].nam, "gold"   ); gr_fd[ 6].num=true;
  strcpy(gr_fd[ 7].nam, "clan"   ); gr_fd[ 7].num=true;
  strcpy(gr_fd[ 8].nam, "council"); gr_fd[ 8].num=true;
  strcpy(gr_fd[ 9].nam, "site"   ); gr_fd[ 9].num=false;
  strcpy(gr_fd[10].nam, "last"   ); gr_fd[10].num=true;
  strcpy(gr_fd[11].nam, "pkill"  ); gr_fd[11].num=false;
}

/*
 *  Store operand's operator and value in operand table.
 */
static bool gr_parse_operator (Character *ch, const char *pch, int *op_num)
{
  enum op_type {EQ, NE, SU, GE, GT, LE, LT};
  int  cou;
  const char opstr [7][3] = { "=", "!=", "<>", ">=", ">", "<=", "<" };

  gr_op[*op_num].op = -1;
  for (cou=0; cou<7; cou++)
    if ( !StringPrefix(opstr[cou], pch) )
      {
        gr_op[*op_num].op = cou;
        break;
      }

  if ( gr_op[*op_num].op < 0 )
    {ch_printf(ch, "Invalid operator: %s\r\n", pch); return false;}

  if ( gr_op[*op_num].op==EQ || gr_op[*op_num].op==LT
       || gr_op[*op_num].op==GT )
    pch++;
  else pch+=2;                               /* advance to operand value */

  if ( *pch=='\0' )
    {ch_printf(ch, "Value is missing from operand.\r\n"); return false;}

  if ( gr_fd[gr_op[*op_num].field].num )
    {
      gr_op[*op_num].num  = true;
      gr_op[*op_num].nval = atol (pch);   /* store num operand value in table */
    }
  else
    {
      if ( strlen(pch) > MAX_FIELD_LENGTH )
        {ch_printf(ch, "Char string is too long:%s\r\n", pch); return false;}
      gr_op[*op_num].num  = false;
      strcpy (gr_op[*op_num].sval, pch);  /* store str operand value in table */
    }
  (*op_num)++;                         /* operand now stored in table      */
  return true;
}

/*
 * Store operand's field name in the operand table.
 */
static bool gr_parse_operand (Character *ch, const char *arg, bool *or_sw, int *op_num)
{
  int cou;

  if ( !StrCmp(arg, "or") )
    return *or_sw = true;

  for (cou=1; cou<=GR_NUM_FIELDS; cou++)          /* check field name    */
    if ( !StringPrefix( gr_fd[cou-1].nam, arg ) )
      {
        arg += strlen( gr_fd[ cou-1 ].nam );     /* advance to operator */
        gr_op[ *op_num ].field = cou-1;          /* store field name    */
        if ( !gr_parse_operator (ch, arg, op_num) )
          return false;
        return true;
      }
  ch_printf(ch, "Sorry. Invalid field name: %s\r\n", arg);
  return false;
}

/*
 * Read the input file to select records matching the search criteria
 */
static void gr_read( Character *ch, int op_num, bool or_sw, int dis_num)
{
  FILE *fp;
  bool res;                                 /* result of a boolean exp   */
  bool title_sw = false;                    /* only print title once     */
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
              title_sw = true;
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
