#include <string.h>
#include "mud.h"

void do_examine( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  Board *board;
  short dam;

  if ( !argument )
    {
      Bug( "do_examine: null argument.", 0);
      return;
    }

  if ( !ch )
    {
      Bug( "do_examine: null ch.", 0);
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Examine what?\r\n", ch );
      return;
    }

  sprintf( buf, "%s noprog", arg );
  do_look( ch, buf );

  /*
   * Support for looking at boards, checking equipment conditions,
   * and support for trigger positions by Thoric
   */
  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( (board = GetBoardFromObject( obj )) != NULL )
        {
          if ( board->num_posts )
            ChPrintf( ch, "There are about %d notes posted here.  Type 'note list' to list them.\r\n", board->num_posts );
          else
            SendToCharacter( "There aren't any notes posted here.\r\n", ch );
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
          SendToCharacter( buf, ch );
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
          SendToCharacter( buf, ch );

          if (obj->value[3] == WEAPON_BLASTER )
            {
              if (obj->blaster_setting == BLASTER_FULL)
                ChPrintf( ch, "It is set on FULL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HIGH)
                ChPrintf( ch, "It is set on HIGH power.\r\n");
              else if (obj->blaster_setting == BLASTER_NORMAL)
                ChPrintf( ch, "It is set on NORMAL power.\r\n");
              else if (obj->blaster_setting == BLASTER_HALF)
                ChPrintf( ch, "It is set on HALF power.\r\n");
              else if (obj->blaster_setting == BLASTER_LOW)
                ChPrintf( ch, "It is set on LOW power.\r\n");
              else if (obj->blaster_setting == BLASTER_STUN)
                ChPrintf( ch, "It is set on STUN.\r\n");
              ChPrintf( ch, "It has from %d to %d shots remaining.\r\n", obj->value[4]/5 , obj->value[4] );
            }
          else if (     ( obj->value[3] == WEAPON_LIGHTSABER ||
                          obj->value[3] == WEAPON_VIBRO_BLADE ||
                          obj->value[3] == WEAPON_FORCE_PIKE ) )
            {
              ChPrintf( ch, "It has %d/%d units of charge remaining.\r\n", obj->value[4] , obj->value[5] );
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
          SendToCharacter( buf, ch );
          break;

        case ITEM_SWITCH:
        case ITEM_LEVER:
        case ITEM_PULLCHAIN:
          if ( IsBitSet( obj->value[0], TRIG_UP ) )
            SendToCharacter( "You notice that it is in the up position.\r\n", ch );
          else
            SendToCharacter( "You notice that it is in the down position.\r\n", ch );
          break;
        case ITEM_BUTTON:
          if ( IsBitSet( obj->value[0], TRIG_UP ) )
            SendToCharacter( "You notice that it is depressed.\r\n", ch );
          else
            SendToCharacter( "You notice that it is not depressed.\r\n", ch );
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
                SendToCharacter( "This corpse has recently been slain.\r\n", ch );
                break;
              case 4:
                SendToCharacter( "This corpse was slain a little while ago.\r\n", ch );
                break;
              case 3:
                SendToCharacter( "A foul smell rises from the corpse, and it is covered in flies.\r\n", ch );
                break;
              case 2:
                SendToCharacter( "A writhing mass of maggots and decay, you can barely go near this corpse.\r\n", ch );
                break;
              case 1:
              case 0:
                SendToCharacter( "Little more than bones, there isn't much left of this corpse.\r\n", ch );
                break;
              }
          }
          if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
            break;
          SendToCharacter( "When you look inside, you see:\r\n", ch );
          sprintf( buf, "in %s noprog", arg );
          do_look( ch, buf );
          break;

        case ITEM_DROID_CORPSE:
          {
            short timerfrac = obj->timer;

            switch (timerfrac)
              {
              default:
                SendToCharacter( "These remains are still smoking.\r\n", ch );
                break;
              case 4:
                SendToCharacter( "The parts of this droid have cooled down completely.\r\n", ch );
                break;
              case 3:
                SendToCharacter( "The broken droid components are beginning to rust.\r\n", ch );
                break;
              case 2:
                SendToCharacter( "The pieces are completely covered in rust.\r\n", ch );
                break;
	      case 1:
              case 0:
                SendToCharacter( "All that remains of it is a pile of crumbling rust.\r\n", ch );
                break;
              }
          }

        case ITEM_CONTAINER:
          if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
            break;

        case ITEM_DRINK_CON:
          SendToCharacter( "When you look inside, you see:\r\n", ch );
          sprintf( buf, "in %s noprog", arg );
          do_look( ch, buf );
        }
      if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
        {
          sprintf( buf, "under %s noprog", arg );
          do_look( ch, buf );
        }
      oprog_examine_trigger( ch, obj );

      if( CharacterDiedRecently(ch) || IsObjectExtracted(obj) )
        return;

      CheckObjectForTrap( ch, obj, TRAP_EXAMINE );
    }
}
