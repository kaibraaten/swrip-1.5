#include "mud.h"

void do_empty( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  if ( !str_cmp( arg2, "into" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Empty what?\r\n", ch );
      return;
    }
  if ( ms_find_obj(ch) )
    return;

  if ( (obj = get_obj_carry( ch, arg1 )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }

  if ( obj->count > 1 )
    separate_obj(obj);

  switch( obj->item_type )
    {
    default:
      act( AT_ACTION, "You shake $p in an attempt to empty it...", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n begins to shake $p in an attempt to empty it...", ch, obj, NULL, TO_ROOM );
      return;
    case ITEM_PIPE:
      act( AT_ACTION, "You gently tap $p and empty it out.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n gently taps $p and empties it out.", ch, obj, NULL, TO_ROOM );
      REMOVE_BIT( obj->value[3], PIPE_FULLOFASH );
      REMOVE_BIT( obj->value[3], PIPE_LIT );
      obj->value[1] = 0;
      return;
    case ITEM_DRINK_CON:
      if ( obj->value[1] < 1 )
        {
          send_to_char( "It's already empty.\r\n", ch );
          return;
        }
      act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
      obj->value[1] = 0;
      return;
    case ITEM_CONTAINER:
      if ( IS_SET(obj->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->name, TO_CHAR );
          return;
        }
      if ( !obj->first_content )
        {
          send_to_char( "It's already empty.\r\n", ch );
          return;
        }
      if ( arg2[0] == '\0' )
        {
          if ( IS_SET( ch->in_room->room_flags, ROOM_NODROP )
               || ( !IS_NPC(ch) &&  IS_SET( ch->act, PLR_LITTERBUG ) ) )
            {
              set_char_color( AT_MAGIC, ch );
              send_to_char( "A magical force stops you!\r\n", ch );
              set_char_color( AT_TELL, ch );
	      send_to_char( "Someone tells you, 'No littering here!'\r\n", ch );
              return;
            }
          if ( IS_SET( ch->in_room->room_flags, ROOM_NODROPALL ) )
            {
              send_to_char( "You can't seem to do that here...\r\n", ch );
              return;
            }
          if ( empty_obj( obj, NULL, ch->in_room ) )
            {
              act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
              act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
              if ( IS_SET( sysdata.save_flags, SV_DROP ) )
                save_char_obj( ch );
            }
          else
            send_to_char( "Hmmm... didn't work.\r\n", ch );
        }
      else
        {
          OBJ_DATA *dest = get_obj_here( ch, arg2 );

          if ( !dest )
            {
              send_to_char( "You can't find it.\r\n", ch );
              return;
            }
          if ( dest == obj )
            {
              send_to_char( "You can't empty something into itself!\r\n", ch );
              return;
            }
          if ( dest->item_type != ITEM_CONTAINER )
            {
              send_to_char( "That's not a container!\r\n", ch );
              return;
            }
          if ( IS_SET(dest->value[1], CONT_CLOSED) )
            {
              act( AT_PLAIN, "The $d is closed.", ch, NULL, dest->name, TO_CHAR );
              return;
            }
          separate_obj( dest );
          if ( empty_obj( obj, dest, NULL ) )
            {
	      act( AT_ACTION, "You empty $p into $P.", ch, obj, dest, TO_CHAR );
              act( AT_ACTION, "$n empties $p into $P.", ch, obj, dest, TO_ROOM );
              if ( !dest->carried_by
                   &&    IS_SET( sysdata.save_flags, SV_PUT ) )
                save_char_obj( ch );
            }
          else
            act( AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR );
        }
      return;
    }
}
