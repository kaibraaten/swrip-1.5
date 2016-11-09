#include <string.h>
#include "mud.hpp"
#include "character.hpp"

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
      for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
        if ( obj->WearLoc == iWear )
          {
            SendToCharacter( WhereName[iWear], ch );
            if ( CanSeeObject( ch, obj ) )
              {
                SendToCharacter( FormatObjectToCharacter( obj, ch, true ), ch );
                strcpy( buf , "" );
                switch ( obj->ItemType )
                  {
                  default:
                    break;

                  case ITEM_ARMOR:
                    if ( obj->Value[1] == 0 )
                      obj->Value[1] = obj->Value[0];
                    if ( obj->Value[1] == 0 )
                      obj->Value[1] = 1;
		    dam = (short) ((obj->Value[0] * 10) / obj->Value[1]);
                    if (dam >= 10) strcat( buf, " (superb) ");
                    else if (dam >=  7) strcat( buf, " (good) ");
                    else if (dam >=  5) strcat( buf, " (worn) ");
                    else if (dam >=  3) strcat( buf, " (poor) ");
                    else if (dam >=  1) strcat( buf, " (awful) ");
                    else if (dam ==  0) strcat( buf, " (broken) ");
                    SendToCharacter( buf, ch );
                    break;

                  case ITEM_WEAPON:
                    dam = INIT_WEAPON_CONDITION - obj->Value[OVAL_WEAPON_CONDITION];
                    if (dam < 2) strcat( buf, " (superb) ");
                    else if (dam < 4) strcat( buf, " (good) ");
                    else if (dam < 7) strcat( buf, " (worn) ");
                    else if (dam < 10) strcat( buf, " (poor) ");
                    else if (dam < 12) strcat( buf, " (awful) ");
                    else if (dam ==  12) strcat( buf, " (broken) ");
                    SendToCharacter( buf, ch );

                    if (obj->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER )
                      {
                        if (obj->BlasterSetting == BLASTER_FULL)
                          Echo( ch, "FULL");
                        else if (obj->BlasterSetting == BLASTER_HIGH)
                          Echo( ch, "HIGH");
                        else if (obj->BlasterSetting == BLASTER_NORMAL)
                          Echo( ch, "NORMAL");
                        else if (obj->BlasterSetting == BLASTER_HALF)
                          Echo( ch, "HALF");
                        else if (obj->BlasterSetting == BLASTER_LOW)
                          Echo( ch, "LOW");
                        else if (obj->BlasterSetting == BLASTER_STUN)
                          Echo( ch, "STUN");
                        Echo( ch, " %d", obj->Value[OVAL_WEAPON_CHARGE] );
                      }
                    else if( ( obj->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER
			       || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE
			       || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
			       || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_BOWCASTER ) )
                      {
                        Echo( ch, "%d", obj->Value[OVAL_WEAPON_CHARGE] );
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
