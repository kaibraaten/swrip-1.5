#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeBlaster
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);
private:
    int _ammo = 0;
    bool _scope = false;
    int _power = 0;
    std::string _itemName;
};

void do_makeblaster(std::shared_ptr<Character> ch, std::string argument)
{
    static std::initializer_list<CraftingMaterial> materials =
    {
     { ITEM_TOOLKIT,         {} },
     { ITEM_OVEN,            {} },
     { ITEM_DURAPLAST,       { Flag::Crafting::Extract } },
     { ITEM_BATTERY,         { Flag::Crafting::Extract } },
     { ITEM_SUPERCONDUCTOR,  { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,         { Flag::Crafting::Extract } },
     { ITEM_AMMO,            { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_SCOPE,           { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_LENS,            { Flag::Crafting::Extract, Flag::Crafting::Optional } }
    };
    auto recipe = AllocateCraftRecipe(gsn_makeblaster, materials,
                                      25, GetProtoObject(OBJ_VNUM_CRAFTING_BLASTER),
                                      { Flag::Crafting::NeedsWorkshop });
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeBlaster>();
    session->OnInterpretArguments.Add(data, &MakeBlaster::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeBlaster::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeBlaster::SetObjectStats);

    StartCrafting(session);
}

void MakeBlaster::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makeblaster <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeBlaster::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_AMMO)
    {
        _ammo = args->Object->Value[OVAL_AMMO_CHARGE];
    }

    if(args->Object->ItemType == ITEM_SCOPE)
    {
        _scope = true;
    }

    if(args->Object->ItemType == ITEM_SUPERCONDUCTOR && _power < 2)
    {
        ++_power;
        args->KeepFinding = _power < 2;
    }
}

void MakeBlaster::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    auto blaster = args->Object;

    if(_scope)
    {
        _power = 0;
    }

    blaster->WearFlags.set(Flag::Wear::Wield);
    blaster->WearFlags.set(Flag::Wear::Take);
    blaster->Weight = 2 + blaster->Level / 10;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " blaster");
    blaster->Name = buf;

    strcpy(buf, _itemName.c_str());
    blaster->ShortDescr = buf;

    strcat(buf, " was carelessly misplaced here.");
    blaster->Description = Capitalize(buf);

    auto hitroll = std::make_shared<Affect>();
    hitroll->Type = -1;
    hitroll->Duration = -1;
    hitroll->Location = GetAffectType("hitroll");
    hitroll->Modifier = urange(0, 1 + _scope, blaster->Level / 30);
    blaster->Add(hitroll);
    ++top_affect;

    auto damroll = std::make_shared<Affect>();
    damroll->Type = -1;
    damroll->Duration = -1;
    damroll->Location = GetAffectType("damroll");
    damroll->Modifier = urange(0, _power, blaster->Level / 30);
    blaster->Add(damroll);
    ++top_affect;

    if(_scope == true)
    {
        auto snipe = std::make_shared<Affect>();
        snipe->Type = -1;
        snipe->Duration = -1;
        snipe->Location = GetAffectType("snipe");
        snipe->Modifier = urange(0, 30, blaster->Level / 3);
        blaster->Add(snipe);
    }

    ++top_affect;
    blaster->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
    blaster->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int)(blaster->Level / 10 + 15);
    blaster->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int)(blaster->Level / 5 + 25);
    blaster->Value[OVAL_WEAPON_TYPE] = WEAPON_BLASTER;
    blaster->Value[OVAL_WEAPON_CHARGE] = _ammo;
    blaster->Value[OVAL_WEAPON_MAX_CHARGE] = 2000;

    blaster->Cost = blaster->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
}
