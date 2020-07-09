#include <cassert>
#include <utility/algorithms.hpp>
#include "act.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "character.hpp"
#include "log.hpp"
#include "mprog.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"

/*
 * The primary output interface for formatted output.
 */
static std::string NAME(std::shared_ptr<Character> ch)
{
    return IsNpc(ch) ? ch->ShortDescr : ch->Name;
}

static std::string SubstituteActSequence(char code,
                                         std::shared_ptr<Character> ch,
                                         std::shared_ptr<Character> vch,
                                         std::shared_ptr<Character> to,
                                         std::shared_ptr<Object> obj1,
                                         std::shared_ptr<Object> obj2,
                                         const std::string &arg1,
                                         const std::string &arg2)
{
    std::string i;

    switch(code)
    {
    case 't':
        i = arg1;
        break;

    case 'T':
        i = arg2;
        break;

    case 'n':
        i = (to != nullptr ? PERS(ch, to) : NAME(ch));
        break;

    case 'N':
        i = (to != nullptr ? PERS(vch, to) : NAME(vch));
        break;

    case 'e':
        assert(ch->Sex <= SEX_FEMALE && ch->Sex >= SEX_NEUTRAL);
        i = HeSheIt(ch);
        break;

    case 'E':
        assert(vch->Sex <= SEX_FEMALE && vch->Sex >= SEX_NEUTRAL);
        i = HeSheIt(vch);
        break;

    case 'm':
        assert(ch->Sex <= SEX_FEMALE && ch->Sex >= SEX_NEUTRAL);
        i = HimHerIt(ch);
        break;

    case 'M':
        assert(vch->Sex <= SEX_FEMALE && vch->Sex >= SEX_NEUTRAL);
        i = HimHerIt(vch);
        break;

    case 's':
        assert(ch->Sex <= SEX_FEMALE && ch->Sex >= SEX_NEUTRAL);
        i = HisHersIts(ch);
        break;

    case 'S':
        assert(vch->Sex <= SEX_FEMALE && vch->Sex >= SEX_NEUTRAL);
        i = HisHersIts(vch);
        break;

    case 'q':
        i = (to == ch) ? "" : "s";
        break;

    case 'Q':
        i = (to == ch) ? "your" : HisHersIts(ch);
        break;

    case 'p':
        i = (to == nullptr || CanSeeObject(to, obj1)
             ? GetObjectShortDescription(obj1) : "something");
        break;

    case 'P':
        i = (to == nullptr || CanSeeObject(to, obj2)
             ? GetObjectShortDescription(obj2) : "something");
        break;

    case 'd':
        if(arg2.empty())
        {
            i = "door";
        }
        else
        {
            std::string fname;
            OneArgument(arg2, fname);
            i = fname;
        }

        break;

    default:
        Log->Bug("%s: bad code %c.", __FUNCTION__, code);
        i = " <@@@> ";
        break;
    }

    return i;
}

static std::string ActString(const std::string &format, std::shared_ptr<Character> to, std::shared_ptr<Character> ch,
                             const ActArg &arg1, const ActArg &arg2)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char *point = buf;
    const char *str = format.c_str();
    std::string i;

    while(!IsNullOrEmpty(str))
    {
        if(*str != '$')
        {
            *point++ = *str++;
            continue;
        }

        ++str;

        if(arg2.IsNull() && *str >= 'A' && *str <= 'Z')
        {
            Log->Bug("%s: missing arg2 for code %c:", __FUNCTION__, *str);
            Log->Bug("%s", format.c_str());
            i = " <@@@> ";
        }
        else
        {
            std::shared_ptr<Character> vch = arg2.Ch;
            std::shared_ptr<Object> obj1 = arg1.Obj;
            std::shared_ptr<Object> obj2 = arg2.Obj;
            i = SubstituteActSequence(*str,
                                      ch,
                                      vch,
                                      to,
                                      obj1,
                                      obj2,
                                      arg1.Str,
                                      arg2.Str);
        }

        ++str;
        const char *i_ptr = i.c_str();

        while((*point = *i_ptr) != '\0')
        {
            ++point, ++i_ptr;
        }
    }

    strcpy(point, "\r\n");
    buf[0] = CharToUppercase(buf[0]);
    return buf;
}

void Act(short AType, const std::string &format, std::shared_ptr<Character> ch, const ActArg &arg1, const ActArg &arg2, ActTarget type)
{
    assert(ch != nullptr);
    std::string txt;
    std::shared_ptr<Character> to;
    std::shared_ptr<Character> vch = arg2.Ch;

    /*
     * Discard null and zero-length messages.
     */
    if(format.empty())
        return;

    /*
     * ACT_SECRETIVE handling
     */
    if(IsNpc(ch)
       && ch->Flags.test(Flag::Mob::Secretive)
       && type != ActTarget::Char)
    {
        return;
    }

    if(ch->InRoom == nullptr)
    {
        to = nullptr;
    }
    else if(type == ActTarget::Char)
    {
        to = ch;
    }
    else
    {
        to = ch->InRoom->Characters().front();
    }

    if(type == ActTarget::Vict)
    {
        if(vch == nullptr)
        {
            Log->Bug("Act: null vch (arg2) with ActTarget::Vict.");
            Log->Bug("%s (%s)", ch->Name.c_str(), format.c_str());
            return;
        }

        assert(vch->InRoom != nullptr);

        to = vch;
    }

    if(MOBtrigger && type != ActTarget::Char && type != ActTarget::Vict && to != nullptr)
    {
        txt = ActString(format, nullptr, ch, arg1, arg2);

        if(IsBitSet(to->InRoom->mprog.progtypes, ACT_PROG))
        {
            RoomProgActTrigger(txt, to->InRoom, ch,
                               arg1.Obj,
                               Vo(arg2.Ch, arg2.Obj));
        }

        auto objectsToTrigger = Filter(to->InRoom->Objects(),
                                       [](auto to_obj)
                                       {
                                           return IsBitSet(to_obj->Prototype->mprog.progtypes, ACT_PROG);
                                       });

        for(const auto &to_obj : objectsToTrigger)
        {
            ObjProgActTrigger(txt, to_obj, ch, arg1.Obj, arg2.Obj);
        }
    }

    std::list<std::shared_ptr<Character>> charactersInRoom;

    if(type == ActTarget::Char || type == ActTarget::Vict)
    {
        charactersInRoom.push_back(to);
    }
    else
    {
        charactersInRoom = ch->InRoom->Characters();
    }

    for(const auto &person : charactersInRoom)
    {
        to = person;

        if(((to == nullptr || to->Desc == nullptr)
            && (IsNpc(to) && !IsBitSet(to->Prototype->mprog.progtypes, ACT_PROG)))
           || !IsAwake(to))
            continue;

        if(!CanSeeCharacter(to, ch) && type != ActTarget::Vict && ch != supermob)
            continue;

        if(type == ActTarget::Char && to != ch)
            continue;

        if(type == ActTarget::Vict && (to != vch || to == ch))
            continue;

        if(type == ActTarget::Room && to == ch)
            continue;

        if(type == ActTarget::NotVict && (to == ch || to == vch))
            continue;

        txt = ActString(format, to, ch, arg1, arg2);

        if(to != nullptr && to->Desc != nullptr)
        {
            SetCharacterColor(AType, to);
            to->Echo(txt);
        }

        if(MOBtrigger)
        {
            MobProgActTrigger(txt, to, ch, arg1.Obj, Vo(arg2.Ch, arg2.Obj));
        }
    }

    MOBtrigger = true;
}
