#include <ranges>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

bool spec_customs_weapons(std::shared_ptr<Character> mob)
{
    char buf[MAX_STRING_LENGTH];

    if (!IsAwake(mob) || mob->Position == POS_FIGHTING)
    {
        return false;
    }

    auto includeThese = [mob](const auto &victim)
    {
        if (IsNpc(victim) || victim->Position == POS_FIGHTING)
        {
            return false;
        }

        if (IsClanned(victim) && !StrCmp(victim->PCData->ClanInfo.Clan->Name, mob->MobClan))
        {
            return false;
        }

        return true;
    };
    auto charactersToActOn = mob->InRoom->Characters();

    for (auto victim : charactersToActOn | std::views::filter(includeThese))
    {
        for (auto obj : victim->Objects() | std::views::reverse)
        {
            if (obj->Prototype->ItemType == ITEM_WEAPON)
            {
                if (victim != mob && CanSeeCharacter(mob, victim) && CanSeeObject(mob, obj))
                {
                    sprintf(buf, "Weapons are banned from non-military usage. I'm going to have to confiscate %s.",
                            obj->ShortDescr.c_str());
                    do_say(mob, buf);

                    if (obj->WearLoc != WEAR_NONE)
                    {
                        RemoveObject(victim, obj->WearLoc, true);
                    }

                    SeparateOneObjectFromGroup(obj);
                    ObjectFromCharacter(obj);
                    Act(AT_ACTION, "$n confiscates $p from $N.", mob, obj, victim, ActTarget::NotVict);
                    Act(AT_ACTION, "$n takes $p from you.", mob, obj, victim, ActTarget::Vict);
                    obj = ObjectToCharacter(obj, mob);
                    obj->Flags.set(Flag::Obj::Contraband);
                    long ch_exp = umin(obj->Cost * 10,
                                       (GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling) + 1)
                                        - GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling))));
                    victim->Echo("You lose %ld experience.\r\n ", ch_exp);
                    GainXP(victim, AbilityClass::Smuggling, 0 - ch_exp);
                    return true;
                }
                else if (CanSeeCharacter(mob, victim)
                         && !obj->Flags.test(Flag::Obj::Contraband))
                {
                    long ch_exp = umin(obj->Cost * 10,
                                       (GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling) + 1)
                                        - GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling))));
                    victim->Echo("You receive %ld experience for smuggling %s.\r\n ", ch_exp, obj->ShortDescr.c_str());
                    GainXP(victim, AbilityClass::Smuggling, ch_exp);

                    Act(AT_ACTION, "$n looks at $N suspiciously.", mob, NULL, victim, ActTarget::NotVict);
                    Act(AT_ACTION, "$n look at you suspiciously.", mob, NULL, victim, ActTarget::Vict);
                    obj->Flags.set(Flag::Obj::Contraband);
                    return true;
                }
                else if (!obj->Flags.test(Flag::Obj::Contraband))
                {
                    long ch_exp = umin(obj->Cost * 10,
                                       (GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling) + 1)
                                        - GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling))));
                    victim->Echo("You receive %ld experience for smuggling %s.\r\n ",
                                 ch_exp, obj->ShortDescr.c_str());
                    GainXP(victim, AbilityClass::Smuggling, ch_exp);
                    obj->Flags.set(Flag::Obj::Contraband);
                    return true;
                }
            }
            else if (obj->ItemType == ITEM_CONTAINER)
            {
                auto isWeaponButNotAlreadySmuggled = [](const auto &item)
                {
                    return item->Prototype->ItemType == ITEM_WEAPON
                           && !item->Flags.test(Flag::Obj::Contraband);
                };

                for (auto content : obj->Objects() | std::views::filter(isWeaponButNotAlreadySmuggled))
                {
                    long ch_exp = umin(content->Cost * 10,
                                       (GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling) + 1)
                                        - GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass::Smuggling))));
                    victim->Echo("You receive %ld experience for smuggling %s.\r\n ",
                                 ch_exp, content->ShortDescr.c_str());
                    GainXP(victim, AbilityClass::Smuggling, ch_exp);
                    content->Flags.set(Flag::Obj::Contraband);
                    return true;
                }
            }
        }
    }

    return false;
}
