#include "character.h"
#include "mud.h"
#include "clan.h"

static void get_obj( CHAR_DATA *ch, OBJ_DATA *obj, OBJ_DATA *container );
static void SaveClanStoreroom( void *element, void *userData );

void do_get( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL;
  OBJ_DATA *obj_next = NULL;
  OBJ_DATA *container = NULL;
  short number = 0;
  bool found = FALSE;
  bool foundowner = FALSE;
  CHAR_DATA *p = NULL, *p_prev = NULL;

  argument = one_argument( argument, arg1 );

  if ( is_number(arg1) )
    {
      number = atoi(arg1);

      if ( number < 1 )
        {
          send_to_char( "That was easy...\r\n", ch );
          return;
        }

      if ( (ch->carry_number + number) > can_carry_n(ch) )
        {
          send_to_char( "You can't carry that many.\r\n", ch );
          return;
        }

      argument = one_argument( argument, arg1 );
    }
  else
    {
      number = 0;
    }

  argument = one_argument( argument, arg2 );

  /* munch optional words */
  if ( !str_cmp( arg2, "from" ) && argument[0] != '\0' )
    {
      argument = one_argument( argument, arg2 );
    }

  /* Get type. */
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Get what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    {
      return;
    }

  if ( ch->in_room && IS_SET(ch->in_room->room_flags, ROOM_PLR_HOME)
       && get_trust(ch) < LEVEL_SUB_IMPLEM )
    {
      if ( !ch->plr_home || ch->plr_home->vnum != ch->in_room->vnum )
        {
          for (p = last_char; p ; p = p_prev )
            {
              p_prev = p->prev;

              if ( p->plr_home && p->plr_home->vnum == ch->in_room->vnum )
		{
		  foundowner = TRUE;
		}
            }

          if ( !foundowner )
            {
              send_to_char( "You can not do that here.\r\n", ch );
              return;
            }
        }
    }

  if ( arg2[0] == '\0' )
    {
      if ( number <= 1 && str_cmp( arg1, "all" )
	   && str_prefix( "all.", arg1 ) )
        {
          /* 'get obj' */
          obj = get_obj_list( ch, arg1, ch->in_room->first_content );

          if ( !obj )
            {
              act( AT_PLAIN, "I see no $T here.", ch, NULL, arg1, TO_CHAR );
              return;
            }

          separate_obj(obj);
          get_obj( ch, obj, NULL );

          if ( char_died(ch) )
            return;

          if ( IS_SET( sysdata.save_flags, SV_GET ) )
            {
              save_char_obj( ch );

              if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
                save_home (ch );

              if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
                save_storeroom( ch->in_room );
	    }
        }
      else
        {
          short cnt = 0;
          bool fAll = FALSE;
          const char *chk = NULL;

          if ( IS_SET( ch->in_room->room_flags, ROOM_DONATION ) )
            {
              send_to_char( "The gods frown upon such a display of greed!\r\n", ch );
              return;
            }

          if ( !str_cmp(arg1, "all") )
            fAll = TRUE;
          else
            fAll = FALSE;

          if ( number > 1 )
            chk = arg1;
          else
            chk = &arg1[4];

          /* 'get all' or 'get all.obj' */
          for ( obj = ch->in_room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;

              if ( ( fAll || nifty_is_name( chk, obj->name ) )
                   && can_see_obj( ch, obj ) )
                {
                  found = TRUE;

                  if ( number && (cnt + obj->count) > number )
                    split_obj( obj, number - cnt );

                  cnt += obj->count;
                  get_obj( ch, obj, NULL );

                  if ( char_died(ch)
                       || ch->carry_number >= can_carry_n( ch )
                       || ch->carry_weight >= can_carry_w( ch )
                       || (number && cnt >= number) )
                    {
                      if ( IS_SET(sysdata.save_flags, SV_GET)
                           &&  !char_died(ch) )
                        {
                          save_char_obj( ch );

                          if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
                            save_home (ch );

			  if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
                            save_storeroom( ch->in_room );
                        }

                      return;
                    }
                }
            }

          if ( !found )
            {
              if ( fAll )
                send_to_char( "I see nothing here.\r\n", ch );
              else
                act( AT_PLAIN, "I see no $T here.", ch, NULL, chk, TO_CHAR );
            }
          else if ( IS_SET( sysdata.save_flags, SV_GET ) )
	    {
	      save_char_obj( ch );

	      if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
		save_home (ch );

	      if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
		save_storeroom( ch->in_room );
	    }
        }
    }
  else
    {
      /* 'get ... container' */
      if ( !str_cmp( arg2, "all" ) || !str_prefix( "all.", arg2 ) )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }

      if ( ( container = get_obj_here( ch, arg2 ) ) == NULL )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2, TO_CHAR );
          return;
        }

      switch ( container->item_type )
        {
        default:
          if ( !IS_OBJ_STAT( container, ITEM_COVERING ) )
	    {
              send_to_char( "That's not a container.\r\n", ch );
              return;
            }

          if ( ch->carry_weight + container->weight > can_carry_w( ch ) )
            {
              send_to_char( "It's too heavy for you to lift.\r\n", ch );
              return;
            }

          break;

        case ITEM_CONTAINER:
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_PC:
        case ITEM_CORPSE_NPC:
          break;
        }

      if ( !IS_OBJ_STAT(container, ITEM_COVERING )
           &&    IS_SET(container->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, container->name, TO_CHAR );
          return;
        }

      if ( number <= 1 && str_cmp( arg1, "all" )
	   && str_prefix( "all.", arg1 ) )
        {
          /* 'get obj container' */
          obj = get_obj_list( ch, arg1, container->first_content );
          if ( !obj )
            {
              act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                   "I see nothing like that beneath the $T." :
                   "I see nothing like that in the $T.",
                   ch, NULL, arg2, TO_CHAR );
              return;
            }
          separate_obj(obj);
          get_obj( ch, obj, container );

          check_for_trap( ch, container, TRAP_GET );
          if ( char_died(ch) )
            return;
          if ( IS_SET( sysdata.save_flags, SV_GET ) )
            {
	      save_char_obj( ch );
              if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
                save_home (ch );
              if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
                save_storeroom( ch->in_room );
            }
        }
      else
        {
          int cnt = 0;
          bool fAll;
          char *chk;

          /* 'get all container' or 'get all.obj container' */
          if ( IS_OBJ_STAT( container, ITEM_DONATION ) )
            {
              send_to_char( "The gods frown upon such an act of greed!\r\n", ch );
              return;
            }

          if ( !str_cmp(arg1, "all") )
            fAll = TRUE;
          else
            fAll = FALSE;

          if ( number > 1 )
            chk = arg1;
          else
            chk = &arg1[4];

          found = FALSE;

          for ( obj = container->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              if ( ( fAll || nifty_is_name( chk, obj->name ) )
                   &&   can_see_obj( ch, obj ) )
                {
                  found = TRUE;
                  if ( number && (cnt + obj->count) > number )
                    split_obj( obj, number - cnt );
                  cnt += obj->count;
                  get_obj( ch, obj, container );
                  if ( char_died(ch)
                       ||   ch->carry_number >= can_carry_n( ch )
                       ||   ch->carry_weight >= can_carry_w( ch )
                       ||   (number && cnt >= number) )
                    return;
                }
	    }

          if ( !found )
            {
              if ( fAll )
                act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                     "I see nothing beneath the $T." :
                     "I see nothing in the $T.",
                     ch, NULL, arg2, TO_CHAR );
              else
                act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                     "I see nothing like that beneath the $T." :
                     "I see nothing like that in the $T.",
                     ch, NULL, arg2, TO_CHAR );
            }
          else
            check_for_trap( ch, container, TRAP_GET );
          if ( char_died(ch) )
            return;
          if ( found && IS_SET( sysdata.save_flags, SV_GET ) )
            {
              save_char_obj( ch );
              if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
                save_home (ch );
              if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
                save_storeroom( ch->in_room );
            }
        }
    }
}

static void get_obj( CHAR_DATA *ch, OBJ_DATA *obj, OBJ_DATA *container )
{
  int weight;

  if ( !CAN_WEAR(obj, ITEM_TAKE)
       && (ch->top_level < sysdata.level_getobjnotake )  )
    {
      send_to_char( "You can't take that.\r\n", ch );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE )
       &&  !can_take_proto( ch ) )
    {
      send_to_char( "A godly force prevents you from getting close to it.\r\n", ch );
      return;
    }

  if ( ch->carry_number + get_obj_number( obj ) > can_carry_n( ch ) )
    {
      act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->name, TO_CHAR );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    weight = obj->weight;
  else
    weight = get_obj_weight( obj );

  if ( ch->carry_weight + weight > can_carry_w( ch ) )
    {
      act( AT_PLAIN, "$d: you can't carry that much weight.",
           ch, NULL, obj->name, TO_CHAR );
      return;
    }

  if ( container )
    {
      act( AT_ACTION, IS_OBJ_STAT(container, ITEM_COVERING) ?
           "You get $p from beneath $P." : "You get $p from $P",
           ch, obj, container, TO_CHAR );
      act( AT_ACTION, IS_OBJ_STAT(container, ITEM_COVERING) ?
           "$n gets $p from beneath $P." : "$n gets $p from $P",
           ch, obj, container, TO_ROOM );
      obj_from_obj( obj );
    }
  else
    {
      act( AT_ACTION, "You get $p.", ch, obj, container, TO_CHAR );
      act( AT_ACTION, "$n gets $p.", ch, obj, container, TO_ROOM );
      obj_from_room( obj );
    }

  /* Clan storeroom checks */
  if ( IS_SET(ch->in_room->room_flags, ROOM_CLANSTOREROOM)
       && (!container || container->carried_by == NULL) )
    {
      List_ForEach( ClanList, SaveClanStoreroom, ch );
    }

  if ( obj->item_type != ITEM_CONTAINER )
    check_for_trap( ch, obj, TRAP_GET );
  if ( char_died(ch) )
    return;

  if ( obj->item_type == ITEM_MONEY )
    {
      ch->gold += obj->value[0];
      extract_obj( obj );
    }
  else
    {
      obj = obj_to_char( obj, ch );
    }

  if ( char_died(ch) || obj_extracted(obj) )
    return;

  oprog_get_trigger(ch, obj);
}

static void SaveClanStoreroom( void *element, void *userData )
{
  CLAN_DATA *clan = (CLAN_DATA*) element;
  CHAR_DATA *ch = (CHAR_DATA*) userData;

  if ( clan->storeroom == ch->in_room->vnum )
    {
      save_clan_storeroom(ch, clan);
    }
}
