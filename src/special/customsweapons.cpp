#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

bool spec_customs_weapons(Character *ch)
{
    char buf[MAX_STRING_LENGTH];

    if(!IsAwake(ch) || ch->Position == POS_FIGHTING)
        return false;

    auto charactersToActOn = ch->InRoom->Characters();

    for(auto victim : charactersToActOn)
    {
        if(IsNpc(victim) || victim->Position == POS_FIGHTING)
            continue;

        if(IsClanned(victim) && !StrCmp(victim->PCData->ClanInfo.Clan->Name, ch->MobClan))
            continue;

        for(auto obj : Reverse(victim->Objects()))
        {
            if(obj->Prototype->ItemType == ITEM_WEAPON)
            {
                if(victim != ch && CanSeeCharacter(ch, victim) && CanSeeObject(ch, obj))
                {
                    sprintf(buf, "Weapons are banned from non-military usage. I'm going to have to confiscate %s.", obj->ShortDescr.c_str());
                    do_say(ch, buf);

                    if(obj->WearLoc != WEAR_NONE)
                        RemoveObject(victim, obj->WearLoc, true);

                    SeparateOneObjectFromGroup(obj);
                    ObjectFromCharacter(obj);
                    Act(AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, ActTarget::NotVict);
                    Act(AT_ACTION, "$n takes $p from you.", ch, obj, victim, ActTarget::Vict);
                    obj = ObjectToCharacter(obj, ch);
                    obj->Flags.set(Flag::Obj::Contraband);
                    long ch_exp = umin(obj->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY))));
                    victim->Echo("You lose %ld experience.\r\n ", ch_exp);
                    GainXP(victim, SMUGGLING_ABILITY, 0 - ch_exp);
                    return true;
                }
                else if(CanSeeCharacter(ch, victim)
                        && !obj->Flags.test(Flag::Obj::Contraband))
                {
                    long ch_exp = umin(obj->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY))));
                    victim->Echo("You receive %ld experience for smuggling %s.\r\n ", ch_exp, obj->ShortDescr.c_str());
                    GainXP(victim, SMUGGLING_ABILITY, ch_exp);

                    Act(AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, ActTarget::NotVict);
                    Act(AT_ACTION, "$n look at you suspiciously.", ch, NULL, victim, ActTarget::Vict);
                    obj->Flags.set(Flag::Obj::Contraband);
                    return true;
                }
                else if(!obj->Flags.test(Flag::Obj::Contraband))
                {
                    long ch_exp = umin(obj->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY))));
                    victim->Echo("You receive %ld experience for smuggling %s.\r\n ",
                                 ch_exp, obj->ShortDescr.c_str());
                    GainXP(victim, SMUGGLING_ABILITY, ch_exp);
                    obj->Flags.set(Flag::Obj::Contraband);
                    return true;
                }
            }
            else if(obj->ItemType == ITEM_CONTAINER)
            {
                for(Object *content : obj->Objects())
                {
                    if(content->Prototype->ItemType == ITEM_WEAPON
                       && !content->Flags.test(Flag::Obj::Contraband))
                    {
                        long ch_exp = umin(content->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(victim, SMUGGLING_ABILITY))));
                        victim->Echo("You receive %ld experience for smuggling %s.\r\n ",
                                     ch_exp, content->ShortDescr.c_str());
                        GainXP(victim, SMUGGLING_ABILITY, ch_exp);
                        content->Flags.set(Flag::Obj::Contraband);
                        return true;
                    }
                }
            }
        }
    }

    return false;
}
