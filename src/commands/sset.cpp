#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"

/*
 * Set a skill's attributes or what skills a player has.
 * High god command, with support for creating skills/spells/herbs/etc
 */
void do_sset(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Character> victim;
    int value = 0;
    int sn = 0;
    bool fAll = false;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty() || arg2.empty() || argument.empty())
    {
        ch->Echo("Syntax: sset <victim> <skill> <value>\r\n");
        ch->Echo("or:     sset <victim> all     <value>\r\n");

        if(GetTrustLevel(ch) > LEVEL_SUB_IMPLEM)
        {
            ch->Echo("or:     sset save skill table\r\n");
            ch->Echo("or:     sset save herb table\r\n");
            ch->Echo("or:     sset create skill 'new skill'\r\n");
            ch->Echo("or:     sset create herb 'new herb'\r\n");
        }

        if(GetTrustLevel(ch) > LEVEL_GREATER)
        {
            ch->Echo("or:     sset <sn>     <field> <value>\r\n");
            ch->Echo("\r\nField being one of:\r\n");
            ch->Echo("  name code target minpos slot mana beats dammsg wearoff guild minlevel\r\n");
            ch->Echo("  type damtype acttype classtype powertype flag dice value difficulty affect\r\n");
            ch->Echo("  rmaffect level adept hit miss die imm (char/vict/room)\r\n");
            ch->Echo("  teachers\r\n");
            ch->Echo("Affect having the fields: <location> <modfifier> [duration] [bitvector]\r\n");
            ch->Echo("(See AFFECTTYPES for location, and AFFECTED_BY for bitvector)\r\n");
        }

        ch->Echo("Skill being any skill or spell.\r\n");
        return;
    }

    if(GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       && !StrCmp(arg1, "save")
       && !StrCmp(argument, "table"))
    {
        if(!StrCmp(arg2, "skill"))
        {
            ch->Echo("Saving skill table...\r\n");
            SaveSkills();
            return;
        }

        if(!StrCmp(arg2, "herb"))
        {
            ch->Echo("Saving herb table...\r\n");
            SaveHerbs();
            return;
        }
    }

    if(GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       && !StrCmp(arg1, "create")
       && (!StrCmp(arg2, "skill") || !StrCmp(arg2, "herb")))
    {
        SkillType type = SKILL_UNKNOWN;

        if(!StrCmp(arg2, "herb"))
        {
            type = SKILL_HERB;

            if(TopHerb >= MAX_HERB)
            {
                ch->Echo("The current top herb is %d, which is the maximum.  "
                         "To add more herbs,\r\nMAX_HERB will have to be "
                         "raised in constants.hpp, and the mud recompiled.\r\n",
                         TopSN);
                return;
            }
        }
        else if(TopSN >= MAX_SKILL)
        {
            ch->Echo("The current top sn is %d, which is the maximum.  "
                     "To add more skills,\r\nMAX_SKILL will have to be "
                     "raised in constants.hpp, and the mud recompiled.\r\n",
                     TopSN);
            return;
        }

        std::shared_ptr<Skill> skill = std::make_shared<Skill>();

        if(type == SKILL_HERB)
        {
            int max, x;

            HerbTable[TopHerb++] = skill;

            for(max = x = 0; x < TopHerb - 1; x++)
                if(HerbTable[x] && HerbTable[x]->Slot > max)
                    max = HerbTable[x]->Slot;

            skill->Slot = max + 1;
        }
        else
            SkillTable[TopSN++] = skill;

        skill->Name = argument;
        skill->SpellFunction = spell_smaug;
        skill->Type = type;
        ch->Echo("Done.\r\n");
        return;
    }

    if(arg1[0] == 'h')
        sn = ToLong(arg1.substr(1));
    else
        sn = ToLong(arg1);

    if(GetTrustLevel(ch) > LEVEL_GREATER
       && ((arg1[0] == 'h' && IsNumber(arg1.substr(1))
            && (sn = ToLong(arg1.substr(1))) >= 0)
           || (IsNumber(arg1) && (sn = ToLong(arg1)) >= 0)))
    {
        std::shared_ptr<Skill> skill;

        if(arg1[0] == 'h')
        {
            if(sn >= TopHerb)
            {
                ch->Echo("Herb number out of range.\r\n");
                return;
            }

            skill = HerbTable[sn];
        }
        else
        {
            if((skill = GetSkill(sn)) == NULL)
            {
                ch->Echo("Skill number out of range.\r\n");
                return;
            }

            sn %= 1000;
        }

        if(!StrCmp(arg2, "difficulty"))
        {
            skill->Difficulty = ToLong(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "participants"))
        {
            skill->Participants = ToLong(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "alignment"))
        {
            skill->Alignment = ToLong(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "damtype"))
        {
            int x = GetSpellDamage(argument);

            if(x == -1)
                ch->Echo("Not a spell damage type.\r\n");
            else
            {
                SET_SDAM(skill, x);
                ch->Echo("Ok.\r\n");
            }

            return;
        }

        if(!StrCmp(arg2, "acttype"))
        {
            int x = GetSpellAction(argument);

            if(x == -1)
                ch->Echo("Not a spell action type.\r\n");
            else
            {
                SET_SACT(skill, x);
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "classtype"))
        {
            int x = GetSpellClass(argument);

            if(x == -1)
                ch->Echo("Not a spell class type.\r\n");
            else
            {
                SET_SCLA(skill, x);
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "powertype"))
        {
            int x = GetSpellPower(argument);

            if(x == -1)
                ch->Echo("Not a spell power type.\r\n");
            else
            {
                SET_SPOW(skill, x);
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "flag"))
        {
            int x = GetSpellFlag(argument);

            if(x == -1)
                ch->Echo("Not a spell flag.\r\n");
            else
            {
                skill->Flags.flip(x);
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "saves"))
        {
            int x = GetSpellSave(argument);

            if(x == -1)
                ch->Echo("Not a saving type.\r\n");
            else
            {
                skill->Saves = x;
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "code"))
        {
            SpellFun *spellfun = nullptr;
            CmdFun *dofun = nullptr;

            if(!StringPrefix("spell_", argument)
               && (spellfun = GetSpellFunction(argument)) != spell_notfound)
            {
                skill->SpellFunction = spellfun;
                skill->SkillFunction = NULL;
                skill->FunctionName = argument;
            }
            else if(!StringPrefix("do_", argument)
                    && (dofun = GetSkillFunction(argument)) != skill_notfound)
            {
                skill->SkillFunction = dofun;
                skill->SpellFunction = NULL;
                skill->FunctionName = argument;
            }
            else
            {
                ch->Echo("Not a spell or skill.\r\n");
                return;
            }

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "target"))
        {
            SkillTargetType x = GetSpellTarget(argument);

            if((int)x == -1)
                ch->Echo("Not a valid target type.\r\n");
            else
            {
                skill->Target = x;
                ch->Echo("Ok.\r\n");
            }
            return;
        }

        if(!StrCmp(arg2, "minpos"))
        {
            skill->Position = (PositionType)urange(POS_DEAD, ToLong(argument), POS_DRAG);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "minlevel"))
        {
            skill->Level = urange(1, ToLong(argument), MAX_ABILITY_LEVEL);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "slot"))
        {
            skill->Slot = urange(0, ToLong(argument), SHRT_MAX);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "mana"))
        {
            skill->Mana = urange(0, ToLong(argument), 2000);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "beats"))
        {
            skill->Beats = urange(0, ToLong(argument), 120);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "guild"))
        {
            skill->Guild = ToLong(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "value"))
        {
            skill->Value = ToLong(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "type"))
        {
            skill->Type = GetSkillType(argument);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "rmaffect"))
        {
            int num = ToLong(argument);
            int cnt = 1;

            if(skill->Affects.empty())
            {
                ch->Echo("This spell has no special affects to remove.\r\n");
                return;
            }

            for(auto affect : skill->Affects)
            {
                if(++cnt == num)
                {
                    skill->Affects.remove(affect);
                    ch->Echo("Removed.\r\n");
                    return;
                }
            }

            ch->Echo("Not found.\r\n");
            return;
        }

        /*
         * affect <location> <modifier> <duration> <bitvector>
         */
        if(!StrCmp(arg2, "affect"))
        {
            std::string location;
            std::string modifier;
            std::string duration;
            std::string bitvector;
            int loc = 0, bits = 0;
            std::shared_ptr<SmaugAffect> aff;

            argument = OneArgument(argument, location);
            argument = OneArgument(argument, modifier);
            argument = OneArgument(argument, duration);

            if(location[0] == '!')
                loc = GetAffectType(location.substr(1)) + REVERSE_APPLY;
            else
                loc = GetAffectType(location);

            if((loc % REVERSE_APPLY) < 0
               || (loc % REVERSE_APPLY) >= MAX_APPLY_TYPE)
            {
                ch->Echo("Unknown affect location.  See AFFECTTYPES.\r\n");
                return;
            }

            while(!argument.empty())
            {
                argument = OneArgument(argument, bitvector);
                int tmpbit = GetAffectFlag(bitvector);

                if(tmpbit == -1)
                    ch->Echo("Unknown bitvector: %s. See AFFECTED_BY\r\n", bitvector.c_str());
                else
                    bits |= (1 << tmpbit);
            }

            aff = std::make_shared<SmaugAffect>();

            if(!StrCmp(duration, "0"))
                duration.erase();

            if(!StrCmp(modifier, "0"))
                modifier.erase();

            aff->Duration = duration;
            aff->Location = loc;
            aff->Modifier = modifier;
            aff->AffectedBy = bits;
            skill->Affects.push_front(aff);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "level"))
        {
            skill->Level = urange(1, ToLong(argument), MAX_ABILITY_LEVEL);
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "name"))
        {
            skill->Name = argument;
            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "dammsg"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.NounDamage.erase();
            else
                skill->Messages.NounDamage = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "wearoff"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.WearOff.erase();
            else
                skill->Messages.WearOff = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "hitchar"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Success.ToCaster.erase();
            else
                skill->Messages.Success.ToCaster = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "hitvict"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Success.ToVictim.erase();
            else
                skill->Messages.Success.ToVictim = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "hitroom"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Success.ToRoom.erase();
            else
                skill->Messages.Success.ToRoom = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "misschar"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Failure.ToCaster.erase();
            else
                skill->Messages.Failure.ToCaster = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "missvict"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Failure.ToVictim.erase();
            else
                skill->Messages.Failure.ToVictim = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "missroom"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.Failure.ToRoom.erase();
            else
                skill->Messages.Failure.ToRoom = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "diechar"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimDeath.ToCaster.erase();
            else
                skill->Messages.VictimDeath.ToCaster = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "dievict"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimDeath.ToVictim.erase();
            else
                skill->Messages.VictimDeath.ToVictim = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "dieroom"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimDeath.ToRoom.erase();
            else
                skill->Messages.VictimDeath.ToRoom = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "immchar"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimImmune.ToCaster.erase();
            else
                skill->Messages.VictimImmune.ToCaster = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "immvict"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimImmune.ToVictim.erase();
            else
                skill->Messages.VictimImmune.ToVictim = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "immroom"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Messages.VictimImmune.ToRoom.erase();
            else
                skill->Messages.VictimImmune.ToRoom = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "dice"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Dice.erase();
            else
                skill->Dice = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        if(!StrCmp(arg2, "teachers"))
        {
            if(!StrCmp(argument, "clear"))
                skill->Teachers.erase();
            else
                skill->Teachers = argument;

            ch->Echo("Ok.\r\n");
            return;
        }

        do_sset(ch, "");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg1)) == NULL)
    {
        if((sn = LookupSkill(arg1)) >= 0)
        {
            arg1 = FormatString("%d %s %s",
                                sn, arg2.c_str(), argument.c_str());
            do_sset(ch, arg1);
        }
        else
            ch->Echo("They aren't here.\r\n");
        return;

        ch->Echo("Only on NPC's.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if(GetTrustLevel(ch) < SysData.LevelToMsetPlayers && victim != ch)
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    fAll = !StrCmp(arg2, "all");
    sn = 0;

    if(!fAll && (sn = LookupSkill(arg2)) < 0)
    {
        ch->Echo("No such skill or spell.\r\n");
        return;
    }

    /*
     * Snarf the value.
     */
    if(!IsNumber(argument))
    {
        ch->Echo("Value must be numeric.\r\n");
        return;
    }

    value = ToLong(argument);

    if(value < 0 || value > 100)
    {
        ch->Echo("Value range is 0 to 100.\r\n");
        return;
    }

    if(fAll)
    {
        for(sn = 0; sn < TopSN; sn++)
        {
            /* Fix by Narn to prevent ssetting skills the player shouldn't have. */
            if(SkillTable[sn]->Guild < 0 || SkillTable[sn]->Guild >= MAX_ABILITY)
                continue;

            if(!SkillTable[sn]->Name.empty()
               && (GetAbilityLevel(victim, SkillTable[sn]->Guild) >= SkillTable[sn]->Level
                   || value == 0))
                victim->PCData->Learned[sn] = value;
        }
    }
    else
    {
        victim->PCData->Learned[sn] = value;
    }
}
