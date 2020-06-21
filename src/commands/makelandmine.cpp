#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

class MakeLandmine
{
public:
    MakeLandmine(int level);
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _strength = 0;
    int _weight = 0;
    int _level = 0;
    std::string _itemName;
};

void do_makelandmine(std::shared_ptr<Character> ch, std::string argument)
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,   {} },
     { ITEM_BATTERY,   { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,   { Flag::Crafting::Extract } },
     { ITEM_DRINK_CON, { Flag::Crafting::Extract } },
     { ITEM_CHEMICAL,  { Flag::Crafting::Extract } },
     { ITEM_NONE,      {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_makelandmine, materials,
                                              25, GetProtoObject(OBJ_VNUM_CRAFTING_LANDMINE),
                                              { Flag::Crafting::NeedsWorkshop });
    CraftingSession *session = AllocateCraftingSession(recipe, ch, argument);
    auto level = IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_makelandmine]);
    auto data = std::make_shared<MakeLandmine>(level);
    session->OnInterpretArguments.Add(data, &MakeLandmine::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeLandmine::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeLandmine::SetObjectStats);

    StartCrafting(session);
}

MakeLandmine::MakeLandmine(int level)
    : _level(level)
{

}

void MakeLandmine::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makelandmine <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeLandmine::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_DRINK_CON
       && args->Object->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] > 0)
    {
        /* FAIL! */
    }

    if(args->Object->ItemType == ITEM_CHEMICAL)
    {
        _strength = urange(10, args->Object->Value[OVAL_CHEMICAL_STRENGTH], _level * 5);
        _weight = args->Object->Weight;
    }
}

void MakeLandmine::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto landmine = args->Object;

    landmine->WearFlags.set(Flag::Wear::Hold);
    landmine->WearFlags.set(Flag::Wear::Take);
    landmine->Weight = _weight;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " landmine");
    landmine->Name = buf;

    strcpy(buf, _itemName.c_str());
    landmine->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    landmine->Description = Capitalize(buf);

    landmine->Value[OVAL_EXPLOSIVE_MIN_DMG] = _strength / 2;
    landmine->Value[OVAL_EXPLOSIVE_MAX_DMG] = _strength;
    landmine->Cost = landmine->Value[OVAL_EXPLOSIVE_MAX_DMG] * 5;
}
