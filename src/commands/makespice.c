#include <string.h>
#include "mud.h"
#include "character.h"

static void OnStart( CHAR_DATA *ch, char *argument );
static void OnFinished( CHAR_DATA *ch );
static void OnAbort( CHAR_DATA *ch );

void do_makespice( CHAR_DATA *ch, char *argument )
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

static void OnAbort( CHAR_DATA *ch )
{
  DISPOSE( ch->dest_buf );
  send_to_char("&RYou are distracted and are unable to finish your work.\r\n&w", ch);
}

static void OnStart( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0;
  OBJ_DATA *obj = NULL;

  strcpy( arg, argument );

  if ( arg[0] == '\0' )
    {
      send_to_char( "&RFrom what?\r\n&w", ch);
      return;
    }

  if ( !IS_SET( ch->in_room->room_flags, ROOM_REFINERY ) )
    {
      send_to_char( "&RYou need to be in a refinery to create drugs from spice.\r\n", ch);
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
      send_to_char( "&RYou do not have that item.\r\n&w", ch );
      return;
    }

  if ( obj->item_type != ITEM_RAWSPICE )
    {
      send_to_char( "&RYou can't make a drug out of that\r\n&w",ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_spice_refining]);

  if ( number_percent( ) < the_chance )
    {
      send_to_char( "&GYou begin the long process of refining spice into a drug.\r\n", ch);
      act( AT_PLAIN, "$n begins working on something.", ch,
	   NULL, argument , TO_ROOM );
      add_timer ( ch , TIMER_DO_FUN , 10 , do_makespice , 1 );
      ch->dest_buf = str_dup(arg);
    }
  else
    {
      send_to_char("&RYou can't figure out what to do with the stuff.\r\n",ch);
      learn_from_failure( ch, gsn_spice_refining );
    }
}

static void OnFinished( CHAR_DATA *ch )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *obj = NULL;
  long xpgain = 0;

  if ( !ch->dest_buf )
    return;

  strcpy(arg, (const char*)ch->dest_buf);
  DISPOSE( ch->dest_buf);

  if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
      send_to_char( "You seem to have lost your spice!\r\n", ch );
      return;
    }
  if ( obj->item_type != ITEM_RAWSPICE )
    {
      send_to_char( "&RYou get your tools mixed up and can't finish your work.\r\n&w",ch);
      return;
    }

  obj->value[1] = URANGE (10, obj->value[1], ( is_npc(ch) ? ch->top_level
                                               : (int) (ch->pcdata->learned[gsn_spice_refining]) ) +10);
  strcpy( buf, obj->name );
  STRFREE( obj->name );
  strcat( buf, " drug spice" );
  obj->name = STRALLOC( buf );
  strcpy( buf, "a drug made from " );
  strcat( buf, obj->short_descr );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  strcat( buf, " was foolishly left lying around here." );
  STRFREE( obj->description );
  obj->description = STRALLOC( buf );
  obj->item_type = ITEM_SPICE;

  send_to_char( "&GYou finish your work.\r\n", ch);
  act( AT_PLAIN, "$n finishes $s work.", ch,
       NULL, NULL, TO_ROOM );

  if ( !obj->cost )
    obj->cost = 500;
  obj->cost += obj->value[1]*10;
  obj->cost *= 2;

  xpgain = UMIN( obj->cost*50 ,( exp_level(get_level(ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
  gain_exp(ch, ENGINEERING_ABILITY, xpgain );
  ch_printf( ch , "You gain %d engineering experience.", xpgain );

  learn_from_success( ch, gsn_spice_refining );
}
