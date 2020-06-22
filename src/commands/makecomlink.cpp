#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeComlink
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _wearLocation = 0;
};

static bool CanUseWearLocation(int wearLocation);
static CraftRecipe *MakeCraftRecipe();

void do_makecomlink(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = MakeCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeComlink>();
    session->OnInterpretArguments.Add(data, &MakeComlink::InterpretArguments);
    session->OnSetObjectStats.Add(data, &MakeComlink::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
        { ITEM_TOOLKIT,  {} },
        { ITEM_OVEN,     {} },
        { ITEM_CIRCUIT,  { Flag::Crafting::Extract } },
        { ITEM_CRYSTAL,  { Flag::Crafting::Extract } },
        { ITEM_NONE,     {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makecomlink, materials,
                                              10, GetProtoObject(OBJ_VNUM_CRAFTING_COMLINK),
                                              { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeComlink::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);
    std::string argument = args->CommandArguments;
    std::string wearLoc;
    std::string itemName;

    argument = OneArgument(argument, wearLoc);
    itemName = argument;

    if(itemName.empty())
    {
        ch->Echo("&RUsage: makecomlink <wearloc> <name>\r\n&w");
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
        ch->Echo("&RYou cannot make a comlink for that body part.\r\n&d");
        args->AbortSession = true;
        return;
    }

    _itemName = itemName;
}

void MakeComlink::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    auto comlink = args->Object;

    comlink->WearFlags.set(Flag::Wear::Take);
    comlink->WearFlags.set(_wearLocation);

    comlink->Weight = 1;

    comlink->Name = _itemName + " comlink";
    comlink->ShortDescr = _itemName;
    comlink->Description = Capitalize(_itemName + " was left here.");

    comlink->Cost = 50;
}

static bool CanUseWearLocation(int wearLocation)
{
    return wearLocation == Flag::Wear::Hold
        || wearLocation == Flag::Wear::Neck
        || wearLocation == Flag::Wear::Wrist
        || wearLocation == Flag::Wear::Ears;
}
