#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
    std::string ItemName;
    int WearLocation = 0;
};

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args);
static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args);
static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> args);
static void AbortHandler(void *userData, std::shared_ptr<AbortCraftingEventArgs> args);
static void FreeUserData(UserData *ud);
static bool CanUseWearLocation(int wearLocation);
static CraftRecipe *MakeCraftRecipe();

void do_makecomlink(std::shared_ptr<Character> ch, std::string argument)
{
    CraftRecipe *recipe = MakeCraftRecipe();
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    UserData *ud = new UserData();

    AddInterpretArgumentsCraftingHandler(session, ud, InterpretArgumentsHandler);
    AddSetObjectStatsCraftingHandler(session, ud, SetObjectStatsHandler);
    AddFinishedCraftingHandler(session, ud, FinishedCraftingHandler);
    AddAbortCraftingHandler(session, ud, AbortHandler);

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

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);
    std::string argument = args->CommandArguments;
    std::string wearLoc;
    std::string itemName;

    argument = OneArgument(argument, wearLoc);
    itemName = argument;

    if(itemName.empty())
    {
        ch->Echo("&RUsage: Makecomlink <wearloc> <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    ud->WearLocation = GetWearFlag(wearLoc);

    if(ud->WearLocation == -1)
    {
        ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str());
        args->AbortSession = true;
        return;
    }

    if(!CanUseWearLocation(ud->WearLocation))
    {
        ch->Echo("&RYou cannot make a comlink for that body part.\r\n&w");
        args->AbortSession = true;
        return;
    }

    ud->ItemName = itemName;
}

static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    auto comlink = args->Object;

    comlink->WearFlags.set(Flag::Wear::Take);
    comlink->WearFlags.set(ud->WearLocation);

    comlink->Weight = 1;

    comlink->Name = ud->ItemName + " comlink";
    comlink->ShortDescr = ud->ItemName;
    comlink->Description = Capitalize(ud->ItemName + " was left here.");

    comlink->Cost = 50;
}

static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    FreeUserData(ud);
}

static void AbortHandler(void *userData, std::shared_ptr<AbortCraftingEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    FreeUserData(ud);
}

static void FreeUserData(UserData *ud)
{
    delete ud;
}

static bool CanUseWearLocation(int wearLocation)
{
    return wearLocation == Flag::Wear::Hold
        || wearLocation == Flag::Wear::Neck
        || wearLocation == Flag::Wear::Wrist
        || wearLocation == Flag::Wear::Ears;
}
