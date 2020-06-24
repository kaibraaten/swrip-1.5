#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protomob.hpp"
#include "act.hpp"

void do_minvoke(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;
    vnum_t vnum = INVALID_VNUM;

    if(arg.empty())
    {
        ch->Echo("Syntax: minvoke <vnum>.\r\n");
        return;
    }

    if(!IsNumber(arg))
    {
        std::string arg2;
        int count = NumberArgument(arg, arg2);
        int cnt = 0;
        
        for(const auto &i : ProtoMobs)
        {
            auto pMobIndex = i.second;
            
            if(NiftyIsName(arg2, pMobIndex->Name)
               && ++cnt == count)
            {
                vnum = pMobIndex->Vnum;
                break;
            }
        }
        
        if(vnum == INVALID_VNUM)
        {
            ch->Echo("No such mobile exists.\r\n");
            return;
        }
    }
    else
    {
        vnum = ToLong(arg);
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
            ch->Echo("You must have an assigned area to invoke this mobile.\r\n");
            return;
        }

        if(vnum < pArea->VnumRanges.Mob.First
           && vnum > pArea->VnumRanges.Mob.Last)
        {
            ch->Echo("That number is not in your allocated range.\r\n");
            return;
        }
    }

    auto pMobIndex = GetProtoMobile(vnum);
    
    if((pMobIndex != nullptr))
    {
        victim = CreateMobile(pMobIndex);
        CharacterToRoom(victim, ch->InRoom);
        Act(AT_IMMORT, "$n has created $N!", ch, NULL, victim, ActTarget::Room);
        ch->Echo("Ok.\r\n");
    }
    else
    {
        ch->Echo("No mobile has that vnum.\r\n");
    }
}
