#include <cstring>
#include <utility/utility.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
    int ArmorValue = 0;
    int WearLocation = 0;
    std::string ItemName;
};

static CraftRecipe *CreateMakeArmorRecipe( void );
static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makearmor( Character *ch, std::string argument )
{
    CraftRecipe *recipe = CreateMakeArmorRecipe();
    CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
    UserData *data = new UserData();

    AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
    AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
    AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
    AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
    AddAbortCraftingHandler( session, data, AbortHandler );

    StartCrafting( session );
}

static CraftRecipe *CreateMakeArmorRecipe( void )
{
    static const CraftingMaterial materials[] =
        {
            { ITEM_THREAD, {} },
            { ITEM_FABRIC, { Flag::Crafting::Extract } },
            { ITEM_NONE, {} }
        };
    CraftRecipe *recipe = AllocateCraftRecipe( gsn_makearmor, materials,
                                               15, GetProtoObject( OBJ_VNUM_CRAFTING_ARMOR ),
                                               { Flag::Crafting::NeedsWorkshop } );

    return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *eventArgs )
{
    struct UserData *ud = (struct UserData*) userData;
    CraftingSession *session = eventArgs->CraftingSession;
    std::string argument = eventArgs->CommandArguments;
    std::string wearLoc;
    Character *ch = GetEngineer( session );

    argument = OneArgument( argument, wearLoc );
    std::string name = argument;

    if( name.empty() )
    {
        ch->Echo("&RUsage: Makearmor <wearloc> <name>\r\n&w");
        eventArgs->AbortSession = true;
        return;
    }

    ud->WearLocation = GetWearFlag( wearLoc );

    if( ud->WearLocation == -1 )
    {
        ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str() );
        eventArgs->AbortSession = true;
        return;
    }

    if ( !CanUseWearLocation( ud->WearLocation ) )
    {
        ch->Echo("&RYou cannot make clothing for that body part.\r\n&w" );
        eventArgs->AbortSession = true;
        return;
    }

    ud->ItemName = name;
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *eventArgs )
{
    if( eventArgs->Object->ItemType == ITEM_FABRIC )
    {
        struct UserData *ud = (struct UserData*) userData;
        ud->ArmorValue = eventArgs->Object->Value[OVAL_FABRIC_STRENGTH];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *eventArgs )
{
    struct UserData *ud = (struct UserData*) userData;
    Object *armor = eventArgs->Object;

    armor->ItemType = ITEM_ARMOR;
    armor->WearFlags.set(Flag::Wear::Take);
    armor->WearFlags.set(ud->WearLocation);

    armor->Name = ud->ItemName;
    armor->ShortDescr = ud->ItemName;

    armor->Description = FormatString( "%s was dropped here.", Capitalize( ud->ItemName ).c_str() );

    armor->Value[OVAL_ARMOR_CONDITION] = armor->Value[OVAL_ARMOR_AC] = ud->ArmorValue;
    armor->Cost *= 10;
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

static bool CanUseWearLocation( int wearLocation )
{
    return wearLocation == Flag::Wear::Body
        || wearLocation == Flag::Wear::Head
        || wearLocation == Flag::Wear::Legs
        || wearLocation == Flag::Wear::Feet
        || wearLocation == Flag::Wear::Arms
        || wearLocation == Flag::Wear::About
        || wearLocation == Flag::Wear::Waist
        || wearLocation == Flag::Wear::Over;
}
