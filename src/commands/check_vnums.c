#include <string.h>
#include "mud.h"

/* Check to make sure range of vnums is free - Scryn 2/27/96 */
void do_check_vnums( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Area *pArea;
  char arg1[MAX_STRING_LENGTH];
  char arg2[MAX_STRING_LENGTH];
  bool room, mob, obj, all, area_conflict;
  int low_range, high_range;

  room = false;
  mob  = false;
  obj  = false;
  all  = false;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if (arg1[0] == '\0')
    {
      SendToCharacter("Please specify room, mob, object, or all as your first argument.\r\n", ch);
      return;
    }

  if(!StrCmp(arg1, "room"))
    room = true;

  else if(!StrCmp(arg1, "mob"))
    mob = true;

  else if(!StrCmp(arg1, "object"))
    obj = true;

  else if(!StrCmp(arg1, "all"))
    all = true;
  else
    {
      SendToCharacter("Please specify room, mob, or object as your first argument.\r\n", ch);
      return;
    }

  if(arg2[0] == '\0')
    {
      SendToCharacter("Please specify the low end of the range to be searched.\r\n", ch);
      return;
    }

  if(argument[0] == '\0')
    {
      SendToCharacter("Please specify the high end of the range to be searched.\r\n", ch);
      return;
    }

  low_range = atoi(arg2);
  high_range = atoi(argument);

  if (low_range < MIN_VNUM || low_range > MAX_VNUM )
    {
      SendToCharacter("Invalid argument for bottom of range.\r\n", ch);
      return;
    }

  if (high_range < MIN_VNUM || high_range > MAX_VNUM )
    {
      SendToCharacter("Invalid argument for top of range.\r\n", ch);
      return;
    }

  if (high_range < low_range)
    {
      SendToCharacter("Bottom of range must be below top of range.\r\n", ch);
      return;
    }

  if (all)
    {
      sprintf(buf, "room %d %d", low_range, high_range);
      do_check_vnums(ch, buf);
      sprintf(buf, "mob %d %d", low_range, high_range);
      do_check_vnums(ch, buf);
      sprintf(buf, "object %d %d", low_range, high_range);
      do_check_vnums(ch, buf);
      return;
    }
  SetCharacterColor( AT_PLAIN, ch );

  for ( pArea = first_asort; pArea; pArea = pArea->next_sort )
    {
      area_conflict = false;
      if ( IsBitSet( pArea->status, AREA_DELETED ) )
        continue;
      else
        if (room)
          {
            if ( low_range < pArea->low_r_vnum && pArea->low_r_vnum < high_range )
              area_conflict = true;

            if ( low_range < pArea->hi_r_vnum && pArea->hi_r_vnum < high_range )
              area_conflict = true;

            if ( ( low_range >= pArea->low_r_vnum )
                 && ( low_range <= pArea->hi_r_vnum ) )
              area_conflict = true;

            if ( ( high_range <= pArea->hi_r_vnum )
                 && ( high_range >= pArea->low_r_vnum ) )
              area_conflict = true;
          }

      if (mob)
        {
          if ( low_range < pArea->low_m_vnum && pArea->low_m_vnum < high_range )
            area_conflict = true;

	  if ( low_range < pArea->hi_m_vnum && pArea->hi_m_vnum < high_range )
            area_conflict = true;
          if ( ( low_range >= pArea->low_m_vnum )
               && ( low_range <= pArea->hi_m_vnum ) )
            area_conflict = true;

          if ( ( high_range <= pArea->hi_m_vnum )
               && ( high_range >= pArea->low_m_vnum ) )
            area_conflict = true;
        }

      if (obj)
        {
          if ( low_range < pArea->low_o_vnum && pArea->low_o_vnum < high_range )
            area_conflict = true;

          if ( low_range < pArea->hi_o_vnum && pArea->hi_o_vnum < high_range )
            area_conflict = true;

          if ( ( low_range >= pArea->low_o_vnum )
               && ( low_range <= pArea->hi_o_vnum ) )
            area_conflict = true;

          if ( ( high_range <= pArea->hi_o_vnum )
               && ( high_range >= pArea->low_o_vnum ) )
            area_conflict = true;
        }

      if (area_conflict)
        {
          sprintf(buf, "Conflict:%-15s| ",
                  (pArea->filename ? pArea->filename : "(invalid)"));
          if(room)
            sprintf( buf2, "Rooms: %5ld - %-5ld\r\n", pArea->low_r_vnum,
                     pArea->hi_r_vnum);
          if(mob)
            sprintf( buf2, "Mobs: %5ld - %-5ld\r\n", pArea->low_m_vnum,
                     pArea->hi_m_vnum);
          if(obj)
            sprintf( buf2, "Objects: %5ld - %-5ld\r\n", pArea->low_o_vnum,
                     pArea->hi_o_vnum);

          strcat( buf, buf2 );
          SendToCharacter(buf, ch);
        }

    }
  for ( pArea = first_bsort; pArea; pArea = pArea->next_sort )
    {
      area_conflict = false;
      if ( IsBitSet( pArea->status, AREA_DELETED ) )
        continue;
      else
        if (room)
          {
            if ( low_range < pArea->low_r_vnum && pArea->low_r_vnum < high_range )
              area_conflict = true;

            if ( low_range < pArea->hi_r_vnum && pArea->hi_r_vnum < high_range )
              area_conflict = true;

            if ( ( low_range >= pArea->low_r_vnum )
                 && ( low_range <= pArea->hi_r_vnum ) )
              area_conflict = true;

            if ( ( high_range <= pArea->hi_r_vnum )
                 && ( high_range >= pArea->low_r_vnum ) )
              area_conflict = true;
          }

      if (mob)
        {
          if ( low_range < pArea->low_m_vnum && pArea->low_m_vnum < high_range )
            area_conflict = true;

          if ( low_range < pArea->hi_m_vnum && pArea->hi_m_vnum < high_range )
            area_conflict = true;
          if ( ( low_range >= pArea->low_m_vnum )
               && ( low_range <= pArea->hi_m_vnum ) )
            area_conflict = true;

          if ( ( high_range <= pArea->hi_m_vnum )
               && ( high_range >= pArea->low_m_vnum ) )
            area_conflict = true;
        }

      if (obj)
        {
          if ( low_range < pArea->low_o_vnum && pArea->low_o_vnum < high_range )
            area_conflict = true;

	  if ( low_range < pArea->hi_o_vnum && pArea->hi_o_vnum < high_range )
            area_conflict = true;

          if ( ( low_range >= pArea->low_o_vnum )
               && ( low_range <= pArea->hi_o_vnum ) )
            area_conflict = true;

          if ( ( high_range <= pArea->hi_o_vnum )
               && ( high_range >= pArea->low_o_vnum ) )
            area_conflict = true;
        }

      if (area_conflict)
        {
          sprintf(buf, "Conflict:%-15s| ",
                  (pArea->filename ? pArea->filename : "(invalid)"));
          if(room)
            sprintf( buf2, "Rooms: %5ld - %-5ld\r\n", pArea->low_r_vnum,
                     pArea->hi_r_vnum);
          if(mob)
            sprintf( buf2, "Mobs: %5ld - %-5ld\r\n", pArea->low_m_vnum,
                     pArea->hi_m_vnum);
          if(obj)
            sprintf( buf2, "Objects: %5ld - %-5ld\r\n", pArea->low_o_vnum,
                     pArea->hi_o_vnum);

          strcat( buf, buf2 );
          SendToCharacter(buf, ch);
        }
    }
}
