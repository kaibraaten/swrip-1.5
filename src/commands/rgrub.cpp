#include "mud.h"
#include "grub.h"

static int rgrub_int_comp(const void *i, const void *j);
static void rgrub_help (Character *ch);

void do_rgrub (Character *ch, char *argument)
{
  char arg1[MAX_STRING_LENGTH];
  char arg2[MAX_STRING_LENGTH];
  char arg3[MAX_STRING_LENGTH];
  char arg4[MAX_STRING_LENGTH];

  argument = OneArgument (argument, arg1);
  argument = OneArgument (argument, arg2);
  argument = OneArgument (argument, arg3);
  argument = OneArgument (argument, arg4);

  if (!StrCmp(arg1, "st"))
    {
#define RGRUB_ST_MAX_SIZE 5000
      Room *pRoom;
      int match, lo, hi, hit_cou, cou, vnum[RGRUB_ST_MAX_SIZE];

      if (!*arg2)                                   /* empty arg gets help scrn */
        {
          rgrub_help(ch);
          return;
        }
      else
	match = atoi (arg2);

      hit_cou = 0;                                 /* number of vnums found */
      lo = (*arg3) ? atoi (arg3) : 0;
      hi = (*arg4) ? atoi (arg4) : MAX_VNUM;

      Echo (ch, "\r\nRoom Vnums\r\n");
      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( RoomIndexHash[cou] )
            for (pRoom = RoomIndexHash[cou]; pRoom; pRoom = pRoom->Next)
              {
                if (pRoom->Vnum >= lo && pRoom->Vnum <= hi)
                  {
                    if ( match == pRoom->Sector && hit_cou < RGRUB_ST_MAX_SIZE)
                      vnum[hit_cou++] = pRoom->Vnum;
                  }
              }
        }
      
      qsort(vnum, hit_cou, sizeof(int), rgrub_int_comp);      /* sort vnums    */

      for (cou=0; cou<hit_cou; cou++)
        Echo (ch, "%5d %6d\r\n", cou+1, vnum[cou]);   /* display vnums */

      return;
    }
  else
    {
      rgrub_help(ch);
      return;
    }
}

/*
 * Sort function used by rgrub to sort integers
 */

static int rgrub_int_comp(const void *i, const void *j)
{
  return *(int*)i - *(int*)j;
}

/*
 * Displays the help screen for the "rgrub" command
 */
static void rgrub_help (Character *ch)
{
  SendToCharacter( "Syntax:\r\n", ch);
  SendToCharacter( "rgrub st n lo hi - sector type search.\r\n"
                "   list room vnums between lo and hi that match n.\r\n", ch );
  SendToCharacter( "   e.g. rgrub st 6 901 969 - list all rooms in Olympus\r\n"
                "      that are sectortype 6.\r\n", ch );
  SendToCharacter( "   e.g. rgrub st 2 - list all rooms sectortype 2.\r\n", ch );
}
