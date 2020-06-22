#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct MakeBowcaster
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void CheckRequirements(std::shared_ptr<CheckRequirementsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _ammo = 0;
    int _tinder = 0;
    int _lenses = 0;
    std::string _itemName;
};

static CraftRecipe *CreateMakeBowcasterCraftRecipe();

void do_makebowcaster(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = CreateMakeBowcasterCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeBowcaster>();
    session->OnInterpretArguments.Add(data, &MakeBowcaster::InterpretArguments);
    session->OnCheckRequirements.Add(data, &MakeBowcaster::CheckRequirements);
    session->OnMaterialFound.Add(data, &MakeBowcaster::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeBowcaster::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *CreateMakeBowcasterCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,    {} },
     { ITEM_OVEN,       {} },
     { ITEM_DURAPLAST,  { Flag::Crafting::Extract } },
     { ITEM_OIL,        { Flag::Crafting::Extract } },
     { ITEM_TINDER,     { Flag::Crafting::Extract } },
     { ITEM_CROSSBOW,   { Flag::Crafting::Extract } },
     { ITEM_LENS,       { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_BOLT,       { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_NONE,       {} }
    };
    auto recipe = AllocateCraftRecipe(gsn_makebowcaster, materials,
                                      25, GetProtoObject(OBJ_VNUM_CRAFTING_BOWCASTER),
                                      { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeBowcaster::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makebowcaster <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeBowcaster::CheckRequirements(std::shared_ptr<CheckRequirementsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    if(ch->Race != RACE_WOOKIEE && !IsImmortal(ch))
    {
        ch->Echo("&ROnly wookiees have the knowledge to craft bowcasters.\r\n&w");
        args->AbortSession = true;
    }
}

void MakeBowcaster::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_BOLT)
    {
        _ammo = args->Object->Value[OVAL_BOLT_CHARGE];
    }

    if(args->Object->ItemType == ITEM_LENS && _lenses < 2)
    {
        ++_lenses;
        args->KeepFinding = _lenses < 2;
    }

    if(args->Object->ItemType == ITEM_TINDER && _tinder < 4)
    {
        ++_tinder;
        args->KeepFinding = _tinder < 4;
    }
}

void MakeBowcaster::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto obj = args->Object;

    obj->ItemType = ITEM_WEAPON;
    obj->WearFlags.set(Flag::Wear::Wield);
    obj->WearFlags.set(Flag::Wear::Take);
    obj->Weight = 2 + obj->Level / 7;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " bowcaster");
    obj->Name = buf;

    strcpy(buf, _itemName.c_str());
    obj->ShortDescr = buf;

    strcat(buf, " was carefully placed here.");
    obj->Description = Capitalize(buf);

    auto hitroll = std::make_shared<Affect>();
    hitroll->Type = -1;
    hitroll->Duration = -1;
    hitroll->Location = GetAffectType("hitroll");
    hitroll->Modifier = urange(0, 1 + _lenses, obj->Level / 30);
    obj->Add(hitroll);
    ++top_affect;

    auto damroll = std::shared_ptr<Affect>();
    damroll->Type = -1;
    damroll->Duration = -1;
    damroll->Location = GetAffectType("damroll");
    damroll->Modifier = urange(0, _tinder, obj->Level / 30);
    obj->Add(damroll);
    ++top_affect;

    obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
    obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int)(obj->Level / 10 + 25);
    obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int)(obj->Level / 5 + 25);
    obj->Value[OVAL_WEAPON_TYPE] = WEAPON_BOWCASTER;
    obj->Value[OVAL_WEAPON_CHARGE] = _ammo;
    obj->Value[OVAL_WEAPON_MAX_CHARGE] = 250;
    obj->Cost = obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
}
