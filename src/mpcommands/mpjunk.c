#include "character.h"
#include "mud.h"

/* lets the mobile destroy an object in its inventory
   it can also destroy a worn object and it can destroy
   items using all.xxxxx or just plain all of them */

void do_mpjunk( Character *ch, char *argument )
{
  char      arg[ MAX_INPUT_LENGTH ];
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0')
    {
      progbug( "Mpjunk - No argument", ch );
      return;
    }

  if ( str_cmp( arg, "all" ) && str_prefix( "all.", arg ) )
    {
      if ( ( obj = get_obj_wear( ch, arg ) ) != NULL )
        {
          unequip_char( ch, obj );
          extract_obj( obj );
          return;
        }
      if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
        return;
      extract_obj( obj );
    }
  else
    for ( obj = ch->first_carrying; obj; obj = obj_next )
      {
        obj_next = obj->next_content;
        if ( arg[3] == '\0' || is_name( &arg[4], obj->name ) )
          {
            if ( obj->wear_loc != WEAR_NONE)
              unequip_char( ch, obj );
            extract_obj( obj );
          }
      }
}
