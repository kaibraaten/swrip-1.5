#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

ch_ret spell_black_lightning(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int dam = 100;

    if (IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(caster))
    {
        dam -= (int) (dam / 2);
    }

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    Act(AT_BLUE, "Bolts of electricity shoot from the fingers of $n, sending $N into a fit of painful spasms.", caster,
        NULL, victim, ActTarget::NotVict);
    Act(AT_BLUE, "Bolts of electricity shoot from your fingertips, sending $N into a fit of painful spasms.", caster,
        NULL, victim, ActTarget::Char);
    Act(AT_BLUE, "Intense pain spreads through your body as bolts of electricity from $N assault you.", victim, NULL,
        caster, ActTarget::Char);

    if (SaveVsPoisonDeath(level, victim))
    {
        return InflictDamage(caster, victim, dam, sn);
    }
    else
    {
        InflictDamage(caster, victim, dam, sn);

        if (CharacterDiedRecently(victim))
        {
            return rCHAR_DIED;
        }

        if (spell_black_lightning(sn, level, caster, vo) == rCHAR_DIED)
        {
            return rCHAR_DIED;
        }
        return rNONE;
    }
}
