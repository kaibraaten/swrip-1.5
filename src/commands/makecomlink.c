#include <string.h>
#include "mud.h"
#include "character.h"

void do_makecomlink( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance;
  bool checktool, checkgem, checkbatt, checkcirc;
  OBJ_DATA *obj;
  int value;
  OBJ_INDEX_DATA *pObjIndex;
  int vnum;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( !str_cmp( arg, "body" )
       || !str_cmp( arg, "head" )
       || !str_cmp( arg, "legs" )
       || !str_cmp( arg, "arms" )
       || !str_cmp( arg, "about" )
       || !str_cmp( arg, "eyes" )
       || !str_cmp( arg, "waist" )
       || !str_cmp( arg, "hold" )
       || !str_cmp( arg, "feet" )
       || !str_cmp( arg, "hands" ) )
    {
      send_to_char( "&RYou cannot make a comlink for that body part.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make a comlink worn as a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with your comlink?\r\n&w", ch);
      return;
    }

  switch( ch->substate )
    {
    default:
      if ( arg2[0] == '\0' )
        {
          send_to_char( "&RUsage: Makecomlink <wearloc> <name>\r\n&w", ch);
          return;
        }

      checktool = FALSE;
      checkgem = FALSE;
      checkbatt = FALSE;
      checkcirc = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = TRUE;
          if (obj->item_type == ITEM_CRYSTAL)
            checkgem = TRUE;
          if (obj->item_type == ITEM_BATTERY)
            checkbatt = TRUE;
          if (obj->item_type == ITEM_CIRCUIT)
            checkcirc = TRUE;
        }

      if ( !checktool )
        {
          send_to_char( "&RYou need toolkit to make a comlink.\r\n", ch);
          return;
        }

      if ( !checkgem )
        {
          send_to_char( "&RYou need a small crystal.\r\n", ch);
          return;
        }

      if ( !checkbatt )
        {
          send_to_char( "&RYou need a power source for your comlink.\r\n", ch);
          return;
        }

      if ( !checkcirc )
        {
          send_to_char( "&RYou need a small circuit.\r\n", ch);
          return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makecomlink]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of making a comlink.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 10 , do_makecomlink , 1 );
          ch->dest_buf = str_dup(arg);
          ch->dest_buf_2 = str_dup(arg2);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makecomlink );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      if ( !ch->dest_buf_2 )
        return;
      strcpy(arg2, (const char*)ch->dest_buf_2);
      DISPOSE( ch->dest_buf_2);
      break;
    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  vnum = 10430;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checktool = FALSE;
  checkgem  = FALSE;
  checkbatt = FALSE;
  checkcirc = FALSE;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = TRUE;
      if (obj->item_type == ITEM_CRYSTAL && checkgem == FALSE)
        {
          checkgem = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
        {
          checkcirc = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE )
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
	}
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makecomlink]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkcirc ) || ( !checkbatt ) || ( !checkgem ) )
    {
      send_to_char( "&RYou hold up your newly created comlink....\r\n", ch);
      send_to_char( "&Rand it falls apart in your hands.\r\n", ch);
      learn_from_failure( ch, gsn_makecomlink );
      return;
    }

  obj = create_object( pObjIndex, ch->top_level );

  obj->item_type = ITEM_COMLINK;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( arg );
  if ( value < 0 || value > 31 )
    SET_BIT( obj->wear_flags, ITEM_WEAR_NECK );
  else
    SET_BIT( obj->wear_flags, 1 << value );
  obj->weight = 1;
  STRFREE( obj->name );
  strcpy( buf, arg2 );
  strcat( buf, " comlink" );
  obj->name = STRALLOC( buf );
  strcpy( buf, arg2 );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was left here." );
  obj->description = STRALLOC( buf );
  obj->cost = 50;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created comlink.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes crafting a comlink.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*100 ,( exp_level(get_level(ch, ENGINEERING_ABILITY ) + 1 ) - exp_level(get_level(ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }

  learn_from_success( ch, gsn_makecomlink );
}
