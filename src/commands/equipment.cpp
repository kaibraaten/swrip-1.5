#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

void do_equipment(Character *ch, std::string argument)
{
    bool found = false;

    SetCharacterColor(AT_RED, ch);
    ch->Echo("You are using:\r\n");
    SetCharacterColor(AT_OBJECT, ch);

    for(int iWear = 0; iWear < MAX_WEAR; iWear++)
    {
        for(auto obj : ch->Objects())
        {
            if(obj->WearLoc == iWear)
            {
                ch->Echo("%s", WhereName[iWear]);

                if(CanSeeObject(ch, obj))
                {
                    int dam = 0;
                    char buf[MAX_STRING_LENGTH] = { '\0' };

                    ch->Echo("%s", FormatObjectToCharacter(obj, ch, true).c_str());

                    switch(obj->ItemType)
                    {
                    default:
                        break;

                    case ITEM_ARMOR:
                        if(obj->Value[OVAL_ARMOR_AC] == 0)
                            obj->Value[OVAL_ARMOR_AC] = obj->Value[OVAL_ARMOR_CONDITION];

                        if(obj->Value[OVAL_ARMOR_AC] == 0)
                            obj->Value[OVAL_ARMOR_AC] = 1;

                        dam = (short)((obj->Value[OVAL_ARMOR_CONDITION] * 10) / obj->Value[OVAL_ARMOR_AC]);

                        if(dam >= 10)
                            strcat(buf, " (superb) ");
                        else if(dam >= 7)
                            strcat(buf, " (good) ");
                        else if(dam >= 5)
                            strcat(buf, " (worn) ");
                        else if(dam >= 3)
                            strcat(buf, " (poor) ");
                        else if(dam >= 1)
                            strcat(buf, " (awful) ");
                        else if(dam == 0)
                            strcat(buf, " (broken) ");

                        ch->Echo("%s", buf);
                        break;

                    case ITEM_WEAPON:
                        dam = INIT_WEAPON_CONDITION - obj->Value[OVAL_WEAPON_CONDITION];

                        if(dam < 2) strcat(buf, " (superb) ");
                        else if(dam < 4) strcat(buf, " (good) ");
                        else if(dam < 7) strcat(buf, " (worn) ");
                        else if(dam < 10) strcat(buf, " (poor) ");
                        else if(dam < 12) strcat(buf, " (awful) ");
                        else if(dam == 12) strcat(buf, " (broken) ");
                        ch->Echo("%s", buf);

                        if(obj->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER)
                        {
                            if(obj->BlasterSetting == BLASTER_FULL)
                                ch->Echo("FULL");
                            else if(obj->BlasterSetting == BLASTER_HIGH)
                                ch->Echo("HIGH");
                            else if(obj->BlasterSetting == BLASTER_NORMAL)
                                ch->Echo("NORMAL");
                            else if(obj->BlasterSetting == BLASTER_HALF)
                                ch->Echo("HALF");
                            else if(obj->BlasterSetting == BLASTER_LOW)
                                ch->Echo("LOW");
                            else if(obj->BlasterSetting == BLASTER_STUN)
                                ch->Echo("STUN");

                            ch->Echo(" %d", obj->Value[OVAL_WEAPON_CHARGE]);
                        }
                        else if((obj->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER
                                 || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE
                                 || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
                                 || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_BOWCASTER))
                        {
                            ch->Echo("%d", obj->Value[OVAL_WEAPON_CHARGE]);
                        }
                        break;
                    }

                    ch->Echo("\r\n");
                }
                else
                {
                    ch->Echo("something.\r\n");
                }

                found = true;
            }
        }
    }

    if(!found)
    {
        ch->Echo("Nothing.\r\n");
    }
}
