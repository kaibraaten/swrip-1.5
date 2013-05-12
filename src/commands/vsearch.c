#include "mud.h"

void do_vsearch( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool found = FALSE;
  OBJ_DATA *obj;
  OBJ_DATA *in_obj;
  int obj_counter = 1;
  int argi;

  one_argument( argument, arg );

  if( arg[0] == '\0' )
    {
      send_to_char( "Syntax:  vsearch <vnum>.\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  argi=atoi(arg);
  if (argi<0 && argi>20000)
    {
      send_to_char( "Vnum out of range.\r\n", ch);
      return;
    }
  for ( obj = first_object; obj != NULL; obj = obj->next )
    {
      if ( !can_see_obj( ch, obj ) || !( argi == obj->pIndexData->vnum ))
        continue;

      found = TRUE;
      for ( in_obj = obj; in_obj->in_obj != NULL;
            in_obj = in_obj->in_obj );

      if ( in_obj->carried_by != NULL )
	pager_printf( ch, "[%2d] Level %d %s carried by %s.\r\n",
                      obj_counter,
                      obj->level, obj_short(obj),
                      PERS( in_obj->carried_by, ch ) );
      else
        pager_printf( ch, "[%2d] [%-5d] %s in %s.\r\n", obj_counter,
                      ( ( in_obj->in_room ) ? in_obj->in_room->vnum : 0 ),
                      obj_short(obj), ( in_obj->in_room == NULL ) ?
                      "somewhere" : in_obj->in_room->name );

      obj_counter++;
    }

  if ( !found )
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n" , ch );
}