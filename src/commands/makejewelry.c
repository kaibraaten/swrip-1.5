#include <string.h>
#include "mud.h"
#include "character.h"

static void on_start( CHAR_DATA *ch, char *argument );
static void on_finished( CHAR_DATA *ch );
static void on_abort( CHAR_DATA *ch );

void do_makejewelry( CHAR_DATA *ch, char *argument )
{
  switch( ch->substate )
    {
    default:
      on_start( ch, argument );
      break;

    case SUB_PAUSE:
      ch->substate = SUB_NONE;
      on_finished( ch );
      break;

    case SUB_TIMER_DO_ABORT:
      ch->substate = SUB_NONE;
      on_abort( ch );
      break;
    }
}

static void on_start( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int the_chance = 0;
  bool checktool = false;
  bool checkoven = false;
  bool checkmetal = false;
  OBJ_DATA *obj = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( arg2[0] == '\0' )
    {
      send_to_char( "&RUsage: Makejewelry <wearloc> <name>\r\n&w", ch);
      return;
    }

  if ( !str_cmp( arg, "body" )
       || !str_cmp( arg, "head" )
       || !str_cmp( arg, "legs" )
       || !str_cmp( arg, "arms" )
       || !str_cmp( arg, "about" )
       || !str_cmp( arg, "waist" )
       || !str_cmp( arg, "hold" )
       || !str_cmp( arg, "feet" )
       || !str_cmp( arg, "over" )
       || !str_cmp( arg, "floating" )
       || !str_cmp( arg, "hands" ) )
    {
      send_to_char( "&RYou cannot make jewelry for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEARMOR.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make jewelry worn as a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with your jewelry?\r\n&w", ch);
      send_to_char( "&RTry MAKEBLADE...\r\n&w", ch);
      return;
    }

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = true;
          if (obj->item_type == ITEM_OVEN)
            checkoven = true;
          if (obj->item_type == ITEM_RARE_METAL)
            checkmetal = true;
        }

      if ( !checktool )
        {
          send_to_char( "&RYou need a toolkit.\r\n", ch);
          return;
        }

      if ( !checkoven )
        {
          send_to_char( "&RYou need an oven.\r\n", ch);
          return;
        }

      if ( !checkmetal )
        {
          send_to_char( "&RYou need some precious metal.\r\n", ch);
          return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makejewelry]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of creating some jewelry.\r\n", ch);
          act( AT_PLAIN, "$n takes $s toolkit and some metal and begins to work.", ch,
               NULL, NULL , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 15 , do_makejewelry , 1 );
          ch->dest_buf = str_dup(arg);
          ch->dest_buf_2 = str_dup(arg2);
        }
      else
	{
	  send_to_char("&RYou can't figure out what to do.\r\n",ch);
	  learn_from_failure( ch, gsn_makejewelry );
	}
}

static void on_finished( CHAR_DATA *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level = 0;
  int the_chance = 0;
  bool checktool = false;
  bool checkoven = false;
  bool checkmetal = false;
  OBJ_DATA *obj = NULL;
  OBJ_DATA *metal = NULL;
  int value = 0;
  int cost = 0;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  if ( !ch->dest_buf_2 )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);
  strcpy(arg2, (const char*)ch->dest_buf_2);
  DISPOSE( ch->dest_buf_2);

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makejewelry]);

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = true;

      if (obj->item_type == ITEM_OVEN)
        checkoven = true;

      if (obj->item_type == ITEM_RARE_METAL && checkmetal == false)
        {
          checkmetal = true;
          separate_obj( obj );
          obj_from_char( obj );
          metal = obj;
        }

      if (obj->item_type == ITEM_CRYSTAL)
        {
          cost += obj->cost;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makejewelry]) ;

  if ( number_percent( ) > the_chance*2  || ( !checkoven ) || ( !checktool ) || ( !checkmetal ) )
    {
      send_to_char( "&RYou hold up your newly created jewelry.\r\n", ch);
      send_to_char( "&RIt suddenly dawns upon you that you have created the most useless\r\n", ch);
      send_to_char( "&Rpiece of junk you've ever seen. You quickly hide your mistake...\r\n", ch);
      learn_from_failure( ch, gsn_makejewelry );
      return;
    }

  obj = metal;

  obj->item_type = ITEM_ARMOR;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( arg );

  if ( value < 0 || value > 31 )
    SET_BIT( obj->wear_flags, ITEM_WEAR_NECK );
  else
    SET_BIT( obj->wear_flags, 1 << value );

  obj->level = level;
  STRFREE( obj->name );
  strcpy( buf, arg2 );
  obj->name = STRALLOC( buf );
  strcpy( buf, arg2 );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was dropped here." );
  obj->description = STRALLOC( buf );
  obj->value[0] = obj->value[1];
  obj->cost *= 10;
  obj->cost += cost;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created jewelry.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes sewing some new jewelry.", ch,
       NULL, NULL , TO_ROOM );

  xpgain = UMIN( obj->cost*100 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1 ) - exp_level(get_level(ch, ENGINEERING_ABILITY ) ) ) );
  gain_exp(ch, ENGINEERING_ABILITY, xpgain );
  ch_printf( ch , "You gain %d engineering experience.", xpgain );

  learn_from_success( ch, gsn_makejewelry );
}

static void on_abort( CHAR_DATA *ch )
{
  DISPOSE( ch->dest_buf );
  DISPOSE( ch->dest_buf_2 );
  send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
}
