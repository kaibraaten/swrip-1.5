#include "mud.h"

void do_bodybag( Character *ch, char *argument )
{
  char buf2[MAX_STRING_LENGTH];
  char buf3[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  bool found;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Bodybag whom?\r\n", ch );
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
           && (obj->Prototype->vnum == OBJ_VNUM_CORPSE_PC ) )
        {
          found = true;
          Echo( ch, "Bagging body: [%5d] %-28s [%5d] %s\r\n",
                     obj->Prototype->vnum,
                     obj->short_descr,
                     obj->in_room->Vnum,
                     obj->in_room->Name );
          ObjectFromRoom(obj);
          obj = ObjectToCharacter(obj, ch);
          obj->timer = -1;
          SaveCharacter( ch );
        }
    }

  if ( !found )
    Echo(ch," You couldn't find any %s\r\n",buf2);
}
