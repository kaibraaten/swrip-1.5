#include <string.h>
#include "mud.hpp"
#include "board.hpp"

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

  if ( IsNullOrEmpty( arg ) )
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
          if ( board->NumberOfPosts )
            Echo( ch, "There are about %d notes posted here.Type 'note list' to list them.\r\n", board->NumberOfPosts );
          else
            SendToCharacter( "There aren't any notes posted here.\r\n", ch );
        }

      switch ( obj->ItemType )
        {
        default:
          break;

        case ITEM_ARMOR:
          if ( obj->Value[OVAL_ARMOR_AC] == 0 )
            obj->Value[OVAL_ARMOR_AC] = obj->Value[OVAL_ARMOR_CONDITION];

          if ( obj->Value[OVAL_ARMOR_AC] == 0 )
            obj->Value[OVAL_ARMOR_AC] = 1;

	  dam = (short) ((obj->Value[OVAL_ARMOR_CONDITION] * 10) / obj->Value[OVAL_ARMOR_AC]);
          strcpy( buf, "As you look more closely, you notice that it is ");

	  if (dam >= 10)
	    strcat( buf, "in superb condition.");
          else if (dam ==  9)
	    strcat( buf, "in very good condition.");
          else if (dam ==  8)
	    strcat( buf, "in good shape.");
          else if (dam ==  7)
	    strcat( buf, "showing a bit of wear.");
          else if (dam ==  6)
	    strcat( buf, "a little run down.");
          else if (dam ==  5)
	    strcat( buf, "in need of repair.");
          else if (dam ==  4)
	    strcat( buf, "in great need of repair.");
          else if (dam ==  3)
	    strcat( buf, "in dire need of repair.");
          else if (dam ==  2)
	    strcat( buf, "very badly worn.");
          else if (dam ==  1)
	    strcat( buf, "practically worthless.");
          else if (dam <=  0)
	    strcat( buf, "broken.");

	  strcat( buf, "\r\n" );
          SendToCharacter( buf, ch );
          break;

        case ITEM_WEAPON:
          dam = INIT_WEAPON_CONDITION - obj->Value[OVAL_WEAPON_CONDITION];
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

          if (obj->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER )
            {
              if (obj->BlasterSetting == BLASTER_FULL)
                Echo( ch, "It is set on FULL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HIGH)
                Echo( ch, "It is set on HIGH power.\r\n");
              else if (obj->BlasterSetting == BLASTER_NORMAL)
                Echo( ch, "It is set on NORMAL power.\r\n");
              else if (obj->BlasterSetting == BLASTER_HALF)
                Echo( ch, "It is set on HALF power.\r\n");
              else if (obj->BlasterSetting == BLASTER_LOW)
                Echo( ch, "It is set on LOW power.\r\n");
              else if (obj->BlasterSetting == BLASTER_STUN)
                Echo( ch, "It is set on STUN.\r\n");

	      Echo( ch, "It has from %d to %d shots remaining.\r\n",
		    obj->Value[OVAL_WEAPON_CHARGE]/5 , obj->Value[OVAL_WEAPON_CHARGE] );
            }
          else if ( ( obj->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER ||
		      obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE ||
		      obj->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE ) )
            {
              Echo( ch, "It has %d/%d units of charge remaining.\r\n", obj->Value[OVAL_WEAPON_CHARGE] , obj->Value[OVAL_WEAPON_MAX_CHARGE] );
            }
          break;

        case ITEM_FOOD:
          if ( obj->Timer > 0 && obj->Value[OVAL_FOOD_MAX_CONDITION] > 0 )
            dam = (obj->Timer * 10) / obj->Value[OVAL_FOOD_MAX_CONDITION];
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
          if ( IsBitSet( obj->Value[OVAL_SWITCH_TRIGFLAGS], TRIG_UP ) )
            SendToCharacter( "You notice that it is in the up position.\r\n", ch );
          else
            SendToCharacter( "You notice that it is in the down position.\r\n", ch );
          break;

        case ITEM_BUTTON:
          if ( IsBitSet( obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP ) )
            SendToCharacter( "You notice that it is depressed.\r\n", ch );
          else
            SendToCharacter( "You notice that it is not depressed.\r\n", ch );
          break;

        case ITEM_CORPSE_PC:
        case ITEM_CORPSE_NPC:
          {
            short timerfrac = obj->Timer;
            if ( obj->ItemType == ITEM_CORPSE_PC )
              timerfrac = (int)obj->Timer / 8 + 1;

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
            short timerfrac = obj->Timer;

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
      ObjProgExamineTrigger( ch, obj );

      if( CharacterDiedRecently(ch) || IsObjectExtracted(obj) )
        return;

      CheckObjectForTrap( ch, obj, TRAP_EXAMINE );
    }
}
