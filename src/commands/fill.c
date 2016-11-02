#include "character.h"
#include "mud.h"

/*
 * Fill a container
 * Many enhancements added by Thoric (ie: filling non-drink containers)
 */
void do_fill( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj;
  Object *source;
  ItemTypes    dest_item, src_item1, src_item2, src_item3, src_item4;
  int       diff;
  bool      all = false;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  /* munch optional words */
  if ( (!StrCmp( arg2, "from" ) || !StrCmp( arg2, "with" ))
       && !IsNullOrEmpty( argument ) )
    argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Fill what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "You do not have that item.\r\n", ch );
      return;
    }
  else
    dest_item = obj->ItemType;

  src_item1 = src_item2 = src_item3 = src_item4 = (ItemTypes)-1;
  switch( dest_item )
    {
    default:
      Act( AT_ACTION, "$n tries to fill $p... (Don't ask me how)", ch, obj, NULL, TO_ROOM );
      SendToCharacter( "You cannot fill that.\r\n", ch );
      return;

      /* place all fillable item types here */
    case ITEM_DRINK_CON:
      src_item1 = ITEM_FOUNTAIN;
      src_item2 = ITEM_BLOOD;
      break;

    case ITEM_HERB_CON:
      src_item1 = ITEM_HERB;
      src_item2 = ITEM_HERB_CON;
      break;

    case ITEM_PIPE:
      src_item1 = ITEM_HERB;
      src_item2 = ITEM_HERB_CON;
      break;

    case ITEM_CONTAINER:
      src_item1 = ITEM_CONTAINER;
      src_item2 = ITEM_CORPSE_NPC;
      src_item3 = ITEM_CORPSE_PC;
      src_item4 = ITEM_CORPSE_NPC;
      break;
    }

  if ( dest_item == ITEM_CONTAINER )
    {
      if ( IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->Name, TO_CHAR );
          return;
        }
      if ( GetObjectWeight( obj ) / obj->Count
           >= obj->Value[OVAL_CONTAINER_CAPACITY] )
        {
          SendToCharacter( "It's already full as it can be.\r\n", ch );
          return;
        }
    }
  else
    {
      diff = obj->Value[OVAL_DRINK_CON_CAPACITY] - obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT];

      if ( diff < 1 || obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] >= obj->Value[OVAL_DRINK_CON_CAPACITY] )
        {
          SendToCharacter( "It's already full as it can be.\r\n", ch );
          return;
        }
    }

  if ( dest_item == ITEM_PIPE
       && IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH ) )
    {
      SendToCharacter( "It's full of ashes, and needs to be emptied first.\r\n", ch );
      return;
    }

  if ( !IsNullOrEmpty( arg2 ) )
    {
      if ( dest_item == ITEM_CONTAINER
           && (!StrCmp( arg2, "all" ) || !StringPrefix( "all.", arg2 )) )
        {
          all = true;
          source = NULL;
        }
      else
        /* This used to let you fill a pipe from an object on the ground.  Seems
           to me you should be holding whatever you want to fill a pipe with.
           It's nitpicking, but I needed to change it to get a mobprog to work
           right.  Check out Lord Fitzgibbon if you're curious.  -Narn */
        if ( dest_item == ITEM_PIPE )
          {
            if ( ( source = GetCarriedObject( ch, arg2 ) ) == NULL )
              {
                SendToCharacter( "You don't have that item.\r\n", ch );
                return;
              }
            if ( source->ItemType != src_item1 && source->ItemType != src_item2
                 &&   source->ItemType != src_item3 &&   source->ItemType != src_item4  )
              {
                Act( AT_PLAIN, "You cannot fill $p with $P!", ch, obj, source, TO_CHAR );
                return;
              }
          }
        else
          {
	    if ( ( source =  GetObjectHere( ch, arg2 ) ) == NULL )
              {
                SendToCharacter( "You cannot find that item.\r\n", ch );
                return;
              }
          }
    }
  else
    source = NULL;

  if ( !source && dest_item == ITEM_PIPE )
    {
      SendToCharacter( "Fill it with what?\r\n", ch );
      return;
    }

  if ( !source )
    {
      bool      found = false;
      Object *src_next;

      found = false;
      SeparateOneObjectFromGroup( obj );
      for ( source = ch->InRoom->FirstContent;
            source;
            source = src_next )
        {
          src_next = source->NextContent;
          if (dest_item == ITEM_CONTAINER)
            {
              if ( !CAN_WEAR(source, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !CharacterCanTakePrototype(ch))
                   ||    ch->CarryWeight + GetObjectWeight(source) > GetCarryCapacityWeight(ch)
                   ||   (GetObjectWeight(source) + GetObjectWeight(obj)/obj->Count)
                   > obj->Value[OVAL_CONTAINER_CAPACITY] )
                continue;
              if ( all && arg2[3] == '.'
                   &&  !NiftyIsName( &arg2[4], source->Name ) )
                continue;
              ObjectFromRoom(source);
              if ( source->ItemType == ITEM_MONEY )
                {
                  ch->Gold += source->Value[OVAL_MONEY_AMOUNT];
                  ExtractObject( source );
                }
	      else
                ObjectToObject(source, obj);
              found = true;
            }
          else
            if (source->ItemType == src_item1
                ||  source->ItemType == src_item2
                ||  source->ItemType == src_item3
                ||  source->ItemType == src_item4 )
              {
                found = true;
                break;
              }
        }
      if ( !found )
        {
          switch( src_item1 )
            {
            default:
              SendToCharacter( "There is nothing appropriate here!\r\n", ch );
              return;
            case ITEM_FOUNTAIN:
              SendToCharacter( "There is no fountain or pool here!\r\n", ch );
              return;
            case ITEM_BLOOD:
              SendToCharacter( "There is no blood pool here!\r\n", ch );
              return;
            case ITEM_HERB_CON:
              SendToCharacter( "There are no herbs here!\r\n", ch );
              return;
            case ITEM_HERB:
              SendToCharacter( "You cannot find any smoking herbs.\r\n", ch );
              return;
            }
        }
      if (dest_item == ITEM_CONTAINER)
        {
          Act( AT_ACTION, "You fill $p.", ch, obj, NULL, TO_CHAR );
          Act( AT_ACTION, "$n fills $p.", ch, obj, NULL, TO_ROOM );
          return;
        }
    }

  if (dest_item == ITEM_CONTAINER)
    {
      Object *otmp, *otmp_next;
      char name[MAX_INPUT_LENGTH];
      Character *gch;
      char *pd;
      bool found = false;

      if ( source == obj )
        {
          SendToCharacter( "You can't fill something with itself!\r\n", ch );
          return;
        }

      switch( source->ItemType )
        {
        default:        /* put something in container */
          if ( !source->InRoom /* disallow inventory items */
               ||   !CAN_WEAR(source, ITEM_TAKE)
               ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !CharacterCanTakePrototype(ch))
               ||    ch->CarryWeight + GetObjectWeight(source) > GetCarryCapacityWeight(ch)
               ||   (GetObjectWeight(source) + GetObjectWeight(obj)/obj->Count)
               > obj->Value[OVAL_CONTAINER_CAPACITY] )
            {
              SendToCharacter( "You can't do that.\r\n", ch );
              return;
            }
          SeparateOneObjectFromGroup( obj );
          Act( AT_ACTION, "You take $P and put it inside $p.", ch, obj, source, TO_CHAR );
          Act( AT_ACTION, "$n takes $P and puts it inside $p.", ch, obj, source, TO_ROOM );
          ObjectFromRoom(source);
          ObjectToObject(source, obj);
          break;
        case ITEM_MONEY:
          SendToCharacter( "You can't do that... yet.\r\n", ch );
          break;
        case ITEM_CORPSE_PC:
          if ( IsNpc(ch) )
            {
              SendToCharacter( "You can't do that.\r\n", ch );
              return;
            }

          pd = source->ShortDescr;
          pd = OneArgument( pd, name );
          pd = OneArgument( pd, name );
          pd = OneArgument( pd, name );

	  if ( StrCmp( name, ch->Name ) && !IsImmortal(ch) )
            {
              bool fGroup;

              fGroup = false;
              for ( gch = FirstCharacter; gch; gch = gch->Next )
                {
                  if ( !IsNpc(gch)
                       &&   IsInSameGroup( ch, gch )
                       &&   !StrCmp( name, gch->Name ) )
                    {
                      fGroup = true;
                      break;
                    }
                }
              if ( !fGroup )
                {
                  SendToCharacter( "That's someone else's corpse.\r\n", ch );
                  return;
                }
            }

        case ITEM_CONTAINER:
          if ( source->ItemType == ITEM_CONTAINER  /* don't remove */
               &&   IsBitSet(source->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
            {
              Act( AT_PLAIN, "The $d is closed.", ch, NULL, source->Name, TO_CHAR );
              return;
            }
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_NPC:
          if ( (otmp=source->FirstContent) == NULL )
            {
              SendToCharacter( "It's empty.\r\n", ch );
              return;
            }
          SeparateOneObjectFromGroup( obj );
          for ( ; otmp; otmp = otmp_next )
            {
              otmp_next = otmp->NextContent;

              if ( !CAN_WEAR(otmp, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( otmp, ITEM_PROTOTYPE) && !CharacterCanTakePrototype(ch))
		   ||    ch->CarryNumber + otmp->Count > GetCarryCapacityNumber(ch)
                   ||    ch->CarryWeight + GetObjectWeight(otmp) > GetCarryCapacityWeight(ch)
                   ||   (GetObjectWeight(source) + GetObjectWeight(obj)/obj->Count)
                   > obj->Value[OVAL_CORPSE_0] )
                continue;

              ObjectFromObject(otmp);
              ObjectToObject(otmp, obj);
              found = true;
            }
          if ( found )
            {
              Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
              Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
            }
          else
            SendToCharacter( "There is nothing appropriate in there.\r\n", ch );
          break;
        }
      return;
    }

  if ( source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 1 )
    {
      SendToCharacter( "There's none left!\r\n", ch );
      return;
    }
  if ( source->Count > 1 && source->ItemType != ITEM_FOUNTAIN )
    SeparateOneObjectFromGroup( source );
  SeparateOneObjectFromGroup( obj );

  switch( source->ItemType )
    {
    default:
      Bug( "do_fill: got bad item type: %d", source->ItemType );
      SendToCharacter( "Something went wrong...\r\n", ch );
      return;
    case ITEM_FOUNTAIN:
      if ( obj->Value[1] != 0 && obj->Value[2] != 0 )
        {
          SendToCharacter( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->Value[2] = 0;
      obj->Value[1] = obj->Value[0];
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_BLOOD:
      if ( obj->Value[1] != 0 && obj->Value[2] != 13 )
        {
          SendToCharacter( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->Value[2] = 13;
      if ( source->Value[1] < diff )
        diff = source->Value[1];
      obj->Value[1] += diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      if ( (source->Value[1] -= diff) < 1 )
        {
          ExtractObject( source );
          MakeBloodstain( ch );
        }
      return;
    case ITEM_HERB:
      if ( obj->Value[1] != 0 && obj->Value[2] != source->Value[2] )
        {
          SendToCharacter( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->Value[2] = source->Value[2];
      if ( source->Value[1] < diff )
        diff = source->Value[1];
      obj->Value[1] += diff;
      Act( AT_ACTION, "You fill $p with $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p with $P.", ch, obj, source, TO_ROOM );
      if ( (source->Value[1] -= diff) < 1 )
        ExtractObject( source );
      return;
    case ITEM_HERB_CON:
      if ( obj->Value[1] != 0 && obj->Value[2] != source->Value[2] )
        {
          SendToCharacter( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->Value[2] = source->Value[2];
      if ( source->Value[1] < diff )
        diff = source->Value[1];
      obj->Value[1] += diff;
      source->Value[1] -= diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_DRINK_CON:
      if ( obj->Value[1] != 0 && obj->Value[2] != source->Value[2] )
        {
          SendToCharacter( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->Value[2] = source->Value[2];
      if ( source->Value[1] < diff )
        diff = source->Value[1];
      obj->Value[1] += diff;
      source->Value[1] -= diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    }
}
