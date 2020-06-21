#include <cstring>
#include <utility/utility.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeArmor
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _armorValue = 0;
    int _wearLocation = 0;
    std::string _itemName;
};

static bool CanUseWearLocation(int wearLocation);
static CraftRecipe *CreateMakeArmorRecipe();

void do_makearmor(std::shared_ptr<Character> ch, std::string argument)
{
    CraftRecipe *recipe = CreateMakeArmorRecipe();
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeArmor>();

    session->OnInterpretArguments.Add(data, &MakeArmor::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeArmor::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeArmor::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *CreateMakeArmorRecipe()
{
    static const CraftingMaterial materials[] =
    {
        { ITEM_THREAD, {} },
        { ITEM_FABRIC, { Flag::Crafting::Extract } },
        { ITEM_NONE, {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makearmor, materials,
                                              15, GetProtoObject(OBJ_VNUM_CRAFTING_ARMOR),
                                              { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeArmor::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> eventArgs)
{
    CraftingSession *session = eventArgs->CraftingSession;
    std::string argument = eventArgs->CommandArguments;
    std::string wearLoc;
    std::shared_ptr<Character> ch = GetEngineer(session);

    argument = OneArgument(argument, wearLoc);
    std::string name = argument;

    if(name.empty())
    {
        ch->Echo("&RUsage: makearmor <wearloc> <name>\r\n&w");
        eventArgs->AbortSession = true;
        return;
    }

    _wearLocation = GetWearFlag(wearLoc);

    if(_wearLocation == -1)
    {
        ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str());
        eventArgs->AbortSession = true;
        return;
    }

    if(!CanUseWearLocation(_wearLocation))
    {
        ch->Echo("&RYou cannot make clothing for that body part.\r\n&w");
        eventArgs->AbortSession = true;
        return;
    }

    _itemName = name;
}

void MakeArmor::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> eventArgs)
{
    if(eventArgs->Object->ItemType == ITEM_FABRIC)
    {
        _armorValue = eventArgs->Object->Value[OVAL_FABRIC_STRENGTH];
    }
}

void MakeArmor::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> eventArgs)
{
    auto armor = eventArgs->Object;

    armor->ItemType = ITEM_ARMOR;
    armor->WearFlags.set(Flag::Wear::Take);
    armor->WearFlags.set(_wearLocation);

    armor->Name = _itemName;
    armor->ShortDescr = _itemName;

    armor->Description = FormatString("%s was dropped here.", Capitalize(_itemName).c_str());

    armor->Value[OVAL_ARMOR_CONDITION] = armor->Value[OVAL_ARMOR_AC] = _armorValue;
    armor->Cost *= 10;
}

static bool CanUseWearLocation(int wearLocation)
{
    return wearLocation == Flag::Wear::Body
        || wearLocation == Flag::Wear::Head
        || wearLocation == Flag::Wear::Legs
        || wearLocation == Flag::Wear::Feet
        || wearLocation == Flag::Wear::Arms
        || wearLocation == Flag::Wear::About
        || wearLocation == Flag::Wear::Waist
        || wearLocation == Flag::Wear::Over;
}
