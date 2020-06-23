#include <cstring>
#include <cstdlib>

#include "mud.hpp"
#include "craft.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeContainer
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _wearLocation = 0;
    std::string _itemName;
};

static bool CanUseWearLocation(int wearLocation);

void do_makecontainer(std::shared_ptr<Character> ch, std::string argument)
{
    static std::initializer_list<CraftingMaterial> materials =
    {
        { ITEM_FABRIC, { Flag::Crafting::Extract } },
        { ITEM_THREAD, {} }
    };

    auto recipe = AllocateCraftRecipe(gsn_makecontainer, materials,
                                      10, GetProtoObject(OBJ_VNUM_CRAFTING_CONTAINER),
                                      { Flag::Crafting::NeedsWorkshop });
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeContainer>();
    session->OnInterpretArguments.Add(data, &MakeContainer::InterpretArguments);
    session->OnSetObjectStats.Add(data, &MakeContainer::SetObjectStats);

    StartCrafting(session);
}

void MakeContainer::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> eventArgs)
{
    auto container = eventArgs->Object;

    container->WearFlags.set(Flag::Wear::Take);
    container->WearFlags.set(_wearLocation);

    container->Name = _itemName;
    container->ShortDescr = _itemName;
    container->Description = Capitalize(_itemName) + " was dropped here.";

    container->Value[OVAL_CONTAINER_CAPACITY] = container->Level;
    container->Value[OVAL_CONTAINER_FLAGS] = 0;
    container->Value[OVAL_CONTAINER_KEY] = 0;
    container->Value[OVAL_CONTAINER_CONDITION] = 10;
}

void MakeContainer::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> eventArgs)
{
    auto session = eventArgs->CraftingSession;
    std::string argument = eventArgs->CommandArguments;
    std::string wearLoc;
    std::string itemName;
    auto ch = GetEngineer(session);

    argument = OneArgument(argument, wearLoc);
    itemName = argument;

    if(itemName.empty())
    {
        ch->Echo("&RUsage: makecontainer <body|about|take|hold> <name>\r\n&d");
        eventArgs->AbortSession = true;
        return;
    }

    _wearLocation = GetWearFlag(wearLoc);

    if(_wearLocation == -1)
    {
        ch->Echo("&R'%s' is not a wear location.&d\r\n", wearLoc.c_str());
        eventArgs->AbortSession = true;
        return;
    }

    if(!CanUseWearLocation(_wearLocation))
    {
        ch->Echo("&RYou cannot make a container for that body part.\r\n&d");
        eventArgs->AbortSession = true;
        return;
    }

    _itemName = itemName;
}

static bool CanUseWearLocation(int wearLocation)
{
    return wearLocation == Flag::Wear::Body
        || wearLocation == Flag::Wear::About
        || wearLocation == Flag::Wear::Hold
        || wearLocation == Flag::Wear::Take;
}
