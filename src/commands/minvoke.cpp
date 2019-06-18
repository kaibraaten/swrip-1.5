#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "protomob.hpp"

void do_minvoke(Character *ch, std::string arg)
{
    std::shared_ptr<ProtoMobile> pMobIndex;
    Character *victim = NULL;
    vnum_t vnum = INVALID_VNUM;

    if (arg.empty())
    {
        ch->Echo("Syntax: minvoke <vnum>.\r\n");
        return;
    }

    if (!IsNumber(arg))
    {
        std::string arg2;
        int count = NumberArgument(arg, arg2);

        for (int hash = 0, cnt = 0; hash < MAX_KEY_HASH; hash++)
            for (pMobIndex = MobIndexHash[hash];
                pMobIndex;
                pMobIndex = pMobIndex->Next)
                if (NiftyIsName(arg2, pMobIndex->Name)
                    && ++cnt == count)
                {
                    vnum = pMobIndex->Vnum;
                    break;
                }

        if (vnum == INVALID_VNUM)
        {
            ch->Echo("No such mobile exists.\r\n");
            return;
        }
    }
    else
    {
        vnum = ToLong(arg);
    }

    if (GetTrustLevel(ch) < LEVEL_CREATOR)
    {
        std::shared_ptr<Area> pArea;

        if (IsNpc(ch))
        {
            ch->Echo("Huh?\r\n");
            return;
        }

        if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to invoke this mobile.\r\n");
            return;
        }

        if (vnum < pArea->VnumRanges.Mob.First
            && vnum > pArea->VnumRanges.Mob.Last)
        {
            ch->Echo("That number is not in your allocated range.\r\n");
            return;
        }
    }

    if ((pMobIndex = GetProtoMobile(vnum)) == NULL)
    {
        ch->Echo("No mobile has that vnum.\r\n");
        return;
    }

    victim = CreateMobile(pMobIndex);
    CharacterToRoom(victim, ch->InRoom);
    Act(AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM);
    ch->Echo("Ok.\r\n");
}

