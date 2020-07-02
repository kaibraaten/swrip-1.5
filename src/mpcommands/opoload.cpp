#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

void do_opoload(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    int level = 0;
    int timer = 0;

    if (IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if (!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if (arg1.empty() || !IsNumber(arg1))
    {
        ProgBug("opoload - Bad syntax", ch);
        return;
    }

    if (arg2.empty())
    {
        level = GetTrustLevel(ch);
    }
    else
    {
        /*
         * New feature from Alander.
         */
        if (!IsNumber(arg2))
        {
            ProgBug("opoload - Bad level syntax", ch);
            return;
        }

        level = ToLong(arg2);

        if (level < 0 || level > GetTrustLevel(ch))
        {
            ProgBug("opoload - Bad level", ch);
            return;
        }

        /*
         * New feature from Thoric.
         */
        timer = ToLong(argument);

        if (timer < 0)
        {
            ProgBug("opoload - Bad timer", ch);
            return;
        }
    }

    auto container = GetObjectFromSupermob(ch);

    if(container == nullptr)
    {
        ProgBug("opoload - Only works with objprogs", ch);
        return;
    }
    
    auto pObjIndex = GetProtoObject(ToLong(arg1));
    
    if (pObjIndex == nullptr)
    {
        ProgBug("opoload - Bad vnum arg", ch);
        return;
    }

    auto obj = CreateObject(pObjIndex, level);
    
    obj->Timer = timer;

    ObjectToObject(obj, container);
}
