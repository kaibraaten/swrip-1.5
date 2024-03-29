#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

/*
 * Generic mob creating spell                                   -Thoric
 */
ch_ret spell_create_mob(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    int lvl = 0;
    vnum_t vnum = skill->Value;
    std::shared_ptr<Character> mob;
    std::shared_ptr<ProtoMobile> mi;
    auto af = std::make_shared<Affect>();

    /* set maximum mob level */
    switch (SPELL_POWER(skill))
    {
        default:
        case SP_NONE:
            lvl = 20;
            break;

        case SP_MINOR:
            lvl = 5;
            break;

        case SP_GREATER:
            lvl = level / 2;
            break;

        case SP_MAJOR:
            lvl = level;
            break;
    }

    /*
     * Add predetermined mobiles here
     */
    if (vnum == INVALID_VNUM)
    {
        return rNONE;
    }

    if ((mi = GetProtoMobile(vnum)) == NULL
        || (mob = CreateMobile(mi)) == NULL)
    {
        FailedCasting(skill, caster, NULL, NULL);
        return rNONE;
    }

    mob->TopLevel(umin(lvl, !skill->Dice.empty() ? ParseDice(caster, level, skill->Dice) : mob->TopLevel()));
    mob->ArmorClass = Interpolate(mob->TopLevel(), 100, -100);

    mob->HitPoints.Max = mob->TopLevel() * 8 + GetRandomNumberFromRange(
            mob->TopLevel() * mob->TopLevel() / 4,
            mob->TopLevel() * mob->TopLevel());
    mob->HitPoints.Current = mob->HitPoints.Max;
    mob->Gold = 0;
    SuccessfulCasting(skill, caster, mob, NULL);
    CharacterToRoom(mob, caster->InRoom);
    StartFollowing(mob, caster);
    af->Type = sn;
    af->Duration = (NumberFuzzy((level + 1) / 3) + 1) * DUR_CONV;
    af->Location = 0;
    af->Modifier = 0;
    af->AffectedBy = CreateBitSet<Flag::MAX>({Flag::Affect::Charm});
    AffectToCharacter(mob, af);
    return rNONE;
}
