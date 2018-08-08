#include "character.hpp"
#include "mud.hpp"

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
      ch->Echo("Huh?\r\n");
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ProgBug( "Mpjunk - No argument", ch );
      return;
    }

  if ( StrCmp( arg, "all" ) && StringPrefix( "all.", arg ) )
    {
      if ( ( obj = GetWornObject( ch, arg ) ) != NULL )
        {
          UnequipCharacter( ch, obj );
          ExtractObject( obj );
          return;
        }
      if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
        return;
      ExtractObject( obj );
    }
  else
    for ( obj = ch->FirstCarrying; obj; obj = obj_next )
      {
        obj_next = obj->NextContent;

	if ( arg[3] == '\0' || IsName( &arg[4], obj->Name ) )
          {
            if ( obj->WearLoc != WEAR_NONE)
              UnequipCharacter( ch, obj );
            ExtractObject( obj );
          }
      }
}

