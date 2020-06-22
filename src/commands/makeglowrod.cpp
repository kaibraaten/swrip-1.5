#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeGlowrod
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _charge = 0;
};

static std::shared_ptr<CraftRecipe> MakeCraftRecipe();

void do_makeglowrod(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = MakeCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);

    auto data = std::make_shared<MakeGlowrod>();
    session->OnInterpretArguments.Add(data, &MakeGlowrod::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeGlowrod::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeGlowrod::SetObjectStats);

    StartCrafting(session);
}

static std::shared_ptr<CraftRecipe> MakeCraftRecipe()
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
    auto recipe = AllocateCraftRecipe(gsn_makeglowrod, materials,
                                      10, GetProtoObject(OBJ_VNUM_CRAFTING_GLOWROD),
                                      { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeGlowrod::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makeglowrod <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeGlowrod::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_BATTERY)
    {
        _charge = args->Object->Value[OVAL_BATTERY_CHARGE];
    }
}

void MakeGlowrod::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto glowrod = args->Object;

    glowrod->ItemType = ITEM_LIGHT;
    glowrod->WearFlags.set(Flag::Wear::Take);
    glowrod->Weight = 3;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " glowrod");
    glowrod->Name = buf;

    strcpy(buf, _itemName.c_str());
    glowrod->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    glowrod->Description = Capitalize(buf);

    glowrod->Value[OVAL_LIGHT_POWER] = _charge;
    glowrod->Cost = glowrod->Value[OVAL_LIGHT_POWER];
}
