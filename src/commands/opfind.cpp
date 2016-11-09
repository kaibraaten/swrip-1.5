#include "mud.hpp"

static void opfind_help (Character *ch);

/*
 * Search objects for obj progs containing a specified text string.
 */
void do_opfind( Character *ch, std::string argument )   /* Gorog */
{
  ProtoObject *pObj = NULL;
  MPROG_DATA *pProg = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  int lo_vnum = MIN_VNUM, hi_vnum = MAX_VNUM;
  int tot_vnum = 0, tot_hits = 0;
  int i = 0, disp_cou=0, disp_limit = 0;

  argument = OneArgument( argument, arg1 );   /* display_limit */
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || !IsNumber(arg1) )
    {
      opfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = umax(0, disp_limit);

  if ( StrCmp(arg2, "mud") )
    {
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg3 ) || IsNullOrEmpty( argument )
           || !IsNumber(arg2) || !IsNumber(arg3) )
	{
          opfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = urange(MIN_VNUM, atoi(arg2), MAX_VNUM);
          hi_vnum = urange(MIN_VNUM, atoi(arg3), MAX_VNUM);

          if ( lo_vnum > hi_vnum )
            {
              opfind_help(ch);
              return;
            }
        }
    }
  if ( IsNullOrEmpty( argument ) )
    {
      opfind_help(ch);
      return;
    }

  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pObj=GetProtoObject(i)) && (pProg=pObj->mprog.mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->Next)
            tot_vnum += CountStringOccurances(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            PagerPrintf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  PagerPrintf( ch, "Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "opfind" command
 */
static void opfind_help (Character *ch)
{
  SendToCharacter( "Syntax:\r\n", ch);
  SendToCharacter( "opfind n lo_vnum hi_vnum text \r\n"
                "   Search obj vnums between lo_vnum and hi_vnum \r\n"
                "   for obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  SendToCharacter( "opfind n mud text \r\n"
                "   Search all the objs in the mud for\r\n"
                "   obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  SendToCharacter( "Example:\r\n", ch);
  SendToCharacter( "opfind 20 901 969 if isnpc \r\n"
                "   Search all obj progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all objects that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  SendToCharacter( "Example:\r\n", ch);
  SendToCharacter( "opfind 100 mud mpslay \r\n"
                "   Search all obj progs in the entire mud\r\n"
                "   and display all objects that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}
