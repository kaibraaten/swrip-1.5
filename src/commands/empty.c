#include "character.hpp"
#include "mud.h"

void do_empty( Character *ch, char *argument )
{
  Object *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !StrCmp( arg2, "into" ) && !IsNullOrEmpty( argument ) )
    argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
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

  if ( obj->Count > 1 )
    SeparateOneObjectFromGroup(obj);

  switch( obj->ItemType )
    {
    default:
      Act( AT_ACTION, "You shake $p in an attempt to empty it...", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n begins to shake $p in an attempt to empty it...", ch, obj, NULL, TO_ROOM );
      return;
    case ITEM_PIPE:
      Act( AT_ACTION, "You gently tap $p and empty it out.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n gently taps $p and empties it out.", ch, obj, NULL, TO_ROOM );
      RemoveBit( obj->Value[3], PIPE_FULLOFASH );
      RemoveBit( obj->Value[3], PIPE_LIT );
      obj->Value[1] = 0;
      return;
    case ITEM_DRINK_CON:
      if ( obj->Value[1] < 1 )
        {
          SendToCharacter( "It's already empty.\r\n", ch );
          return;
        }
      Act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
      obj->Value[1] = 0;
      return;
    case ITEM_CONTAINER:
      if ( IsBitSet(obj->Value[1], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->Name, TO_CHAR );
          return;
        }
      if ( !obj->FirstContent )
        {
          SendToCharacter( "It's already empty.\r\n", ch );
          return;
        }
      if ( IsNullOrEmpty( arg2 ) )
        {
          if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROP )
               || ( !IsNpc(ch) &&  IsBitSet( ch->Flags, PLR_LITTERBUG ) ) )
            {
              SetCharacterColor( AT_MAGIC, ch );
              SendToCharacter( "A magical force stops you!\r\n", ch );
              SetCharacterColor( AT_TELL, ch );
	      SendToCharacter( "Someone tells you, 'No littering here!'\r\n", ch );
              return;
            }
          if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROPALL ) )
            {
              SendToCharacter( "You can't seem to do that here...\r\n", ch );
              return;
            }
          if ( EmptyObjectContents( obj, NULL, ch->InRoom ) )
            {
              Act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
              if ( IsBitSet( SysData.SaveFlags, SV_DROP ) )
                SaveCharacter( ch );
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
          if ( dest->ItemType != ITEM_CONTAINER )
            {
              SendToCharacter( "That's not a container!\r\n", ch );
              return;
            }
          if ( IsBitSet(dest->Value[1], CONT_CLOSED) )
            {
              Act( AT_PLAIN, "The $d is closed.", ch, NULL, dest->Name, TO_CHAR );
              return;
            }
          SeparateOneObjectFromGroup( dest );
          if ( EmptyObjectContents( obj, dest, NULL ) )
            {
	      Act( AT_ACTION, "You empty $p into $P.", ch, obj, dest, TO_CHAR );
              Act( AT_ACTION, "$n empties $p into $P.", ch, obj, dest, TO_ROOM );
              if ( !dest->CarriedBy
                   &&    IsBitSet( SysData.SaveFlags, SV_PUT ) )
                SaveCharacter( ch );
            }
          else
            Act( AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR );
        }
      return;
    }
}
