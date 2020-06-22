#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeJewelry
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _wearLocation = 0;
    long _cost = 0;
};

static std::shared_ptr<CraftRecipe> MakeCraftRecipe();
static bool CanUseWearLocation(int wearLocation);

void do_makejewelry(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = MakeCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeJewelry>();
    session->OnInterpretArguments.Add(data, &MakeJewelry::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeJewelry::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeJewelry::SetObjectStats);

    StartCrafting(session);
}

static std::shared_ptr<CraftRecipe> MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
        { ITEM_TOOLKIT,     {} },
        { ITEM_OVEN,        {} },
        { ITEM_RARE_METAL,  { Flag::Crafting::Extract } },
        { ITEM_CRYSTAL,     { Flag::Crafting::Extract, Flag::Crafting::Optional } },
        { ITEM_NONE,        {} }
    };
    auto recipe = AllocateCraftRecipe(gsn_makejewelry, materials,
                                      15, GetProtoObject(OBJ_VNUM_CRAFTING_ARMOR),
                                      { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeJewelry::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);
    std::string argument = args->CommandArguments;
    std::string wearLoc;
    std::string name;

    argument = OneArgument(argument, wearLoc);
    name = argument;

    if(name.empty())
    {
        ch->Echo("&RUsage: makejewelry <wearloc> <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _wearLocation = GetWearFlag(wearLoc);

    if(_wearLocation == -1)
    {
        ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str());
        args->AbortSession = true;
        return;
    }

    if(!CanUseWearLocation(_wearLocation))
    {
        ch->Echo("&RYou cannot make jewelry for that body part.\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = name;
}

void MakeJewelry::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_RARE_METAL)
    {
        _cost += args->Object->Cost;
    }

    if(args->Object->ItemType == ITEM_CRYSTAL)
    {
        _cost += args->Object->Cost;
        args->KeepFinding = true;
    }
}

void MakeJewelry::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto obj = args->Object;

    obj->WearFlags.set(Flag::Wear::Take);
    obj->WearFlags.set(_wearLocation);

    strcpy(buf, _itemName.c_str());
    obj->Name = buf;

    strcpy(buf, _itemName.c_str());
    obj->ShortDescr = buf;

    strcat(buf, " was dropped here.");
    obj->Description = Capitalize(buf);

    obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];

    obj->Cost += _cost;
}

static bool CanUseWearLocation(int wearLocation)
{
    return wearLocation == Flag::Wear::Finger
        || wearLocation == Flag::Wear::Neck
        || wearLocation == Flag::Wear::Head
        || wearLocation == Flag::Wear::Wrist
        || wearLocation == Flag::Wear::Ears;
}
