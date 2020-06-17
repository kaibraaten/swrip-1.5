#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_reload(Character *ch, std::string arg)
{
    std::shared_ptr<Ship> ship;
    long price = 0;

    if(arg.empty())
    {
        ch->Echo("&RYou need to specify a target!\r\n");
        return;
    }

    if((ship = GetShipInRoom(ch->InRoom, arg)) == NULL)
    {
        Act(AT_PLAIN, "I see no $T here.", ch, nullptr, arg, ActTarget::Char);
        return;
    }

    if(IsShipDisabled(ship))
        price += 200;

    if(ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
        price += 100;

    if(ship->WeaponSystems.Laser.State == LASER_DAMAGED)
        price += 50;

    for(const Turret *turret : ship->WeaponSystems.Turrets)
    {
        if(IsTurretDamaged(turret))
        {
            price += 50;
        }
    }

    if(IsClanned(ch) && !StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->Owner))
    {
        if(ch->PCData->ClanInfo.Clan->Funds < price)
        {
            ch->Echo("&R%s doesn't have enough funds to prepare this ship for launch.\r\n",
                     ch->PCData->ClanInfo.Clan->Name.c_str());
            return;
        }

        ch->PCData->ClanInfo.Clan->Funds -= price;
        ch->Echo("&GIt costs %s %ld credits to ready this ship for launch.\r\n",
                 ch->PCData->ClanInfo.Clan->Name.c_str(), price);
    }
    else if(StrCmp(ship->Owner, "Public"))
    {
        if(ch->Gold < price)
        {
            ch->Echo("&RYou don't have enough funds to prepare this ship for launch.\r\n");
            return;
        }

        ch->Gold -= price;
        ch->Echo("&GYou pay %ld credits to ready the ship for launch.\r\n", price);
    }

    ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
    ship->Defenses.Shield.Current = 0;
    ship->AutoRecharge = false;
    ship->AutoTrack = false;
    ship->AutoSpeed = false;
    ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;

    ship->WeaponSystems.Tube.State = MISSILE_READY;
    ship->WeaponSystems.Laser.State = LASER_READY;

    for(Turret *turret : ship->WeaponSystems.Turrets)
    {
        SetTurretReady(turret);
    }

    ship->State = SHIP_LANDED;
}
