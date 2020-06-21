#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeShield
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _charge = 0;
    int _gemType = 0;
};

static CraftRecipe *MakeCraftRecipe();

void do_makeshield(std::shared_ptr<Character> ch, std::string argument)
{
    CraftRecipe *recipe = MakeCraftRecipe();
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeShield>();
    session->OnInterpretArguments.Add(data, &MakeShield::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeShield::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeShield::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,         {} },
     { ITEM_BATTERY,         { Flag::Crafting::Extract } },
     { ITEM_SUPERCONDUCTOR,  { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,         { Flag::Crafting::Extract } },
     { ITEM_CRYSTAL,         { Flag::Crafting::Extract } },
     { ITEM_NONE,            {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makeshield, materials,
                                              20, GetProtoObject(OBJ_VNUM_CRAFTING_SHIELD),
                                              { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeShield::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makeshield <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeShield::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_BATTERY)
    {
        _charge = umin(args->Object->Value[OVAL_BATTERY_CHARGE], 10);
    }

    if(args->Object->ItemType == ITEM_CRYSTAL)
    {
       _gemType = args->Object->Value[OVAL_CRYSTAL_TYPE];
    }
}

void MakeShield::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    auto shield = args->Object;

    shield->ItemType = ITEM_ARMOR;
    shield->WearFlags.set(Flag::Wear::Wield);
    shield->WearFlags.set(Flag::Wear::Shield);
    shield->Weight = 2;

    shield->Name = _itemName + " energy shield";
    shield->ShortDescr = _itemName;
    shield->Description = Capitalize(_itemName) + " was carelessly misplaced here.";

    shield->Value[OVAL_ARMOR_CONDITION] = (int)(shield->Level / 10 + _gemType * 2);
    shield->Value[OVAL_ARMOR_AC] = (int)(shield->Level / 10 + _gemType * 2);
    shield->Value[OVAL_ARMOR_SHIELD_CHARGE] = _charge;
    shield->Value[OVAL_ARMOR_SHIELD_MAX_CHARGE] = _charge;
    shield->Cost = shield->Value[OVAL_ARMOR_AC] * 100;
}
