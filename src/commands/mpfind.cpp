#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"

static void mpfind_help (Character *ch);

/*
 * Search mobs for mob progs containing a specified text string.
 */
void do_mpfind( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  std::string arg3;
  vnum_t lo_vnum = MIN_VNUM, hi_vnum = MAX_VNUM;

  argument = OneArgument( argument, arg1 );   /* display_limit */
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() || !IsNumber(arg1) )
    {
      mpfind_help(ch);
      return;
    }

  int disp_limit = std::stoi(arg1);
  disp_limit = umax(0, disp_limit);

  if ( StrCmp(arg2, "mud") )
    {
      argument = OneArgument( argument, arg3 );

      if ( arg3.empty() || !IsNumber(arg2) || !IsNumber(arg3) )
        {
	  mpfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = urange(MIN_VNUM, std::stoi(arg2), MAX_VNUM);
          hi_vnum = urange(MIN_VNUM, std::stoi(arg3), MAX_VNUM);

          if ( lo_vnum > hi_vnum )
            {
              mpfind_help(ch);
              return;
            }
        }
    }
  
  if ( argument.empty() )
    {
      mpfind_help(ch);
      return;
    }

  int tot_hits = 0;
  int disp_cou = 0;
  
  for (vnum_t i = lo_vnum; i <= hi_vnum; i++)
    {
      const ProtoMobile *pMob = GetProtoMobile(i);
      
      if ( pMob != nullptr && !pMob->mprog.MudProgs().empty() )
        {
          int tot_vnum = 0;

          for(const MPROG_DATA *pProg : pMob->mprog.MudProgs())
            {
              tot_vnum += CountStringOccurances(pProg->comlist, argument);
            }
          
          tot_hits += tot_vnum;

          if ( tot_vnum && ++disp_cou <= disp_limit)
            {
              ch->Echo("%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
            }
        }
    }
  
  ch->Echo("Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "mpfind" command
 */
static void mpfind_help (Character *ch)
{
  ch->Echo("Syntax:\r\n");
  ch->Echo( "mpfind n lo_vnum hi_vnum text \r\n"
            "   Search mob vnums between lo_vnum and hi_vnum \r\n"
            "   for mob progs that contain an occurrence of text. \r\n"
            "   Display a maxiumu of n lines.\r\n\r\n");
  ch->Echo( "mpfind n mud text \r\n"
            "   Search all the mobs in the mud for\r\n"
            "   mob progs that contain an occurrence of text. \r\n"
            "   Display a maximum of n lines.\r\n\r\n");

  ch->Echo("Example:\r\n");
  ch->Echo( "mpfind 20 901 969 if isnpc \r\n"
            "   Search all mob progs in Olympus (vnums 901 thru 969)\r\n"
            "   and display all mobs that contain the text \"if isnpc\".\r\n"
            "   Display a maximum of 20 lines.\r\n\r\n" );
  ch->Echo("Example:\r\n");
  ch->Echo( "mpfind 100 mud mpslay \r\n"
            "   Search all mob progs in the entire mud\r\n"
            "   and display all mobs that contain the text \"mpslay\".\r\n"
            "   Display a maximum of 100 lines.\r\n\r\n" );
}
