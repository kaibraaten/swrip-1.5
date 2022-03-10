#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

extern std::string spell_target_name;

ch_ret spell_farsight(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    /* The spell fails if the victim isn't playing, the victim is the caster,
       the target room has private, solitary, noastral, death or proto flags,
       the caster's room is norecall, the victim is too high in level, the
       victim is a proto mob, the victim makes the saving throw or the pkill
       flag on the caster is not the same as on the victim.  Got it?
    */

    int saving = GetRandomPercent();

    if ((victim = GetCharacterAnywhere(caster, spell_target_name)) == NULL
        || victim == caster
        || !victim->InRoom
        || victim->InRoom->Flags.test(Flag::Room::Private)
        || victim->InRoom->Flags.test(Flag::Room::Prototype)
        || (IsNpc(victim) && victim->Flags.test(Flag::Mob::Prototype))
        || (IsNpc(victim) && SaveVsSpellStaff(level, victim))
        || saving <= 50)
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    auto location = victim->InRoom;

    if (!location)
    {
        FailedCasting(skill, caster, victim, NULL);
        return rSPELL_FAILED;
    }

    SuccessfulCasting(skill, caster, victim, NULL);
    auto original = caster->InRoom;
    CharacterFromRoom(caster);
    CharacterToRoom(caster, location);
    do_look(caster, "auto");
    CharacterFromRoom(caster);
    CharacterToRoom(caster, original);
    return rNONE;
}

