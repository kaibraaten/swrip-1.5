#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"
#include "triggers.hpp"

void do_oinvoke(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Object> obj;
    vnum_t vnum = INVALID_VNUM;
    int level = 0;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty())
    {
        ch->Echo("Syntax: oinvoke <vnum> <level>.\r\n");
        return;
    }

    if(arg2.empty())
    {
        level = GetTrustLevel(ch);
    }
    else
    {
        if(!IsNumber(arg2))
        {
            ch->Echo("Syntax: oinvoke <vnum> <level>.\r\n");
            return;
        }

        level = ToLong(arg2);

        if(level < 0 || level > GetTrustLevel(ch))
        {
            ch->Echo("Limited to your trust level.\r\n");
            return;
        }
    }

    if(!IsNumber(arg1))
    {
        std::string arg;
        int count = NumberArgument(arg1, arg);
        int cnt = 0;
        
        for(const auto & [_, pObjIndex] : ProtoObjects)
        {
            if(NiftyIsName(arg, pObjIndex->Name)
               && ++cnt == count)
            {
                vnum = pObjIndex->Vnum;
                break;
            }
        }

        if(vnum == INVALID_VNUM)
        {
            ch->Echo("No such object exists.\r\n");
            return;
        }
    }
    else
    {
        vnum = ToLong(arg1);
    }
    
    if(GetTrustLevel(ch) < LEVEL_CREATOR)
    {
        std::shared_ptr<Area> pArea;

        if(IsNpc(ch))
        {
            ch->Echo("Huh?\r\n");
            return;
        }

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to invoke this object.\r\n");
            return;
        }

        if(vnum < pArea->VnumRanges.Object.First
           && vnum > pArea->VnumRanges.Object.Last)
        {
            ch->Echo("That number is not in your allocated range.\r\n");
            return;
        }
    }

    auto pObjIndex = GetProtoObject(vnum);

    if(pObjIndex == nullptr)
    {
        ch->Echo("No object has that vnum.\r\n");
        return;
    }

    obj = CreateObject(pObjIndex, level);

    if(obj->WearFlags.test(Flag::Wear::Take))
    {
        obj = ObjectToCharacter(obj, ch);
    }
    else
    {
        obj = ObjectToRoom(obj, ch->InRoom);
        Act(AT_IMMORT, "$n has created $p!", ch, obj, NULL, ActTarget::Room);
    }

    ImpScriptSpawnTrigger(obj);
    ch->Echo("Ok.\r\n");
}
