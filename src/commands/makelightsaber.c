#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( Character *ch, char *argument );
static void OnFinished( Character *ch );
static void OnAbort( Character *ch );

void do_makelightsaber( Character *ch, char *argument )
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
  bool checkdura = false;
  bool checkbatt = false;
  bool checkoven = false;
  bool checkcond = false;
  bool checkcirc = false;
  bool checklens = false;
  bool checkgems = false;
  bool checkmirr = false;
  OBJ_DATA *obj = NULL;

  strcpy( arg, argument );

  if ( arg[0] == '\0' )
    {
      send_to_char( "&RUsage: Makelightsaber <name>\r\n&w", ch);
      return;
    }

  if ( !IS_SET( ch->in_room->room_flags, ROOM_SAFE ) || !IS_SET( ch->in_room->room_flags, ROOM_SILENCE ))
    {
      send_to_char( "&RYou need to be in a quiet peaceful place to craft a lightsaber.\r\n", ch);
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
	checktool = true;
      if (obj->item_type == ITEM_LENS)
	checklens = true;
      if (obj->item_type == ITEM_CRYSTAL)
	checkgems = true;
      if (obj->item_type == ITEM_MIRROR)
	checkmirr = true;
      if (obj->item_type == ITEM_DURAPLAST || obj->item_type == ITEM_DURASTEEL )
	checkdura = true;
      if (obj->item_type == ITEM_BATTERY)
	checkbatt = true;
      if (obj->item_type == ITEM_OVEN)
	checkoven = true;
      if (obj->item_type == ITEM_CIRCUIT)
	checkcirc = true;
      if (obj->item_type == ITEM_SUPERCONDUCTOR)
	checkcond = true;
    }

  if ( !checktool )
    {
      send_to_char( "&RYou need toolkit to make a lightsaber.\r\n", ch);
      return;
    }

  if ( !checkdura )
    {
      send_to_char( "&RYou need something to make it out of.\r\n", ch);
      return;
    }

  if ( !checkbatt )
    {
      send_to_char( "&RYou need a power source for your lightsaber.\r\n", ch);
      return;
    }

  if ( !checkoven )
    {
      send_to_char( "&RYou need a small furnace to heat and shape the components.\r\n", ch);
      return;
    }

  if ( !checkcirc )
    {
      send_to_char( "&RYou need a small circuit board.\r\n", ch);
      return;
    }

  if ( !checkcond )
    {
      send_to_char( "&RYou still need a small superconductor for your lightsaber.\r\n", ch);
      return;
    }

  if ( !checklens )
    {
      send_to_char( "&RYou still need a lens to focus the beam.\r\n", ch);
      return;
    }

  if ( !checkgems )
    {
      send_to_char( "&RLightsabers require 1 to 3 gems to work properly.\r\n", ch);
      return;
    }

  if ( !checkmirr )
    {
      send_to_char( "&RYou need a high intesity reflective cup to create a lightsaber.\r\n", ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]);

  if ( number_percent( ) < the_chance )
    {
      send_to_char( "&GYou begin the long process of crafting a lightsaber.\r\n", ch);
      act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
	   NULL, argument , TO_ROOM );
      add_timer ( ch , TIMER_DO_FUN , 25 , do_makelightsaber , 1 );
      ch->dest_buf = str_dup(arg);
    }
  else
    {
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_lightsaber_crafting );
    }
}

static void OnFinished( Character *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int the_chance = 0;
  bool checktool = false;
  bool checkdura = false;
  bool checkbatt = false;
  bool checkoven = false;
  bool checkcond = false;
  bool checkcirc = false;
  bool checklens = false;
  bool checkgems = false;
  bool checkmirr = false;
  OBJ_DATA *obj = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  vnum_t vnum = INVALID_VNUM;
  int level = 0;
  int gems = 0;
  int charge = 0;
  int gemtype = 0;
  Affect *paf = NULL;
  Affect *paf2 = NULL;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]);
  vnum = OBJ_VNUM_CRAFTING_LIGHTSABER;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = true;

      if (obj->item_type == ITEM_OVEN)
        checkoven = true;

      if ( (obj->item_type == ITEM_DURAPLAST || obj->item_type == ITEM_DURASTEEL) && checkdura == false)
        {
          checkdura = true;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }

      if (obj->item_type == ITEM_DURASTEEL && checkdura == false)
        {
          checkdura = true;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }

      if (obj->item_type == ITEM_BATTERY && checkbatt == false)
        {
          charge = UMIN(obj->value[1], 10);
          separate_obj( obj );
	  obj_from_char( obj );
          extract_obj( obj );
          checkbatt = true;
        }

      if (obj->item_type == ITEM_SUPERCONDUCTOR && checkcond == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcond = true;
        }

      if (obj->item_type == ITEM_CIRCUIT && checkcirc == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkcirc = true;
        }

      if (obj->item_type == ITEM_LENS && checklens == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checklens = true;
        }

      if (obj->item_type == ITEM_MIRROR && checkmirr == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkmirr = true;
        }

      if (obj->item_type == ITEM_CRYSTAL && gems < 3)
        {
          gems++;
          if ( gemtype < obj->value[0] )
            gemtype = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkgems = true;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_lightsaber_crafting]) ;

  if ( number_percent() > the_chance*2
       || !checktool
       || !checkdura
       || !checkbatt
       || !checkoven
       || !checkmirr
       || !checklens
       || !checkgems
       || !checkcond
       || !checkcirc )

    {
      send_to_char( "&RYou hold up your new lightsaber and press the switch hoping for the best.\r\n", ch);
      send_to_char( "&RInstead of a blade of light, smoke starts pouring from the handle.\r\n", ch);
      send_to_char( "&RYou drop the hot handle and watch as it melts on away on the floor.\r\n", ch);
      learn_from_failure( ch, gsn_lightsaber_crafting );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_WEAPON;
  SET_BIT( obj->wear_flags, ITEM_WIELD );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  SET_BIT( obj->extra_flags, ITEM_ANTI_SOLDIER );
  SET_BIT( obj->extra_flags, ITEM_ANTI_THIEF );
  SET_BIT( obj->extra_flags, ITEM_ANTI_HUNTER );
  SET_BIT( obj->extra_flags, ITEM_ANTI_PILOT );
  SET_BIT( obj->extra_flags, ITEM_ANTI_CITIZEN );
  obj->level = level;
  obj->weight = 5;
  STRFREE( obj->name );
  obj->name = STRALLOC( "lightsaber saber" );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = STRALLOC( buf );
  STRFREE( obj->action_desc );
  strcpy( buf, arg );
  strcat( buf, " ignites with a hum and a soft glow." );
  obj->action_desc = STRALLOC( buf );
  CREATE( paf, Affect, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "hitroll" );
  paf->modifier           = URANGE( 0, gems, level/30 );
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  CREATE( paf2, Affect, 1 );
  paf2->type               = -1;
  paf2->duration           = -1;
  paf2->location           = get_affecttype( "parry" );
  paf2->modifier           = ( level/3 );
  paf2->bitvector          = 0;
  paf2->next               = NULL;
  LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
  obj->value[1] = (int) (level/10+gemtype*2);      /* min dmg  */
  obj->value[2] = (int) (level/5+gemtype*6);      /* max dmg */
  obj->value[3] = WEAPON_LIGHTSABER;
  obj->value[4] = charge;
  obj->value[5] = charge;
  obj->cost = obj->value[2]*75;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created lightsaber.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new lightsaber.", ch,
       NULL, NULL, TO_ROOM );

  xpgain = UMIN( obj->cost*50 , exp_level(get_level(ch, FORCE_ABILITY ) + 1) );
  gain_exp(ch, FORCE_ABILITY, xpgain );
  ch_printf( ch , "You gain %d force experience.", xpgain );

  learn_from_success( ch, gsn_lightsaber_crafting );
}

static void OnAbort( Character *ch )
{
  DISPOSE( ch->dest_buf );
  send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
}
