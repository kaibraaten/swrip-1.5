#include "character.h"
#include "mud.h"

/* lets the mobile destroy an object in its inventory
   it can also destroy a worn object and it can destroy
   items using all.xxxxx or just plain all of them */

void do_mpjunk( Character *ch, char *argument )
{
  char      arg[ MAX_INPUT_LENGTH ];
  Object *obj;
  Object *obj_next;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0')
    {
      ProgBug( "Mpjunk - No argument", ch );
      return;
    }

  if ( StrCmp( arg, "all" ) && StringPrefix( "all.", arg ) )
    {
      if ( ( obj = GetWornObject( ch, arg ) ) != NULL )
        {
          UnequipCharacter( ch, obj );
          extract_obj( obj );
          return;
        }
      if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
        return;
      extract_obj( obj );
    }
  else
    for ( obj = ch->first_carrying; obj; obj = obj_next )
      {
        obj_next = obj->next_content;
        if ( arg[3] == '\0' || IsName( &arg[4], obj->name ) )
          {
            if ( obj->wear_loc != WEAR_NONE)
              UnequipCharacter( ch, obj );
            extract_obj( obj );
          }
      }
}
