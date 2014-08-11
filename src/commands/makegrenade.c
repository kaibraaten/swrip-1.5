#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( Character *ch, char *argument );
static void OnFinished( Character *ch );
static void OnAbort( Character *ch );

void do_makegrenade( Character *ch, char *argument )
{
  switch( ch->substate )
    {
    default:
      OnStart( ch, argument );
      break;

    case SUB_PAUSE:
      ch->substate = SUB_NONE;
      OnFinished( ch );
      break;

    case SUB_TIMER_DO_ABORT:
      ch->substate = SUB_NONE;
      OnAbort( ch );
      break;
    }
}

static void OnStart( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0;
  bool checktool = false;
  bool checkdrink = false;
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  OBJ_DATA *obj = NULL;

  strcpy( arg , argument );

  if ( arg[0] == '\0' )
    {
      send_to_char( "&RUsage: Makegrenade <name>\r\n&w", ch);
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
      if (obj->item_type == ITEM_DRINK_CON
	  && obj->value[OVAL_DRINK_CON_CURRENT_AMOUNT] == 0 )
	checkdrink = true;
      if (obj->item_type == ITEM_BATTERY)
	checkbatt = true;
      if (obj->item_type == ITEM_CIRCUIT)
	checkcirc = true;
      if (obj->item_type == ITEM_CHEMICAL)
	checkchem = true;
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

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makegrenade]);

  if ( number_percent( ) < the_chance )
    {
      send_to_char( "&GYou begin the long process of making a grenade.\r\n", ch);
      act( AT_PLAIN, "$n takes $s tools and a drink container and begins to work on something.", ch,
	   NULL, NULL , TO_ROOM );
      add_timer ( ch , TIMER_DO_FUN , 25 , do_makegrenade , SUB_PAUSE );
      ch->dest_buf   = str_dup(arg);
      return;
    }
  else
    {
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makegrenade );
    }
}

static void OnFinished( Character *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level = 0;
  int the_chance = 0;
  int weight = 0;
  int strength = 0;
  bool checktool = false;
  bool checkdrink = false;
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  OBJ_DATA *obj = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  vnum_t vnum = INVALID_VNUM;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makegrenade]);
  vnum = OBJ_VNUM_CRAFTING_GRENADE;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = true;
      if (obj->item_type == ITEM_DRINK_CON && checkdrink == false
	  && obj->value[OVAL_DRINK_CON_CURRENT_AMOUNT] == 0 )
        {
          checkdrink = true;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_BATTERY && checkbatt == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = true;
        }
      if (obj->item_type == ITEM_CHEMICAL)
        {
          strength = URANGE( 10, obj->value[OVAL_CHEMICAL_STRENGTH], level * 5 );
          weight = obj->weight;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkchem = true;
        }
      if (obj->item_type == ITEM_CIRCUIT && checkcirc == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = true;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
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
  obj->value[OVAL_GRENADE_MIN_DMG] = strength/2;
  obj->value[OVAL_GRENADE_MAX_DMG] = strength;
  obj->cost = obj->value[OVAL_GRENADE_MAX_DMG]*5;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created grenade.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new grenade.", ch,
       NULL, NULL , TO_ROOM );

  xpgain = UMIN( obj->cost*50 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
  gain_exp(ch, ENGINEERING_ABILITY, xpgain );
  ch_printf( ch , "You gain %d engineering experience.", xpgain );

  learn_from_success( ch, gsn_makegrenade );
}

static void OnAbort( Character *ch )
{
  DISPOSE( ch->dest_buf );
  send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
}
