#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "act.hpp"

extern std::string spell_target_name;
extern int pAbort;

/*
 * Cast a spell.  Multi-caster and component support by Thoric
 */
void do_cast(Character* ch, std::string argument)
{
    std::string arg1;
    std::string targetName;
    Character* victim = nullptr;
    Object* obj = nullptr;
    void* vo = nullptr;
    int mana = 0;
    int sn = 0;
    ch_ret retcode = rNONE;
    bool dont_wait = false;
    std::shared_ptr<Skill> skill;
    struct timeval time_used;

    switch (ch->SubState)
    {
    default:
        /* no ordering charmed mobs to cast spells */
        if (IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
        {
            ch->Echo("You can't seem to do that right now...\r\n");
            return;
        }

        if (ch->InRoom->Flags.test(Flag::Room::NoMagic))
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You failed.\r\n");
            return;
        }

        spell_target_name = OneArgument(argument, arg1);
        OneArgument(spell_target_name, targetName);

        if (arg1.empty())
        {
            ch->Echo("Cast which what where?\r\n");
            return;
        }

        if (GetTrustLevel(ch) < LEVEL_GREATER)
        {
            if ((sn = FindSpell(ch, arg1, true)) < 0
                || (!IsNpc(ch) && ch->PCData->Learned[sn] <= 0))
            {
                ch->Echo("You can't do that.\r\n");
                return;
            }

            if ((skill = GetSkill(sn)) == NULL)
            {
                ch->Echo("You can't do that right now...\r\n");
                return;
            }
        }
        else
        {
            if ((sn = LookupSkill(arg1)) < 0)
            {
                ch->Echo("We didn't create that yet...\r\n");
                return;
            }

            if (sn >= MAX_SKILL)
            {
                ch->Echo("Hmm... that might hurt.\r\n");
                return;
            }

            if ((skill = GetSkill(sn)) == NULL)
            {
                ch->Echo("Somethis is severely wrong with that one...\r\n");
                return;
            }

            if (skill->Type != SKILL_SPELL)
            {
                ch->Echo("That isn't a force power.\r\n");
                return;
            }

            if (!skill->SpellFunction)
            {
                ch->Echo("We didn't finish that one yet...\r\n");
                return;
            }
        }

        /*
         * Something else removed by Merc                 -Thoric
         */
        if (ch->Position < skill->Position)
        {
            switch (ch->Position)
            {
            default:
                ch->Echo("You can't concentrate enough.\r\n");
                break;

            case POS_SITTING:
                ch->Echo("You can't summon enough energy sitting down.\r\n");
                break;

            case POS_RESTING:
                ch->Echo("You're too relaxed to user that force power.\r\n");
                break;

            case POS_FIGHTING:
                ch->Echo("You can't concentrate enough while fighting!\r\n");
                break;

            case POS_SLEEPING:
                ch->Echo("You dream about being the greatest force user ever.\r\n");
                break;
            }

            return;
        }

        if (skill->SpellFunction == spell_null)
        {
            ch->Echo("That's not a spell!\r\n");
            return;
        }

        if (!skill->SpellFunction)
        {
            ch->Echo("You cannot cast that... yet.\r\n");
            return;
        }

        mana = IsNpc(ch) ? 0 : skill->Mana;

        /*
         * Locate targets.
         */
        vo = LocateSpellTargets(ch, targetName, sn, &victim, &obj);

        if (vo == &pAbort)
            return;

        if (IsSafe(ch, victim))
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You cannot do that to them.\r\n");
            return;
        }


        if (!IsNpc(ch) && ch->Mana.Current < mana)
        {
            ch->Echo("The force is not strong enough within you.\r\n");
            return;
        }

        if (skill->Participants <= 1)
            break;

        /* multi-participant spells                       -Thoric */
        AddTimerToCharacter(ch, TIMER_CMD_FUN, umin(skill->Beats / 10, 3), do_cast, SUB_PAUSE);
        Act(AT_MAGIC, "You begin to feel the force in yourself and those around you...",
            ch, NULL, NULL, TO_CHAR);
        Act(AT_MAGIC, "$n reaches out with the force to those around...", ch, NULL, NULL, TO_ROOM);
        ch->dest_buf = targetName + " " + spell_target_name;
        ch->tempnum = sn;
        return;

    case SUB_TIMER_DO_ABORT:
        ch->dest_buf.erase();
        
        if (IS_VALID_SN((sn = ch->tempnum)))
        {
            if ((skill = GetSkill(sn)) == NULL)
            {
                ch->Echo("Something went wrong...\r\n");
                Log->Bug("do_cast: SUB_TIMER_DO_ABORT: bad sn %d", sn);
                return;
            }

            mana = IsNpc(ch) ? 0 : skill->Mana;

            if (GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
                ch->Mana.Current -= mana / 3;
        }

        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("You stop your concentration\r\n");
        /* should add chance of backfire here */
        return;

    case SUB_PAUSE:
        sn = ch->tempnum;

        if ((skill = GetSkill(sn)) == NULL)
        {
            ch->Echo("Something went wrong...\r\n");
            Log->Bug("do_cast: substate 1: bad sn %d", sn);
            return;
        }

        if (ch->dest_buf.empty() || !IS_VALID_SN(sn) || skill->Type != SKILL_SPELL)
        {
            ch->Echo("Something negates the powers of the force.\r\n");
            Log->Bug("do_cast: ch->dest_buf.empty() or bad sn (%d)", sn);
            return;
        }

        mana = IsNpc(ch) ? 0 : skill->Mana;
        std::string buf = ch->dest_buf;
        ch->dest_buf.erase();
        spell_target_name = OneArgument(buf, targetName);
        ch->SubState = SUB_NONE;

        if (skill->Participants > 1)
        {
            int cnt = 1;
            std::shared_ptr<Timer> t;

            for (Character* tmp : ch->InRoom->Characters())
            {
                if (tmp != ch
                    && (t = GetTimerPointer(tmp, TIMER_CMD_FUN)) != NULL
                    && t->Count >= 1 && t->DoFun == do_cast
                    && tmp->tempnum == sn && !tmp->dest_buf.empty()
                    && StrCmp(tmp->dest_buf, buf) == 0)
                {
                    ++cnt;
                }
            }

            if (cnt >= skill->Participants)
            {
                for (Character* tmp : ch->InRoom->Characters())
                {
                    if (tmp != ch
                        && (t = GetTimerPointer(tmp, TIMER_CMD_FUN)) != NULL
                        && t->Count >= 1 && t->DoFun == do_cast
                        && tmp->tempnum == sn && !tmp->dest_buf.empty()
                        && StrCmp(tmp->dest_buf, buf) == 0)
                    {
                        ExtractTimer(tmp, t);
                        Act(AT_MAGIC, "Channeling your energy into $n, you help direct the force",
                            ch, NULL, tmp, TO_VICT);
                        Act(AT_MAGIC, "$N channels $S energy into you!", ch, NULL, tmp, TO_CHAR);
                        Act(AT_MAGIC, "$N channels $S energy into $n!", ch, NULL, tmp, TO_NOTVICT);
                        LearnFromSuccess(tmp, sn);

                        tmp->Mana.Current -= mana;
                        tmp->SubState = SUB_NONE;
                        tmp->tempnum = -1;
                        tmp->dest_buf.erase();
                    }
                }

                dont_wait = true;
                ch->Echo("You concentrate all the energy into a burst of force!\r\n");
                vo = LocateSpellTargets(ch, targetName, sn, &victim, &obj);

                if (vo == &pAbort)
                    return;
            }
            else
            {
                SetCharacterColor(AT_MAGIC, ch);
                ch->Echo("There was not enough power for that to succeed...\r\n");

                if (GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
                    ch->Mana.Current -= mana / 2;

                LearnFromFailure(ch, sn);
                return;
            }
        }
    }

    if (!dont_wait)
        SetWaitState(ch, skill->Beats);

    /*
     * Getting ready to cast... check for spell components        -Thoric
     */
    if (!IsNpc(ch) && abs(ch->Alignment - skill->Alignment) > 1010)
    {
        if (ch->Alignment > skill->Alignment)
        {
            ch->Echo("You do not have enough anger in you.\r\n");

            if (GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
                ch->Mana.Current -= mana / 2;

            return;
        }

        if (ch->Alignment < skill->Alignment)
        {
            ch->Echo("Your anger and hatred prevent you from focusing.\r\n");

            if (GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
                ch->Mana.Current -= mana / 2;

            return;
        }
    }

    if (!IsNpc(ch)
        && (GetRandomPercent() + skill->Difficulty * 5) > ch->PCData->Learned[sn])
    {
        /* Some more interesting loss of concentration messages  -Thoric */
        switch (NumberBits(2))
        {
        case 0: /* too busy */
            if (ch->Fighting)
                ch->Echo("This round of battle is too hectic to concentrate properly.\r\n");
            else
                ch->Echo("You lost your concentration.\r\n");
            break;

        case 1: /* irritation */
            if (NumberBits(2) == 0)
            {
                switch (NumberBits(2))
                {
                case 0:
                    ch->Echo("A tickle in your nose prevents you from keeping your concentration.\r\n");
                    break;

                case 1:
                    ch->Echo("An itch on your leg keeps you from properly using the force.\r\n");
                    break;

                case 2:
                    ch->Echo("A nagging thought prevents you from focusing on the force.\r\n");
                    break;

                case 3:
                    ch->Echo("A twitch in your eye disrupts your concentration for a moment.\r\n");
                    break;
                }
            }
            else
            {
                ch->Echo("Something distracts you, and you lose your concentration.\r\n");
            }
            break;

        case 2: /* not enough time */
            if (ch->Fighting)
                ch->Echo("There wasn't enough time this round to complete your concentration.\r\n");
            else
                ch->Echo("You lost your concentration.\r\n");
            break;

        case 3:
            ch->Echo("A disturbance in the force muddles your concentration.\r\n");
            break;
        }

        if (GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
            ch->Mana.Current -= mana / 2;

        LearnFromFailure(ch, sn);
        return;
    }
    else
    {
        ch->Mana.Current -= mana;

        /*
         * check for immunity to magic if victim is known...
         * and it is a TAR_CHAR_DEFENSIVE/SELF spell
         * otherwise spells will have to check themselves
         */
        if ((skill->Target == TAR_CHAR_DEFENSIVE
            || skill->Target == TAR_CHAR_SELF)
            && victim && victim->Immune.test(Flag::Ris::Magic))
        {
            ImmuneCasting(skill, ch, victim, NULL);
            retcode = rSPELL_FAILED;
        }
        else
        {
            StartTimer(&time_used);
            retcode = skill->SpellFunction(sn, GetAbilityLevel(ch, FORCE_ABILITY), ch, vo);
            StopTimer(&time_used);
            UpdateNumberOfTimesUsed(&time_used, skill->UseRec);
        }
    }

    if (retcode == rCHAR_DIED || retcode == rERROR || CharacterDiedRecently(ch))
        return;

    if (retcode != rSPELL_FAILED)
    {
        int force_exp = skill->Level * skill->Level * 10;
        force_exp = urange(0, force_exp, (GetRequiredXpForLevel(GetAbilityLevel(ch, FORCE_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, FORCE_ABILITY))) / 35);

        if (!ch->Fighting)
        {
            ch->Echo("You gain %d force experience.\r\n", force_exp);
        }

        GainXP(ch, FORCE_ABILITY, force_exp);
        LearnFromSuccess(ch, sn);
    }
    else
        LearnFromFailure(ch, sn);

    /*
     * Fixed up a weird mess here, and added double safeguards    -Thoric
     */
    if (skill->Target == TAR_CHAR_OFFENSIVE
        && victim
        && !CharacterDiedRecently(victim)
        && victim != ch)
    {
        std::list<Character*> copyOfCharactersInRoom(ch->InRoom->Characters());

        for (Character* vch : copyOfCharactersInRoom)
        {
            if (vch == victim)
            {
                if (victim->Master != ch
                    && !victim->Fighting)
                {
                    retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
                }

                break;
            }
        }
    }
}
