#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeBlade
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _charge = 0;
    bool _hasStaff = false;
    std::string _itemName;
};

void do_makeblade(std::shared_ptr<Character> ch, std::string argument)
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,    {} },
     { ITEM_OVEN,       {} },
     { ITEM_DURASTEEL,  { Flag::Crafting::Extract } },
     { ITEM_BATTERY,    { Flag::Crafting::Extract } },
     { ITEM_STAFF,      { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_NONE,       {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makeblade, materials,
                                              25, GetProtoObject(OBJ_VNUM_CRAFTING_BLADE),
                                              { Flag::Crafting::NeedsWorkshop });
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeBlade>();
    session->OnInterpretArguments.Add(data, &MakeBlade::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeBlade::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeBlade::SetObjectStats);

    StartCrafting(session);
}

void MakeBlade::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    if(!args->CommandArguments.empty())
    {
        _itemName = args->CommandArguments;
    }
    else
    {
        ch->Echo("&RUsage: makeblade <name>\r\n&w");
        args->AbortSession = true;
    }
}

void MakeBlade::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_STAFF)
    {
        _hasStaff = true;
    }

    if(args->Object->ItemType == ITEM_BATTERY)
    {
        _charge = args->Object->Value[OVAL_BATTERY_CHARGE];
    }
}

void MakeBlade::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    auto weapon = args->Object;

    weapon->ItemType = ITEM_WEAPON;
    weapon->WearFlags.set(Flag::Wear::Wield);
    weapon->WearFlags.set(Flag::Wear::Take);
    weapon->Weight = 3;

    strcpy(buf, _itemName.c_str());

    if(!_hasStaff)
    {
        strcat(buf, " vibro-blade blade");
    }
    else
    {
        strcat(buf, " force pike");
    }

    weapon->Name = buf;
    weapon->ShortDescr = _itemName;
    weapon->Description = Capitalize(weapon->ShortDescr + " was left here.");

    auto backstab = std::make_shared<Affect>();
    backstab->Type = -1;
    backstab->Duration = -1;
    backstab->Location = GetAffectType("backstab");
    backstab->Modifier = weapon->Level / 3;
    weapon->Add(backstab);
    ++top_affect;

    if(!_hasStaff)
    {
        auto hitroll = std::make_shared<Affect>();
        hitroll->Type = -1;
        hitroll->Duration = -1;
        hitroll->Location = GetAffectType("hitroll");
        hitroll->Modifier = -2;
        weapon->Add(hitroll);
        ++top_affect;
    }

    weapon->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;

    if(!_hasStaff)
    {
        weapon->Value[OVAL_WEAPON_TYPE] = WEAPON_VIBRO_BLADE;
    }
    else
    {
        weapon->Value[OVAL_WEAPON_TYPE] = WEAPON_FORCE_PIKE;
    }

    weapon->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int)(weapon->Level / 20 + 8 + weapon->Value[OVAL_WEAPON_TYPE]);
    weapon->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int)(weapon->Level / 10 + 18 + weapon->Value[OVAL_WEAPON_TYPE]);

    weapon->Value[OVAL_WEAPON_CHARGE] = _charge;
    weapon->Value[OVAL_WEAPON_MAX_CHARGE] = _charge;
    weapon->Cost = weapon->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 10;
}
