#include "character.hpp"
#include "mud.hpp"

ch_ret spell_poison(int sn, int level, Character* ch, void* vo)
{
    Character* victim = (Character*)vo;
    std::shared_ptr<Affect> af = std::make_shared<Affect>();
    int poison_chance;
    bool first = true;

    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment = ch->Alignment - 100;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    poison_chance = ModifySavingThrowBasedOnResistance(victim, level, Flag::Ris::Poison);

    if (poison_chance == 1000 || SaveVsPoisonDeath(poison_chance, victim))
        return rSPELL_FAILED;

    if (IsAffectedBy(victim, Flag::Affect::Poison))
        first = false;

    af->Type = sn;
    af->Duration = level * DUR_CONV;
    af->Location = APPLY_STR;
    af->Modifier = -2;
    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Poison });
    JoinAffect(victim, af);
    SetCharacterColor(AT_MAGIC, victim);
    victim->Echo("You feel very sick.\r\n");
    victim->MentalState = urange(20, victim->MentalState
        + (first ? 5 : 0), 100);

    if (ch != victim)
        ch->Echo("Ok.\r\n");

    return rNONE;
}

