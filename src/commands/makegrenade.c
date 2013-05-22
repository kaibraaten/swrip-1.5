#include <string.h>
#include "mud.h"
#include "character.h"

void do_makegrenade( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level, the_chance, weight = 0, strength = 0;
  bool checktool, checkdrink, checkbatt, checkchem, checkcirc;
  OBJ_DATA *obj = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  int vnum = 0;

  strcpy( arg , argument );

  switch( ch->substate )
    {
    default:
      if ( arg[0] == '\0' )
        {
          send_to_char( "&RUsage: Makegrenade <name>\r\n&w", ch);
          return;
        }

      checktool  = FALSE;
      checkdrink = FALSE;
      checkbatt  = FALSE;
      checkchem  = FALSE;
      checkcirc  = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = TRUE;
          if (obj->item_type == ITEM_DRINK_CON && obj->value[1] == 0 )
            checkdrink = TRUE;
          if (obj->item_type == ITEM_BATTERY)
            checkbatt = TRUE;
          if (obj->item_type == ITEM_CIRCUIT)
            checkcirc = TRUE;
          if (obj->item_type == ITEM_CHEMICAL)
            checkchem = TRUE;
        }

      if ( !checktool )
        {
          send_to_char( "&RYou need toolkit to make a grenade.\r\n", ch);
          return;
        }

      if ( !checkdrink )
        {
          send_to_char( "&RYou will need an empty drink container to mix and hold the chemicals.\r\n", ch);
          return;
        }

      if ( !checkbatt )
        {
          send_to_char( "&RYou need a small battery for the timer.\r\n", ch);
          return;
        }

      if ( !checkcirc )
        {
          send_to_char( "&RYou need a small circuit for the timer.\r\n", ch);
          return;
	}

      if ( !checkchem )
        {
          send_to_char( "&RSome explosive chemicals would come in handy!\r\n", ch);
          return;
        }

      the_chance = IS_NPC(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makegrenade]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of making a grenade.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and a drink container and begins to work on something.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 25 , do_makegrenade , 1 );
          ch->dest_buf   = str_dup(arg);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makegrenade );
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

  level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makegrenade]);
  vnum = 10425;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checktool = FALSE;
  checkdrink = FALSE;
  checkbatt = FALSE;
  checkchem = FALSE;
  checkcirc = FALSE;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = TRUE;
      if (obj->item_type == ITEM_DRINK_CON && checkdrink == FALSE && obj->value[1] == 0 )
        {
          checkdrink = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
        }
      if (obj->item_type == ITEM_CHEMICAL)
        {
          strength = URANGE( 10, obj->value[0], level * 5 );
          weight = obj->weight;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkchem = TRUE;
        }
      if (obj->item_type == ITEM_CIRCUIT && checkcirc == FALSE)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = TRUE;
        }
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makegrenade]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkdrink ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
      send_to_char( "&RJust as you are about to finish your work,\r\nyour newly created grenade explodes in your hands...doh!\r\n", ch);
      learn_from_failure( ch, gsn_makegrenade );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_GRENADE;
  SET_BIT( obj->wear_flags, ITEM_HOLD );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = weight;
  STRFREE( obj->name );
  strcpy( buf , arg );
  strcat( buf , " grenade");
  obj->name = STRALLOC( buf );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = STRALLOC( buf );
  obj->value[0] = strength/2;
  obj->value[1] = strength;
  obj->cost = obj->value[1]*5;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created grenade.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new grenade.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*50 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }
  learn_from_success( ch, gsn_makegrenade );
}
