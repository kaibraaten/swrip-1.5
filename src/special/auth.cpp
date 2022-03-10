#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"

bool spec_auth(std::shared_ptr<Character> mob)
{
    auto includeThese = [](const auto &victim)
    {
        if (IsNpc(victim)
            || !victim->PCData->Flags.test(Flag::PCData::Unauthed)
            || victim->PCData->AuthState == AuthType::MustChangeName)
        {
            return false;
        }
        else
        {
            return true;
        }
    };

    for (auto victim : mob->InRoom->Characters() | std::views::filter(includeThese))
    {
        std::shared_ptr<ProtoObject> pObjIndex = GetProtoObject(OBJ_VNUM_SCHOOL_DIPLOMA);

        if (!IsNpc(victim) && pObjIndex != nullptr)
        {
            if (!HasDiploma(victim))
            {
                auto obj = CreateObject(pObjIndex, 1);
                obj = ObjectToCharacter(obj, victim);
                victim->Echo("&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w");
            }
        }

        victim->PCData->AuthState = AuthType::Authed;
        victim->PCData->Flags.reset(Flag::PCData::Unauthed);

        victim->PCData->AuthedBy = mob->Name;
        char buf[MAX_STRING_LENGTH];
        sprintf(buf, "%s authorized %s", mob->Name.c_str(),
                victim->Name.c_str());
        ToChannel(buf, CHANNEL_MONITOR, "Monitor", mob->TopLevel());
    }

    return false;
}
