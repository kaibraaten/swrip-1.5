#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( Character *ch, char *argument );
static void OnFinished( Character *ch );
static void OnAbort( Character *ch );

void do_makebowcaster( Character *ch, char *argument )
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
  bool checkoven = false;
  bool checkdura = false;
  bool checkbow = false;
  bool checktinder = false;
  bool checkoil = false;
  OBJ_DATA *obj = NULL;

  strcpy( arg , argument );

  if ( ch->race != RACE_WOOKIEE )
    {
      send_to_char( "&ROnly wookiees have the knowledge to craft bowcasters.\r\n&w", ch);
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "&RUsage: Makebowcaster <name>\r\n&w", ch);
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
      if (obj->item_type == ITEM_DURAPLAST)
	checkdura = true;
      if (obj->item_type == ITEM_CROSSBOW)
	checkbow = true;
      if (obj->item_type == ITEM_OVEN)
	checkoven = true;
      if (obj->item_type == ITEM_TINDER)
	checktinder = true;
      if (obj->item_type == ITEM_OIL)
	checkoil = true;
    }

  if ( !checktool )
    {
      send_to_char( "&RYou need toolkit to make a blaster.\r\n", ch);
      return;
    }

  if ( !checkdura )
    {
      send_to_char( "&RYou need something to make it out of.\r\n", ch);
      return;
    }

  if ( !checkoil )
    {
      send_to_char( "&RYou need something to greeze the wood with.\r\n", ch);
      return;
    }

  if ( !checkoven )
    {
      send_to_char( "&RYou need a small furnace to heat the plastics.\r\n", ch);
      return;
    }

  if ( !checkbow )
    {
      send_to_char( "&RYou need a crossbow to start with.\r\n", ch);
      return;
    }

  if ( !checktinder )
    {
      send_to_char( "&RYou need wood to complete your bowcaster.\r\n", ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makebowcaster]);

  if ( number_percent( ) < the_chance )
    {
      send_to_char( "&GYou begin the long process of making a bowcaster.\r\n", ch);
      act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
	   NULL, argument , TO_ROOM );
      add_timer ( ch , TIMER_DO_FUN , 25 , do_makebowcaster , 1 );
      ch->dest_buf   = str_dup(arg);
      return;
    }
  else
    {
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makebowcaster );
    }
}

static void OnFinished( Character *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  long xpgain = 0;
  int level = 0;
  int the_chance = 0;
  bool checktool = false;
  bool checkoven = false;
  bool checkdura = false;
  bool checkbow = false;
  bool checktinder = false;
  bool checkoil = false;
  bool checkammo = false;
  OBJ_DATA *obj = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  int vnum = INVALID_VNUM;
  int power = 0;
  int scope = 0;
  int ammo = 0;
  Affect *paf = NULL;
  Affect *paf2 = NULL;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makebowcaster]);
  vnum = OBJ_VNUM_CRAFTING_BOWCASTER;

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
      if (obj->item_type == ITEM_DURAPLAST && checkdura == false)
        {
          checkdura = true;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_BOLT && checkammo == false)
        {
          ammo = obj->value[0];
          checkammo = true;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_OIL && checkoil == false)
        {
	  separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkoil = true;
        }
      if (obj->item_type == ITEM_LENS && scope < 2)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          scope++;
        }
      if (obj->item_type == ITEM_TINDER && power<4)
        {
          power++;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checktinder = true;
        }
      if (obj->item_type == ITEM_CROSSBOW && checkbow == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbow = true;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makebowcaster]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkoil ) || ( !checkoven )  || ( !checktinder ) || ( !checkbow) )
    {
      send_to_char( "&RYou hold up your new bowcaster and aim at a leftover piece of plastic.\r\n", ch);
      send_to_char( "&RYou slowly draw back the bolt and squeeze the trigger hoping for the best...\r\n", ch);
      send_to_char( "&RYour bowcaster backfires destroying the firing mechanism and ruining your work.\r\n", ch);
      learn_from_failure( ch, gsn_makebowcaster );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_WEAPON;
  SET_BIT( obj->wear_flags, ITEM_WIELD );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = 2+level/7;
  STRFREE( obj->name );
  strcpy( buf , arg );
  strcat( buf , " bowcaster");
  obj->name = STRALLOC( buf );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carefully placed here." );
  obj->description = STRALLOC( buf );
  CREATE( paf, Affect, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "hitroll" );
  paf->modifier           = URANGE( 0, 1+scope, level/30 );
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  CREATE( paf2, Affect, 1 );
  paf2->type               = -1;
  paf2->duration           = -1;
  paf2->location           = get_affecttype( "damroll" );
  paf2->modifier           = URANGE( 0, power, level/30);
  paf2->bitvector          = 0;
  paf2->next               = NULL;
  LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
  obj->value[1] = (int) (level/10+25);      /* min dmg  */
  obj->value[2] = (int) (level/5+25);      /* max dmg  */
  obj->value[3] = WEAPON_BOWCASTER;
  obj->value[4] = ammo;
  obj->value[5] = 250;
  obj->cost = obj->value[2]*50;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newest bowcaster.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new bowcaster.", ch,
       NULL, NULL , TO_ROOM );

  xpgain = UMIN( obj->cost*50 ,( exp_level(get_level(ch, ENGINEERING_ABILITY) + 1) - exp_level(get_level(ch, ENGINEERING_ABILITY ) ) ) );
  gain_exp(ch, ENGINEERING_ABILITY, xpgain );
  ch_printf( ch , "You gain %d engineering experience.", xpgain );
  
  learn_from_success( ch, gsn_makebowcaster );
}

static void OnAbort( Character *ch )
{
  DISPOSE( ch->dest_buf );
  send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
}
