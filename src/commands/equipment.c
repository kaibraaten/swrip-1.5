#include <string.h>
#include "mud.h"

void do_equipment( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  int iWear, dam;
  bool found;
  char buf[MAX_STRING_LENGTH];

  set_char_color( AT_RED, ch );
  send_to_char( "You are using:\r\n", ch );
  found = FALSE;
  set_char_color( AT_OBJECT, ch );
  for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
    {
      for ( obj = ch->first_carrying; obj; obj = obj->next_content )
        if ( obj->wear_loc == iWear )
          {
            send_to_char( where_name[iWear], ch );
            if ( can_see_obj( ch, obj ) )
              {
                send_to_char( format_obj_to_char( obj, ch, TRUE ), ch );
                strcpy( buf , "" );
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
                    if (dam >= 10) strcat( buf, " (superb) ");
                    else if (dam >=  7) strcat( buf, " (good) ");
                    else if (dam >=  5) strcat( buf, " (worn) ");
                    else if (dam >=  3) strcat( buf, " (poor) ");
                    else if (dam >=  1) strcat( buf, " (awful) ");
                    else if (dam ==  0) strcat( buf, " (broken) ");
                    send_to_char( buf, ch );
                    break;

                  case ITEM_WEAPON:
                    dam = INIT_WEAPON_CONDITION - obj->value[0];
                    if (dam < 2) strcat( buf, " (superb) ");
                    else if (dam < 4) strcat( buf, " (good) ");
                    else if (dam < 7) strcat( buf, " (worn) ");
                    else if (dam < 10) strcat( buf, " (poor) ");
                    else if (dam < 12) strcat( buf, " (awful) ");
                    else if (dam ==  12) strcat( buf, " (broken) ");
                    send_to_char( buf, ch );
                    if (obj->value[3] == WEAPON_BLASTER )
                      {
                        if (obj->blaster_setting == BLASTER_FULL)
                          ch_printf( ch, "FULL");
                        else if (obj->blaster_setting == BLASTER_HIGH)
                          ch_printf( ch, "HIGH");
                        else if (obj->blaster_setting == BLASTER_NORMAL)
                          ch_printf( ch, "NORMAL");
                        else if (obj->blaster_setting == BLASTER_HALF)
                          ch_printf( ch, "HALF");
                        else if (obj->blaster_setting == BLASTER_LOW)
                          ch_printf( ch, "LOW");
                        else if (obj->blaster_setting == BLASTER_STUN)
                          ch_printf( ch, "STUN");
                        ch_printf( ch, " %d", obj->value[4] );
                      }
                    else if (     ( obj->value[3] == WEAPON_LIGHTSABER ||
                                    obj->value[3] == WEAPON_VIBRO_BLADE
                                    || obj->value[3] == WEAPON_FORCE_PIKE
                                    || obj->value[3] == WEAPON_BOWCASTER ) )
                      {
                        ch_printf( ch, "%d", obj->value[4] );
                      }
                    break;
                  }
                send_to_char( "\r\n", ch );
	      }
            else
              send_to_char( "something.\r\n", ch );
            found = TRUE;
          }
    }

  if ( !found )
    send_to_char( "Nothing.\r\n", ch );
}
