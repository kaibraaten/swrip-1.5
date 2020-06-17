#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "object.hpp"
#include "repos/homerepository.hpp"

#define MAX_NUMBER_OF_CRYSTALS 3

struct UserData
{
    std::string ItemName;
    int GemType = 0;
    int GemCount = 0;
    int Charge = 0;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makelightsaber( Character *ch, std::string argument )
{
    static const CraftingMaterial materials[] =
        {
            { ITEM_TOOLKIT,        {} },
            { ITEM_OVEN,           {} },
            { ITEM_LENS,           { Flag::Crafting::Extract } },
            { ITEM_CRYSTAL,        { Flag::Crafting::Extract } },
            { ITEM_MIRROR,         { Flag::Crafting::Extract } },
            { ITEM_DURAPLAST,      { Flag::Crafting::Extract } },
            { ITEM_BATTERY,        { Flag::Crafting::Extract } },
            { ITEM_CIRCUIT,        { Flag::Crafting::Extract } },
            { ITEM_SUPERCONDUCTOR, { Flag::Crafting::Extract } },
            { ITEM_NONE,           {} }
        };
    CraftRecipe *recipe = AllocateCraftRecipe( gsn_lightsaber_crafting, materials,
                                               25, GetProtoObject( OBJ_VNUM_CRAFTING_LIGHTSABER ),
                                               {} );
    CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
    UserData *data = new UserData();

    AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
    AddCheckRequirementsCraftingHandler( session, data, CheckRequirementsHandler );
    AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
    AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
    AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
    AddAbortCraftingHandler( session, data, AbortHandler );

    StartCrafting( session );
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
    Character *ch = GetEngineer( eventArgs->CraftingSession );
    struct UserData *ud = (struct UserData*) userData;

    if ( eventArgs->CommandArguments.empty() )
    {
        ch->Echo("&RUsage: Makelightsaber <name>\r\n&w" );
        eventArgs->AbortSession = true;
        return;
    }

    ud->ItemName = eventArgs->CommandArguments;
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
    struct UserData *ud = (struct UserData*) userData;

    if( eventArgs->Object->ItemType == ITEM_BATTERY )
    {
        ud->Charge = umax( eventArgs->Object->Value[OVAL_BATTERY_CHARGE], 10 );
    }

    if( eventArgs->Object->ItemType == ITEM_CRYSTAL
        && ud->GemCount < MAX_NUMBER_OF_CRYSTALS )
    {
        ++ud->GemCount;
        eventArgs->KeepFinding = ud->GemCount < MAX_NUMBER_OF_CRYSTALS;

        if( ud->GemType < eventArgs->Object->Value[OVAL_CRYSTAL_TYPE] )
        {
            ud->GemType = eventArgs->Object->Value[OVAL_CRYSTAL_TYPE];
        }
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
    struct UserData *ud = (struct UserData*) userData;
    auto lightsaber = eventArgs->Object;
    char buf[MAX_STRING_LENGTH];

    lightsaber->WearFlags.set(Flag::Wear::Wield);
    lightsaber->WearFlags.set(Flag::Wear::Take);

    lightsaber->Weight = 5;

    lightsaber->Name = "lightsaber saber";

    strcpy( buf, ud->ItemName.c_str() );
    lightsaber->ShortDescr = buf;

    sprintf( buf, "%s was carelessly misplaced here.",
             Capitalize( ud->ItemName ).c_str() );
    lightsaber->Description = buf;

    strcpy( buf, ud->ItemName.c_str() );
    strcat( buf, " ignites with a hum and a soft glow." );
    lightsaber->ActionDescription = buf;

    auto hitroll = std::make_shared<Affect>();
    hitroll->Type               = -1;
    hitroll->Duration           = -1;
    hitroll->Location           = GetAffectType( "hitroll" );
    hitroll->Modifier           = urange( 0, ud->GemCount, lightsaber->Level / 30 );
    lightsaber->Add(hitroll);
    ++top_affect;

    auto parry = std::make_shared<Affect>();
    parry->Type               = -1;
    parry->Duration           = -1;
    parry->Location           = GetAffectType( "parry" );
    parry->Modifier           = lightsaber->Level / 3;
    lightsaber->Add(parry);
    ++top_affect;

    lightsaber->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
    lightsaber->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (lightsaber->Level / 10 + ud->GemType * 2);
    lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (lightsaber->Level / 5 + ud->GemType * 6);
    lightsaber->Value[OVAL_WEAPON_TYPE] = WEAPON_LIGHTSABER;
    lightsaber->Value[OVAL_WEAPON_CHARGE] = ud->Charge;
    lightsaber->Value[OVAL_WEAPON_MAX_CHARGE] = ud->Charge;
    lightsaber->Cost = lightsaber->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 75;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    FreeUserData( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    FreeUserData( ud );
}

static void FreeUserData( struct UserData *ud )
{
    delete ud;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *eventArgs )
{
    Character *ch = GetEngineer( eventArgs->CraftingSession );

    // You can craft a lightsaber in your home even without the safe
    // and silence flags.
    if (!((CheckRoomFlag(ch->InRoom, Flag::Room::Safe)
           && CheckRoomFlag(ch->InRoom, Flag::Room::Silence))
          || Homes->FindByVnum(ch->InRoom->Vnum) != nullptr))
    {
        ch->Echo("&RYou need to be in a quiet, peaceful place to craft a lightsaber.&w\r\n" );
        eventArgs->AbortSession = true;
        return;
    }
}
