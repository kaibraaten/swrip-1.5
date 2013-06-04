#include <string.h>
#include "mud.h"
#include "character.h"

void do_makeblade( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level, the_chance;
  int charge = 0;
  bool checktool, checkdura, checkbatt, checkoven, checkstaff;
  OBJ_DATA *obj;
  OBJ_INDEX_DATA *pObjIndex;
  int vnum;
  AFFECT_DATA *paf;
  AFFECT_DATA *paf2;

  strcpy( arg , argument );

  switch( ch->substate )
    {
    default:

      if ( arg[0] == '\0' )
        {
          send_to_char( "&RUsage: Makeblade <name>\r\n&w", ch);
          return;
        }

      checktool = FALSE;
      checkdura = FALSE;
      checkbatt = FALSE;
      checkoven = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
        {
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
	}

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_TOOLKIT)
            checktool = TRUE;
          if (obj->item_type == ITEM_DURASTEEL )
            checkdura = TRUE;
          if (obj->item_type == ITEM_BATTERY)
            checkbatt = TRUE;

          if (obj->item_type == ITEM_OVEN)
            checkoven = TRUE;
        }

      if ( !checktool )
        {
          send_to_char( "&RYou need toolkit to make a vibro-blade.\r\n", ch);
          return;
        }

      if ( !checkdura )
        {
          send_to_char( "&RYou need something to make it out of.\r\n", ch);
          return;
        }

      if ( !checkbatt )
        {
          send_to_char( "&RYou need a power source for your blade.\r\n", ch);
          return;
        }

      if ( !checkoven )
        {
          send_to_char( "&RYou need a small furnace to heat the metal.\r\n", ch);
          return;
        }

      the_chance = is_npc(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_makeblade]);

      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of crafting a vibroblade.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
	       NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 25 , do_makeblade , 1 );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_makeblade );
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

  level = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_makeblade]);
  vnum = 10422;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checktool = FALSE;
  checkdura = FALSE;
  checkbatt = FALSE;
  checkoven = FALSE;
  checkstaff = FALSE;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_TOOLKIT)
        checktool = TRUE;
      if (obj->item_type == ITEM_OVEN)
	checkoven = TRUE;
      if (obj->item_type == ITEM_DURASTEEL  && checkdura == FALSE)
        {
          checkdura = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_STAFF && checkstaff == FALSE)
        {
          checkstaff = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }

      if (obj->item_type == ITEM_BATTERY && checkbatt == FALSE )
        {
          charge = UMAX( 5, obj->value[0] );
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
          checkbatt = TRUE;
        }
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_makeblade]) ;

  if ( number_percent( ) > the_chance*2  || ( !checktool ) || ( !checkdura ) || ( !checkbatt ) || ( !checkoven ) )
    {
      send_to_char( "&RYou activate your newly created vibroblade.\r\n", ch);
      send_to_char( "&RIt hums softly for a few seconds then begins to shake violently.\r\n", ch);
      send_to_char( "&RIt finally shatters breaking apart into a dozen pieces.\r\n", ch);
      learn_from_failure( ch, gsn_makeblade );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_WEAPON;
  SET_BIT( obj->wear_flags, ITEM_WIELD );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  obj->weight = 3;
  STRFREE( obj->name );
  strcpy( buf, arg );
  if (!checkstaff)
    strcat( buf, " vibro-blade blade" );
  else
    strcat( buf, " force pike" );

  obj->name = STRALLOC( buf );
  strcpy( buf, arg );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, " was left here." );
  obj->description = STRALLOC( buf );
  CREATE( paf, AFFECT_DATA, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "backstab" );
  paf->modifier           = level/3;
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;
  if ( !checkstaff )
    {
      CREATE( paf2, AFFECT_DATA, 1 );
      paf2->type               = -1;
      paf2->duration           = -1;
      paf2->location           = get_affecttype( "hitroll" );
      paf2->modifier           = -2;
      paf2->bitvector          = 0;
      paf2->next               = NULL;
      LINK( paf2, obj->first_affect, obj->last_affect, next, prev );
      ++top_affect;
    }
  obj->value[0] = INIT_WEAPON_CONDITION;
  if( !checkstaff )
    obj->value[3] = WEAPON_VIBRO_BLADE;
  else
    obj->value[3] = WEAPON_FORCE_PIKE;

  obj->value[1] = (int) (level/20+8+obj->value[3]);      /* min dmg  */
  obj->value[2] = (int) (level/10+18+obj->value[3]);      /* max dmg */

  obj->value[4] = charge;
  obj->value[5] = charge;
  obj->cost = obj->value[2]*10;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created blade.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes crafting a blade.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*200 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }

  learn_from_success( ch, gsn_makeblade );
}
