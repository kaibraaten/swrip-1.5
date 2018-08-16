#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

static void rpfind_help (Character *ch);

/*
 * Search rooms for room progs containing a specified text string.
 */
void do_rpfind( Character *ch, char *argument )   /* Gorog */
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  vnum_t lo_vnum = MIN_VNUM, hi_vnum = MAX_VNUM;

  argument = OneArgument( argument, arg1 );   /* display_limit */
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || !IsNumber(arg1) )
    {
      rpfind_help(ch);
      return;
    }

  int disp_limit = atoi (arg1);
  disp_limit = umax(0, disp_limit);

  if ( StrCmp(arg2, "mud") )
    {
      argument = OneArgument( argument, arg3 );

      if ( IsNullOrEmpty( arg3 ) || IsNullOrEmpty( argument )
           || !IsNumber(arg2) || !IsNumber(arg3) )
	{
          rpfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = urange(MIN_VNUM, atoi(arg2), MAX_VNUM);
          hi_vnum = urange(MIN_VNUM, atoi(arg3), MAX_VNUM);

          if ( lo_vnum > hi_vnum )
            {
              rpfind_help(ch);
              return;
            }
        }
    }

  if ( IsNullOrEmpty( argument ) )
    {
      rpfind_help(ch);
      return;
    }

  int tot_hits = 0;
  int disp_cou = 0;
  
  for (vnum_t i = lo_vnum; i <= hi_vnum; i++)
    {
      const Room *pRoom = GetRoom(i);
      
      if ( pRoom != nullptr && !pRoom->mprog.MudProgs().empty())
        {
          int tot_vnum = 0;

          for(const MPROG_DATA *pProg : pRoom->mprog.MudProgs())
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
 * Displays the help screen for the "rpfind" command
 */
static void rpfind_help (Character *ch)
{
  ch->Echo("Syntax:\r\n");
  ch->Echo( "rpfind n lo_vnum hi_vnum text \r\n"
            "   Search room vnums between lo_vnum and hi_vnum \r\n"
            "   for room progs that contain an occurrence of text. \r\n"
            "   Display a maxiumu of n lines.\r\n\r\n" );
  ch->Echo( "rpfind n mud text \r\n"
            "   Search all the rooms in the mud for\r\n"
            "   room progs that contain an occurrence of text. \r\n"
            "   Display a maxiumu of n lines.\r\n\r\n" );

  ch->Echo("Example:\r\n");
  ch->Echo( "rpfind 20 901 969 if isnpc \r\n"
            "   Search all room progs in Olympus (vnums 901 thru 969)\r\n"
            "   and display all vnums that contain the text \"if isnpc\".\r\n"
            "   Display a maximum of 20 lines.\r\n\r\n" );
  ch->Echo("Example:\r\n");
  ch->Echo( "rpfind 100 mud mpslay \r\n"
            "   Search all room progs in the entire mud\r\n"
            "   and display all vnums that contain the text \"mpslay\".\r\n"
            "   Display a maximum of 100 lines.\r\n\r\n" );
}
