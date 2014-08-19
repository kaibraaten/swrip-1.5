#include "character.h"
#include "mud.h"

void do_put( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *container;
  Object *obj;
  Object *obj_next;
  Clan *clan;
  short count;
  int           number;
  bool  save_char = false;

  argument = OneArgument( argument, arg1 );
  if ( IsNumber(arg1) )
    {
      number = atoi(arg1);
      if ( number < 1 )
        {
          SendToCharacter( "That was easy...\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg1 );
    }
  else
    number = 0;
  argument = OneArgument( argument, arg2 );
  /* munch optional words */
  if ( (!StrCmp(arg2, "into") || !StrCmp(arg2, "inside") || !StrCmp(arg2, "in"))
       &&   argument[0] != '\0' )
    argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      SendToCharacter( "Put what in what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( !StrCmp( arg2, "all" ) || !StringPrefix( "all.", arg2 ) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( ( container = get_obj_here( ch, arg2 ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2, TO_CHAR );
      return;
    }

  if ( !container->carried_by && IsBitSet( sysdata.save_flags, SV_PUT ) )
    save_char = true;

  if ( IS_OBJ_STAT(container, ITEM_COVERING) )
    {
      if ( ch->carry_weight + container->weight > GetCarryCapacityWeight( ch ) )
        {
          SendToCharacter( "It's too heavy for you to lift.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( container->item_type != ITEM_CONTAINER )
        {
          SendToCharacter( "That's not a container.\r\n", ch );
          return;
        }

      if ( IsBitSet(container->value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, container->name, TO_CHAR );
          return;
        }
    }

  if ( number <= 1 && StrCmp( arg1, "all" ) && StringPrefix( "all.", arg1 ) )
    {
      /* 'put obj container' */
      if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
        {
          SendToCharacter( "You do not have that item.\r\n", ch );
          return;
	}

      if ( obj == container )
        {
          SendToCharacter( "You can't fold it into itself.\r\n", ch );
          return;
        }

      if ( !CanDropObject( ch, obj ) )
        {
          SendToCharacter( "You can't let go of it.\r\n", ch );
          return;
        }

      if ( (IS_OBJ_STAT(container, ITEM_COVERING)
            &&   (get_obj_weight( obj ) / obj->count)
            > ((get_obj_weight( container ) / container->count)
               -   container->weight)) )
        {
          SendToCharacter( "It won't fit under there.\r\n", ch );
          return;
        }

      if ( (get_obj_weight( obj ) / obj->count)
           + (get_obj_weight( container ) / container->count)
           >  container->value[OVAL_CONTAINER_CAPACITY] )
        {
          SendToCharacter( "It won't fit.\r\n", ch );
          return;
        }

      separate_obj(obj);
      separate_obj(container);
      obj_from_char( obj );
      obj = obj_to_obj( obj, container );
      check_for_trap ( ch, container, TRAP_PUT );
      if ( char_died(ch) )
        return;
      count = obj->count;
      obj->count = 1;
      act( AT_ACTION, IS_OBJ_STAT( container, ITEM_COVERING )
           ? "$n hides $p beneath $P." : "$n puts $p in $P.",
           ch, obj, container, TO_ROOM );
      act( AT_ACTION, IS_OBJ_STAT( container, ITEM_COVERING )
           ? "You hide $p beneath $P." : "You put $p in $P.",
	   ch, obj, container, TO_CHAR );
      obj->count = count;

      if ( save_char )
        {
          save_char_obj( ch );
          if( IsBitSet( ch->in_room->room_flags, ROOM_PLR_HOME ) )
            save_home (ch );
          if ( IsBitSet( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
            save_storeroom( ch->in_room );
        }
      /* Clan storeroom check */
      if ( IsBitSet(ch->in_room->room_flags, ROOM_CLANSTOREROOM)
           &&   container->carried_by == NULL)
        for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            SaveClanStoreroom(ch, clan);
    }
  else
    {
      bool found = false;
      int cnt = 0;
      bool fAll;
      char *chk;

      if ( !StrCmp(arg1, "all") )
        fAll = true;
      else
        fAll = false;
      if ( number > 1 )
        chk = arg1;
      else
        chk = &arg1[4];

      separate_obj(container);
      /* 'put all container' or 'put all.obj container' */
      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;

          if ( ( fAll || NiftyIsName( chk, obj->name ) )
               &&   CanSeeObject( ch, obj )
               &&   obj->wear_loc == WEAR_NONE
               &&   obj != container
               &&   CanDropObject( ch, obj )
	       &&   get_obj_weight( obj ) + get_obj_weight( container )
               <= container->value[OVAL_CONTAINER_CAPACITY] )
            {
              if ( number && (cnt + obj->count) > number )
                split_obj( obj, number - cnt );
              cnt += obj->count;
              obj_from_char( obj );
              act( AT_ACTION, "$n puts $p in $P.", ch, obj, container, TO_ROOM );
              act( AT_ACTION, "You put $p in $P.", ch, obj, container, TO_CHAR );
              obj = obj_to_obj( obj, container );
              found = true;

              check_for_trap( ch, container, TRAP_PUT );
              if ( char_died(ch) )
                return;
              if ( number && cnt >= number )
                break;
            }
        }

      /*
       * Don't bother to save anything if nothing was dropped   -Thoric
       */
      if ( !found )
        {
          if ( fAll )
            act( AT_PLAIN, "You are not carrying anything.",
                 ch, NULL, NULL, TO_CHAR );
          else
            act( AT_PLAIN, "You are not carrying any $T.",
                 ch, NULL, chk, TO_CHAR );
          return;
        }

      if ( save_char )
        {
          save_char_obj( ch );
          if( IsBitSet( ch->in_room->room_flags, ROOM_PLR_HOME ) )
            save_home (ch );
          if ( IsBitSet( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
            save_storeroom( ch->in_room );
        }
      /* Clan storeroom check */
      if ( IsBitSet(ch->in_room->room_flags, ROOM_CLANSTOREROOM)
           && container->carried_by == NULL )
	for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            SaveClanStoreroom(ch, clan);
    }
}
