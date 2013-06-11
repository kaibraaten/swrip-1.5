#include <string.h>
#include "mud.h"
#include "character.h"

void do_makeshield( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance;
  bool checktool, checkbatt, checkcond, checkcirc, checkgems;
  OBJ_DATA *obj;
  OBJ_INDEX_DATA *pObjIndex;
  int vnum, level, charge, gemtype = 0;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if ( arg[0] == '\0' )
        {
          send_to_char( "&RUsage: Makeshield <name>\r\n&w", ch);
          return;
        }

      checktool = FALSE;
      checkbatt = FALSE;
      checkcond = FALSE;
      checkcirc = FALSE;
      checkgems = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a workshop.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = TRUE;
          if (obj->item_type == ITEM_CRYSTAL)
            checkgems = TRUE;
          if (obj->item_type == ITEM_BATTERY)
            checkbatt = TRUE;
          if (obj->item_type == ITEM_CIRCUIT)
            checkcirc = TRUE;
          if (obj->item_type == ITEM_SUPERCONDUCTOR)
            checkcond = TRUE;
        }

      if ( !checktool )
        {
          send_to_char( "&RYou need toolkit to make an energy shield.\r\n", ch);
          return;
        }

      if ( !checkbatt )
        {
          send_to_char( "&RYou need a power source for your energy shield.\r\n", ch);
          return;
        }

      if ( !checkcirc )
        {
          send_to_char( "&RYou need a small circuit board.\r\n", ch);
          return;
        }

      if ( !checkcond )
        {
          send_to_char( "&RYou still need a small superconductor for your energy shield.\r\n", ch);
          return;
        }

      if ( !checkgems )
        {
          send_to_char( "&RYou need a small crystal.\r\n", ch);
          return;
        }

      the_chance = IsNpc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makeshield]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of crafting an energy shield.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 20 , do_makeshield , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makeshield );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  level = IsNpc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeshield]);
  vnum = 10429;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checktool = FALSE;
  checkbatt = FALSE;
  checkcond = FALSE;
  checkcirc = FALSE;
  checkgems = FALSE;
  charge = 0;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = TRUE;

      if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
        {
          charge = UMIN(obj->value[1], 10);
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
        }
      if (obj->item_type == ITEM_SUPERCONDUCTOR && checkcond == FALSE)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcond = TRUE;
        }
      if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
        {
          separate_obj( obj );
          obj_from_char( obj );
	  extract_obj( obj );
          checkcirc = TRUE;
        }
      if (obj->item_type == ITEM_CRYSTAL && checkgems == FALSE)
        {
          gemtype = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkgems = TRUE;
        }
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makeshield]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkbatt )
       || ( !checkgems ) || ( !checkcond ) || ( !checkcirc) )

    {
      send_to_char( "&RYou hold up your new energy shield and press the switch hoping for the best.\r\n", ch);
      send_to_char( "&RInstead of a field of energy being created, smoke starts pouring from the device.\r\n", ch);
      send_to_char( "&RYou drop the hot device and watch as it melts on away on the floor.\r\n", ch);
      learn_from_failure( ch, gsn_makeshield );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_ARMOR;
  SET_BIT( obj->wear_flags, ITEM_WIELD );
  SET_BIT( obj->wear_flags, ITEM_WEAR_SHIELD );
  obj->level = level;
  obj->weight = 2;
  STRFREE( obj->name );
  obj->name = STRALLOC( "energy shield" );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = STRALLOC( buf );
  obj->value[0] = (int) (level/10+gemtype*2);      /* condition */
  obj->value[1] = (int) (level/10+gemtype*2);      /* armor */
  obj->value[4] = charge;
  obj->value[5] = charge;
  obj->cost = obj->value[2]*100;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created energy shield.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new energy shield.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*50 ,( exp_level(get_level(ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }

  learn_from_success( ch, gsn_makeshield );
}

