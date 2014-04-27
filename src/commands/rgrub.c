#include "mud.h"
#include "grub.h"

extern ROOM_INDEX_DATA *room_index_hash[MAX_KEY_HASH];

static int rgrub_int_comp(const void *i, const void *j);
static void rgrub_help (CHAR_DATA *ch);

void do_rgrub (CHAR_DATA *ch, char *argument)
{
  char arg1[MAX_STRING_LENGTH];
  char arg2[MAX_STRING_LENGTH];
  char arg3[MAX_STRING_LENGTH];
  char arg4[MAX_STRING_LENGTH];

  argument = one_argument (argument, arg1);
  argument = one_argument (argument, arg2);
  argument = one_argument (argument, arg3);
  argument = one_argument (argument, arg4);

  if (!str_cmp(arg1, "st"))
    {
#define RGRUB_ST_MAX_SIZE 5000
      ROOM_INDEX_DATA *pRoom;
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

      ch_printf (ch, "\r\nRoom Vnums\r\n");
      for (cou = 0; cou < MAX_KEY_HASH; cou++)
        {
          if ( room_index_hash[cou] )
            for (pRoom = room_index_hash[cou]; pRoom; pRoom = pRoom->next)
              {
                if (pRoom->vnum >= lo && pRoom->vnum <= hi)
                  {
                    if ( match == pRoom->sector_type && hit_cou < RGRUB_ST_MAX_SIZE)
                      vnum[hit_cou++] = pRoom->vnum;
                  }
              }
        }
      qsort(vnum, hit_cou, sizeof(int), rgrub_int_comp);      /* sort vnums    */
      for (cou=0; cou<hit_cou; cou++)
        ch_printf (ch, "%5d %6d\r\n", cou+1, vnum[cou]);   /* display vnums */
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
static void rgrub_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "rgrub st n lo hi - sector type search.\r\n"
                "   list room vnums between lo and hi that match n.\r\n", ch );
  send_to_char( "   e.g. rgrub st 6 901 969 - list all rooms in Olympus\r\n"
                "      that are sectortype 6.\r\n", ch );
  send_to_char( "   e.g. rgrub st 2 - list all rooms sectortype 2.\r\n", ch );
}
