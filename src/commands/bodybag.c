#include "mud.h"

void do_bodybag( Character *ch, char *argument )
{
  char buf2[MAX_STRING_LENGTH];
  char buf3[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  bool found;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Bodybag whom?\r\n", ch );
      return;
    }

  /* make sure the buf3 is clear? */
  sprintf(buf3, " ");
  /* check to see if vict is playing? */
  sprintf(buf2,"the corpse of %s",arg);
  found = false;
  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( obj->in_room
           && !StrCmp( buf2, obj->short_descr )
           && (obj->pIndexData->vnum == 11 ) )
        {
          found = true;
          ch_printf( ch, "Bagging body: [%5d] %-28s [%5d] %s\r\n",
                     obj->pIndexData->vnum,
                     obj->short_descr,
                     obj->in_room->vnum,
                     obj->in_room->name );
          obj_from_room(obj);
          obj = obj_to_char(obj, ch);
          obj->timer = -1;
          save_char_obj( ch );
        }
    }

  if ( !found )
    ch_printf(ch," You couldn't find any %s\r\n",buf2);
}
