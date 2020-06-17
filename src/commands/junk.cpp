#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_junk(Character *ch, std::string arg)
{
    std::shared_ptr<Object> obj;

    if(arg.empty() || !StrCmp(arg, ch->Name))
    {
        ch->Echo("Junk what?");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    obj = GetObjectInListReverse(ch, arg, ch->InRoom->Objects());

    if(!obj)
    {
        ch->Echo("You can't find it.\r\n");
        return;
    }

    SeparateOneObjectFromGroup(obj);

    if(!obj->WearFlags.test(Flag::Wear::Take))
    {
        Act(AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, ActTarget::Char);
        return;
    }

    if(obj->ItemType != ITEM_CONTAINER
       && obj->ItemType != ITEM_ARMOR
       && obj->ItemType != ITEM_TRASH
       && obj->ItemType != ITEM_KEY
       && obj->ItemType != ITEM_DRINK_CON
       && obj->ItemType != ITEM_MEDPAC)
    {
        Act(AT_PLAIN, "$p is not an acceptable item.", ch, obj, 0, ActTarget::Char);
        return;
    }

    ObjProgSacTrigger(ch, obj);

    if(IsObjectExtracted(obj))
        return;

    if(cur_obj == obj->Serial)
        global_objcode = rOBJ_SACCED;

    ExtractObject(obj);
}
