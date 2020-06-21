#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
    std::string ItemName;
    int Charge = 0;
};

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args);
static void MaterialFoundHandler(void *userData, std::shared_ptr<MaterialFoundEventArgs> args);
static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args);
static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> args);
static void AbortHandler(void *userData, std::shared_ptr<AbortCraftingEventArgs> args);
static CraftRecipe *MakeCraftRecipe();
static void FreeUserData(struct UserData *ud);

void do_makeglowrod(std::shared_ptr<Character> ch, std::string argument)
{
    CraftRecipe *recipe = MakeCraftRecipe();
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    UserData *data = new UserData();

    AddInterpretArgumentsCraftingHandler(session, data, InterpretArgumentsHandler);
    AddMaterialFoundCraftingHandler(session, data, MaterialFoundHandler);
    AddSetObjectStatsCraftingHandler(session, data, SetObjectStatsHandler);
    AddFinishedCraftingHandler(session, data, FinishedCraftingHandler);
    AddAbortCraftingHandler(session, data, AbortHandler);

    StartCrafting(session);
}

static CraftRecipe *MakeCraftRecipe(void)
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,   {} },
     { ITEM_BATTERY,   { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,   { Flag::Crafting::Extract } },
     { ITEM_CHEMICAL,  { Flag::Crafting::Extract } },
     { ITEM_LENS,      { Flag::Crafting::Extract } },
     { ITEM_NONE,      {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makeglowrod, materials,
                                              10, GetProtoObject(OBJ_VNUM_CRAFTING_GLOWROD),
                                              { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    struct UserData *ud = (struct UserData *)userData;
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: Makeglowrod <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    ud->ItemName = args->CommandArguments;
}

static void MaterialFoundHandler(void *userData, std::shared_ptr<MaterialFoundEventArgs> args)
{
    struct UserData *ud = (struct UserData *)userData;

    if(args->Object->ItemType == ITEM_BATTERY)
    {
        ud->Charge = args->Object->Value[OVAL_BATTERY_CHARGE];
    }
}

static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args)
{
    struct UserData *ud = (struct UserData *)userData;
    char buf[MAX_STRING_LENGTH];
    auto glowrod = args->Object;

    glowrod->ItemType = ITEM_LIGHT;
    glowrod->WearFlags.set(Flag::Wear::Take);
    glowrod->Weight = 3;

    strcpy(buf, ud->ItemName.c_str());
    strcat(buf, " glowrod");
    glowrod->Name = buf;

    strcpy(buf, ud->ItemName.c_str());
    glowrod->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    glowrod->Description = Capitalize(buf);

    glowrod->Value[OVAL_LIGHT_POWER] = ud->Charge;
    glowrod->Cost = glowrod->Value[OVAL_LIGHT_POWER];
}

static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> args)
{
    struct UserData *ud = (struct UserData *)userData;
    FreeUserData(ud);
}

static void AbortHandler(void *userData, std::shared_ptr<AbortCraftingEventArgs> args)
{
    struct UserData *ud = (struct UserData *)userData;
    FreeUserData(ud);
}

static void FreeUserData(struct UserData *ud)
{
    delete ud;
}


