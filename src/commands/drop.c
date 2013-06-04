#include "character.h"
#include "mud.h"
#include "clan.h"

static void SaveClanStoreroom( void *element, void *userData );

void do_drop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;
  bool found;
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
       ||   ( !is_npc(ch) && IS_SET( ch->act, PLR_LITTERBUG )) )
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
	{
	  List_ForEach( ClanList, SaveClanStoreroom, ch );
	}
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
              if ( obj->pIndexData->mprog.progtypes & DROP_PROG && obj->count > 1 )
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
	List_ForEach( ClanList, SaveClanStoreroom, ch );

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
}

static void SaveClanStoreroom( void *element, void *userData )
{
  Clan *clan = (Clan*) element;
  Character *ch = (Character*) userData;

  if ( clan->storeroom == ch->in_room->vnum )
    {
      save_clan_storeroom(ch, clan);
    }
}
