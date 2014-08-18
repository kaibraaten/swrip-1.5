#include "mud.h"

static void mpfind_help (Character *ch);

/*
 * Search mobs for mob progs containing a specified text string.
 */
void do_mpfind( Character *ch, char *argument )   /* Gorog */
{
  ProtoMobile  *   pMob;
  MPROG_DATA      *   pProg;
  char                arg1 [MAX_INPUT_LENGTH];
  char                arg2 [MAX_INPUT_LENGTH];
  char                arg3 [MAX_INPUT_LENGTH];
  int                 lo_vnum=1, hi_vnum=32767;
  int                 tot_vnum, tot_hits=0;
  int                 i, disp_cou=0, disp_limit;

  argument = OneArgument( argument, arg1 );   /* display_limit */
  argument = OneArgument( argument, arg2 );

  if ( arg1[0]=='\0' || arg2[0]=='\0' || !IsNumber(arg1) )
    {
      mpfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = umax(0, disp_limit);

  if ( StrCmp(arg2, "mud") )
    {
      argument = OneArgument( argument, arg3 );
      if ( arg3[0]=='\0' || !IsNumber(arg2) || !IsNumber(arg3) )
        {
	  mpfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = urange(1, atoi(arg2), 32767);
          hi_vnum = urange(1, atoi(arg3), 32767);
          if ( lo_vnum > hi_vnum )
            {
              mpfind_help(ch);
              return;
            }
        }
    }
  if ( argument[0] == '\0' )
    {
      mpfind_help(ch);
      return;
    }

  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pMob=get_mob_index(i)) && (pProg=pMob->mprog.mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->next)
            tot_vnum += CountStringOccurances(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            pager_printf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  pager_printf( ch, "Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "mpfind" command
 */
static void mpfind_help (Character *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "mpfind n lo_vnum hi_vnum text \r\n"
                "   Search mob vnums between lo_vnum and hi_vnum \r\n"
                "   for mob progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  send_to_char( "mpfind n mud text \r\n"
                "   Search all the mobs in the mud for\r\n"
                "   mob progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  send_to_char( "Example:\r\n", ch);
  send_to_char( "mpfind 20 901 969 if isnpc \r\n"
                "   Search all mob progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all mobs that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  send_to_char( "Example:\r\n", ch);
  send_to_char( "mpfind 100 mud mpslay \r\n"
                "   Search all mob progs in the entire mud\r\n"
                "   and display all mobs that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}
