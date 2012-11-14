/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                         Object manipulation module                      *
 ****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

/*double sqrt( double x );*/

/*
 * External functions
 */

void    show_list_to_char  args( ( OBJ_DATA *list, CHAR_DATA *ch,
                                   bool fShort, bool fShowNothing ) );
/*
 * Local functions.
 */
void    get_obj         args( ( CHAR_DATA *ch, OBJ_DATA *obj,
                                OBJ_DATA *container ) );
bool    remove_obj      args( ( CHAR_DATA *ch, int iWear, bool fReplace ) );
void    wear_obj        args( ( CHAR_DATA *ch, OBJ_DATA *obj, bool fReplace, short wear_bit ) );


/*
 * how resistant an object is to damage                         -Thoric
 */
short get_obj_resistance( OBJ_DATA *obj )
{
  short resist;

  resist = number_fuzzy(MAX_ITEM_IMPACT);

  /* magical items are more resistant */
  if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    resist += number_fuzzy(12);
  /* blessed objects should have a little bonus */
  if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    resist += number_fuzzy(5);
  /* lets make store inventory pretty tough */
  if ( IS_OBJ_STAT( obj, ITEM_INVENTORY ) )
    resist += 20;

  /* okay... let's add some bonus/penalty for item level... */
  resist += (obj->level / 10);

  /* and lasty... take armor or weapon's condition into consideration */
  if (obj->item_type == ITEM_ARMOR || obj->item_type == ITEM_WEAPON)
    resist += (obj->value[0]);

  return URANGE(10, resist, 99);
}


void get_obj( CHAR_DATA *ch, OBJ_DATA *obj, OBJ_DATA *container )
{
  CLAN_DATA *clan;
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
    for ( clan = first_clan; clan; clan = clan->next )
      if ( clan->storeroom == ch->in_room->vnum )
        save_clan_storeroom(ch, clan);

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
  return;
}


void do_get( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;
  OBJ_DATA *container;
  short number;
  bool found, foundowner = FALSE;
  CHAR_DATA *p, *p_prev;
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
    number = 0;
  argument = one_argument( argument, arg2 );
  /* munch optional words */
  if ( !str_cmp( arg2, "from" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  /* Get type. */
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Get what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ch->in_room && IS_SET(ch->in_room->room_flags, ROOM_PLR_HOME) && get_trust(ch) < LEVEL_SUB_IMPLEM )
    {
      if ( !ch->plr_home || ch->plr_home->vnum != ch->in_room->vnum )
        {
          for (p = last_char; p ; p = p_prev )
            {
              p_prev = p->prev;  /* TRI */
              if ( p->plr_home && p->plr_home->vnum == ch->in_room->vnum )
                foundowner = TRUE;
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
      if ( number <= 1 && str_cmp( arg1, "all" ) && str_prefix( "all.", arg1 ) )
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
          bool fAll;
          char *chk;

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
          found = FALSE;
          for ( obj = ch->in_room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              if ( ( fAll || nifty_is_name( chk, obj->name ) )
                   &&   can_see_obj( ch, obj ) )
                {
                  found = TRUE;
                  if ( number && (cnt + obj->count) > number )
                    split_obj( obj, number - cnt );
                  cnt += obj->count;
                  get_obj( ch, obj, NULL );
                  if ( char_died(ch)
                       ||   ch->carry_number >= can_carry_n( ch )
                       ||   ch->carry_weight >= can_carry_w( ch )
                       ||   (number && cnt >= number) )
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
          else
            if ( IS_SET( sysdata.save_flags, SV_GET ) )
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

      if ( number <= 1 && str_cmp( arg1, "all" ) && str_prefix( "all.", arg1 ) )
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
  return;
}



void do_put( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *container;
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;
  CLAN_DATA *clan;
  short count;
  int           number;
  bool  save_char = FALSE;

  argument = one_argument( argument, arg1 );
  if ( is_number(arg1) )
    {
      number = atoi(arg1);
      if ( number < 1 )
        {
          send_to_char( "That was easy...\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg1 );
    }
  else
    number = 0;
  argument = one_argument( argument, arg2 );
  /* munch optional words */
  if ( (!str_cmp(arg2, "into") || !str_cmp(arg2, "inside") || !str_cmp(arg2, "in"))
       &&   argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Put what in what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

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

  if ( !container->carried_by && IS_SET( sysdata.save_flags, SV_PUT ) )
    save_char = TRUE;

  if ( IS_OBJ_STAT(container, ITEM_COVERING) )
    {
      if ( ch->carry_weight + container->weight > can_carry_w( ch ) )
        {
          send_to_char( "It's too heavy for you to lift.\r\n", ch );
          return;
        }
    }
  else
    {
      if ( container->item_type != ITEM_CONTAINER )
        {
          send_to_char( "That's not a container.\r\n", ch );
          return;
        }

      if ( IS_SET(container->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, container->name, TO_CHAR );
          return;
        }
    }

  if ( number <= 1 && str_cmp( arg1, "all" ) && str_prefix( "all.", arg1 ) )
    {
      /* 'put obj container' */
      if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return;
        }

      if ( obj == container )
        {
          send_to_char( "You can't fold it into itself.\r\n", ch );
          return;
        }

      if ( !can_drop_obj( ch, obj ) )
        {
          send_to_char( "You can't let go of it.\r\n", ch );
          return;
        }

      if ( (IS_OBJ_STAT(container, ITEM_COVERING)
            &&   (get_obj_weight( obj ) / obj->count)
            > ((get_obj_weight( container ) / container->count)
               -   container->weight)) )
        {
          send_to_char( "It won't fit under there.\r\n", ch );
          return;
        }

      if ( (get_obj_weight( obj ) / obj->count)
           + (get_obj_weight( container ) / container->count)
           >  container->value[0] )
        {
          send_to_char( "It won't fit.\r\n", ch );
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
          if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
            save_home (ch );
          if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
            save_storeroom( ch->in_room );
        }
      /* Clan storeroom check */
      if ( IS_SET(ch->in_room->room_flags, ROOM_CLANSTOREROOM)
           &&   container->carried_by == NULL)
        for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            save_clan_storeroom(ch, clan);
    }
  else
    {
      bool found = FALSE;
      int cnt = 0;
      bool fAll;
      char *chk;

      if ( !str_cmp(arg1, "all") )
        fAll = TRUE;
      else
        fAll = FALSE;
      if ( number > 1 )
        chk = arg1;
      else
        chk = &arg1[4];

      separate_obj(container);
      /* 'put all container' or 'put all.obj container' */
      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;

          if ( ( fAll || nifty_is_name( chk, obj->name ) )
               &&   can_see_obj( ch, obj )
               &&   obj->wear_loc == WEAR_NONE
               &&   obj != container
               &&   can_drop_obj( ch, obj )
               &&   get_obj_weight( obj ) + get_obj_weight( container )
               <= container->value[0] )
            {
              if ( number && (cnt + obj->count) > number )
                split_obj( obj, number - cnt );
              cnt += obj->count;
              obj_from_char( obj );
              act( AT_ACTION, "$n puts $p in $P.", ch, obj, container, TO_ROOM );
              act( AT_ACTION, "You put $p in $P.", ch, obj, container, TO_CHAR );
              obj = obj_to_obj( obj, container );
              found = TRUE;

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
          if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
            save_home (ch );
          if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
            save_storeroom( ch->in_room );
        }
      /* Clan storeroom check */
      if ( IS_SET(ch->in_room->room_flags, ROOM_CLANSTOREROOM)
           && container->carried_by == NULL )
        for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            save_clan_storeroom(ch, clan);
    }

  return;
}


void do_drop( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;
  bool found;
  CLAN_DATA *clan;
  int number;

  argument = one_argument( argument, arg );
  if ( is_number(arg) )
    {
      number = atoi(arg);
      if ( number < 1 )
        {
          send_to_char( "That was easy...\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg );
    }
  else
    number = 0;

  if ( arg[0] == '\0' )
    {
      send_to_char( "Drop what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( IS_SET( ch->in_room->room_flags, ROOM_NODROP )
       ||   ( !IS_NPC(ch) && IS_SET( ch->act, PLR_LITTERBUG )) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "A magical force stops you!\r\n", ch );
      set_char_color( AT_TELL, ch );
      send_to_char( "Someone tells you, 'No littering here!'\r\n", ch );
      return;
    }

  if ( number > 0 )
    {
      /* 'drop NNNN coins' */

      if ( !str_cmp( arg, "credits" ) || !str_cmp( arg, "credit" ) )
        {
          if ( ch->gold < number )
            {
              send_to_char( "You haven't got that many credits.\r\n", ch );
              return;
            }

          ch->gold -= number;

          for ( obj = ch->in_room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;

              switch ( obj->pIndexData->vnum )
                {
                case OBJ_VNUM_MONEY_ONE:
                  number += 1;
                  extract_obj( obj );
                  break;

                case OBJ_VNUM_MONEY_SOME:
                  number += obj->value[0];
                  extract_obj( obj );
                  break;
                }
            }

          act( AT_ACTION, "$n drops some credits.", ch, NULL, NULL, TO_ROOM );
          obj_to_room( create_money( number ), ch->in_room );
          send_to_char( "OK.\r\n", ch );
          if ( IS_SET( sysdata.save_flags, SV_DROP ) )
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

  if ( number <= 1 && str_cmp( arg, "all" ) && str_prefix( "all.", arg ) )
    {
      /* 'drop obj' */
      if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return;
        }

      if ( !can_drop_obj( ch, obj ) )
        {
          send_to_char( "You can't let go of it.\r\n", ch );
          return;
        }

      separate_obj( obj );
      act( AT_ACTION, "$n drops $p.", ch, obj, NULL, TO_ROOM );
      act( AT_ACTION, "You drop $p.", ch, obj, NULL, TO_CHAR );

      obj_from_char( obj );
      obj = obj_to_room( obj, ch->in_room );
      oprog_drop_trigger ( ch, obj );   /* mudprogs */

      if( char_died(ch) || obj_extracted(obj) )
        return;

      /* Clan storeroom saving */
      if ( IS_SET(ch->in_room->room_flags, ROOM_CLANSTOREROOM) )
        for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            save_clan_storeroom(ch, clan);
    }
  else
    {
      int cnt = 0;
      char *chk;
      bool fAll;

      if ( !str_cmp(arg, "all") )
        fAll = TRUE;
      else
        fAll = FALSE;
      if ( number > 1 )
        chk = arg;
      else
        chk = &arg[4];
      /* 'drop all' or 'drop all.obj' */
      if ( IS_SET( ch->in_room->room_flags, ROOM_NODROPALL ) )
        {
          send_to_char( "You can't seem to do that here...\r\n", ch );
          return;
        }
      found = FALSE;
      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;

          if ( (fAll || nifty_is_name( chk, obj->name ) )
               &&   can_see_obj( ch, obj )
               &&   obj->wear_loc == WEAR_NONE
               &&   can_drop_obj( ch, obj ) )
            {
              found = TRUE;
              if ( obj->pIndexData->progtypes & DROP_PROG && obj->count > 1 )
                {
                  ++cnt;
                  separate_obj( obj );
                  obj_from_char( obj );
                  if ( !obj_next )
                    obj_next = ch->first_carrying;
                }
              else
                {
                  if ( number && (cnt + obj->count) > number )
                    split_obj( obj, number - cnt );
                  cnt += obj->count;
                  obj_from_char( obj );
                }
              act( AT_ACTION, "$n drops $p.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You drop $p.", ch, obj, NULL, TO_CHAR );
              obj = obj_to_room( obj, ch->in_room );
              oprog_drop_trigger( ch, obj );            /* mudprogs */
              if ( char_died(ch) )
                return;
              if ( number && cnt >= number )
                break;
            }
        }

      if ( IS_SET(ch->in_room->room_flags, ROOM_CLANSTOREROOM) )
        for ( clan = first_clan; clan; clan = clan->next )
          if ( clan->storeroom == ch->in_room->vnum )
            save_clan_storeroom(ch, clan);

      if ( !found )
        {
          if ( fAll )
            act( AT_PLAIN, "You are not carrying anything.",
                 ch, NULL, NULL, TO_CHAR );
          else
            act( AT_PLAIN, "You are not carrying any $T.",
                 ch, NULL, chk, TO_CHAR );
        }
    }
  if ( IS_SET( sysdata.save_flags, SV_DROP ) )
    {
      save_char_obj( ch );
      if( IS_SET( ch->in_room->room_flags, ROOM_PLR_HOME ) )
        save_home (ch );
      if ( IS_SET( ch->in_room->room_flags, ROOM_CLANSTOREROOM ) )
        save_storeroom( ch->in_room );
    } /* duping protector */
  return;
}



void do_give( CHAR_DATA *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char buf  [MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA  *obj;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  if ( !str_cmp( arg2, "to" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Give what to whom?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( is_number( arg1 ) )
    {
      /* 'give NNNN coins victim' */
      int amount;

      amount   = atoi(arg1);
      if ( amount <= 0
           || ( str_cmp( arg2, "credits" ) && str_cmp( arg2, "credit" ) ) )
        {
          send_to_char( "Sorry, you can't do that.\r\n", ch );
          return;
        }

      argument = one_argument( argument, arg2 );
      if ( !str_cmp( arg2, "to" ) && argument[0] != '\0' )
        argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' )
        {
          send_to_char( "Give what to whom?\r\n", ch );
          return;
        }

      if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( ch->gold < amount )
        {
          send_to_char( "Very generous of you, but you haven't got that many credits.\r\n", ch );
          return;
        }

      ch->gold     -= amount;
      victim->gold += amount;
      strcpy(buf, "$n gives you ");
      strcat(buf, arg1);
      strcat(buf, (amount > 1) ? " credits." : " credit.");

      act( AT_ACTION, buf, ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n gives $N some credits.",  ch, NULL, victim, TO_NOTVICT );
      act( AT_ACTION, "You give $N some credits.",  ch, NULL, victim, TO_CHAR    );
      send_to_char( "OK.\r\n", ch );
      mprog_bribe_trigger( victim, ch, amount );
      if ( IS_SET( sysdata.save_flags, SV_GIVE ) && !char_died(ch) )
        save_char_obj(ch);
      if ( IS_SET( sysdata.save_flags, SV_RECEIVE ) && !char_died(victim) )
        save_char_obj(victim);
      return;
    }

  if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }

  if ( obj->wear_loc != WEAR_NONE )
    {
      send_to_char( "You must remove it first.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !can_drop_obj( ch, obj ) )
    {
      send_to_char( "You can't let go of it.\r\n", ch );
      return;
    }

  if ( victim->carry_number + (get_obj_number(obj)/obj->count) > can_carry_n( victim ) )
    {
      act( AT_PLAIN, "$N has $S hands full.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( victim->carry_weight + (get_obj_weight(obj)/obj->count) > can_carry_w( victim ) )
    {
      act( AT_PLAIN, "$N can't carry that much weight.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( !can_see_obj( victim, obj ) )
    {
      act( AT_PLAIN, "$N can't see it.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IS_NPC(victim) && victim->pIndexData && victim->pIndexData->pShop )
    {

      if ( victim->owner && str_cmp( ch->name, victim->owner ) )
        {
          send_to_char ("This isnt your vendor!\r\n",ch);
          return;
        }
    }

  if (IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) && !can_take_proto( victim ) )
    {
      act( AT_PLAIN, "You cannot give that to $N!", ch, NULL, victim, TO_CHAR );
      return;
    }

  separate_obj( obj );
  obj_from_char( obj );
  act( AT_ACTION, "$n gives $p to $N.", ch, obj, victim, TO_NOTVICT );
  act( AT_ACTION, "$n gives you $p.",   ch, obj, victim, TO_VICT    );
  act( AT_ACTION, "You give $p to $N.", ch, obj, victim, TO_CHAR    );
  obj = obj_to_char( obj, victim );

  mprog_give_trigger( victim, ch, obj );
  if ( IS_SET( sysdata.save_flags, SV_GIVE ) && !char_died(ch) )
    save_char_obj(ch);
  if ( IS_SET( sysdata.save_flags, SV_RECEIVE ) && !char_died(victim) )
    save_char_obj(victim);
  return;
}

/*
 * Damage an object.                                            -Thoric
 * Affect player's AC if necessary.
 * Make object into scraps if necessary.
 * Send message about damaged object.
 */
obj_ret damage_obj( OBJ_DATA *obj )
{
  CHAR_DATA *ch;
  obj_ret objcode;

  ch = obj->carried_by;
  objcode = rNONE;

  if (ch && ch->in_room && IS_SET(ch->in_room->room_flags,ROOM_ARENA))
    return objcode;

  separate_obj( obj );
  if ( ch )
    act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
  else
    if ( obj->in_room && ( ch = obj->in_room->first_person ) != NULL )
      {
        act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_ROOM );
        act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
        ch = NULL;
      }

  oprog_damage_trigger(ch, obj);
  if ( obj_extracted(obj) )
    return global_objcode;

  switch( obj->item_type )
    {
    default:
      make_scraps( obj );
      objcode = rOBJ_SCRAPPED;
      break;
    case ITEM_CONTAINER:
      if (--obj->value[3] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    case ITEM_ARMOR:
      if ( ch && obj->value[0] >= 1 )
        ch->armor += apply_ac( obj, obj->wear_loc );
      if (--obj->value[0] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      else
        if ( ch && obj->value[0] >= 1 )
          ch->armor -= apply_ac( obj, obj->wear_loc );
      break;
    case ITEM_WEAPON:
      if (--obj->value[0] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    }
  return objcode;
}


/*
 * Remove an object.
 */
bool remove_obj( CHAR_DATA *ch, int iWear, bool fReplace )
{
  OBJ_DATA *obj, *tmpobj;

  if ( ( obj = get_eq_char( ch, iWear ) ) == NULL )
    return TRUE;

  if ( !fReplace
       &&   ch->carry_number + get_obj_number( obj ) > can_carry_n( ch ) )
    {
      act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->name, TO_CHAR );
      return FALSE;
    }

  if ( !fReplace )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      act( AT_PLAIN, "You can't remove $p.", ch, obj, NULL, TO_CHAR );
      return FALSE;
    }

  if ( obj == get_eq_char( ch, WEAR_WIELD )
       && ( tmpobj = get_eq_char( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->wear_loc = WEAR_WIELD;

  unequip_char( ch, obj );

  act( AT_ACTION, "$n stops using $p.", ch, obj, NULL, TO_ROOM );
  act( AT_ACTION, "You stop using $p.", ch, obj, NULL, TO_CHAR );
  oprog_remove_trigger( ch, obj );
  return TRUE;
}

/*
 * See if char could be capable of dual-wielding                -Thoric
 */
bool could_dual( CHAR_DATA *ch )
{
  if ( IS_NPC(ch) )
    return TRUE;
  if ( ch->pcdata->learned[gsn_dual_wield] )
    return TRUE;

  return FALSE;
}

/*
 * See if char can dual wield at this time                      -Thoric
 */
bool can_dual( CHAR_DATA *ch )
{
  if ( !could_dual(ch) )
    return FALSE;

  if ( get_eq_char( ch, WEAR_DUAL_WIELD ) )
    {
      send_to_char( "You are already wielding two weapons!\r\n", ch );
      return FALSE;
    }
  if ( get_eq_char( ch, WEAR_HOLD ) )
    {
      send_to_char( "You cannot dual wield while holding something!\r\n", ch );
      return FALSE;
    }
  return TRUE;
}


/*
 * Check to see if there is room to wear another object on this location
 * (Layered clothing support)
 */
bool can_layer( CHAR_DATA *ch, OBJ_DATA *obj, short wear_loc )
{
  OBJ_DATA   *otmp;
  short bitlayers = 0;
  short objlayers = obj->pIndexData->layers;

  for ( otmp = ch->first_carrying; otmp; otmp = otmp->next_content )
    if ( otmp->wear_loc == wear_loc )
      {
        if ( !otmp->pIndexData->layers )
          return FALSE;
        else
          bitlayers |= otmp->pIndexData->layers;
      }

  if ( (bitlayers && !objlayers) || bitlayers > objlayers )
    return FALSE;
  if ( !bitlayers || ((bitlayers & ~objlayers) == bitlayers) )
    return TRUE;
  return FALSE;
}

/*
 * Wear one object.
 * Optional replacement of existing objects.
 * Big repetitive code, ick.
 * Restructured a bit to allow for specifying body location     -Thoric
 */
void wear_obj( CHAR_DATA *ch, OBJ_DATA *obj, bool fReplace, short wear_bit )
{
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *tmpobj;
  short bit, tmp;
  bool check_size;

  separate_obj( obj );

  if ( wear_bit > -1 )
    {
      bit = wear_bit;
      if ( !CAN_WEAR(obj, 1 << bit) )
        {
          if ( fReplace )
            {
              switch( 1 << bit )
                {
                case ITEM_HOLD:
                  send_to_char( "You cannot hold that.\r\n", ch );
                  break;
                case ITEM_WIELD:
                  send_to_char( "You cannot wield that.\r\n", ch );
                  break;
                default:
                  sprintf( buf, "You cannot wear that on your %s.\r\n",
                           w_flags[bit] );
                  send_to_char( buf, ch );
                }
            }
          return;
        }
    }
  else
    {
      for ( bit = -1, tmp = 1; tmp < 31; tmp++ )
        {
          if ( CAN_WEAR(obj, 1 << tmp) )
            {
              bit = tmp;
              break;
            }
        }
    }


  check_size = FALSE;

  if (  1 << bit == ITEM_WIELD ||   1 << bit == ITEM_HOLD
        || obj->item_type == ITEM_LIGHT ||   1 << bit == ITEM_WEAR_SHIELD )
    check_size = FALSE;
  else if ( ch->race == RACE_DEFEL )
    check_size = TRUE;
  else if ( !IS_NPC(ch) )
    switch (ch->race)
      {
      default:
      case RACE_TRANDOSHAN:
      case RACE_VERPINE:
      case RACE_HUMAN:
      case RACE_ADARIAN:
      case RACE_RODIAN:
      case RACE_TWI_LEK:

        if ( !IS_OBJ_STAT(obj, ITEM_HUMAN_SIZE) )
          check_size = TRUE;
        break;

      case RACE_HUTT:

        if ( !IS_OBJ_STAT(obj, ITEM_HUTT_SIZE) )
          check_size = TRUE;
        break;

      case RACE_GAMORREAN:
      case RACE_MON_CALAMARI:
      case RACE_QUARREN:
      case RACE_WOOKIEE:

        if ( !IS_OBJ_STAT(obj, ITEM_LARGE_SIZE) )
          check_size = TRUE;
        break;

      case RACE_CHADRA_FAN:
      case RACE_EWOK:
      case RACE_JAWA:
      case RACE_SULLUSTAN:
        if ( !IS_OBJ_STAT(obj, ITEM_SMALL_SIZE) )
          check_size = TRUE;
        break;

      }

  /*
    this seems redundant but it enables both multiple sized objects to be
    used as well as objects with no size flags at all
  */

  if ( check_size )
    {
      if ( ch->race == RACE_DEFEL )
        {
          act( AT_MAGIC, "It is against your nature to wear anything that might make you visible.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n wants to use $p, but doesn't.",
               ch, obj, NULL, TO_ROOM );
          return;
        }

      if ( IS_OBJ_STAT(obj, ITEM_HUTT_SIZE) )
        {
          act( AT_MAGIC, "That item is too big for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but it is too big.",
               ch, obj, NULL, TO_ROOM );
          return;
        }

      if ( IS_OBJ_STAT(obj, ITEM_LARGE_SIZE) || IS_OBJ_STAT(obj, ITEM_HUMAN_SIZE) )
        {
          act( AT_MAGIC, "That item is the wrong size for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but can't.",
               ch, obj, NULL, TO_ROOM );
          return;
        }

      if ( IS_OBJ_STAT(obj, ITEM_SMALL_SIZE) )
        {
          act( AT_MAGIC, "That item is too small for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but it is too small.",
               ch, obj, NULL, TO_ROOM );
          return;
        }
    }

  /* currently cannot have a light in non-light position */
  if ( obj->item_type == ITEM_LIGHT )
    {
      if ( !remove_obj( ch, WEAR_LIGHT, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n holds $p as a light.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You hold $p as your light.",  ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_LIGHT );
      oprog_wear_trigger( ch, obj );
      return;
    }

  if ( bit == -1 )
    {
      if ( fReplace )
        send_to_char( "You can't wear, wield, or hold that.\r\n", ch );
      return;
    }

  switch ( 1 << bit )
    {
    default:
      bug( "wear_obj: uknown/unused item_wear bit %d", bit );
      if ( fReplace )
        send_to_char( "You can't wear, wield, or hold that.\r\n", ch );
      return;

    case ITEM_WEAR_FINGER:
      if ( get_eq_char( ch, WEAR_FINGER_L )
           &&   get_eq_char( ch, WEAR_FINGER_R )
           &&   !remove_obj( ch, WEAR_FINGER_L, fReplace )
           &&   !remove_obj( ch, WEAR_FINGER_R, fReplace ) )
        return;

      if ( !get_eq_char( ch, WEAR_FINGER_L ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n slips $s left finger into $p.",    ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You slip your left finger into $p.",  ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_FINGER_L );
          oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !get_eq_char( ch, WEAR_FINGER_R ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n slips $s right finger into $p.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You slip your right finger into $p.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_FINGER_R );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free finger.", 0 );
      send_to_char( "You already wear something on both fingers.\r\n", ch );
      return;

    case ITEM_WEAR_NECK:
      if ( get_eq_char( ch, WEAR_NECK_1 ) != NULL
           &&   get_eq_char( ch, WEAR_NECK_2 ) != NULL
           &&   !remove_obj( ch, WEAR_NECK_1, fReplace )
           &&   !remove_obj( ch, WEAR_NECK_2, fReplace ) )
        return;

      if ( !get_eq_char( ch, WEAR_NECK_1 ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n wears $p around $s neck.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You wear $p around your neck.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_NECK_1 );
          oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !get_eq_char( ch, WEAR_NECK_2 ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n wears $p around $s neck.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You wear $p around your neck.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_NECK_2 );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free neck.", 0 );
      send_to_char( "You already wear two neck items.\r\n", ch );
      return;

    case ITEM_WEAR_BODY:
      /*
        if ( !remove_obj( ch, WEAR_BODY, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_BODY ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n fits $p on $s body.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You fit $p on your body.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_BODY );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_HEAD:
      if ( ch->race == RACE_VERPINE || ch->race == RACE_TWI_LEK )
        {
          send_to_char( "You cant wear anything on your head.\r\n", ch );
          return;
        }
      if ( !remove_obj( ch, WEAR_HEAD, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n dons $p upon $s head.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You don $p upon your head.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_HEAD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_EYES:
      if ( !remove_obj( ch, WEAR_EYES, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n places $p on $s eyes.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You place $p on your eyes.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_EYES );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_EARS:
      if ( ch->race == RACE_VERPINE )
        {
          send_to_char( "What ears?.\r\n", ch );
          return;
        }
      if ( !remove_obj( ch, WEAR_EARS, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s ears.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your ears.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_EARS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_LEGS:
      /*
        if ( !remove_obj( ch, WEAR_LEGS, fReplace ) )
        return;
      */
      if ( ch->race == RACE_HUTT )
        {
          send_to_char( "Hutts don't have legs.\r\n", ch );
          return;
        }
      if ( !can_layer( ch, obj, WEAR_LEGS ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n slips into $p.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You slip into $p.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_LEGS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_FEET:
      /*
        if ( !remove_obj( ch, WEAR_FEET, fReplace ) )
        return;
      */
      if ( ch->race == RACE_HUTT )
        {
          send_to_char( "Hutts don't have feet!\r\n", ch );
          return;
        }
      if ( !can_layer( ch, obj, WEAR_FEET ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s feet.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your feet.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_FEET );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_HANDS:
      /*
        if ( !remove_obj( ch, WEAR_HANDS, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_HANDS ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s hands.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your hands.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_HANDS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_ARMS:
      /*
        if ( !remove_obj( ch, WEAR_ARMS, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_ARMS ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s arms.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your arms.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_ARMS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_ABOUT:
      /*
        if ( !remove_obj( ch, WEAR_ABOUT, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_ABOUT ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p about $s body.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p about your body.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_ABOUT );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_WAIST:
      /*
        if ( !remove_obj( ch, WEAR_WAIST, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_WAIST ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p about $s waist.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p about your waist.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_WAIST );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_WRIST:
      if ( get_eq_char( ch, WEAR_WRIST_L )
           &&   get_eq_char( ch, WEAR_WRIST_R )
           &&   !remove_obj( ch, WEAR_WRIST_L, fReplace )
           &&   !remove_obj( ch, WEAR_WRIST_R, fReplace ) )
        return;

      if ( !get_eq_char( ch, WEAR_WRIST_L ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n fits $p around $s left wrist.",
                       ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You fit $p around your left wrist.",
                       ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_WRIST_L );
          oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !get_eq_char( ch, WEAR_WRIST_R ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n fits $p around $s right wrist.",
                       ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You fit $p around your right wrist.",
                       ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          equip_char( ch, obj, WEAR_WRIST_R );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free wrist.", 0 );
      send_to_char( "You already wear two wrist items.\r\n", ch );
      return;

    case ITEM_WEAR_SHIELD:
      if ( !remove_obj( ch, WEAR_SHIELD, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n uses $p as an energy shield.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You use $p as an energy shield.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_SHIELD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WIELD:
      if ( (tmpobj  = get_eq_char( ch, WEAR_WIELD )) != NULL
           &&   !could_dual(ch) )
        {
          send_to_char( "You're already wielding something.\r\n", ch );
          return;
        }

      if ( tmpobj )
        {
          if ( can_dual(ch) )
            {
              if ( get_obj_weight( obj ) + get_obj_weight( tmpobj ) > str_app[get_curr_str(ch)].wield )
                {
                  send_to_char( "It is too heavy for you to wield.\r\n", ch );
                  return;
                }
              if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
                {
                  if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                    {
                      act( AT_ACTION, "$n dual-wields $p.", ch, obj, NULL, TO_ROOM );
                      act( AT_ACTION, "You dual-wield $p.", ch, obj, NULL, TO_CHAR );
                    }
                  else
                    actiondesc( ch, obj, NULL );
                }
              equip_char( ch, obj, WEAR_DUAL_WIELD );
              oprog_wear_trigger( ch, obj );
            }
          return;
        }

      if ( get_obj_weight( obj ) > str_app[get_curr_str(ch)].wield )
        {
          send_to_char( "It is too heavy for you to wield.\r\n", ch );
          return;
        }

      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wields $p.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wield $p.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_WIELD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_HOLD:
      if ( get_eq_char( ch, WEAR_DUAL_WIELD ) )
        {
          send_to_char( "You cannot hold something AND two weapons!\r\n", ch );
          return;
        }
      if ( !remove_obj( ch, WEAR_HOLD, fReplace ) )
        return;
      if ( obj->item_type == ITEM_DEVICE
           || obj->item_type == ITEM_GRENADE
           || obj->item_type == ITEM_FOOD
           || obj->item_type == ITEM_PILL
           || obj->item_type == ITEM_POTION
           || obj->item_type == ITEM_DRINK_CON
           || obj->item_type == ITEM_SALVE
           || obj->item_type == ITEM_KEY
           || !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n holds $p in $s hands.",   ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You hold $p in your hands.", ch, obj, NULL, TO_CHAR );
        }
      equip_char( ch, obj, WEAR_HOLD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_FLOATING:
      if ( !can_layer( ch, obj, WEAR_FLOATING ) )
        {
          send_to_char( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n activates $p. $p takes up position behind $n",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You activate $p and it takes up position behind you.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_FLOATING );
      oprog_wear_trigger( ch, obj );
      return;
    case ITEM_WEAR_OVER:
      if ( !remove_obj( ch, WEAR_OVER, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p over you.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      equip_char( ch, obj, WEAR_OVER );
      oprog_wear_trigger( ch, obj );
      return;


    }
}


void do_wear( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  short wear_bit;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  if ( (!str_cmp(arg2, "on")  || !str_cmp(arg2, "upon") || !str_cmp(arg2, "around"))
       &&   argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Wear, wield, or hold what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( !str_cmp( arg1, "all" ) )
    {
      OBJ_DATA *obj_next;

      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->wear_loc == WEAR_NONE && can_see_obj( ch, obj ) )
            wear_obj( ch, obj, FALSE, -1 );
        }
      return;
    }
  else
    {
      if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return;
        }
      if ( arg2[0] != '\0' )
        wear_bit = get_wflag(arg2);
      else
        wear_bit = -1;
      wear_obj( ch, obj, TRUE, wear_bit );
    }

  return;
}



void do_remove( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj, *obj_next;


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
      act( AT_PLAIN, "You must remove $p first.", ch, obj_next, NULL, TO_CHAR );
      return;
    }

  remove_obj( ch, obj->wear_loc, TRUE );
  return;
}


void do_bury( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  bool shovel;
  short move;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "What do you wish to bury?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  shovel = FALSE;
  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->item_type == ITEM_SHOVEL )
      {
        shovel = TRUE;
        break;
      }

  obj = get_obj_list_rev( ch, arg, ch->in_room->last_content );
  if ( !obj )
    {
      send_to_char( "You can't find it.\r\n", ch );
      return;
    }

  separate_obj(obj);
  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      act( AT_PLAIN, "You cannot bury $p.", ch, obj, 0, TO_CHAR );
      return;
    }

  switch( ch->in_room->sector_type )
    {
    case SECT_CITY:
    case SECT_INSIDE:
      send_to_char( "The floor is too hard to dig through.\r\n", ch );
      return;
    case SECT_WATER_SWIM:
    case SECT_WATER_NOSWIM:
    case SECT_UNDERWATER:
      send_to_char( "You cannot bury something here.\r\n", ch );
      return;
    case SECT_AIR:
      send_to_char( "What?  In the air?!\r\n", ch );
      return;
    }

  if ( obj->weight > (UMAX(5, (can_carry_w(ch) / 10)))
       &&  !shovel )
    {
      send_to_char( "You'd need a shovel to bury something that big.\r\n", ch );
      return;
    }

  move = (obj->weight * 50 * (shovel ? 1 : 5)) / UMAX(1, can_carry_w(ch));
  move = URANGE( 2, move, 1000 );
  if ( move > ch->move )
    {
      send_to_char( "You don't have the energy to bury something of that size.\r\n", ch );
      return;
    }
  ch->move -= move;

  act( AT_ACTION, "You solemnly bury $p...", ch, obj, NULL, TO_CHAR );
  act( AT_ACTION, "$n solemnly buries $p...", ch, obj, NULL, TO_ROOM );
  SET_BIT( obj->extra_flags, ITEM_BURRIED );
  WAIT_STATE( ch, URANGE( 10, move / 2, 100 ) );
  return;
}

void do_sacrifice( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;

  one_argument( argument, arg );

  if( !ch || !ch->in_room )
    return;

  if ( arg[0] == '\0' || !str_cmp( arg, ch->name ) )
    {
      send_to_char( "Junk what?", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  obj = get_obj_list_rev( ch, arg, ch->in_room->last_content );
  if ( !obj )
    {
      send_to_char( "You can't find it.\r\n", ch );
      return;
    }

  separate_obj(obj);
  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }

  if ( obj->item_type != ITEM_CONTAINER && obj->item_type != ITEM_ARMOR && obj->item_type != ITEM_TRASH
       && obj->item_type != ITEM_KEY && obj->item_type != ITEM_DRINK_CON
       && obj->item_type != ITEM_MEDPAC )
    {
      act( AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, TO_CHAR );
      return;
    }


  oprog_sac_trigger( ch, obj );
  if ( obj_extracted(obj) )
    return;
  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_SACCED;
  extract_obj( obj );
  return;
}

void do_brandish( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  OBJ_DATA *staff;
  ch_ret retcode;
  int sn;

  if ( ( staff = get_eq_char( ch, WEAR_HOLD ) ) == NULL )
    {
      send_to_char( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( staff->item_type != ITEM_STAFF )
    {
      send_to_char( "You can brandish only with a staff.\r\n", ch );
      return;
    }

  if ( ( sn = staff->value[3] ) < 0
       ||   sn >= top_sn
       ||   skill_table[sn]->spell_fun == NULL )
    {
      bug( "Do_brandish: bad sn %d.", sn );
      return;
    }

  WAIT_STATE( ch, 2 * PULSE_VIOLENCE );

  if ( staff->value[2] > 0 )
    {
      if ( !oprog_use_trigger( ch, staff, NULL, NULL, NULL ) )
        {
          act( AT_MAGIC, "$n brandishes $p.", ch, staff, NULL, TO_ROOM );
          act( AT_MAGIC, "You brandish $p.",  ch, staff, NULL, TO_CHAR );
        }
      for ( vch = ch->in_room->first_person; vch; vch = vch_next )
        {
          vch_next      = vch->next_in_room;
          if ( !IS_NPC( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
               && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
            continue;
          else
            switch ( skill_table[sn]->target )
              {
              default:
                bug( "Do_brandish: bad target for sn %d.", sn );
                return;

              case TAR_IGNORE:
                if ( vch != ch )
                  continue;
                break;

              case TAR_CHAR_OFFENSIVE:
                if ( IS_NPC(ch) ? IS_NPC(vch) : !IS_NPC(vch) )
                  continue;
                break;

              case TAR_CHAR_DEFENSIVE:
                if ( IS_NPC(ch) ? !IS_NPC(vch) : IS_NPC(vch) )
                  continue;
                break;

              case TAR_CHAR_SELF:
                if ( vch != ch )
                  continue;
                break;
              }

          retcode = obj_cast_spell( staff->value[3], staff->value[0], ch, vch, NULL );
          if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
            {
              bug( "do_brandish: char died", 0 );
              return;
            }
        }
    }

  if ( --staff->value[2] <= 0 )
    {
      act( AT_MAGIC, "$p blazes bright and vanishes from $n's hands!", ch, staff, NULL, TO_ROOM );
      act( AT_MAGIC, "$p blazes bright and is gone!", ch, staff, NULL, TO_CHAR );
      if ( staff->serial == cur_obj )
        global_objcode = rOBJ_USED;
      extract_obj( staff );
    }

  return;
}



void do_zap( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *wand;
  OBJ_DATA *obj;
  ch_ret retcode;

  one_argument( argument, arg );
  if ( arg[0] == '\0' && !ch->fighting )
    {
      send_to_char( "Zap whom or what?\r\n", ch );
      return;
    }

  if ( ( wand = get_eq_char( ch, WEAR_HOLD ) ) == NULL )
    {
      send_to_char( "You hold nothing in your hand.\r\n", ch );
      return;
    }

  if ( wand->item_type != ITEM_WAND )
    {
      send_to_char( "You can zap only with a wand.\r\n", ch );
      return;
    }

  obj = NULL;
  if ( arg[0] == '\0' )
    {
      if ( ch->fighting )
        {
          victim = who_fighting( ch );
        }
      else
        {
          send_to_char( "Zap whom or what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = get_char_room ( ch, arg ) ) == NULL
           &&   ( obj    = get_obj_here  ( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find it.\r\n", ch );
          return;
        }
    }

  WAIT_STATE( ch, 1 * PULSE_VIOLENCE );

  if ( wand->value[2] > 0 )
    {
      if ( victim )
        {
          if ( !oprog_use_trigger( ch, wand, victim, NULL, NULL ) )
            {
              act( AT_MAGIC, "$n aims $p at $N.", ch, wand, victim, TO_ROOM );
              act( AT_MAGIC, "You aim $p at $N.", ch, wand, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !oprog_use_trigger( ch, wand, NULL, obj, NULL ) )
            {
              act( AT_MAGIC, "$n aims $p at $P.", ch, wand, obj, TO_ROOM );
              act( AT_MAGIC, "You aim $p at $P.", ch, wand, obj, TO_CHAR );
            }
        }

      retcode = obj_cast_spell( wand->value[3], wand->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          bug( "do_zap: char died", 0 );
          return;
        }
    }

  if ( --wand->value[2] <= 0 )
    {
      act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_ROOM );
      act( AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_CHAR );
      if ( wand->serial == cur_obj )
        global_objcode = rOBJ_USED;
      extract_obj( wand );
    }

  return;
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void save_clan_storeroom( CHAR_DATA *ch, CLAN_DATA *clan )
{
  FILE *fp;
  char filename[256];
  short templvl;
  OBJ_DATA *contents;

  if ( !clan )
    {
      bug( "save_clan_storeroom: Null clan pointer!", 0 );
      return;
    }

  if ( !ch )
    {
      bug ("save_clan_storeroom: Null ch pointer!", 0);
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );
  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_clan_storeroom: fopen", 0 );
      perror( filename );
    }
  else
    {
      templvl = ch->top_level;
      ch->top_level = LEVEL_HERO;               /* make sure EQ doesn't get lost */
      contents = ch->in_room->last_content;
      if (contents)
        fwrite_obj(ch, contents, fp, 0, OS_CARRY );
      fprintf( fp, "#END\n" );
      ch->top_level = templvl;
      fclose( fp );
      return;
    }
  return;
}

/* put an item on auction, or see the stats on the current item or bet */
void do_auction (CHAR_DATA *ch, char *argument)
{
  OBJ_DATA *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument (argument, arg1);

  if (IS_NPC(ch)) /* NPC can be extracted at any time and thus can't auction! */
    return;

  if ( !IS_SET( ch->in_room->room_flags , ROOM_HOTEL ) && !IS_SET( ch->in_room->room_flags , ROOM_HOTEL ) )
    {
      set_char_color ( AT_LBLUE, ch );
      send_to_char ( "\r\nYou must go to an auction hall to do that!\r\n", ch );
      return;
    }

  if ( ( time_info.hour > 18 || time_info.hour < 9 ) && auction->item == NULL )
    {
      set_char_color ( AT_LBLUE, ch );
      send_to_char ( "\r\nThe auctioneer has retired for the evening...\r\n", ch );
      return;
    }

  if (arg1[0] == '\0')
    {
      if (auction->item != NULL)
        {
          AFFECT_DATA *paf;
          obj = auction->item;

          /* show item data here */
          if (auction->bet > 0)
            sprintf (buf, "Current bid on this item is %d credits.\r\n",auction->bet);
          else
            sprintf (buf, "No bids on this item have been received.\r\n");
          set_char_color ( AT_BLUE, ch );
          send_to_char (buf,ch);
          /*          spell_identify (0, LEVEL_HERO - 1, ch, auction->item); */

          sprintf( buf,
                   "Object '%s' is %s, special properties: %s %s.\r\nIts weight is %d, value is %d.\r\n",
                   obj->name,
                   aoran( item_type_name( obj ) ),
                   extra_bit_name( obj->extra_flags ),
                   magic_bit_name( obj->magic_flags ),
                   obj->weight,
                   obj->cost );
          set_char_color( AT_LBLUE, ch );
          send_to_char( buf, ch );

          sprintf( buf, "Worn on: %s\r\n",
                   flag_string(obj->wear_flags -1, w_flags ) );
          send_to_char( buf, ch );

          set_char_color( AT_BLUE, ch );

          switch ( obj->item_type )
            {

            case ITEM_ARMOR:
              ch_printf( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->value[0] );
              ch_printf( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->value[1] );
              break;
            }

          for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
            showaffect( ch, paf );

          for ( paf = obj->first_affect; paf; paf = paf->next )
            showaffect( ch, paf );
          if ( ( obj->item_type == ITEM_CONTAINER ) && ( obj->first_content ) )
            {
              set_char_color( AT_OBJECT, ch );
              send_to_char( "Contents:\r\n", ch );
              show_list_to_char( obj->first_content, ch, TRUE, FALSE );
            }

          if (IS_IMMORTAL(ch))
            {
              sprintf(buf, "Seller: %s.  Bidder: %s.  Round: %d.\r\n",
                      auction->seller->name, auction->buyer->name,
                      (auction->going + 1));
              send_to_char(buf, ch);
              sprintf(buf, "Time left in round: %d.\r\n", auction->pulse);
              send_to_char(buf, ch);
            }
          return;
        }
      else
        {
          set_char_color ( AT_LBLUE, ch );
          send_to_char ( "\r\nThere is nothing being auctioned right now.  What would you like to auction?\r\n", ch );
          return;
        }
    }

  if ( IS_IMMORTAL(ch) && !str_cmp(arg1,"stop"))
    {
      if (auction->item == NULL)
        {
          send_to_char ("There is no auction to stop.\r\n",ch);
          return;
        }
      else /* stop the auction */
        {
          set_char_color ( AT_LBLUE, ch );
          sprintf (buf,"Sale of %s has been stopped by an Immortal.",
                   auction->item->short_descr);
          talk_auction (buf);
          obj_to_char (auction->item, auction->seller);
          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
            save_char_obj(auction->seller);
          auction->item = NULL;
          if (auction->buyer != NULL && auction->buyer != auction->seller) /* return money to the buyer */
            {
              auction->buyer->gold += auction->bet;
              send_to_char ("Your money has been returned.\r\n",auction->buyer);
            }
          return;
        }
    }

  if (!str_cmp(arg1,"bid") )
    {
      if (auction->item != NULL)
        {
          int newbet;

          if ( ch == auction->seller)
            {
              send_to_char("You can't bid on your own item!\r\n", ch);
              return;
            }

          /* make - perhaps - a bet now */
          if (argument[0] == '\0')
            {
              send_to_char ("Bid how much?\r\n",ch);
              return;
            }

          newbet = parsebet (auction->bet, argument);
          /*        ch_printf( ch, "Bid: %d\r\n",newbet);       */

          if (newbet < auction->starting)
            {
              send_to_char("You must place a bid that is higher than the starting bet.\r\n", ch);
              return;
            }

          /* to avoid slow auction, use a bigger amount than 100 if the bet
             is higher up - changed to 100 for our high economy
          */

          if (newbet < (auction->bet + 100))
            {
              send_to_char ("You must at least bid 10000 credits over the current bid.\r\n",ch);
              return;
            }

          if (newbet > ch->gold)
            {
              send_to_char ("You don't have that much money!\r\n",ch);
              return;
            }

          if (newbet > 2000000000)
            {
              send_to_char("You can't bid over 2 billion credits.\r\n", ch);
              return;
            }

          /* the actual bet is OK! */

          /* return the gold to the last buyer, if one exists */
          if (auction->buyer != NULL && auction->buyer != auction->seller)
            auction->buyer->gold += auction->bet;

          ch->gold -= newbet; /* substract the gold - important :) */
          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
            save_char_obj(ch);
          auction->buyer = ch;
          auction->bet   = newbet;
          auction->going = 0;
          auction->pulse = PULSE_AUCTION; /* start the auction over again */

          sprintf (buf,"A bid of %d credits has been received on %s.\r\n",newbet,auction->item->short_descr);
          talk_auction (buf);
          return;


        }
      else
        {
          send_to_char ("There isn't anything being auctioned right now.\r\n",ch);
          return;
        }
    }

  /* finally... */
  if ( ms_find_obj(ch) )
    return;

  obj = get_obj_carry (ch, arg1); /* does char have the item ? */

  if (obj == NULL)
    {
      send_to_char ("You aren't carrying that.\r\n",ch);
      return;
    }

  if (obj->timer > 0)
    {
      send_to_char ("You can't auction objects that are decaying.\r\n", ch);
      return;
    }

  argument = one_argument (argument, arg2);

  if (arg2[0] == '\0')
    {
      auction->starting = 0;
      strcpy(arg2, "0");
    }

  if ( !is_number(arg2) )
    {
      send_to_char("You must input a number at which to start the auction.\r\n", ch);
      return;
    }

  if ( atoi(arg2) < 0 )
    {
      send_to_char("You can't auction something for less than 0 credits!\r\n", ch);
      return;
    }

  if (auction->item == NULL)
    switch (obj->item_type)
      {

      default:
        act (AT_TELL, "You cannot auction $Ts.",ch, NULL, item_type_name (obj), TO_CHAR);
        return;

        /* insert any more item types here... items with a timer MAY NOT BE
           AUCTIONED!
        */
      case ITEM_LIGHT:
      case ITEM_TREASURE:
      case ITEM_RARE_METAL:
      case ITEM_CRYSTAL:
      case ITEM_BOOK:
      case ITEM_FABRIC:
      case ITEM_ARMOR:
      case ITEM_CONTAINER:
        separate_obj(obj);
        obj_from_char (obj);
        if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
          save_char_obj(ch);
        auction->item = obj;
        auction->bet = 0;
        auction->buyer = ch;
        auction->seller = ch;
        auction->pulse = PULSE_AUCTION;
        auction->going = 0;
        auction->starting = atoi(arg2);

        if (auction->starting > 0)
          auction->bet = auction->starting;

        sprintf (buf, "A new item is being auctioned: %s at %d credits.", obj->short_descr, auction->starting);
        talk_auction (buf);

        return;

      } /* switch */
  else
    {
      act (AT_TELL, "Try again later - $p is being auctioned right now!",ch,auction->item,NULL,TO_CHAR);
      WAIT_STATE( ch, 1.5 * PULSE_VIOLENCE );
      return;
    }
}



/* Make objects in rooms that are nofloor fall - Scryn 1/23/96 */

void obj_fall( OBJ_DATA *obj, bool through )
{
  EXIT_DATA *pexit;
  ROOM_INDEX_DATA *to_room;
  static int fall_count;
  char buf[MAX_STRING_LENGTH];
  static bool is_falling; /* Stop loops from the call to obj_to_room()  -- Altrag */

  if ( !obj->in_room || is_falling )
    return;

  if (fall_count > 30)
    {
      bug( "object falling in loop more than 30 times", 0 );
      extract_obj(obj);
      fall_count = 0;
      return;
    }

  if ( IS_SET( obj->in_room->room_flags, ROOM_NOFLOOR )
       &&   CAN_GO( obj, DIR_DOWN )
       &&   !IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    {

      pexit = get_exit( obj->in_room, DIR_DOWN );
      to_room = pexit->to_room;

      if (through)
        fall_count++;
      else
        fall_count = 0;

      if (obj->in_room == to_room)
        {
          sprintf(buf, "Object falling into same room, room %d",
                  to_room->vnum);
          bug( buf, 0 );
          extract_obj( obj );
          return;
        }

      if (obj->in_room->first_person)
        {
          act( AT_PLAIN, "$p falls far below...",
               obj->in_room->first_person, obj, NULL, TO_ROOM );
          act( AT_PLAIN, "$p falls far below...",
               obj->in_room->first_person, obj, NULL, TO_CHAR );
        }
      obj_from_room( obj );
      is_falling = TRUE;
      obj = obj_to_room( obj, to_room );
      is_falling = FALSE;

      if (obj->in_room->first_person)
        {
          act( AT_PLAIN, "$p falls from above...",
               obj->in_room->first_person, obj, NULL, TO_ROOM );
          act( AT_PLAIN, "$p falls from above...",
               obj->in_room->first_person, obj, NULL, TO_CHAR );
        }

      if (!IS_SET( obj->in_room->room_flags, ROOM_NOFLOOR ) && through )
        {
          /*            int dam = (int)9.81*sqrt(fall_count*2/9.81)*obj->weight/2;
           */           int dam = fall_count*obj->weight/2;
          /* Damage players */
          if ( obj->in_room->first_person && number_percent() > 15 )
            {
              CHAR_DATA *rch;
              CHAR_DATA *vch = NULL;
              int chcnt = 0;

              for ( rch = obj->in_room->first_person; rch;
                    rch = rch->next_in_room, chcnt++ )
                if ( number_range( 0, chcnt ) == 0 )
                  vch = rch;
              act( AT_WHITE, "$p falls on $n!", vch, obj, NULL, TO_ROOM );
              act( AT_WHITE, "$p falls on you!", vch, obj, NULL, TO_CHAR );
              damage( vch, vch, dam*vch->top_level, TYPE_UNDEFINED );
            }
          /* Damage objects */
          switch( obj->item_type )
            {
            case ITEM_WEAPON:
            case ITEM_ARMOR:
              if ( (obj->value[0] - dam) <= 0 )
                {
                  if (obj->in_room->first_person)
                    {
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_ROOM );
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_CHAR );
                    }
                  make_scraps(obj);
                }
              else
                obj->value[0] -= dam;
              break;
            default:
              if ( (dam*15) > get_obj_resistance(obj) )
                {
                  if (obj->in_room->first_person)
                    {
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_ROOM );
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_CHAR );
                    }
                  make_scraps(obj);
                }
              break;
            }
        }
      obj_fall( obj, TRUE );
    }
  return;
}
