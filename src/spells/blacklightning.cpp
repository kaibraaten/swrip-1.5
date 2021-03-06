#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "act.hpp"

ch_ret spell_black_lightning(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Character> victim = vo.Ch;
    int dam = 100;

    if(IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(ch))
        dam -= (int)(dam / 2);

    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment = ch->Alignment - 100;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    Act(AT_BLUE, "Bolts of electricity shoot from the fingers of $n, sending $N into a fit of painful spasms."
        , ch, NULL, victim, ActTarget::NotVict);
    Act(AT_BLUE, "Bolts of electricity shoot from your fingertips, sending $N into a fit of painful spasms."
        , ch, NULL, victim, ActTarget::Char);
    Act(AT_BLUE, "Intense pain spreads through your body as bolts of electricity from $N assault you."
        , victim, NULL, ch, ActTarget::Char);

    if(SaveVsPoisonDeath(level, victim))
        return InflictDamage(ch, victim, dam, sn);
    else
    {
        InflictDamage(ch, victim, dam, sn);

        if(CharacterDiedRecently(victim))
            return rCHAR_DIED;

        if(spell_black_lightning(sn, level, ch, vo) == rCHAR_DIED)
            return rCHAR_DIED;
        return rNONE;
    }
}
