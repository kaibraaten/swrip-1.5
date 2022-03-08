#include <utility/random.hpp>
#include "social.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "repos/socialrepository.hpp"
#include "act.hpp"
#include "triggers.hpp"

bool CheckSocial(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument)
{
    std::string arg;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Social> social = Socials->FindByName(command);

    if(social == nullptr)
    {
        return false;
    }

    if(!IsNpc(ch) && ch->Flags.test(Flag::Plr::NoEmote))
    {
        ch->Echo("You are anti-social!\r\n");
        return true;
    }

    switch(ch->Position)
    {
    case POS_DEAD:
        ch->Echo("Lie still; you are DEAD.\r\n");
        return true;

    case POS_INCAP:
    case POS_MORTAL:
        ch->Echo("You are hurt far too bad for that.\r\n");
        return true;

    case POS_STUNNED:
        ch->Echo("You are too stunned to do that.\r\n");
        return true;

    case POS_SLEEPING:
        /*
         * I just know this is the path to a 12" 'if' statement.  :(
         * But two players asked for it already!  -- Furey
         */
        if(!StrCmp(social->Name, "snore"))
        {
            break;
        }

        ch->Echo("In your dreams, or what?\r\n");
        return true;

    default:
        break;
    }

    OneArgument(argument, arg);

    if(arg.empty())
    {
        Act(AT_SOCIAL, social->OthersNoArg, ch, nullptr, victim, ActTarget::Room);
        Act(AT_SOCIAL, social->CharNoArg, ch, nullptr, victim, ActTarget::Char);
    }
    else if(!(victim = GetCharacterInRoom(ch, arg)))
    {
        ch->Echo("They aren't here.\r\n");
    }
    else if(victim == ch)
    {
        Act(AT_SOCIAL, social->OthersAuto, ch, nullptr, victim, ActTarget::Room);
        Act(AT_SOCIAL, social->CharAuto, ch, nullptr, victim, ActTarget::Char);
    }
    else
    {
        Act(AT_SOCIAL, social->OthersFound, ch, nullptr, victim, ActTarget::NotVict);
        Act(AT_SOCIAL, social->CharFound, ch, nullptr, victim, ActTarget::Char);
        Act(AT_SOCIAL, social->VictimFound, ch, nullptr, victim, ActTarget::Vict);

        if(!IsNpc(ch) && IsNpc(victim)
           && !IsAffectedBy(victim, Flag::Affect::Charm)
           && IsAwake(victim)
           && !IsBitSet(victim->Prototype->mprog.progtypes, ACT_PROG))
        {
            switch(NumberBits(4))
            {
            case 0:
                if(!ch->InRoom->Flags.test(Flag::Room::Safe)
                   && IsEvil(ch))
                {
                    if(!StrCmp(social->Name, "slap") || !StrCmp(social->Name, "punch"))
                    {
                        HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
                    }
                }
                else if(IsNeutral(ch))
                {
                    Act(AT_ACTION, "$n slaps $N.", victim, NULL, ch, ActTarget::NotVict);
                    Act(AT_ACTION, "You slap $N.", victim, NULL, ch, ActTarget::Char);
                    Act(AT_ACTION, "$n slaps you.", victim, NULL, ch, ActTarget::Vict);
                }
                else
                {
                    Act(AT_ACTION, "$n acts like $N doesn't even exist.", victim, NULL, ch, ActTarget::NotVict);
                    Act(AT_ACTION, "You just ignore $N.", victim, NULL, ch, ActTarget::Char);
                    Act(AT_ACTION, "$n appears to be ignoring you.", victim, NULL, ch, ActTarget::Vict);
                }
                break;

            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                Act(AT_SOCIAL, social->OthersFound, victim, NULL, ch, ActTarget::NotVict);
                Act(AT_SOCIAL, social->CharFound, victim, NULL, ch, ActTarget::Char);
                Act(AT_SOCIAL, social->VictimFound, victim, NULL, ch, ActTarget::Vict);
                break;

            case 9:
            case 10:
            case 11:
            case 12:
                Act(AT_ACTION, "$n slaps $N.", victim, NULL, ch, ActTarget::NotVict);
                Act(AT_ACTION, "You slap $N.", victim, NULL, ch, ActTarget::Char);
                Act(AT_ACTION, "$n slaps you.", victim, NULL, ch, ActTarget::Vict);
                break;
            }
        }
    }

    return true;
}
