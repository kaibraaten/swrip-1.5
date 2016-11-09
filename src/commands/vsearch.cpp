#include "character.hpp"
#include "mud.h"

void do_vsearch( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool found = false;
  Object *obj;
  Object *in_obj;
  int obj_counter = 1;
  vnum_t argi = INVALID_VNUM;

  OneArgument( argument, arg );

  if( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Syntax: vsearch <vnum>.\r\n", ch );
      return;
    }

  SetPagerColor( AT_PLAIN, ch );
  argi = atoi(arg);

  if (argi < MIN_VNUM && argi > MAX_VNUM)
    {
      SendToCharacter( "Vnum out of range.\r\n", ch);
      return;
    }

  for ( obj = FirstObject; obj != NULL; obj = obj->Next )
    {
      if ( !CanSeeObject( ch, obj ) || !( argi == obj->Prototype->Vnum ))
        continue;

      found = true;

      for ( in_obj = obj; in_obj->InObject != NULL;
            in_obj = in_obj->InObject );

      if ( in_obj->CarriedBy != NULL )
	PagerPrintf( ch, "[%2d] Level %d %s carried by %s.\r\n",
                      obj_counter,
                      obj->Level, GetObjectShortDescription(obj),
                      PERS( in_obj->CarriedBy, ch ) );
      else
        PagerPrintf( ch, "[%2d] [%-5d] %s in %s.\r\n", obj_counter,
                      ( ( in_obj->InRoom ) ? in_obj->InRoom->Vnum : 0 ),
                      GetObjectShortDescription(obj), ( in_obj->InRoom == NULL ) ?
                      "somewhere" : in_obj->InRoom->Name );

      obj_counter++;
    }

  if ( !found )
    SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n" , ch );
}
