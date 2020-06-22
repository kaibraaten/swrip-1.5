#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"
#include "act.hpp"

class MakeSpice
{
public:
    void InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args);
    void MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args);
    void SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args);

private:
    std::string _itemName;
    int _spiceType = 0;
    int _spiceGrade = 0;
};

static CraftRecipe *MakeCraftRecipe();

void do_makespice(std::shared_ptr<Character> ch, std::string argument)
{
    auto recipe = MakeCraftRecipe();
    auto session = AllocateCraftingSession(recipe, ch, argument);
    auto data = std::make_shared<MakeSpice>();
    session->OnInterpretArguments.Add(data, &MakeSpice::InterpretArguments);
    session->OnMaterialFound.Add(data, &MakeSpice::MaterialFound);
    session->OnSetObjectStats.Add(data, &MakeSpice::SetObjectStats);

    StartCrafting(session);
}

static CraftRecipe *MakeCraftRecipe()
{
    static const CraftingMaterial materials[] =
    {
     { ITEM_RAWSPICE, { Flag::Crafting::Extract } },
     { ITEM_NONE,     {} }
    };
    auto recipe = AllocateCraftRecipe(gsn_spice_refining, materials,
                                      10, GetProtoObject(OBJ_VNUM_CRAFTING_SPICE),
                                      { Flag::Crafting::NeedsRefinery });

    return recipe;
}

void MakeSpice::InterpretArguments(std::shared_ptr<InterpretArgumentsEventArgs> args)
{
    auto ch = GetEngineer(args->CraftingSession);

    if(args->CommandArguments.empty())
    {
        ch->Echo("&RUsage: makespice <name>\r\n&w");
        args->AbortSession = true;
        return;
    }

    _itemName = args->CommandArguments;
}

void MakeSpice::MaterialFound(std::shared_ptr<MaterialFoundEventArgs> args)
{
    if(args->Object->ItemType == ITEM_RAWSPICE)
    {
        _spiceType = args->Object->Value[OVAL_RAWSPICE_TYPE];
        _spiceGrade = args->Object->Value[OVAL_RAWSPICE_GRADE];
    }
}

void MakeSpice::SetObjectStats(std::shared_ptr<SetObjectStatsEventArgs> args)
{
    char buf[MAX_STRING_LENGTH];
    auto spice = args->Object;
    std::shared_ptr<Character> ch = GetEngineer(args->CraftingSession);

    spice->Value[OVAL_SPICE_GRADE] = urange(10, _spiceGrade, (IsNpc(ch) ? ch->TopLevel : (int)(ch->PCData->Learned[gsn_spice_refining])) + 10);

    strcpy(buf, _itemName.c_str());
    strcat(buf, " drug spice ");
    strcat(buf, GetSpiceTypeName(_spiceType));
    spice->Name = buf;

    strcpy(buf, _itemName.c_str());
    spice->ShortDescr = buf;

    strcat(buf, " was foolishly left lying around here.");
    spice->Description = Capitalize(buf);

    spice->ItemType = ITEM_SPICE;
    spice->Value[OVAL_SPICE_TYPE] = _spiceType;
    spice->Value[OVAL_SPICE_GRADE] = _spiceGrade;

    ch->Echo("&GYou finish your work.\r\n");
    Act(AT_PLAIN, "$n finishes $s work.", ch, NULL, NULL, ActTarget::Room);

    spice->Cost = 500;
    spice->Cost += spice->Value[OVAL_SPICE_GRADE] * 10;
    spice->Cost *= 2;
}
