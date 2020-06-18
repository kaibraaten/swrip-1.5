#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "act.hpp"

void do_ammo(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Object> ammo;
    bool checkammo = false;
    int charge = 0;
    auto wield = GetEquipmentOnCharacter(ch, WEAR_WIELD);

    if(wield != nullptr)
    {
        ammo = GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD);

        if(ammo == nullptr)
            ammo = GetEquipmentOnCharacter(ch, WEAR_HOLD);
    }
    else
    {
        wield = GetEquipmentOnCharacter(ch, WEAR_HOLD);
        ammo = NULL;
    }

    if(wield == nullptr || wield->ItemType != ITEM_WEAPON)
    {
        ch->Echo("&RYou don't seem to be holding a weapon.\r\n&w");
        return;
    }

    if(wield->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER)
    {

        if(ammo != nullptr && ammo->ItemType != ITEM_AMMO)
        {
            ch->Echo("&RYour hands are too full to reload your blaster.\r\n&w");
            return;
        }

        if(ammo != nullptr)
        {
            if(ammo->Value[OVAL_AMMO_CHARGE] > wield->Value[OVAL_WEAPON_MAX_CHARGE])
            {
                ch->Echo("That cartridge is too big for your blaster.");
                return;
            }

            UnequipCharacter(ch, ammo);
            checkammo = true;
            charge = ammo->Value[OVAL_AMMO_CHARGE];
            SeparateOneObjectFromGroup(ammo);
            ExtractObject(ammo);
        }
        else
        {
            for(auto i = std::rbegin(ch->Objects()); i != std::rend(ch->Objects()); ++i)
            {
                ammo = *i;

                if(ammo->ItemType == ITEM_AMMO)
                {
                    if(wield->Value[OVAL_WEAPON_MAX_CHARGE] < ammo->Value[OVAL_AMMO_CHARGE])
                    {
                        ch->Echo("That cartridge is too big for your blaster.");
                        continue;
                    }

                    checkammo = true;
                    charge = ammo->Value[OVAL_AMMO_CHARGE];
                    SeparateOneObjectFromGroup(ammo);
                    ExtractObject(ammo);
                    break;
                }
            }
        }

        if(!checkammo)
        {
            ch->Echo("&RYou don't seem to have any ammo to reload your blaster with.\r\n&w");
            return;
        }

        ch->Echo("You replace your ammunition cartridge.\r\nYour blaster is charged with %d shots at high power to %d shots on low.\r\n", charge / 5, charge);
        Act(AT_PLAIN, "$n replaces the ammunition cell in $p.", ch, wield, NULL, ActTarget::Room);
    }
    else if(wield->Value[OVAL_WEAPON_TYPE] == WEAPON_BOWCASTER)
    {
        if(ammo != nullptr && ammo->ItemType != ITEM_BOLT)
        {
            ch->Echo("&RYour hands are too full to reload your bowcaster.\r\n&w");
            return;
        }

        if(ammo != nullptr)
        {
            if(ammo->Value[OVAL_AMMO_CHARGE] > wield->Value[OVAL_WEAPON_MAX_CHARGE])
            {
                ch->Echo("That cartridge is too big for your bowcaster.");
                return;
            }

            UnequipCharacter(ch, ammo);
            checkammo = true;
            charge = ammo->Value[OVAL_AMMO_CHARGE];
            SeparateOneObjectFromGroup(ammo);
            ExtractObject(ammo);
        }
        else
        {
            for(auto i = std::rbegin(ch->Objects()); i != std::rend(ch->Objects()); ++i)
            {
                ammo = *i;

                if(ammo->ItemType == ITEM_BOLT)
                {
                    if(ammo->Value[OVAL_AMMO_CHARGE] > wield->Value[OVAL_WEAPON_MAX_CHARGE])
                    {
                        ch->Echo("That cartridge is too big for your bowcaster.");
                        continue;
                    }

                    checkammo = true;
                    charge = ammo->Value[OVAL_AMMO_CHARGE];
                    SeparateOneObjectFromGroup(ammo);
                    ExtractObject(ammo);
                    break;
                }
            }
        }

        if(!checkammo)
        {
            ch->Echo("&RYou don't seem to have any quarrels to reload your bowcaster with.\r\n&w");
            return;
        }

        ch->Echo("You replace your quarrel pack.\r\nYour bowcaster is charged with %d energy bolts.\r\n", charge);
        Act(AT_PLAIN, "$n replaces the quarrels in $p.", ch, wield, NULL, ActTarget::Room);
    }
    else
    {
        if(ammo && ammo->ItemType != ITEM_BATTERY)
        {
            ch->Echo("&RYour hands are too full to replace the power cell.\r\n&w");
            return;
        }

        if(ammo != nullptr)
        {
            UnequipCharacter(ch, ammo);
            checkammo = true;
            charge = ammo->Value[OVAL_AMMO_CHARGE];
            SeparateOneObjectFromGroup(ammo);
            ExtractObject(ammo);
        }
        else
        {
            for(auto i = std::rbegin(ch->Objects()); i != std::rend(ch->Objects()); ++i)
            {
                ammo = *i;

                if(ammo->ItemType == ITEM_BATTERY)
                {
                    checkammo = true;
                    charge = ammo->Value[OVAL_AMMO_CHARGE];
                    SeparateOneObjectFromGroup(ammo);
                    ExtractObject(ammo);
                    break;
                }
            }
        }

        if(!checkammo)
        {
            ch->Echo("&RYou don't seem to have a power cell.\r\n&w");
            return;
        }

        if(wield->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER)
        {
            ch->Echo("You replace your power cell.\r\nYour lightsaber is charged to %d/%d units.\r\n", charge, charge);
            Act(AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, ActTarget::Room);
            Act(AT_PLAIN, "$p ignites with a bright glow.", ch, wield, NULL, ActTarget::Room);
        }
        else if(wield->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE)
        {
            ch->Echo("You replace your power cell.\r\nYour vibro-blade is charged to %d/%d units.\r\n", charge, charge);
            Act(AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, ActTarget::Room);
        }
        else if(wield->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE)
        {
            ch->Echo("You replace your power cell.\r\nYour force-pike is charged to %d/%d units.\r\n", charge, charge);
            Act(AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, ActTarget::Room);
        }
        else
        {
            ch->Echo("You feel very foolish.\r\n");
            Act(AT_PLAIN, "$n tries to jam a power cell into $p.", ch, wield, NULL, ActTarget::Room);
        }
    }

    wield->Value[OVAL_WEAPON_CHARGE] = charge;
}

