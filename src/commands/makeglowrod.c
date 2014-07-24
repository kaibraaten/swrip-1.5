#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( Character *ch, char *argument );
static void OnFinished( Character *ch );
static void OnAbort( Character *ch );

void do_makeglowrod( Character *ch, char *argument )
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
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  bool checklens = false;
  OBJ_DATA *obj = NULL;

  strcpy( arg , argument );

  if ( arg[0] == '\0' )
    {
      send_to_char( "&RUsage: Makeflashlight <name>\r\n&w", ch);
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
      if (obj->item_type == ITEM_BATTERY)
	checkbatt = true;
      if (obj->item_type == ITEM_CIRCUIT)
	checkcirc = true;
      if (obj->item_type == ITEM_CHEMICAL)
	checkchem = true;
      if (obj->item_type == ITEM_LENS)
	checklens = true;
    }

  if ( !checktool )
    {
      send_to_char( "&RYou need toolkit to make a light.\r\n", ch);
      return;
    }

  if ( !checklens )
    {
      send_to_char( "&RYou need a lens to make a light.\r\n", ch);
      return;
    }

  if ( !checkbatt )
    {
      send_to_char( "&RYou need a battery for the light to work.\r\n", ch);
      return;
    }

  if ( !checkcirc )
    {
      send_to_char( "&RYou need a small circuit.\r\n", ch);
      return;
    }

  if ( !checkchem )
    {
      send_to_char( "&RSome chemicals to light would come in handy!\r\n", ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makeglowrod]);

  if ( number_percent( ) < the_chance )
    {
      send_to_char( "&GYou begin the long process of making a light.\r\n", ch);
      act( AT_PLAIN, "$n takes $s tools and begins to work on something.", ch,
	   NULL, argument , TO_ROOM );
      add_timer ( ch , TIMER_DO_FUN , 10 , do_makeglowrod , 1 );
      ch->dest_buf   = str_dup(arg);
      return;
    }
  else
    {
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makeglowrod );
    }
}

static void OnFinished( Character *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level = 0, the_chance = 0, strength = 0;
  bool checktool = false;
  bool checkbatt = false;
  bool checkchem = false;
  bool checkcirc = false;
  bool checklens = false;
  OBJ_DATA *obj = NULL;
  OBJ_INDEX_DATA *pObjIndex = NULL;
  vnum_t vnum = INVALID_VNUM;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeglowrod]);
  vnum = OBJ_VNUM_CRAFTING_GLOWROD;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = true;

      if (obj->item_type == ITEM_BATTERY && checkbatt == false)
        {
          strength = obj->value[0];
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = true;
        }
      if (obj->item_type == ITEM_CHEMICAL)
        {
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
      if (obj->item_type == ITEM_LENS && checklens == false)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checklens = true;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makeglowrod]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checklens ) || ( !checkbatt ) || ( !checkchem ) || ( !checkcirc) )
    {
      send_to_char( "&RJust as you are about to finish your work,\r\nyour newly created glowrod explodes in your hands...doh!\r\n", ch);
      learn_from_failure( ch, gsn_makeglowrod );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_LIGHT;
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = 3;
  STRFREE( obj->name );
  strcpy( buf , arg );
  strcat( buf , " glowrod");
  obj->name = STRALLOC( buf );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = STRALLOC( buf );
  obj->value[2] = strength;
  obj->cost = obj->value[2];

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created glowrod.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new glowrod.", ch,
       NULL, NULL, TO_ROOM );

  xpgain = UMIN( obj->cost*100 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
  gain_exp(ch, ENGINEERING_ABILITY, xpgain );
  ch_printf( ch , "You gain %d engineering experience.", xpgain );

  learn_from_success( ch, gsn_makeglowrod );
}

static void OnAbort( Character *ch )
{
  DISPOSE( ch->dest_buf );
  send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
}
