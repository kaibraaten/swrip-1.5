#include <string.h>
#include "mud.h"

void do_examine( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  BOARD_DATA *board;
  short dam;

  if ( !argument )
    {
      bug( "do_examine: null argument.", 0);
      return;
    }

  if ( !ch )
    {
      bug( "do_examine: null ch.", 0);
      return;
    }

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Examine what?\r\n", ch );
      return;
    }

  sprintf( buf, "%s noprog", arg );
  do_look( ch, buf );

  /*
   * Support for looking at boards, checking equipment conditions,
   * and support for trigger positions by Thoric
   */
  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      if ( (board = get_board( obj )) != NULL )
        {
          if ( board->num_posts )
            ch_printf( ch, "There are about %d notes posted here.  Type 'note list' to list them.\r\n", board->num_posts );
          else
            send_to_char( "There aren't any notes posted here.\r\n", ch );
        }

      switch ( obj->item_type )
        {
        default:
          break;

        case ITEM_ARMOR:
          if ( obj->value[1] == 0 )
            obj->value[1] = obj->value[0];
          if ( obj->value[1] == 0 )
            obj->value[1] = 1;
          dam = (short) ((obj->value[0] * 10) / obj->value[1]);
          strcpy( buf, "As you look more closely, you notice that it is ");
          if (dam >= 10) strcat( buf, "in superb condition.");
          else if (dam ==  9) strcat( buf, "in very good condition.");
          else if (dam ==  8) strcat( buf, "in good shape.");
          else if (dam ==  7) strcat( buf, "showing a bit of wear.");
          else if (dam ==  6) strcat( buf, "a little run down.");
          else if (dam ==  5) strcat( buf, "in need of repair.");
          else if (dam ==  4) strcat( buf, "in great need of repair.");
          else if (dam ==  3) strcat( buf, "in dire need of repair.");
          else if (dam ==  2) strcat( buf, "very badly worn.");
          else if (dam ==  1) strcat( buf, "practically worthless.");
          else if (dam <=  0) strcat( buf, "broken.");
          strcat( buf, "\r\n" );
          send_to_char( buf, ch );
          break;

        case ITEM_WEAPON:
          dam = INIT_WEAPON_CONDITION - obj->value[0];
	  strcpy( buf, "As you look more closely, you notice that it is ");

          if (dam ==  0)
	    strcat( buf, "in superb condition.");
          else if (dam ==  1)
	    strcat( buf, "in excellent condition.");
          else if (dam ==  2)
	    strcat( buf, "in very good condition.");
          else if (dam ==  3)
	    strcat( buf, "in good shape.");
          else if (dam ==  4)
	    strcat( buf, "showing a bit of wear.");
          else if (dam ==  5)
	    strcat( buf, "a little run down.");
          else if (dam ==  6)
	    strcat( buf, "in need of repair.");
          else if (dam ==  7)
	    strcat( buf, "in great need of repair.");
          else if (dam ==  8)
	    strcat( buf, "in dire need of repair.");
          else if (dam ==  9)
	    strcat( buf, "very badly worn.");
          else if (dam == 10)
	    strcat( buf, "practically worthless.");
          else if (dam == 11)
	    strcat( buf, "almost broken.");
          else if (dam == 12)
	    strcat( buf, "broken.");

          strcat( buf, "\r\n" );
          send_to_char( buf, ch );

          if (obj->value[3] == WEAPON_BLASTER )
            {
              if (obj->blaster_setting == BLASTER_FULL)
                ch_printf( ch, "It is set on FULL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HIGH)
                ch_printf( ch, "It is set on HIGH power.\r\n");
              else if (obj->blaster_setting == BLASTER_NORMAL)
                ch_printf( ch, "It is set on NORMAL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HALF)
                ch_printf( ch, "It is set on HALF power.\r\n");
              else if (obj->blaster_setting == BLASTER_LOW)
                ch_printf( ch, "It is set on LOW power.\r\n");
              else if (obj->blaster_setting == BLASTER_STUN)
                ch_printf( ch, "It is set on STUN.\r\n");
              ch_printf( ch, "It has from %d to %d shots remaining.\r\n", obj->value[4]/5 , obj->value[4] );
            }
          else if (     ( obj->value[3] == WEAPON_LIGHTSABER ||
                          obj->value[3] == WEAPON_VIBRO_BLADE ||
                          obj->value[3] == WEAPON_FORCE_PIKE ) )
            {
              ch_printf( ch, "It has %d/%d units of charge remaining.\r\n", obj->value[4] , obj->value[5] );
            }
          break;

        case ITEM_FOOD:
          if ( obj->timer > 0 && obj->value[1] > 0 )
            dam = (obj->timer * 10) / obj->value[1];
          else
            dam = 10;

	  strcpy( buf, "As you examine it carefully you notice that it " );

          if (dam >= 10)
	    strcat( buf, "is fresh.");
          else if (dam ==  9)
	    strcat( buf, "is nearly fresh.");
          else if (dam ==  8)
	    strcat( buf, "is perfectly fine.");
          else if (dam ==  7)
	    strcat( buf, "looks good.");
          else if (dam ==  6)
	    strcat( buf, "looks ok.");
          else if (dam ==  5)
	    strcat( buf, "is a little stale.");
          else if (dam ==  4)
	    strcat( buf, "is a bit stale.");
          else if (dam ==  3)
	    strcat( buf, "smells slightly off.");
          else if (dam ==  2)
	    strcat( buf, "smells quite rank.");
          else if (dam ==  1)
	    strcat( buf, "smells revolting.");
          else if (dam <=  0)
	    strcat( buf, "is crawling with maggots.");

          strcat( buf, "\r\n" );
          send_to_char( buf, ch );
          break;

        case ITEM_SWITCH:
        case ITEM_LEVER:
        case ITEM_PULLCHAIN:
          if ( IsBitSet( obj->value[0], TRIG_UP ) )
            send_to_char( "You notice that it is in the up position.\r\n", ch );
          else
            send_to_char( "You notice that it is in the down position.\r\n", ch );
          break;
        case ITEM_BUTTON:
          if ( IsBitSet( obj->value[0], TRIG_UP ) )
            send_to_char( "You notice that it is depressed.\r\n", ch );
          else
            send_to_char( "You notice that it is not depressed.\r\n", ch );
          break;

        case ITEM_CORPSE_PC:
        case ITEM_CORPSE_NPC:
          {
            short timerfrac = obj->timer;
            if ( obj->item_type == ITEM_CORPSE_PC )
              timerfrac = (int)obj->timer / 8 + 1;

	    switch (timerfrac)
              {
              default:
                send_to_char( "This corpse has recently been slain.\r\n", ch );
                break;
              case 4:
                send_to_char( "This corpse was slain a little while ago.\r\n", ch );
                break;
              case 3:
                send_to_char( "A foul smell rises from the corpse, and it is covered in flies.\r\n", ch );
                break;
              case 2:
                send_to_char( "A writhing mass of maggots and decay, you can barely go near this corpse.\r\n", ch );
                break;
              case 1:
              case 0:
                send_to_char( "Little more than bones, there isn't much left of this corpse.\r\n", ch );
                break;
              }
          }
          if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
            break;
          send_to_char( "When you look inside, you see:\r\n", ch );
          sprintf( buf, "in %s noprog", arg );
          do_look( ch, buf );
          break;

        case ITEM_DROID_CORPSE:
          {
            short timerfrac = obj->timer;

            switch (timerfrac)
              {
              default:
                send_to_char( "These remains are still smoking.\r\n", ch );
                break;
              case 4:
                send_to_char( "The parts of this droid have cooled down completely.\r\n", ch );
                break;
              case 3:
                send_to_char( "The broken droid components are beginning to rust.\r\n", ch );
                break;
              case 2:
                send_to_char( "The pieces are completely covered in rust.\r\n", ch );
                break;
	      case 1:
              case 0:
                send_to_char( "All that remains of it is a pile of crumbling rust.\r\n", ch );
                break;
              }
          }

        case ITEM_CONTAINER:
          if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
            break;

        case ITEM_DRINK_CON:
          send_to_char( "When you look inside, you see:\r\n", ch );
          sprintf( buf, "in %s noprog", arg );
          do_look( ch, buf );
        }
      if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
        {
          sprintf( buf, "under %s noprog", arg );
          do_look( ch, buf );
        }
      oprog_examine_trigger( ch, obj );

      if( char_died(ch) || obj_extracted(obj) )
        return;

      check_for_trap( ch, obj, TRAP_EXAMINE );
    }
}
