#include <string.h>
#include "mud.h"
#include "character.h"

void do_makeblaster( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level, the_chance;
  bool checktool, checkdura, checkbatt, checkoven, checkcond, checkcirc, checkammo, checkscope;
  OBJ_DATA *obj;
  OBJ_INDEX_DATA *pObjIndex;
  int vnum, power, scope, ammo;
  AFFECT_DATA *paf;
  AFFECT_DATA *paf2;

  strcpy( arg , argument );

  switch( ch->substate )
    {
    default:
      if ( arg[0] == '\0' )
        {
          send_to_char( "&RUsage: Makeblaster <name>\r\n&w", ch);
          return;
        }

      checktool = FALSE;
      checkdura = FALSE;
      checkbatt = FALSE;
      checkoven = FALSE;
      checkcond = FALSE;
      checkcirc = FALSE;
      checkscope = FALSE;
      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = TRUE;
          if (obj->item_type == ITEM_DURAPLAST)
            checkdura = TRUE;
          if (obj->item_type == ITEM_BATTERY)
            checkbatt = TRUE;
          if (obj->item_type == ITEM_OVEN)
            checkoven = TRUE;
          if (obj->item_type == ITEM_CIRCUIT)
            checkcirc = TRUE;
          if (obj->item_type == ITEM_SUPERCONDUCTOR)
            checkcond = TRUE;
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

      if ( !checkbatt )
        {
          send_to_char( "&RYou need a power source for your blaster.\r\n", ch);
          return;
        }

      if ( !checkoven )
        {
          send_to_char( "&RYou need a small furnace to heat the plastics.\r\n", ch);
          return;
        }

      if ( !checkcirc )
        {
          send_to_char( "&RYou need a small circuit board to control the firing mechanism.\r\n", ch);
          return;
        }

      if ( !checkcond )
        {
          send_to_char( "&RYou still need a small superconductor.\r\n", ch);
          return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makeblaster]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of making a blaster.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 25 , do_makeblaster , 1 );
          ch->dest_buf   = str_dup(arg);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makeblaster );
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

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeblaster]);
  vnum = 10420;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checkammo= FALSE;
  checktool = FALSE;
  checkdura = FALSE;
  checkbatt = FALSE;
  checkoven = FALSE;
  checkcond = FALSE;
  checkcirc = FALSE;
  checkscope = FALSE;
  power     = 0;
  scope     = 0;
  ammo = 0;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = TRUE;
      if (obj->item_type == ITEM_OVEN)
        checkoven = TRUE;
      if (obj->item_type == ITEM_DURAPLAST && checkdura == FALSE)
        {
	  checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_AMMO && checkammo == FALSE)
        {
          ammo = obj->value[0];
          checkammo = TRUE;
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
      if (obj->item_type == ITEM_LENS && scope == 0)
        {
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          scope++;
        }
      if (obj->item_type == ITEM_SUPERCONDUCTOR && power<2)
        {
          power++;
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
      if (obj->item_type == ITEM_SCOPE && checkscope == FALSE)
        {
          separate_obj( obj );
	  obj_from_char( obj );
          extract_obj( obj );
          checkscope = TRUE;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makeblaster]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkbatt ) || ( !checkoven )  || ( !checkcond ) || ( !checkcirc) )
    {
      send_to_char( "&RYou hold up your new blaster and aim at a leftover piece of plastic.\r\n", ch);
      send_to_char( "&RYou slowly squeeze the trigger hoping for the best...\r\n", ch);
      send_to_char( "&RYour blaster backfires destroying your weapon and burning your hand.\r\n", ch);
      learn_from_failure( ch, gsn_makeblaster );
      return;
    }

  if (checkscope)
    power = 0;

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_WEAPON;
  SET_BIT( obj->wear_flags, ITEM_WIELD );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = 2+level/10;
  STRFREE( obj->name );
  strcpy( buf , arg );
  strcat( buf , " blaster");
  obj->name = STRALLOC( buf );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was carelessly misplaced here." );
  obj->description = STRALLOC( buf );
  CREATE( paf, AFFECT_DATA, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "hitroll" );
  paf->modifier           = URANGE( 0, 1+scope, level/30 );
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  CREATE( paf2, AFFECT_DATA, 1 );
  paf2->type               = -1;
  paf2->duration           = -1;
  paf2->location           = get_affecttype( "damroll" );
  paf2->modifier           = URANGE( 0, power, level/30);
  paf2->bitvector          = 0;
  paf2->next               = NULL;
  LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  if ( checkscope == TRUE )
    {
      CREATE( paf2, AFFECT_DATA, 1 );
      paf2->type               = -1;
      paf2->duration           = -1;
      paf2->location           = get_affecttype( "snipe" );
      paf2->modifier           = URANGE( 0, 30 , level/3);
      paf2->bitvector          = 0;
      paf2->next               = NULL;
      LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
    }
  ++top_affect;
  obj->value[0] = INIT_WEAPON_CONDITION;       /* condition  */
  obj->value[1] = (int) (level/10+15);      /* min dmg  */
  obj->value[2] = (int) (level/5+25);      /* max dmg  */
  obj->value[3] = WEAPON_BLASTER;
  obj->value[4] = ammo;
  obj->value[5] = 2000;
  obj->cost = obj->value[2]*50;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created blaster.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new blaster.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*50 ,( exp_level(get_level(ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }
  learn_from_success( ch, gsn_makeblaster );
}