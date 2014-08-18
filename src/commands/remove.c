#include "mud.h"
#include "character.h"

void do_remove( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL, *obj_next = NULL;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Remove what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( !StrCmp( arg, "all" ) )  /* SB Remove all */
    {
      for ( obj = ch->first_carrying; obj != NULL ; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->wear_loc != WEAR_NONE && CanSeeObject ( ch, obj ) )
            RemoveObject ( ch, obj->wear_loc, true );
        }

      return;
    }

  if ( ( obj = GetWornObject( ch, arg ) ) == NULL )
    {
      send_to_char( "You are not using that item.\r\n", ch );
      return;
    }

  if ( (obj_next=GetEquipmentOnCharacter(ch, obj->wear_loc)) != obj )
    {
      act( AT_PLAIN, "You must remove $p first.",
	   ch, obj_next, NULL, TO_CHAR );
      return;
    }

  RemoveObject( ch, obj->wear_loc, true );
}
