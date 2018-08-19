#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

void do_remove( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

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
      std::list<Object*> carriedObjects(ch->Objects());

      for(Object *obj : carriedObjects)
        {
          if ( obj->WearLoc != WEAR_NONE && CanSeeObject ( ch, obj ) )
            {
              RemoveObject ( ch, obj->WearLoc, true );
            }
        }

      return;
    }

  Object *obj = GetWornObject(ch, arg);
  
  if ( obj == nullptr )
    {
      ch->Echo("You are not using that item.\r\n");
      return;
    }

  Object *alreadyWorn = GetEquipmentOnCharacter(ch, obj->WearLoc);
  
  if ( alreadyWorn != obj )
    {
      Act( AT_PLAIN, "You must remove $p first.",
	   ch, alreadyWorn, NULL, TO_CHAR );
      return;
    }

  RemoveObject( ch, obj->WearLoc, true );
}

