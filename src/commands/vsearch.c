#include "character.h"
#include "mud.h"

void do_vsearch( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool found = false;
  Object *obj;
  Object *in_obj;
  int obj_counter = 1;
  int argi;

  OneArgument( argument, arg );

  if( arg[0] == '\0' )
    {
      SendToCharacter( "Syntax:  vsearch <vnum>.\r\n", ch );
      return;
    }

  SetPagerColor( AT_PLAIN, ch );
  argi=atoi(arg);
  if (argi<0 && argi>20000)
    {
      SendToCharacter( "Vnum out of range.\r\n", ch);
      return;
    }
  for ( obj = first_object; obj != NULL; obj = obj->next )
    {
      if ( !CanSeeObject( ch, obj ) || !( argi == obj->Prototype->vnum ))
        continue;

      found = true;
      for ( in_obj = obj; in_obj->in_obj != NULL;
            in_obj = in_obj->in_obj );

      if ( in_obj->carried_by != NULL )
	PagerPrintf( ch, "[%2d] Level %d %s carried by %s.\r\n",
                      obj_counter,
                      obj->level, GetObjectShortDescription(obj),
                      PERS( in_obj->carried_by, ch ) );
      else
        PagerPrintf( ch, "[%2d] [%-5d] %s in %s.\r\n", obj_counter,
                      ( ( in_obj->in_room ) ? in_obj->in_room->vnum : 0 ),
                      GetObjectShortDescription(obj), ( in_obj->in_room == NULL ) ?
                      "somewhere" : in_obj->in_room->name );

      obj_counter++;
    }

  if ( !found )
    SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n" , ch );
}
