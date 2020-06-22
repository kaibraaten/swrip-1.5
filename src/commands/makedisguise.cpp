#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

class MakeDisguise
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    int _race = 0;
    int _sex = 0;
    std::string _name;
};

static CraftRecipe *MakeCraftRecipe();

void do_makedisguise(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = MakeCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeDisguise>();
    session->OnInterpretArguments.Add(data, &MakeDisguise::InterpretArguments);
    session->OnSetObjectStats.Add(data, &MakeDisguise::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
        { ITEM_THREAD,      {} },
        { ITEM_DIS_FABRIC,  { Flag::Crafting::Extract } },
        { ITEM_HAIR,        { Flag::Crafting::Extract } },
        { ITEM_NONE,        {} }
    };
    CraftRecipe *recipe = AllocateCraftRecipe(gsn_disguise, materials,
                                              25, GetProtoObject(OBJ_VNUM_CRAFTING_DISGUISE),
                                              { Flag::Crafting::NeedsWorkshop });

    return recipe;
}

void MakeDisguise::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);
    std::string argument = args->CommandArguments;
    std::string sex;
    std::string race;

    argument = OneArgument(argument, sex);
    argument = OneArgument(argument, race);

    if(argument.empty() || sex.empty() || race.empty())
    {
        ch->Echo("&RUsage: makedisguise <sex> <race> <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _sex = GetSex(sex);

    if(_sex == -1)
    {
        ch->Echo("Sex must be male, female or neutral.&w\r\n");
        args->AbortSession = true;
        return;
    }

    _race = GetRaceFromName(race);

    if(_race < 0)
    {
        ch->Echo("&R'%s' is not a valid race.&w\r\n", race.c_str());
        args->AbortSession = true;
        return;
    }

    _name = argument;
}

void MakeDisguise::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto disguise = args->Object;

    disguise->WearFlags.set(Flag::Wear::Disguise);
    disguise->WearFlags.set(Flag::Wear::Take);

    strcpy(buf, _name.c_str());
    strcat(buf, " disguise");
    disguise->Name = buf;

    strcpy(buf, _name.c_str());
    disguise->ShortDescr = buf;

    disguise->Description.erase();

    disguise->Value[OVAL_DISGUISE_MAX_CONDITION] = INIT_WEAPON_CONDITION;
    disguise->Value[OVAL_DISGUISE_CONDITION] = INIT_WEAPON_CONDITION;
    disguise->Value[OVAL_DISGUISE_RACE] = _race;
    disguise->Value[OVAL_DISGUISE_SEX] = _sex;
    disguise->Cost = 5000;
}
