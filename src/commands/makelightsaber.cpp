#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "object.hpp"
#include "repos/homerepository.hpp"

#define MAX_NUMBER_OF_CRYSTALS 3

class MakeLightsaber
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void CheckRequirements(std::shared_ptr<CheckRequirementsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _gemType = 0;
    int _gemCount = 0;
    int _charge = 0;
};

void do_makelightsaber(std::shared_ptr<Character> ch, std::string argument)
{
    static std::initializer_list<CraftingMaterial> materials =
    {
        { ITEM_TOOLKIT,        {} },
        { ITEM_OVEN,           {} },
        { ITEM_LENS,           { Flag::Crafting::Extract } },
        { ITEM_CRYSTAL,        { Flag::Crafting::Extract } },
        { ITEM_MIRROR,         { Flag::Crafting::Extract } },
        { ITEM_DURAPLAST,      { Flag::Crafting::Extract } },
        { ITEM_BATTERY,        { Flag::Crafting::Extract } },
        { ITEM_CIRCUIT,        { Flag::Crafting::Extract } },
        { ITEM_SUPERCONDUCTOR, { Flag::Crafting::Extract } }
    };
    auto recipe = AllocateCraftRecipe(gsn_lightsaber_crafting, materials,
                                      25, GetProtoObject(OBJ_VNUM_CRAFTING_LIGHTSABER),
                                      {});
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeLightsaber>();
    session->OnInterpretArguments.Add(data, &MakeLightsaber::InterpretArguments);
    session->OnCheckRequirements.Add(data, &MakeLightsaber::CheckRequirements);
    session->OnMaterialFound.Add(data, &MakeLightsaber::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeLightsaber::SetObjectStats);

    StartCrafting(session);
}

void MakeLightsaber::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> eventArgs)
{
    auto ch = GetEngineer(eventArgs->CraftingSession);

    if(eventArgs->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makelightsaber <name>\r\n&w");
        eventArgs->AbortSession = true;
        return;
    }

    _itemName = eventArgs->CommandArguments;
}

void MakeLightsaber::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> eventArgs)
{
    if(eventArgs->Object->ItemType == ITEM_BATTERY)
    {
        _charge = umax(eventArgs->Object->Value[OVAL_BATTERY_CHARGE], 10);
    }

    if(eventArgs->Object->ItemType == ITEM_CRYSTAL
       && _gemCount < MAX_NUMBER_OF_CRYSTALS)
    {
        ++_gemCount;
        eventArgs->KeepFinding = _gemCount < MAX_NUMBER_OF_CRYSTALS;

        if(_gemType < eventArgs->Object->Value[OVAL_CRYSTAL_TYPE])
        {
            _gemType = eventArgs->Object->Value[OVAL_CRYSTAL_TYPE];
        }
    }
}

void MakeLightsaber::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> eventArgs)
{
    auto lightsaber = eventArgs->Object;
    char buf[MAX_STRING_LENGTH];

    lightsaber->WearFlags.set(Flag::Wear::Wield);
    lightsaber->WearFlags.set(Flag::Wear::Take);

    lightsaber->Weight = 5;

    lightsaber->Name = "lightsaber saber";

    strcpy(buf, _itemName.c_str());
    lightsaber->ShortDescr = buf;

    sprintf(buf, "%s was carelessly misplaced here.",
            Capitalize(_itemName).c_str());
    lightsaber->Description = buf;

    strcpy(buf, _itemName.c_str());
    strcat(buf, " ignites with a hum and a soft glow.");
    lightsaber->ActionDescription = buf;

    auto hitroll = std::make_shared<Affect>();
    hitroll->Type = -1;
    hitroll->Duration = -1;
    hitroll->Location = GetAffectType("hitroll");
    hitroll->Modifier = urange(0, _gemCount, lightsaber->Level / 30);
    lightsaber->Add(hitroll);
    ++top_affect;

    auto parry = std::make_shared<Affect>();
    parry->Type = -1;
    parry->Duration = -1;
    parry->Location = GetAffectType("parry");
    parry->Modifier = lightsaber->Level / 3;
    lightsaber->Add(parry);
    ++top_affect;

    lightsaber->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
    lightsaber->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int)(lightsaber->Level / 10 + _gemType * 2);
    lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int)(lightsaber->Level / 5 + _gemType * 6);
    lightsaber->Value[OVAL_WEAPON_TYPE] = WEAPON_LIGHTSABER;
    lightsaber->Value[OVAL_WEAPON_CHARGE] = _charge;
    lightsaber->Value[OVAL_WEAPON_MAX_CHARGE] = _charge;
    lightsaber->Cost = lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 75;
}

void MakeLightsaber::CheckRequirements(std::shared_ptr<CheckRequirementsEventArgs> eventArgs)
{
    auto ch = GetEngineer(eventArgs->CraftingSession);

    // You can craft a lightsaber in your home even without the safe
    // and silence flags.
    if(!((CheckRoomFlag(ch->InRoom, Flag::Room::Safe)
          && CheckRoomFlag(ch->InRoom, Flag::Room::Silence))
         || Homes->FindByVnum(ch->InRoom->Vnum) != nullptr))
    {
        ch->Echo("&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n");
        eventArgs->AbortSession = true;
        return;
    }
}
