#include "character.h"
#include "mud.h"

static void wear_obj( Character *ch, Object *obj, bool fReplace, short wear_bit);
static bool can_layer( const Character *ch, const Object *obj, short wear_loc );
static bool can_dual( const Character *ch );
static bool could_dual( const Character *ch );

void do_wear( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj;
  short wear_bit;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( (!StrCmp(arg2, "on")
	|| !StrCmp(arg2, "upon")
	|| !StrCmp(arg2, "around"))
       && argument[0] != '\0' )
    {
      argument = OneArgument( argument, arg2 );
    }

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Wear, wield, or hold what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( !StrCmp( arg1, "all" ) )
    {
      Object *obj_next;

      for ( obj = ch->first_carrying; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->wear_loc == WEAR_NONE && CanSeeObject( ch, obj ) )
            wear_obj( ch, obj, false, -1 );
        }

      return;
    }
  else
    {
      if ( ( obj = GetCarriedObject( ch, arg1 ) ) == NULL )
        {
          SendToCharacter( "You do not have that item.\r\n", ch );
          return;
        }

      if ( arg2[0] != '\0' )
        wear_bit = GetWearFlag(arg2);
      else
        wear_bit = -1;

      wear_obj( ch, obj, true, wear_bit );
    }
}

/*
 * Wear one object.
 * Optional replacement of existing objects.
 * Big repetitive code, ick.
 * Restructured a bit to allow for specifying body location     -Thoric
 */
static void wear_obj( Character *ch, Object *obj, bool fReplace, short wear_bit )
{
  char buf[MAX_STRING_LENGTH];
  Object *tmpobj = NULL;
  short bit = 0;
  short tmp = 0;
  bool check_size = false;

  separate_obj( obj );

  if ( wear_bit > -1 )
    {
      bit = wear_bit;

      if ( !CAN_WEAR(obj, 1 << bit) )
        {
          if ( fReplace )
            {
              switch( 1 << bit )
                {
                case ITEM_HOLD:
                  SendToCharacter( "You cannot hold that.\r\n", ch );
                  break;

                case ITEM_WIELD:
                  SendToCharacter( "You cannot wield that.\r\n", ch );
                  break;

		default:
                  sprintf( buf, "You cannot wear that on your %s.\r\n",
                           wear_flags[bit] );
                  SendToCharacter( buf, ch );
                }
            }

          return;
        }
    }
  else
    {
      for ( bit = -1, tmp = 1; tmp < 31; tmp++ )
        {
          if ( CAN_WEAR(obj, 1 << tmp) )
            {
              bit = tmp;
              break;
            }
        }
    }


  if (  1 << bit == ITEM_WIELD ||   1 << bit == ITEM_HOLD
        || obj->item_type == ITEM_LIGHT ||   1 << bit == ITEM_WEAR_SHIELD )
    {
      check_size = false;
    }
  else if ( ch->race == RACE_DEFEL )
    {
      check_size = true;
    }
  else if ( !IsNpc(ch) )
    {
      switch (ch->race)
	{
	default:
	  if ( !IS_OBJ_STAT(obj, ITEM_HUMAN_SIZE) )
	    {
	      check_size = true;
	    }

	  break;

	case RACE_HUTT:
	  if ( !IS_OBJ_STAT(obj, ITEM_HUTT_SIZE) )
	    {
	      check_size = true;
	    }

	  break;

	case RACE_GAMORREAN:
	case RACE_MON_CALAMARI:
	case RACE_QUARREN:
	case RACE_WOOKIEE:
	  if ( !IS_OBJ_STAT(obj, ITEM_LARGE_SIZE) )
	    {
	      check_size = true;
	    }

	  break;

	case RACE_CHADRA_FAN:
	case RACE_EWOK:
	case RACE_JAWA:
	case RACE_SULLUSTAN:
	  if ( !IS_OBJ_STAT(obj, ITEM_SMALL_SIZE) )
	    {
	      check_size = true;
	    }

	  break;
	}
    }

  /*
    this seems redundant but it enables both multiple sized objects to be
    used as well as objects with no size flags at all
  */

  if ( check_size )
    {
      if ( ch->race == RACE_DEFEL )
        {
          act( AT_MAGIC, "It is against your nature to wear anything that might make you visible.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n wants to use $p, but doesn't.",
               ch, obj, NULL, TO_ROOM );
          return;
        }

      if ( IS_OBJ_STAT(obj, ITEM_HUTT_SIZE) )
        {
          act( AT_MAGIC, "That item is too big for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but it is too big.",
               ch, obj, NULL, TO_ROOM );
          return;
	}

      if ( IS_OBJ_STAT(obj, ITEM_LARGE_SIZE) || IS_OBJ_STAT(obj, ITEM_HUMAN_SIZE) )
        {
          act( AT_MAGIC, "That item is the wrong size for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but can't.",
               ch, obj, NULL, TO_ROOM );
          return;
        }

      if ( IS_OBJ_STAT(obj, ITEM_SMALL_SIZE) )
        {
          act( AT_MAGIC, "That item is too small for you.", ch, NULL, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to use $p, but it is too small.",
               ch, obj, NULL, TO_ROOM );
          return;
        }
    }

  /* currently cannot have a light in non-light position */
  if ( obj->item_type == ITEM_LIGHT )
    {
      if ( !RemoveObject( ch, WEAR_LIGHT, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n holds $p as a light.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You hold $p as your light.",  ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_LIGHT );
      oprog_wear_trigger( ch, obj );
      return;
    }

  if ( bit == -1 )
    {
      if ( fReplace )
        SendToCharacter( "You can't wear, wield, or hold that.\r\n", ch );
      return;
    }

  switch ( 1 << bit )
    {
    default:
      bug( "wear_obj: uknown/unused item_wear bit %d", bit );
      if ( fReplace )
        SendToCharacter( "You can't wear, wield, or hold that.\r\n", ch );
      return;

    case ITEM_WEAR_FINGER:
      if ( GetEquipmentOnCharacter( ch, WEAR_FINGER_L )
           &&   GetEquipmentOnCharacter( ch, WEAR_FINGER_R )
           &&   !RemoveObject( ch, WEAR_FINGER_L, fReplace )
           &&   !RemoveObject( ch, WEAR_FINGER_R, fReplace ) )
        return;

      if ( !GetEquipmentOnCharacter( ch, WEAR_FINGER_L ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n slips $s left finger into $p.",    ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You slip your left finger into $p.",  ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          EquipCharacter( ch, obj, WEAR_FINGER_L );
          oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !GetEquipmentOnCharacter( ch, WEAR_FINGER_R ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n slips $s right finger into $p.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You slip your right finger into $p.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }

	  EquipCharacter( ch, obj, WEAR_FINGER_R );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free finger.", 0 );
      SendToCharacter( "You already wear something on both fingers.\r\n", ch );
      return;

    case ITEM_WEAR_NECK:
      if ( GetEquipmentOnCharacter( ch, WEAR_NECK_1 ) != NULL
           &&   GetEquipmentOnCharacter( ch, WEAR_NECK_2 ) != NULL
           &&   !RemoveObject( ch, WEAR_NECK_1, fReplace )
           &&   !RemoveObject( ch, WEAR_NECK_2, fReplace ) )
        return;

      if ( !GetEquipmentOnCharacter( ch, WEAR_NECK_1 ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n wears $p around $s neck.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You wear $p around your neck.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          EquipCharacter( ch, obj, WEAR_NECK_1 );
          oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !GetEquipmentOnCharacter( ch, WEAR_NECK_2 ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n wears $p around $s neck.",   ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You wear $p around your neck.", ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
	  EquipCharacter( ch, obj, WEAR_NECK_2 );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free neck.", 0 );
      SendToCharacter( "You already wear two neck items.\r\n", ch );
      return;

    case ITEM_WEAR_BODY:
      /*
        if ( !RemoveObject( ch, WEAR_BODY, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_BODY ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n fits $p on $s body.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You fit $p on your body.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_BODY );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_HEAD:
      if ( ch->race == RACE_VERPINE || ch->race == RACE_TWI_LEK )
        {
          SendToCharacter( "You cant wear anything on your head.\r\n", ch );
          return;
        }
      if ( !RemoveObject( ch, WEAR_HEAD, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
	      act( AT_ACTION, "$n dons $p upon $s head.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You don $p upon your head.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_HEAD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_EYES:
      if ( !RemoveObject( ch, WEAR_EYES, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n places $p on $s eyes.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You place $p on your eyes.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_EYES );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_EARS:
      if ( ch->race == RACE_VERPINE )
        {
          SendToCharacter( "What ears?.\r\n", ch );
          return;
        }
      if ( !RemoveObject( ch, WEAR_EARS, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s ears.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your ears.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }

      EquipCharacter( ch, obj, WEAR_EARS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_LEGS:
      /*
        if ( !RemoveObject( ch, WEAR_LEGS, fReplace ) )
        return;
      */
      if ( ch->race == RACE_HUTT )
        {
          SendToCharacter( "Hutts don't have legs.\r\n", ch );
          return;
        }
      if ( !can_layer( ch, obj, WEAR_LEGS ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n slips into $p.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You slip into $p.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_LEGS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_FEET:
      /*
        if ( !RemoveObject( ch, WEAR_FEET, fReplace ) )
        return;
      */
      if ( ch->race == RACE_HUTT )
        {
          SendToCharacter( "Hutts don't have feet!\r\n", ch );
          return;
        }
      if ( !can_layer( ch, obj, WEAR_FEET ) )
        {
	  SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s feet.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your feet.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_FEET );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_HANDS:
      /*
        if ( !RemoveObject( ch, WEAR_HANDS, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_HANDS ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s hands.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your hands.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_HANDS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_ARMS:
      if ( !can_layer( ch, obj, WEAR_ARMS ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p on $s arms.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p on your arms.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_ARMS );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_ABOUT:
      /*
        if ( !RemoveObject( ch, WEAR_ABOUT, fReplace ) )
        return;
      */
      if ( !can_layer( ch, obj, WEAR_ABOUT ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p about $s body.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p about your body.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_ABOUT );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_WAIST:
      if ( !can_layer( ch, obj, WEAR_WAIST ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p about $s waist.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p about your waist.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_WAIST );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_WRIST:
      if ( GetEquipmentOnCharacter( ch, WEAR_WRIST_L )
           &&   GetEquipmentOnCharacter( ch, WEAR_WRIST_R )
           &&   !RemoveObject( ch, WEAR_WRIST_L, fReplace )
           &&   !RemoveObject( ch, WEAR_WRIST_R, fReplace ) )
        return;

      if ( !GetEquipmentOnCharacter( ch, WEAR_WRIST_L ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n fits $p around $s left wrist.",
                       ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You fit $p around your left wrist.",
                       ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          EquipCharacter( ch, obj, WEAR_WRIST_L );
	  oprog_wear_trigger( ch, obj );
          return;
        }

      if ( !GetEquipmentOnCharacter( ch, WEAR_WRIST_R ) )
        {
          if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
            {
              if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                {
                  act( AT_ACTION, "$n fits $p around $s right wrist.",
                       ch, obj, NULL, TO_ROOM );
                  act( AT_ACTION, "You fit $p around your right wrist.",
                       ch, obj, NULL, TO_CHAR );
                }
              else
                actiondesc( ch, obj, NULL );
            }
          EquipCharacter( ch, obj, WEAR_WRIST_R );
          oprog_wear_trigger( ch, obj );
          return;
        }

      bug( "Wear_obj: no free wrist.", 0 );
      SendToCharacter( "You already wear two wrist items.\r\n", ch );
      return;

    case ITEM_WEAR_SHIELD:
      if ( !RemoveObject( ch, WEAR_SHIELD, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n uses $p as an energy shield.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You use $p as an energy shield.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_SHIELD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WIELD:
      if ( (tmpobj  = GetEquipmentOnCharacter( ch, WEAR_WIELD )) != NULL
           &&   !could_dual(ch) )
        {
          SendToCharacter( "You're already wielding something.\r\n", ch );
          return;
        }

      if ( tmpobj )
        {
          if ( can_dual(ch) )
            {
              if ( get_obj_weight( obj ) + get_obj_weight( tmpobj ) > str_app[GetCurrentStrength(ch)].wield )
                {
                  SendToCharacter( "It is too heavy for you to wield.\r\n", ch );
                  return;
                }

	      if( obj->item_type == ITEM_WEAPON && obj->value[3] == WEAPON_LIGHTSABER )
		{
		  ChPrintf( ch, "You can't dual-wield lightsabers.\r\n" );
		  return;
		}

              if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
                {
                  if ( !obj->action_desc || obj->action_desc[0]=='\0' )
                    {
                      act( AT_ACTION, "$n dual-wields $p.", ch, obj, NULL, TO_ROOM );
                      act( AT_ACTION, "You dual-wield $p.", ch, obj, NULL, TO_CHAR );
                    }
                  else
		    {
		      actiondesc( ch, obj, NULL );
		    }
                }

              EquipCharacter( ch, obj, WEAR_DUAL_WIELD );
              oprog_wear_trigger( ch, obj );
            }
          return;
        }

      if ( get_obj_weight( obj ) > str_app[GetCurrentStrength(ch)].wield )
        {
          SendToCharacter( "It is too heavy for you to wield.\r\n", ch );
          return;
        }

      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wields $p.", ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wield $p.", ch, obj, NULL, TO_CHAR );
            }
	  else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_WIELD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_HOLD:
      if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) )
        {
          SendToCharacter( "You cannot hold something AND two weapons!\r\n", ch );
          return;
        }
      if ( !RemoveObject( ch, WEAR_HOLD, fReplace ) )
        return;
      if ( obj->item_type == ITEM_DEVICE
           || obj->item_type == ITEM_GRENADE
           || obj->item_type == ITEM_FOOD
           || obj->item_type == ITEM_PILL
           || obj->item_type == ITEM_POTION
           || obj->item_type == ITEM_DRINK_CON
           || obj->item_type == ITEM_SALVE
           || obj->item_type == ITEM_KEY
           || !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n holds $p in $s hands.",   ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You hold $p in your hands.", ch, obj, NULL, TO_CHAR );
        }
      EquipCharacter( ch, obj, WEAR_HOLD );
      oprog_wear_trigger( ch, obj );
      return;

    case ITEM_WEAR_FLOATING:
      if ( !can_layer( ch, obj, WEAR_FLOATING ) )
        {
          SendToCharacter( "It won't fit overtop of what you're already wearing.\r\n", ch );
          return;
        }
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n activates $p. $p takes up position behind $n",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You activate $p and it takes up position behind you.", ch, obj, NULL, TO_CHAR );
            }
	  else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_FLOATING );
      oprog_wear_trigger( ch, obj );
      return;
    case ITEM_WEAR_OVER:
      if ( !RemoveObject( ch, WEAR_OVER, fReplace ) )
        return;
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          if ( !obj->action_desc || obj->action_desc[0]=='\0' )
            {
              act( AT_ACTION, "$n wears $p.",   ch, obj, NULL, TO_ROOM );
              act( AT_ACTION, "You wear $p over you.", ch, obj, NULL, TO_CHAR );
            }
          else
            actiondesc( ch, obj, NULL );
        }
      EquipCharacter( ch, obj, WEAR_OVER );
      oprog_wear_trigger( ch, obj );
      return;
    }
}

/*
 * Check to see if there is room to wear another object on this location
 * (Layered clothing support)
 */
static bool can_layer( const Character *ch, const Object *obj, short wear_loc )
{
  Object *otmp;
  short bitlayers = 0;
  short objlayers = obj->Prototype->layers;

  for ( otmp = ch->first_carrying; otmp; otmp = otmp->next_content )
    if ( otmp->wear_loc == wear_loc )
      {
        if ( !otmp->Prototype->layers )
          return false;
        else
          bitlayers |= otmp->Prototype->layers;
      }

  if ( (bitlayers && !objlayers) || bitlayers > objlayers )
    return false;
  if ( !bitlayers || ((bitlayers & ~objlayers) == bitlayers) )
    return true;
  return false;
}

/*
 * See if char could be capable of dual-wielding                -Thoric
 */
static bool could_dual( const Character *ch )
{
  if ( IsNpc(ch) )
    return true;

  if ( ch->pcdata->learned[gsn_dual_wield] )
    return true;

  return false;
}

/*
 * See if char can dual wield at this time                      -Thoric
 */
static bool can_dual( const Character *ch )
{
  if ( !could_dual(ch) )
    {
      return false;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD ) )
    {
      SendToCharacter( "You are already wielding two weapons!\r\n", ch );
      return false;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_HOLD ) )
    {
      SendToCharacter( "You cannot dual wield while holding something!\r\n", ch );
      return false;
    }

  return true;
}
