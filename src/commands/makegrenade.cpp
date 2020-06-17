#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

struct UserData
{
    int Strength = 0;
    int Weight = 0;
    int Level = 0;
    std::string ItemName;
};

static void InterpretArgumentsHandler(void *userData, InterpretArgumentsEventArgs *args);
static void MaterialFoundHandler(void *userData, MaterialFoundEventArgs *args);
static void SetObjectStatsHandler(void *userData, SetObjectStatsEventArgs *args);
static void FinishedCraftingHandler(void *userData, FinishedCraftingEventArgs *args);
static void AbortHandler(void *userData, AbortCraftingEventArgs *args);
static void FreeUserData(struct UserData *ud);

void do_makegrenade(Character *ch, std::string argument)
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,         {} },
     { ITEM_BATTERY,         { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,         { Flag::Crafting::Extract } },
     { ITEM_DRINK_CON,       { Flag::Crafting::Extract } },
     { ITEM_CHEMICAL,        { Flag::Crafting::Extract } },
     { ITEM_NONE,            {} },
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makegrenade, materials,
                                              25, GetProtoObject(OBJ_VNUM_CRAFTING_GRENADE),
                                              { Flag::Crafting::NeedsWorkshop });
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    UserData *data = new UserData();

    data->Level = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_makegrenade]);

    AddInterpretArgumentsCraftingHandler(session, data, InterpretArgumentsHandler);
    AddMaterialFoundCraftingHandler(session, data, MaterialFoundHandler);
    AddSetObjectStatsCraftingHandler(session, data, SetObjectStatsHandler);
    AddFinishedCraftingHandler(session, data, FinishedCraftingHandler);
    AddAbortCraftingHandler(session, data, AbortHandler);

    StartCrafting(session);
}

static void InterpretArgumentsHandler(void *userData, InterpretArgumentsEventArgs *args)
{
    Character *ch = GetEngineer(args->CraftingSession);
    struct UserData *ud = (struct UserData *)userData;

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: Makegrenade <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    ud->ItemName = args->CommandArguments;
}

static void MaterialFoundHandler(void *userData, MaterialFoundEventArgs *args)
{
    struct UserData *ud = (struct UserData *)userData;

    if(args->Object->ItemType == ITEM_DRINK_CON
       && args->Object->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] > 0)
    {
        /* FAIL! */
    }

    if(args->Object->ItemType == ITEM_CHEMICAL)
    {
        ud->Strength = urange(10, args->Object->Value[OVAL_CHEMICAL_STRENGTH], ud->Level * 5);
        ud->Weight = args->Object->Weight;
    }
}

static void SetObjectStatsHandler(void *userData, SetObjectStatsEventArgs *args)
{
    struct UserData *ud = (struct UserData *)userData;
    char buf[MAX_STRING_LENGTH];
    auto grenade = args->Object;

    grenade->WearFlags.set(Flag::Wear::Hold);
    grenade->WearFlags.set(Flag::Wear::Take);
    grenade->Weight = ud->Weight;

    strcpy(buf, ud->ItemName.c_str());
    strcat(buf, " grenade");
    grenade->Name = buf;

    strcpy(buf, ud->ItemName.c_str());
    grenade->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    grenade->Description = Capitalize(buf);

    grenade->Value[OVAL_EXPLOSIVE_MIN_DMG] = ud->Strength / 2;
    grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] = ud->Strength;
    grenade->Cost = grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] * 5;
}

static void FinishedCraftingHandler(void *userData, FinishedCraftingEventArgs *args)
{
    struct UserData *ud = (struct UserData *)userData;
    FreeUserData(ud);
}

static void AbortHandler(void *userData, AbortCraftingEventArgs *args)
{
    struct UserData *ud = (struct UserData *)userData;
    FreeUserData(ud);
}

static void FreeUserData(struct UserData *ud)
{
    delete ud;
}


