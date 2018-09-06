#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"

/*
 * Fill a container
 * Many enhancements added by Thoric (ie: filling non-drink containers)
 */
void do_fill( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Object *obj = nullptr;
  Object *source = nullptr;
  ItemTypes dest_item = ITEM_NONE, src_item1 = ITEM_NONE, src_item2 = ITEM_NONE, src_item3 = ITEM_NONE, src_item4 = ITEM_NONE;
  int diff = 0;
  bool all = false;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  /* munch optional words */
  if ( (!StrCmp( arg2, "from" ) || !StrCmp( arg2, "with" ))
       && !argument.empty() )
    argument = OneArgument( argument, arg2 );

  if ( arg1.empty() )
    {
      ch->Echo( "Fill what?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
    {
      ch->Echo( "You do not have that item.\r\n" );
      return;
    }
  else
    {
      dest_item = obj->ItemType;
    }
  
  src_item1 = src_item2 = src_item3 = src_item4 = (ItemTypes)-1;

  switch( dest_item )
    {
    default:
      Act( AT_ACTION, "$n tries to fill $p... (Don't ask me how)", ch, obj, NULL, TO_ROOM );
      ch->Echo( "You cannot fill that.\r\n" );
      return;

      /* place all fillable item types.here */
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
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->Name.c_str(), TO_CHAR );
          return;
        }
      if ( GetObjectWeight( obj ) / obj->Count
           >= obj->Value[OVAL_CONTAINER_CAPACITY] )
        {
          ch->Echo( "It's already full as it can be.\r\n" );
          return;
        }
    }
  else
    {
      diff = obj->Value[OVAL_DRINK_CON_CAPACITY] - obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT];

      if ( diff < 1 || obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] >= obj->Value[OVAL_DRINK_CON_CAPACITY] )
        {
          ch->Echo( "It's already full as it can be.\r\n" );
          return;
        }
    }

  if ( dest_item == ITEM_PIPE
       && IsBitSet( obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH ) )
    {
      ch->Echo( "It's full of ashes, and needs to be emptied first.\r\n" );
      return;
    }

  if ( !arg2.empty() )
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
                ch->Echo( "You don't have that item.\r\n" );
                return;
              }
            
            if ( source->ItemType != src_item1 && source->ItemType != src_item2
                 &&   source->ItemType != src_item3 &&   source->ItemType != src_item4  )
              {
                Act( AT_PLAIN, "You cannot fill $p with $P!", ch, obj, source, TO_CHAR );
                return;
              }
          }
        else if ( ( source =  GetObjectHere( ch, arg2 ) ) == NULL )
          {
            ch->Echo( "You cannot find that item.\r\n" );
            return;
          }
    }
  else
    {
      source = NULL;
    }
  
  if ( !source && dest_item == ITEM_PIPE )
    {
      ch->Echo( "Fill it with what?\r\n" );
      return;
    }

  if ( !source )
    {
      bool found = false;

      SeparateOneObjectFromGroup( obj );

      std::list<Object*> sources(ch->InRoom->Objects());

      for(auto i = std::begin(sources); i != std::end(sources); ++i)
        {
          source = *i;
          
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
              ch->Echo( "There is nothing appropriate here!\r\n" );
              return;
              
            case ITEM_FOUNTAIN:
              ch->Echo( "There is no fountain or pool here!\r\n" );
              return;

            case ITEM_BLOOD:
              ch->Echo( "There is no blood pool here!\r\n" );
              return;

            case ITEM_HERB_CON:
              ch->Echo( "There are no herbs here!\r\n" );
              return;

            case ITEM_HERB:
              ch->Echo( "You cannot find any smoking herbs.\r\n" );
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
      std::string name;
      Character *gch = nullptr;
      std::string pd;
      bool found = false;

      if ( source == obj )
        {
          ch->Echo( "You can't fill something with itself!\r\n" );
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
              ch->Echo( "You can't do that.\r\n" );
              return;
            }

          SeparateOneObjectFromGroup( obj );
          Act( AT_ACTION, "You take $P and put it inside $p.", ch, obj, source, TO_CHAR );
          Act( AT_ACTION, "$n takes $P and puts it inside $p.", ch, obj, source, TO_ROOM );
          ObjectFromRoom(source);
          ObjectToObject(source, obj);
          break;

        case ITEM_MONEY:
          ch->Echo( "You can't do that... yet.\r\n" );
          break;

        case ITEM_CORPSE_PC:
          if ( IsNpc(ch) )
            {
              ch->Echo( "You can't do that.\r\n" );
              return;
            }

          pd = source->ShortDescr;
          pd = OneArgument( pd, name );
          pd = OneArgument( pd, name );
          pd = OneArgument( pd, name );

	  if ( StrCmp( name, ch->Name ) && !IsImmortal(ch) )
            {
              bool fGroup = false;

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
                  ch->Echo( "That's someone else's corpse.\r\n" );
                  return;
                }
            }

        case ITEM_CONTAINER:
          if ( source->ItemType == ITEM_CONTAINER  /* don't remove */
               &&   IsBitSet(source->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
            {
              Act( AT_PLAIN, "The $d is closed.", ch, NULL, source->Name.c_str(), TO_CHAR );
              return;
            }
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_NPC:
          if ( source->Objects().empty() )
            {
              ch->Echo( "It's empty.\r\n" );
              return;
            }

          SeparateOneObjectFromGroup( obj );

          std::list<Object*> contents(source->Objects());

          for(Object *otmp : contents)
            {
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
            {
              ch->Echo( "There is nothing appropriate in there.\r\n" );
            }
          
          break;
        }
      return;
    }

  if ( source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 1 )
    {
      ch->Echo( "There's none left!\r\n" );
      return;
    }

  if ( source->Count > 1 && source->ItemType != ITEM_FOUNTAIN )
    SeparateOneObjectFromGroup( source );

  SeparateOneObjectFromGroup( obj );

  switch( source->ItemType )
    {
    default:
      Log->Bug( "do_fill: got bad item type: %d", source->ItemType );
      ch->Echo( "Something went wrong...\r\n" );
      return;

    case ITEM_FOUNTAIN:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] != 0
           && obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] != 0 )
        {
          ch->Echo( "There is already another liquid in it.\r\n" );
          return;
        }

      obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = 0;
      obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] = obj->Value[OVAL_DRINK_CON_CAPACITY];
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;

    case ITEM_BLOOD:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] != 0
           && obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] != 13 )
        {
          ch->Echo( "There is already another liquid in it.\r\n" );
          return;
        }

      obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = 13;

      if ( source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < diff )
        diff = source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT];

      obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] += diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] -= diff;
      
      if ( source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 1 )
        {
          ExtractObject( source );
          MakeBloodstain( ch );
        }
      return;

    case ITEM_HERB:
      if ( obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] != 0
           && obj->Value[OVAL_PIPE_TOBACCO_HERB] != source->Value[OVAL_PIPE_TOBACCO_HERB] )
        {
          ch->Echo( "There is already another type of herb in it.\r\n" );
          return;
        }

      obj->Value[OVAL_PIPE_TOBACCO_HERB] = source->Value[OVAL_PIPE_TOBACCO_HERB];

      if ( source->Value[OVAL_PIPE_TOBACCO_AMOUNT] < diff )
        diff = source->Value[OVAL_PIPE_TOBACCO_AMOUNT];

      obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] += diff;
      Act( AT_ACTION, "You fill $p with $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p with $P.", ch, obj, source, TO_ROOM );

      if ( (source->Value[OVAL_PIPE_TOBACCO_AMOUNT] -= diff) < 1 )
        ExtractObject( source );
      return;

    case ITEM_HERB_CON:
      if ( obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] != 0
           && obj->Value[OVAL_PIPE_TOBACCO_HERB] != source->Value[OVAL_PIPE_TOBACCO_HERB] )
        {
          ch->Echo( "There is already another type of herb in it.\r\n" );
          return;
        }

      obj->Value[OVAL_PIPE_TOBACCO_HERB] = source->Value[OVAL_PIPE_TOBACCO_HERB];

      if ( source->Value[OVAL_PIPE_TOBACCO_AMOUNT] < diff )
        diff = source->Value[OVAL_PIPE_TOBACCO_AMOUNT];

      obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] += diff;
      source->Value[OVAL_PIPE_TOBACCO_AMOUNT] -= diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;

    case ITEM_DRINK_CON:
      if ( obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] != 0
           && obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] != source->Value[OVAL_DRINK_CON_LIQUID_TYPE] )
        {
          ch->Echo( "There is already another liquid in it.\r\n" );
          return;
        }

      obj->Value[OVAL_DRINK_CON_LIQUID_TYPE] = source->Value[OVAL_DRINK_CON_LIQUID_TYPE];

      if ( source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < diff )
        diff = source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT];

      obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] += diff;
      source->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] -= diff;
      Act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      Act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    }
}
