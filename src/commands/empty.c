#include "character.h"
#include "mud.h"

void do_empty( Character *ch, char *argument )
{
  Object *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );
  if ( !StrCmp( arg2, "into" ) && argument[0] != '\0' )
    argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Empty what?\r\n", ch );
      return;
    }
  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (obj = GetCarriedObject( ch, arg1 )) == NULL )
    {
      SendToCharacter( "You aren't carrying that.\r\n", ch );
      return;
    }

  if ( obj->count > 1 )
    SeparateOneObjectFromGroup(obj);

  switch( obj->item_type )
    {
    default:
      Act( AT_ACTION, "You shake $p in an attempt to empty it...", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n begins to shake $p in an attempt to empty it...", ch, obj, NULL, TO_ROOM );
      return;
    case ITEM_PIPE:
      Act( AT_ACTION, "You gently tap $p and empty it out.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n gently taps $p and empties it out.", ch, obj, NULL, TO_ROOM );
      RemoveBit( obj->value[3], PIPE_FULLOFASH );
      RemoveBit( obj->value[3], PIPE_LIT );
      obj->value[1] = 0;
      return;
    case ITEM_DRINK_CON:
      if ( obj->value[1] < 1 )
        {
          SendToCharacter( "It's already empty.\r\n", ch );
          return;
        }
      Act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
      obj->value[1] = 0;
      return;
    case ITEM_CONTAINER:
      if ( IsBitSet(obj->value[1], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->name, TO_CHAR );
          return;
        }
      if ( !obj->first_content )
        {
          SendToCharacter( "It's already empty.\r\n", ch );
          return;
        }
      if ( arg2[0] == '\0' )
        {
          if ( IsBitSet( ch->in_room->room_flags, ROOM_NODROP )
               || ( !IsNpc(ch) &&  IsBitSet( ch->act, PLR_LITTERBUG ) ) )
            {
              SetCharacterColor( AT_MAGIC, ch );
              SendToCharacter( "A magical force stops you!\r\n", ch );
              SetCharacterColor( AT_TELL, ch );
	      SendToCharacter( "Someone tells you, 'No littering here!'\r\n", ch );
              return;
            }
          if ( IsBitSet( ch->in_room->room_flags, ROOM_NODROPALL ) )
            {
              SendToCharacter( "You can't seem to do that here...\r\n", ch );
              return;
            }
          if ( EmptyObjectContents( obj, NULL, ch->in_room ) )
            {
              Act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
              if ( IsBitSet( sysdata.save_flags, SV_DROP ) )
                save_char_obj( ch );
            }
          else
            SendToCharacter( "Hmmm... didn't work.\r\n", ch );
        }
      else
        {
          Object *dest = GetObjectHere( ch, arg2 );

          if ( !dest )
            {
              SendToCharacter( "You can't find it.\r\n", ch );
              return;
            }
          if ( dest == obj )
            {
              SendToCharacter( "You can't empty something into itself!\r\n", ch );
              return;
            }
          if ( dest->item_type != ITEM_CONTAINER )
            {
              SendToCharacter( "That's not a container!\r\n", ch );
              return;
            }
          if ( IsBitSet(dest->value[1], CONT_CLOSED) )
            {
              Act( AT_PLAIN, "The $d is closed.", ch, NULL, dest->name, TO_CHAR );
              return;
            }
          SeparateOneObjectFromGroup( dest );
          if ( EmptyObjectContents( obj, dest, NULL ) )
            {
	      Act( AT_ACTION, "You empty $p into $P.", ch, obj, dest, TO_CHAR );
              Act( AT_ACTION, "$n empties $p into $P.", ch, obj, dest, TO_ROOM );
              if ( !dest->carried_by
                   &&    IsBitSet( sysdata.save_flags, SV_PUT ) )
                save_char_obj( ch );
            }
          else
            Act( AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR );
        }
      return;
    }
}
