#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

class MakeGrenade
{
public:
    MakeGrenade(int level);
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _strength = 0;
    int _weight = 0;
    int _level = 0;
    std::string _itemName;
};

void do_makegrenade(std::shared_ptr<Character> ch, std::string argument)
{
    static std::initializer_list<CraftingMaterial> materials =
    {
     { ITEM_TOOLKIT,         {} },
     { ITEM_BATTERY,         { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,         { Flag::Crafting::Extract } },
     { ITEM_DRINK_CON,       { Flag::Crafting::Extract } },
     { ITEM_CHEMICAL,        { Flag::Crafting::Extract } }
    };
    auto recipe = AllocateCraftRecipe(gsn_makegrenade, materials,
                                      25, GetProtoObject(OBJ_VNUM_CRAFTING_GRENADE),
                                      { Flag::Crafting::NeedsWorkshop });
    auto session = AllocateCraftingSession(recipe, ch, argument);

    int level = GetSkillLevel(ch, gsn_makegrenade);
    auto data = std::make_shared<MakeGrenade>(level);
    session->OnInterpretArguments.Add(data, &MakeGrenade::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeGrenade::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeGrenade::SetObjectStats);

    StartCrafting(session);
}

MakeGrenade::MakeGrenade(int level)
    : _level(level)
{

}

void MakeGrenade::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makegrenade <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeGrenade::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
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

void MakeGrenade::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto grenade = args->Object;

    grenade->WearFlags.set(Flag::Wear::Hold);
    grenade->WearFlags.set(Flag::Wear::Take);
    grenade->Weight = _weight;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " grenade");
    grenade->Name = buf;

    strcpy(buf, _itemName.c_str());
    grenade->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    grenade->Description = Capitalize(buf);

    grenade->Value[OVAL_EXPLOSIVE_MIN_DMG] = _strength / 2;
    grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] = _strength;
    grenade->Cost = grenade->Value[OVAL_EXPLOSIVE_MAX_DMG] * 5;
}
