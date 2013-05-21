#include <string.h>
#include "mud.h"

void do_makedisguise( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char sexrace[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int level, the_chance;
  bool checkneedle, checkfabric, checkhair;
  OBJ_DATA *obj;
  OBJ_INDEX_DATA *pObjIndex;
  int vnum, sex, race;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:

      argument = one_argument( argument, arg1 );
      argument = one_argument( argument, arg2 );

      if ( !argument || argument[0] == '\0' || arg2[0] == '\0' || arg1[0] == '\0' )
        {
          send_to_char( "&RUsage: Makedisguise <sex> <race> <name>\r\n&w", ch);
          return;
        }

      checkneedle = FALSE;
      checkfabric = FALSE;
      checkhair = FALSE;

      if ( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
	{
          send_to_char( "&RYou need to be in a factory or workshop to do that.\r\n", ch);
          return;
        }

      for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->item_type == ITEM_THREAD)
            checkneedle = TRUE;
          if (obj->item_type == ITEM_DIS_FABRIC)
            checkfabric = TRUE;
          if (obj->item_type == ITEM_HAIR)
            checkhair = TRUE;
        }

      if( (sex = atoi(arg1)) > 2 || sex < 0 )
        {
          send_to_char( "&RSex choices: 0 neutral, 1 male, 2 female.\r\n", ch);
          return;
        }
      if( (race = atoi(arg2)) > 33 || sex < 0 )
        {
          send_to_char( "&RIncorrect race: Help race for options, from 0 to 33.\r\n", ch);
          return;
        }

      if ( !checkneedle )
        {
          send_to_char( "&RYou need need and thread to make a blaster.\r\n", ch);
          return;
        }

      if ( !checkfabric )
        {
          send_to_char( "&RYou need something to make it out of.\r\n", ch);
          return;
        }

      sprintf( sexrace, "%d", (sex*1000) + race );
      the_chance = IS_NPC(ch) ? ch->top_level
        : (int) (ch->pcdata->learned[gsn_disguise]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin the long process of making a disguise.\r\n", ch);
          act( AT_PLAIN, "$n takes $s tools and a small oven and begins to work on something.", ch,
	       NULL, argument , TO_ROOM );
          add_timer ( ch , TIMER_DO_FUN , 25 , do_makedisguise , 1 );
          ch->dest_buf   = str_dup(sexrace);
          ch->dest_buf_2   = str_dup(argument);
          return;
        }
      send_to_char("&RYou can't figure out how to fit the parts together.\r\n",ch);
      learn_from_failure( ch, gsn_disguise );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg1, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      strcpy(arg2, (const char*)ch->dest_buf_2);
      DISPOSE( ch->dest_buf_2);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou are interupted and fail to finish your work.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;


  race = atoi(arg1)%1000;
  sex = atoi(arg1)/1000;

  level = IS_NPC(ch) ? ch->top_level : (int) (ch->pcdata->learned[gsn_disguise]);
  vnum = 10420;

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "&RThe item you are trying to create is missing from the database.\r\nPlease inform the administration of this error.\r\n", ch );
      return;
    }

  checkneedle = FALSE;
  checkhair = FALSE;
  checkfabric = FALSE;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if (obj->item_type == ITEM_THREAD)
        checkneedle = TRUE;

      if (obj->item_type == ITEM_DIS_FABRIC && checkfabric == FALSE)
        {
          checkfabric = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
      if (obj->item_type == ITEM_HAIR && checkhair == FALSE)
        {
          checkhair = TRUE;
          separate_obj( obj );
          obj_from_char( obj );
          extract_obj( obj );
        }
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_disguise]) ;

  if ( number_percent( ) > the_chance*2  || ( !checkneedle ) || ( !checkfabric ) )
    {
      send_to_char( "&RYour blaster backfires destroying your weapon and burning your hand.\r\n", ch);
      learn_from_failure( ch, gsn_disguise );
      return;
    }

  obj = create_object( pObjIndex, level );

  obj->item_type = ITEM_DISGUISE;
  SET_BIT( obj->wear_flags, ITEM_DISGUISE );
  SET_BIT( obj->wear_flags, ITEM_TAKE );
  obj->level = level;
  STRFREE( obj->name );
  strcpy( buf , arg2 );
  strcat( buf , " disguise");
  obj->name = STRALLOC( buf );
  strcpy( buf, arg2 );
  STRFREE( obj->short_descr );
  obj->short_descr = STRALLOC( buf );
  STRFREE( obj->description );
  strcat( buf, argument );
  obj->description = STRALLOC( buf );

  obj->value[0] = INIT_WEAPON_CONDITION;  /* beginning condition  */
  obj->value[1] = INIT_WEAPON_CONDITION;      /* condition */
  obj->value[2] = race;      /* race */
  obj->value[3] = sex;  /* sex */
  obj->cost = 5000;

  obj = obj_to_char( obj, ch );

  send_to_char( "&GYou finish your work and hold up your newly created disguise.&w\r\n", ch);
  act( AT_PLAIN, "$n finishes making $s new disguise.", ch,
       NULL, argument , TO_ROOM );

  {
    long xpgain;

    xpgain = UMIN( obj->cost*50 ,( exp_level(get_level( ch, ENGINEERING_ABILITY ) + 1) - exp_level(get_level( ch, ENGINEERING_ABILITY ) ) ) );
    gain_exp(ch, ENGINEERING_ABILITY, xpgain );
    ch_printf( ch , "You gain %d engineering experience.", xpgain );
  }
  learn_from_success( ch, gsn_disguise );
}
