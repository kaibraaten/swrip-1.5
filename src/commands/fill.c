#include "character.h"
#include "mud.h"

/*
 * Fill a container
 * Many enhancements added by Thoric (ie: filling non-drink containers)
 */
void do_fill( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *source;
  short    dest_item, src_item1, src_item2, src_item3, src_item4;
  int       diff;
  bool      all = FALSE;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  /* munch optional words */
  if ( (!str_cmp( arg2, "from" ) || !str_cmp( arg2, "with" ))
       &&    argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Fill what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }
  else
    dest_item = obj->item_type;

  src_item1 = src_item2 = src_item3 = src_item4 = -1;
  switch( dest_item )
    {
    default:
      act( AT_ACTION, "$n tries to fill $p... (Don't ask me how)", ch, obj, NULL, TO_ROOM );
      send_to_char( "You cannot fill that.\r\n", ch );
      return;
      /* place all fillable item types here */
    case ITEM_DRINK_CON:
      src_item1 = ITEM_FOUNTAIN;        src_item2 = ITEM_BLOOD;         break;
    case ITEM_HERB_CON:
      src_item1 = ITEM_HERB;    src_item2 = ITEM_HERB_CON;      break;
    case ITEM_PIPE:
      src_item1 = ITEM_HERB;    src_item2 = ITEM_HERB_CON;      break;
    case ITEM_CONTAINER:
      src_item1 = ITEM_CONTAINER;       src_item2 = ITEM_CORPSE_NPC;
      src_item3 = ITEM_CORPSE_PC;       src_item4 = ITEM_CORPSE_NPC;    break;
    }

  if ( dest_item == ITEM_CONTAINER )
    {
      if ( IS_SET(obj->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->name, TO_CHAR );
          return;
        }
      if ( get_obj_weight( obj ) / obj->count
           >=   obj->value[0] )
        {
          send_to_char( "It's already full as it can be.\r\n", ch );
          return;
        }
    }
  else
    {
      diff = obj->value[0] - obj->value[1];
      if ( diff < 1 || obj->value[1] >= obj->value[0] )
        {
          send_to_char( "It's already full as it can be.\r\n", ch );
          return;
        }
    }

  if ( dest_item == ITEM_PIPE
       &&   IS_SET( obj->value[3], PIPE_FULLOFASH ) )
    {
      send_to_char( "It's full of ashes, and needs to be emptied first.\r\n", ch );
      return;
    }

  if ( arg2[0] != '\0' )
    {
      if ( dest_item == ITEM_CONTAINER
           && (!str_cmp( arg2, "all" ) || !str_prefix( "all.", arg2 )) )
        {
          all = TRUE;
          source = NULL;
        }
      else
        /* This used to let you fill a pipe from an object on the ground.  Seems
           to me you should be holding whatever you want to fill a pipe with.
           It's nitpicking, but I needed to change it to get a mobprog to work
           right.  Check out Lord Fitzgibbon if you're curious.  -Narn */
        if ( dest_item == ITEM_PIPE )
          {
            if ( ( source = get_obj_carry( ch, arg2 ) ) == NULL )
              {
                send_to_char( "You don't have that item.\r\n", ch );
                return;
              }
            if ( source->item_type != src_item1 && source->item_type != src_item2
                 &&   source->item_type != src_item3 &&   source->item_type != src_item4  )
              {
                act( AT_PLAIN, "You cannot fill $p with $P!", ch, obj, source, TO_CHAR );
                return;
              }
          }
        else
          {
	    if ( ( source =  get_obj_here( ch, arg2 ) ) == NULL )
              {
                send_to_char( "You cannot find that item.\r\n", ch );
                return;
              }
          }
    }
  else
    source = NULL;

  if ( !source && dest_item == ITEM_PIPE )
    {
      send_to_char( "Fill it with what?\r\n", ch );
      return;
    }

  if ( !source )
    {
      bool      found = FALSE;
      OBJ_DATA *src_next;

      found = FALSE;
      separate_obj( obj );
      for ( source = ch->in_room->first_content;
            source;
            source = src_next )
        {
          src_next = source->next_content;
          if (dest_item == ITEM_CONTAINER)
            {
              if ( !CAN_WEAR(source, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !can_take_proto(ch))
                   ||    ch->carry_weight + get_obj_weight(source) > can_carry_w(ch)
                   ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
                   > obj->value[0] )
                continue;
              if ( all && arg2[3] == '.'
                   &&  !nifty_is_name( &arg2[4], source->name ) )
                continue;
              obj_from_room(source);
              if ( source->item_type == ITEM_MONEY )
                {
                  ch->gold += source->value[0];
                  extract_obj( source );
                }
	      else
                obj_to_obj(source, obj);
              found = TRUE;
            }
          else
            if (source->item_type == src_item1
                ||  source->item_type == src_item2
                ||  source->item_type == src_item3
                ||  source->item_type == src_item4 )
              {
                found = TRUE;
                break;
              }
        }
      if ( !found )
        {
          switch( src_item1 )
            {
            default:
              send_to_char( "There is nothing appropriate here!\r\n", ch );
              return;
            case ITEM_FOUNTAIN:
              send_to_char( "There is no fountain or pool here!\r\n", ch );
              return;
            case ITEM_BLOOD:
              send_to_char( "There is no blood pool here!\r\n", ch );
              return;
            case ITEM_HERB_CON:
              send_to_char( "There are no herbs here!\r\n", ch );
              return;
            case ITEM_HERB:
              send_to_char( "You cannot find any smoking herbs.\r\n", ch );
              return;
            }
        }
      if (dest_item == ITEM_CONTAINER)
        {
          act( AT_ACTION, "You fill $p.", ch, obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n fills $p.", ch, obj, NULL, TO_ROOM );
          return;
        }
    }

  if (dest_item == ITEM_CONTAINER)
    {
      OBJ_DATA *otmp, *otmp_next;
      char name[MAX_INPUT_LENGTH];
      CHAR_DATA *gch;
      char *pd;
      bool found = FALSE;

      if ( source == obj )
        {
          send_to_char( "You can't fill something with itself!\r\n", ch );
          return;
        }

      switch( source->item_type )
        {
        default:        /* put something in container */
          if ( !source->in_room /* disallow inventory items */
               ||   !CAN_WEAR(source, ITEM_TAKE)
               ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !can_take_proto(ch))
               ||    ch->carry_weight + get_obj_weight(source) > can_carry_w(ch)
               ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
               > obj->value[0] )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }
          separate_obj( obj );
          act( AT_ACTION, "You take $P and put it inside $p.", ch, obj, source, TO_CHAR );
          act( AT_ACTION, "$n takes $P and puts it inside $p.", ch, obj, source, TO_ROOM );
          obj_from_room(source);
          obj_to_obj(source, obj);
          break;
        case ITEM_MONEY:
          send_to_char( "You can't do that... yet.\r\n", ch );
          break;
        case ITEM_CORPSE_PC:
          if ( IS_NPC(ch) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }

          pd = source->short_descr;
          pd = one_argument( pd, name );
          pd = one_argument( pd, name );
          pd = one_argument( pd, name );

	  if ( str_cmp( name, ch->name ) && !IS_IMMORTAL(ch) )
            {
              bool fGroup;

              fGroup = FALSE;
              for ( gch = first_char; gch; gch = gch->next )
                {
                  if ( !IS_NPC(gch)
                       &&   is_same_group( ch, gch )
                       &&   !str_cmp( name, gch->name ) )
                    {
                      fGroup = TRUE;
                      break;
                    }
                }
              if ( !fGroup )
                {
                  send_to_char( "That's someone else's corpse.\r\n", ch );
                  return;
                }
            }

        case ITEM_CONTAINER:
          if ( source->item_type == ITEM_CONTAINER  /* don't remove */
               &&   IS_SET(source->value[1], CONT_CLOSED) )
            {
              act( AT_PLAIN, "The $d is closed.", ch, NULL, source->name, TO_CHAR );
              return;
            }
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_NPC:
          if ( (otmp=source->first_content) == NULL )
            {
              send_to_char( "It's empty.\r\n", ch );
              return;
            }
          separate_obj( obj );
          for ( ; otmp; otmp = otmp_next )
            {
              otmp_next = otmp->next_content;

              if ( !CAN_WEAR(otmp, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( otmp, ITEM_PROTOTYPE) && !can_take_proto(ch))
		   ||    ch->carry_number + otmp->count > can_carry_n(ch)
                   ||    ch->carry_weight + get_obj_weight(otmp) > can_carry_w(ch)
                   ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
                   > obj->value[0] )
                continue;
              obj_from_obj(otmp);
              obj_to_obj(otmp, obj);
              found = TRUE;
            }
          if ( found )
            {
              act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
              act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
            }
          else
            send_to_char( "There is nothing appropriate in there.\r\n", ch );
          break;
        }
      return;
    }

  if ( source->value[1] < 1 )
    {
      send_to_char( "There's none left!\r\n", ch );
      return;
    }
  if ( source->count > 1 && source->item_type != ITEM_FOUNTAIN )
    separate_obj( source );
  separate_obj( obj );

  switch( source->item_type )
    {
    default:
      bug( "do_fill: got bad item type: %d", source->item_type );
      send_to_char( "Something went wrong...\r\n", ch );
      return;
    case ITEM_FOUNTAIN:
      if ( obj->value[1] != 0 && obj->value[2] != 0 )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = 0;
      obj->value[1] = obj->value[0];
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_BLOOD:
      if ( obj->value[1] != 0 && obj->value[2] != 13 )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = 13;
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      if ( (source->value[1] -= diff) < 1 )
        {
          extract_obj( source );
          make_bloodstain( ch );
        }
      return;
    case ITEM_HERB:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      act( AT_ACTION, "You fill $p with $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p with $P.", ch, obj, source, TO_ROOM );
      if ( (source->value[1] -= diff) < 1 )
        extract_obj( source );
      return;
    case ITEM_HERB_CON:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      source->value[1] -= diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_DRINK_CON:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      source->value[1] -= diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    }
}
