#include <string.h>
#include "mud.h"
#include "character.h"

void do_equipment( Character *ch, char *argument )
{
  Object *obj;
  int iWear, dam;
  bool found;
  char buf[MAX_STRING_LENGTH];

  SetCharacterColor( AT_RED, ch );
  SendToCharacter( "You are using:\r\n", ch );
  found = false;
  SetCharacterColor( AT_OBJECT, ch );
  for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
    {
      for ( obj = ch->first_carrying; obj; obj = obj->next_content )
        if ( obj->wear_loc == iWear )
          {
            SendToCharacter( where_name[iWear], ch );
            if ( CanSeeObject( ch, obj ) )
              {
                SendToCharacter( FormatObjectToCharacter( obj, ch, true ), ch );
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
                    SendToCharacter( buf, ch );
                    break;

                  case ITEM_WEAPON:
                    dam = INIT_WEAPON_CONDITION - obj->value[OVAL_WEAPON_CONDITION];
                    if (dam < 2) strcat( buf, " (superb) ");
                    else if (dam < 4) strcat( buf, " (good) ");
                    else if (dam < 7) strcat( buf, " (worn) ");
                    else if (dam < 10) strcat( buf, " (poor) ");
                    else if (dam < 12) strcat( buf, " (awful) ");
                    else if (dam ==  12) strcat( buf, " (broken) ");
                    SendToCharacter( buf, ch );

                    if (obj->value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER )
                      {
                        if (obj->blaster_setting == BLASTER_FULL)
                          ChPrintf( ch, "FULL");
                        else if (obj->blaster_setting == BLASTER_HIGH)
                          ChPrintf( ch, "HIGH");
                        else if (obj->blaster_setting == BLASTER_NORMAL)
                          ChPrintf( ch, "NORMAL");
                        else if (obj->blaster_setting == BLASTER_HALF)
                          ChPrintf( ch, "HALF");
                        else if (obj->blaster_setting == BLASTER_LOW)
                          ChPrintf( ch, "LOW");
                        else if (obj->blaster_setting == BLASTER_STUN)
                          ChPrintf( ch, "STUN");
                        ChPrintf( ch, " %d", obj->value[OVAL_WEAPON_CHARGE] );
                      }
                    else if( ( obj->value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER
			       || obj->value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE
			       || obj->value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
			       || obj->value[OVAL_WEAPON_TYPE] == WEAPON_BOWCASTER ) )
                      {
                        ChPrintf( ch, "%d", obj->value[OVAL_WEAPON_CHARGE] );
                      }
                    break;
                  }
                SendToCharacter( "\r\n", ch );
	      }
            else
              SendToCharacter( "something.\r\n", ch );
            found = true;
          }
    }

  if ( !found )
    SendToCharacter( "Nothing.\r\n", ch );
}
