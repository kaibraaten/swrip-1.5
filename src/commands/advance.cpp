#include "mud.hpp"
#include "character.hpp"

void do_advance(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::shared_ptr<Character> victim;
    AbilityClass ability = AbilityClass::None;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg3);
    argument = OneArgument(argument, arg2);

    if(arg1.empty() || arg2.empty() || arg3.empty())
    {
        ch->Echo("Syntax: advance <char> <ability> <level>.\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg1)) == NULL)
    {
        ch->Echo("That player is not here.\r\n");
        return;
    }

    for(int iAbility = 0; iAbility < (int)AbilityClass::Max; iAbility++)
    {
        if(!StringPrefix(arg3, AbilityName[iAbility]))
        {
            ability = AbilityClass(iAbility);
            break;
        }
    }

    if(ability == AbilityClass::None)
    {
        ch->Echo("No such ability.\r\n");
        do_advance(ch, "");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    /* You can demote yourself but not someone else at your own trust. -- Narn */
    if(GetTrustLevel(ch) <= GetTrustLevel(victim) && ch != victim)
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    int level = strtol(arg2.c_str(), nullptr, 10);

    if(level < 1 || level > MAX_ABILITY_LEVEL)
    {
        ch->Echo("Level must be 1 to %d.\r\n", MAX_ABILITY_LEVEL);
        return;
    }

    /*
     * Lower level:
     *   Reset to level 1.
     *   Then raise again.
     *   Currently, an imp can lower another imp.
     *   -- Swiftest
     */
    if(level <= GetAbilityLevel(victim, ability))
    {
        ch->Echo("Lowering a player's level!\r\n");
        SetCharacterColor(AT_IMMORT, victim);
        victim->Echo("Cursed and forsaken! The gods have lowered your level.\r\n");
        SetAbilityXP(victim, ability, 0);
        SetAbilityLevel(victim, ability, 1);

        if(ability == AbilityClass::Combat)
            victim->HitPoints.Max = 500;

        if(ability == AbilityClass::Force)
            victim->Mana.Max = 0;
    }
    else
    {
        ch->Echo("Raising a player's level!\r\n");
        victim->Echo("The gods feel fit to raise your level!\r\n");
    }

    for(int iLevel = GetAbilityLevel(victim, ability); iLevel < level; iLevel++)
    {
        SetAbilityXP(victim, ability, GetRequiredXpForLevel(iLevel + 1));
        GainXP(victim, ability, 0);
    }
}

