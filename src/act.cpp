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
static std::string NAME(const Character *ch)
{
    return IsNpc(ch) ? ch->ShortDescr : ch->Name;
}

static std::string SubstituteActSequence(char code,
                                         const Character *ch,
                                         const Character *vch,
                                         const Character *to,
                                         const Object *obj1,
                                         const Object *obj2,
                                         const char *arg1,
                                         const char *arg2)
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
        if(IsNullOrEmpty(arg2))
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

static std::string ActString(const std::string &format, Character *to, Character *ch,
                             const void *arg1, const void *arg2)
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

        if(arg2 == nullptr && *str >= 'A' && *str <= 'Z')
        {
            Log->Bug("%s: missing arg2 for code %c:", __FUNCTION__, *str);
            Log->Bug("%s", format.c_str());
            i = " <@@@> ";
        }
        else
        {
            Character *vch = static_cast<Character *>(const_cast<void *>(arg2));
            Object *obj1 = static_cast<Object *>(const_cast<void *>(arg1));
            Object *obj2 = static_cast<Object *>(const_cast<void *>(arg2));
            i = SubstituteActSequence(*str,
                                      ch,
                                      vch,
                                      to,
                                      obj1,
                                      obj2,
                                      static_cast<const char *>(arg1),
                                      static_cast<const char *>(arg2));
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

void Act(short AType, const std::string &format, Character *ch, const void *arg1, const void *arg2, int type)
{
    assert(ch != nullptr);
    std::string txt;
    Character *to = nullptr;
    Character *vch = static_cast<Character *>(const_cast<void *>(arg2));

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
       && type != TO_CHAR)
    {
        return;
    }

    if(ch->InRoom == nullptr)
    {
        to = nullptr;
    }
    else if(type == TO_CHAR)
    {
        to = ch;
    }
    else
    {
        to = ch->InRoom->Characters().front();
    }

    if(type == TO_VICT)
    {
        if(vch == nullptr)
        {
            Log->Bug("Act: null vch (arg2) with TO_VICT.");
            Log->Bug("%s (%s)", ch->Name.c_str(), format.c_str());
            return;
        }

        assert(vch->InRoom != nullptr);

        to = vch;
    }

    if(MOBtrigger && type != TO_CHAR && type != TO_VICT && to != nullptr)
    {
        txt = ActString(format, nullptr, ch, arg1, arg2);

        if(IsBitSet(to->InRoom->mprog.progtypes, ACT_PROG))
        {
            RoomProgActTrigger(txt, to->InRoom, ch,
                               static_cast<Object *>(const_cast<void *>(arg1)),
                               const_cast<void *>(arg2));
        }

        auto objectsToTrigger = Filter(to->InRoom->Objects(),
                                       [](auto to_obj)
                                       {
                                           return IsBitSet(to_obj->Prototype->mprog.progtypes, ACT_PROG);
                                       });

        for(const auto &to_obj : objectsToTrigger)
        {
            Object *obj1 = static_cast<Object *>(const_cast<void *>(arg1));
            Object *obj2 = static_cast<Object *>(const_cast<void *>(arg2));
            ObjProgActTrigger(txt, to_obj, ch, obj1, obj2);
        }
    }

    std::list<Character *> charactersInRoom;

    if(type == TO_CHAR || type == TO_VICT)
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

        if(!CanSeeCharacter(to, ch) && type != TO_VICT)
            continue;

        if(type == TO_CHAR && to != ch)
            continue;

        if(type == TO_VICT && (to != vch || to == ch))
            continue;

        if(type == TO_ROOM && to == ch)
            continue;

        if(type == TO_NOTVICT && (to == ch || to == vch))
            continue;

        if(!CanSeeCharacter(to, ch) && type != TO_VICT)
            continue;

        txt = ActString(format, to, ch, arg1, arg2);

        if(to != nullptr && to->Desc != nullptr)
        {
            SetCharacterColor(AType, to);
            to->Echo(txt);
        }

        if(MOBtrigger)
        {
            Object *obj1 = static_cast<Object *>(const_cast<void *>(arg1));
            /* Note: use original string, not string with ANSI. -- Alty */
            MobProgActTrigger(txt, to, ch, obj1, const_cast<void *>(arg2));
        }
    }

    MOBtrigger = true;
}
