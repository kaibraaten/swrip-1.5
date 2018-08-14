#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

void do_remove( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL, *obj_next = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Remove what?\r\n");
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( !StrCmp( arg, "all" ) )  /* SB Remove all */
    {
      for ( obj = ch->FirstCarrying; obj != NULL ; obj = obj_next )
        {
          obj_next = obj->NextContent;
          if ( obj->WearLoc != WEAR_NONE && CanSeeObject ( ch, obj ) )
            RemoveObject ( ch, obj->WearLoc, true );
        }

      return;
    }

  if ( ( obj = GetWornObject( ch, arg ) ) == NULL )
    {
      ch->Echo("You are not using that item.\r\n");
      return;
    }

  if ( (obj_next=GetEquipmentOnCharacter(ch, obj->WearLoc)) != obj )
    {
      Act( AT_PLAIN, "You must remove $p first.",
	   ch, obj_next, NULL, TO_CHAR );
      return;
    }

  RemoveObject( ch, obj->WearLoc, true );
}

