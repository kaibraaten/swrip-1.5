#include <string.h>
#include "mud.h"
#include "character.h"

static void trunc1(char *s, size_t len);

void do_owhere( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH], field[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Object *obj, *outer_obj;
  bool found = false;
  int icnt=0, vnum=0;
  const char *heading =
    "    Vnum  Short Desc        Vnum  Room/Char          Vnum  Container\r\n";

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      pager_printf( ch, "Owhere what?\r\n" );
      return;
    }

  if ( IsNumber(arg) )
    vnum=atoi(arg);

  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( vnum )
        {
          if ( vnum!=obj->pIndexData->vnum)
            continue;
        }
      else if ( !NiftyIsName( arg, obj->name ) )
	{
	  continue;
	}

      if ( !found )
	send_to_pager( heading, ch );       /* print report heading */

      found = true;
      outer_obj = obj;

      while ( outer_obj->in_obj )
        outer_obj = outer_obj->in_obj;

      sprintf(field, "%-18s", obj_short(obj));
      trunc1(field, 18);
      sprintf(buf, "%3d &R&w%5ld &R&w%-18s &R&w", ++icnt, obj->pIndexData->vnum, field);

      if ( outer_obj->carried_by )
        {
          sprintf(field, "%-18s", PERS(outer_obj->carried_by, ch));
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                  (IsNpc(outer_obj->carried_by) ?
                   outer_obj->carried_by->pIndexData->vnum : INVALID_VNUM), field);

          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->in_obj->name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                      obj->in_obj->pIndexData->vnum, field);
            }

          sprintf(buf+strlen(buf), "&R&w\r\n");
          send_to_pager(buf, ch);
        }
      else if ( outer_obj->in_room )
        {
          sprintf(field, "%-18s", outer_obj->in_room->name);
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                  outer_obj->in_room->vnum, field);

          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->in_obj->name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5ld %-18s &R&w",
                      obj->in_obj->pIndexData->vnum, field);
            }

          sprintf(buf+strlen(buf), "&R&w\r\n");
          send_to_pager(buf, ch);
        }
    }

  if ( !found )
    pager_printf(ch, "None found.\r\n");
}

static void trunc1(char *s, size_t len)
{
  if ( strlen(s) > len )
    s[len] = '\0';
}
