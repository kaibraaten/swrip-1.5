#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "race.hpp"
#include "act.hpp"

void do_group(std::shared_ptr<Character> ch, std::string arg)
{
    Character *victim = NULL;

    if(arg.empty())
    {
        Character *gch = NULL;

        SetCharacterColor(AT_GREEN, ch);
        ch->Echo("%s's group:\r\n", PERS(ch, ch).c_str());

        for(gch = FirstCharacter; gch; gch = gch->Next)
        {
            if(IsInSameGroup(gch, ch))
            {
                SetCharacterColor(AT_DGREEN, ch);

                if(IsAffectedBy(gch, Flag::Affect::Possess))
                    ch->Echo("[%2d %s] %-16s %4s/%4s hp %4s/%4s mv %5s xp\r\n",
                             gch->TopLevel,
                             IsNpc(gch) ? "Mob" : RaceTable[gch->Race].Name,
                             Capitalize(PERS(gch, ch)).c_str(),
                             "????",
                             "????",
                             "????",
                             "????",
                             "?????");

                else
                    ch->Echo("[%2d %s] %-16s %4d/%4d hp %4d/%4d mv\r\n",
                             gch->TopLevel,
                             IsNpc(gch) ? "Mob" : RaceTable[gch->Race].Name,
                             Capitalize(PERS(gch, ch)).c_str(),
                             gch->HitPoints.Current,
                             gch->HitPoints.Max,
                             gch->Fatigue.Current,
                             gch->Fatigue.Max);
            }
        }

        return;
    }

    if(!StrCmp(arg, "disband"))
    {
        Character *gch = NULL;
        int count = 0;

        if(ch->Leader || ch->Master)
        {
            ch->Echo("You cannot disband a group if you're following someone.\r\n");
            return;
        }

        for(gch = FirstCharacter; gch; gch = gch->Next)
        {
            if(IsInSameGroup(ch, gch)
               && (ch != gch))
            {
                gch->Leader = NULL;
                gch->Master = NULL;
                count++;
                ch->Echo("Your group is disbanded.\r\n");
            }
        }

        if(count == 0)
            ch->Echo("You have no group members to disband.\r\n");
        else
            ch->Echo("You disband your group.\r\n");

        return;
    }

    if(!StrCmp(arg, "all"))
    {
        int count = 0;

        for(Character *rch : ch->InRoom->Characters())
        {
            if(ch != rch
               && !IsNpc(rch)
               && rch->Master == ch
               && !ch->Master
               && !ch->Leader
               && !IsInSameGroup(rch, ch))
            {
                rch->Leader = ch;
                count++;
            }
        }

        if(count == 0)
        {
            ch->Echo("You have no eligible group members.\r\n");
        }
        else
        {
            Act(AT_ACTION, "$n groups $s followers.", ch, NULL, NULL, ActTarget::Room);
            ch->Echo("You group your followers.\r\n");
        }

        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(ch->Master || (ch->Leader && ch->Leader != ch))
    {
        ch->Echo("But you are following someone else!\r\n");
        return;
    }

    if(victim->Master != ch && ch != victim)
    {
        Act(AT_PLAIN, "$N isn't following you.", ch, NULL, victim, ActTarget::Char);
        return;
    }

    if(IsInSameGroup(victim, ch) && ch != victim)
    {
        victim->Leader = NULL;
        Act(AT_ACTION, "$n removes $N from $s group.",
            ch, NULL, victim, ActTarget::NotVict);
        Act(AT_ACTION, "$n removes you from $s group.",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_ACTION, "You remove $N from your group.",
            ch, NULL, victim, ActTarget::Char);
        return;
    }

    victim->Leader = ch;
    Act(AT_ACTION, "$N joins $n's group.", ch, NULL, victim, ActTarget::NotVict);
    Act(AT_ACTION, "You join $n's group.", ch, NULL, victim, ActTarget::Vict);
    Act(AT_ACTION, "$N joins your group.", ch, NULL, victim, ActTarget::Char);
}
