#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "repos/objectrepository.hpp"
#include "repos/playerrepository.hpp"

void do_bodybag(Character *ch, std::string arg)
{
    if(arg.empty())
    {
        ch->Echo("Bodybag whom?\r\n");
        return;
    }

    std::string buf2 = "the corpse of " + Capitalize(arg);

    bool found = false;

    for(auto obj : Objects)
    {
        if(obj->InRoom
           && !StrCmp(buf2, obj->ShortDescr)
           && (obj->Prototype->Vnum == OBJ_VNUM_CORPSE_PC))
        {
            found = true;
            ch->Echo("Bagging body: [%5ld] %-28s [%5ld] %s\r\n",
                     obj->Prototype->Vnum,
                     obj->ShortDescr.c_str(),
                     obj->InRoom->Vnum,
                     obj->InRoom->Name.c_str());
            ObjectFromRoom(obj);
            obj = ObjectToCharacter(obj, ch);
            obj->Timer = -1;
            PlayerCharacters->Save(ch);
        }
    }

    if(!found)
    {
        ch->Echo("You couldn't find any %s\r\n", buf2);
    }
}
