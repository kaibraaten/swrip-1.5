#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

void do_empty( Character *ch, char *argument )
{
  Object *obj = nullptr;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !StrCmp( arg2, "into" ) && !IsNullOrEmpty( argument ) )
    argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo( "Empty what?\r\n" );
      return;
    }
  
  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (obj = GetCarriedObject( ch, arg1 )) == NULL )
    {
      ch->Echo( "You aren't carrying that.\r\n" );
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
      RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH );
      RemoveBit( obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT );
      obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
      return;

    case ITEM_DRINK_CON:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 1 )
        {
          ch->Echo( "It's already empty.\r\n" );
          return;
        }

      Act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
      obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] = 0;
      return;

    case ITEM_CONTAINER:
      if ( IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->Name, TO_CHAR );
          return;
        }

      if ( !obj->FirstContent )
        {
          ch->Echo( "It's already empty.\r\n" );
          return;
        }

      if ( IsNullOrEmpty( arg2 ) )
        {
          if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROP )
               || ( !IsNpc(ch) &&  IsBitSet( ch->Flags, PLR_LITTERBUG ) ) )
            {
              SetCharacterColor( AT_MAGIC, ch );
              ch->Echo( "A magical force stops you!\r\n" );
              SetCharacterColor( AT_TELL, ch );
	      ch->Echo( "Someone tells you, 'No littering here!'\r\n" );
              return;
            }

          if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROPALL ) )
            {
              ch->Echo( "You can't seem to do that here...\r\n" );
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
            {
              ch->Echo( "Hmmm... didn't work.\r\n" );
            }
        }
      else
        {
          Object *dest = GetObjectHere( ch, arg2 );

          if ( !dest )
            {
              ch->Echo( "You can't find it.\r\n" );
              return;
            }

          if ( dest == obj )
            {
              ch->Echo( "You can't empty something into itself!\r\n" );
              return;
            }

          if ( dest->ItemType != ITEM_CONTAINER )
            {
              ch->Echo( "That's not a container!\r\n" );
              return;
            }

          if ( IsBitSet(dest->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
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
            {
              Act( AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR );
            }
        }
      
      return;
    }
}
