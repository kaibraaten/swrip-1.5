#include "mud.h"

void do_remove( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL, *obj_next = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Remove what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( !str_cmp( arg, "all" ) )  /* SB Remove all */
    {
      for ( obj = ch->first_carrying; obj != NULL ; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->wear_loc != WEAR_NONE && can_see_obj ( ch, obj ) )
            remove_obj ( ch, obj->wear_loc, TRUE );
        }

      return;
    }

  if ( ( obj = get_obj_wear( ch, arg ) ) == NULL )
    {
      send_to_char( "You are not using that item.\r\n", ch );
      return;
    }

  if ( (obj_next=get_eq_char(ch, obj->wear_loc)) != obj )
    {
      act( AT_PLAIN, "You must remove $p first.",
	   ch, obj_next, NULL, TO_CHAR );
      return;
    }

  remove_obj( ch, obj->wear_loc, TRUE );
}