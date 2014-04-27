#include <string.h>
#include "mud.h"
#include "character.h"

void do_makearmor( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level, the_chance;
  bool checksew, checkfab;
  OBJ_DATA *obj;
  OBJ_DATA *material = NULL;
  int value;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( !str_cmp( arg, "eyes" )
       || !str_cmp( arg, "ears" )
       || !str_cmp( arg, "finger" )
       || !str_cmp( arg, "neck" )
       || !str_cmp( arg, "floating" )
       || !str_cmp( arg, "wrist" ) )
    {
      send_to_char( "&RYou cannot make clothing for that body part.\r\n&w", ch);
      send_to_char( "&RTry MAKEJEWELRY.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "shield" ) )
    {
      send_to_char( "&RYou cannot make clothing worn as a shield.\r\n&w", ch);
      send_to_char( "&RTry MAKESHIELD.\r\n&w", ch);
      return;
    }
  if ( !str_cmp( arg, "wield" ) )
    {
      send_to_char( "&RAre you going to fight with your clothing?\r\n&w", ch);
      send_to_char( "&RTry MAKEBLADE...\r\n&w", ch);
      return;
    }

  switch( ch->substate )
    {
    default:

      if ( arg2[0] == '\0' )
        {
          send_to_char( "&RUsage: Makearmor <wearloc> <name>\r\n&w", ch);
          return;
        }

      checksew = FALSE;
      checkfab = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
	{
          if (obj->item_type == ITEM_FABRIC)
            checkfab = TRUE;
          if (obj->item_type == ITEM_THREAD)
            checksew = TRUE;
        }

      if ( !checkfab )
        {
          send_to_char( "&RYou need some sort of fabric or material.\r\n", ch);
          return;
        }

      if ( !checksew )
        {
          send_to_char( "&RYou need a needle and some thread.\r\n", ch);
          return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makearmor]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of creating some armor.\r\n", ch);
          act( AT_PLAIN, "$n takes $s sewing kit and some material and begins to work.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 15 , do_makearmor , 1 );
          ch->dest_buf = str_dup(arg);
          ch->dest_buf_2 = str_dup(arg2);
          return;
        }
      send_to_char("&RYou can't figure out what to do.\r\n",ch);
      learn_from_failure( ch, gsn_makearmor );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      if ( !ch->dest_buf_2 )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      strcpy(arg2, (const char*)ch->dest_buf_2);
      DISPOSE( ch->dest_buf_2);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      DISPOSE( ch->dest_buf_2 );
      ch->substate = SUB_NONE;
      send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makearmor]);

  checksew = FALSE;
  checkfab = FALSE;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_THREAD)
        checksew = TRUE;
      if (obj->item_type == ITEM_FABRIC && checkfab == FALSE)
        {
          checkfab = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          material = obj;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makearmor]) ;

  if ( number_percent( ) > the_chance*2  || ( !checkfab ) || ( !checksew ) )
    {
      send_to_char( "&RYou hold up your newly created armor.\r\n", ch);
      send_to_char( "&RIt suddenly dawns upon you that you have created the most useless\r\n", ch);
      send_to_char( "&Rgarment you've ever seen. You quickly hide your mistake...\r\n", ch);
      learn_from_failure( ch, gsn_makearmor );
      return;
    }

  obj = material;

  obj->item_type = ITEM_ARMOR;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  value = get_wearflag( arg );
  if ( value < 0 || value > 31 )
    SET_BIT( obj->wear_flags, ITEM_WEAR_BODY );
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

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created garment.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes sewing some new armor.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*100 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }
  learn_from_success( ch, gsn_makearmor );
}
