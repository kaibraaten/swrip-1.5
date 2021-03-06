#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "object.hpp"
#include "act.hpp"

void do_skin(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Object> corpse;
    std::shared_ptr<Object> obj;
    std::shared_ptr<Object> skin;
    std::string name;
    char buf[MAX_STRING_LENGTH];

    if(argument.empty())
    {
        ch->Echo("Whose corpse do you wish to skin?\r\n");
        return;
    }

    if((corpse = GetObjectHere(ch, argument)) == NULL)
    {
        ch->Echo("You cannot find that here.\r\n");
        return;
    }

    if((obj = GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL)
    {
        ch->Echo("You have no weapon with which to perform this deed.\r\n");
        return;
    }

    if(corpse->ItemType != ITEM_CORPSE_PC)
    {
        ch->Echo("You can only skin bodies.\r\n");
        return;
    }

    if(corpse->Value[OVAL_CORPSE_SKINNED] == 1)
    {
        ch->Echo("This corpse has already been skinned.\r\n");
        return;
    }


    if(obj->Value[OVAL_CORPSE_3] != 1
       && obj->Value[OVAL_CORPSE_3] != 2
       && obj->Value[OVAL_CORPSE_3] != 3
       && obj->Value[OVAL_CORPSE_3] != 11)
    {
        ch->Echo("There is nothing you can do with this corpse.\r\n");
        return;
    }

    if(GetProtoObject(OBJ_VNUM_SKIN) == NULL)
    {
        Log->Bug("Vnum %ld (OBJ_VNUM_SKIN) not found for do_skin!", OBJ_VNUM_SKIN);
        return;
    }

    LearnFromSuccess(ch, gsn_punch);

    Act(AT_BLOOD, "$n strips the skin from $p.", ch, corpse, NULL, ActTarget::Room);
    Act(AT_BLOOD, "You strip the skin from $p.", ch, corpse, NULL, ActTarget::Char);
    skin = CreateObject(GetProtoObject(OBJ_VNUM_SKIN), 0);
    name = corpse->ShortDescr;
    sprintf(buf, skin->ShortDescr.c_str(), name.c_str());
    skin->ShortDescr = buf;
    sprintf(buf, skin->Description.c_str(), name.c_str());
    skin->Description = buf;

    sprintf(buf, "The skinned bones of %s", name.c_str());
    corpse->Name = buf;

    sprintf(buf, "The skinned bones of %s", name.c_str());
    corpse->Description = buf;

    sprintf(buf, "The skinned bones of %s", name.c_str());
    corpse->ShortDescr = buf;

    corpse->Value[OVAL_CORPSE_SKINNED] = 1;
    corpse->Value[OVAL_CORPSE_DECAY] = -1;
    corpse->Timer = -1;

    ObjectToCharacter(skin, ch);
}
