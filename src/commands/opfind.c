#include "mud.h"

static void opfind_help (CHAR_DATA *ch);

/*
 * Search objects for obj progs containing a specified text string.
 */
void do_opfind( CHAR_DATA *ch, char *argument )   /* Gorog */
{
  OBJ_INDEX_DATA  *   pObj;
  MPROG_DATA      *   pProg;
  char                arg1 [MAX_INPUT_LENGTH];
  char                arg2 [MAX_INPUT_LENGTH];
  char                arg3 [MAX_INPUT_LENGTH];
  int                 lo_vnum=1, hi_vnum=32767;
  int                 tot_vnum, tot_hits=0;
  int                 i, disp_cou=0, disp_limit;

  argument = one_argument( argument, arg1 );   /* display_limit */
  argument = one_argument( argument, arg2 );

  if ( arg1[0]=='\0' || arg2[0]=='\0' || !is_number(arg1) )
    {
      opfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = UMAX(0, disp_limit);

  if ( str_cmp(arg2, "mud") )
    {
      argument = one_argument( argument, arg3 );
      if ( arg3[0]=='\0' || argument[0]=='\0'
           ||   !is_number(arg2) || !is_number(arg3) )
	{
          opfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = URANGE(1, atoi(arg2), 32767);
          hi_vnum = URANGE(1, atoi(arg3), 32767);
          if ( lo_vnum > hi_vnum )
            {
              opfind_help(ch);
              return;
            }
        }
    }
  if ( argument[0] == '\0' )
    {
      opfind_help(ch);
      return;
    }

  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pObj=get_obj_index(i)) && (pProg=pObj->mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->next)
            tot_vnum += str_count(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            pager_printf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  pager_printf( ch, "Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "opfind" command
 */
static void opfind_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "opfind n lo_vnum hi_vnum text \r\n"
                "   Search obj vnums between lo_vnum and hi_vnum \r\n"
                "   for obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  send_to_char( "opfind n mud text \r\n"
                "   Search all the objs in the mud for\r\n"
                "   obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  send_to_char( "Example:\r\n", ch);
  send_to_char( "opfind 20 901 969 if isnpc \r\n"
                "   Search all obj progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all objects that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  send_to_char( "Example:\r\n", ch);
  send_to_char( "opfind 100 mud mpslay \r\n"
                "   Search all obj progs in the entire mud\r\n"
                "   and display all objects that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}
