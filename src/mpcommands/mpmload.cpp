#include "character.hpp"
#include "mud.hpp"

/* lets the mobile load an item or mobile.  All items
   are loaded into inventory.  you can specify a level with
   the load object portion as well. */

void do_mpmload(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<ProtoMobile> pMobIndex;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(arg.empty() || !IsNumber(arg))
    {
        ProgBug("Mpmload - Bad vnum as arg", ch);
        return;
    }

    if((pMobIndex = GetProtoMobile(ToLong(arg))) == NULL)
    {
        ProgBug("Mpmload - Bad mob vnum", ch);
        return;
    }

    auto victim = CreateMobile(pMobIndex);
    CharacterToRoom(victim, ch->InRoom);
}
