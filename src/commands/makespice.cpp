#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

struct UserData
{
    std::string ItemName;
    int SpiceType = 0;
    int SpiceGrade = 0;
};

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args);
static void MaterialFoundHandler(void *userData, std::shared_ptr<MaterialFoundEventArgs> args);
static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args);
static void FinishedCraftingHandler(void *userData, std::shared_ptr<FinishedCraftingEventArgs> args);
static void AbortHandler(void *userData, std::shared_ptr<AbortCraftingEventArgs> args);
static CraftRecipe *MakeCraftRecipe();
static void FreeUserData(UserData *ud);

void do_makespice(std::shared_ptr<Character> ch, std::string argument)
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

static CraftRecipe *MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_RAWSPICE, { Flag::Crafting::Extract } },
     { ITEM_NONE,     {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_spice_refining, materials,
                                              10, GetProtoObject(OBJ_VNUM_CRAFTING_SPICE),
                                              { Flag::Crafting::NeedsRefinery });

    return recipe;
}

static void InterpretArgumentsHandler(void *userData, std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: Makespice <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    ud->ItemName = args->CommandArguments;
}

static void MaterialFoundHandler(void *userData, std::shared_ptr<MaterialFoundEventArgs> args)
{
    UserData *ud = (UserData *)userData;

    if(args->Object->ItemType == ITEM_RAWSPICE)
    {
        ud->SpiceType = args->Object->Value[OVAL_RAWSPICE_TYPE];
        ud->SpiceGrade = args->Object->Value[OVAL_RAWSPICE_GRADE];
    }
}

static void SetObjectStatsHandler(void *userData, std::shared_ptr<SetObjectStatsEventArgs> args)
{
    UserData *ud = (UserData *)userData;
    char buf[MAX_STRING_LENGTH];
    auto spice = args->Object;
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    spice->Value[OVAL_SPICE_GRADE] = urange(10, ud->SpiceGrade, (IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_spice_refining])) + 10);

    strcpy(buf, ud->ItemName.c_str());
    strcat(buf, " drug spice ");
    strcat(buf, GetSpiceTypeName(ud->SpiceType));
    spice->Name = buf;

    strcpy(buf, ud->ItemName.c_str());
    spice->ShortDescr = buf;

    strcat(buf, " was foolishly left lying around here.");
    spice->Description = Capitalize(buf);

    spice->ItemType = ITEM_SPICE;
    spice->Value[OVAL_SPICE_TYPE] = ud->SpiceType;
    spice->Value[OVAL_SPICE_GRADE] = ud->SpiceGrade;

    ch->Echo("&GYou finish your work.\r\n");
    Act(AT_PLAIN, "$n finishes $s work.", ch, NULL, NULL, ActTarget::Room);

    spice->Cost = 500;
    spice->Cost += spice->Value[OVAL_SPICE_GRADE] * 10;
    spice->Cost *= 2;
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

static void FreeUserData(struct UserData *ud)
{
    delete ud;
}
