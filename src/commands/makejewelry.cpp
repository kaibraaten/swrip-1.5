#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
    std::string ItemName;
    int WearLocation = 0;
    long Cost = 0;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );
static bool CanUseWearLocation( int wearLocation );

void do_makejewelry( std::shared_ptr<Character> ch, std::string argument )
{
    UserData *data = new UserData();
    CraftRecipe *recipe = MakeCraftRecipe();
    CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

    AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
    AddCheckRequirementsCraftingHandler( session, data, CheckRequirementsHandler );
    AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
    AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
    AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
    AddAbortCraftingHandler( session, data, AbortHandler );

    StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
    static const CraftingMaterial materials[] =
        {
            { ITEM_TOOLKIT,     {} },
            { ITEM_OVEN,        {} },
            { ITEM_RARE_METAL,  { Flag::Crafting::Extract } },
            { ITEM_CRYSTAL,     { Flag::Crafting::Extract, Flag::Crafting::Optional } },
            { ITEM_NONE,        {} }
        };
    CraftRecipe *recipe = AllocateCraftRecipe( gsn_makejewelry, materials,
                                               15, GetProtoObject( OBJ_VNUM_CRAFTING_ARMOR ),
                                               { Flag::Crafting::NeedsWorkshop } );

    return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    std::shared_ptr<Character> ch = GetEngineer( args->CraftingSession );
    std::string argument = args->CommandArguments;
    std::string wearLoc;
    std::string name;

    argument = OneArgument( argument, wearLoc );
    name = argument;

    if ( name.empty() )
    {
        ch->Echo("&RUsage: Makejewelry <wearloc> <name>\r\n&w" );
        args->AbortSession = true;
        return;
    }

    ud->WearLocation = GetWearFlag( wearLoc );

    if( ud->WearLocation == -1 )
    {
        ch->Echo("&R'%s' is not a wear location.&w\r\n", wearLoc.c_str() );
        args->AbortSession = true;
        return;
    }

    if ( !CanUseWearLocation( ud->WearLocation ) )
    {
        ch->Echo("&RYou cannot make jewelry for that body part.\r\n&w" );
        args->AbortSession = true;
        return;
    }

    ud->ItemName = name;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{

}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;

    if( args->Object->ItemType == ITEM_RARE_METAL )
    {
        ud->Cost += args->Object->Cost;
    }

    if( args->Object->ItemType == ITEM_CRYSTAL )
    {
        ud->Cost += args->Object->Cost;
        args->KeepFinding = true;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    char buf[MAX_STRING_LENGTH];
    auto obj = args->Object;

    obj->WearFlags.set(Flag::Wear::Take);
    obj->WearFlags.set(ud->WearLocation);

    strcpy( buf, ud->ItemName.c_str() );
    obj->Name = buf;

    strcpy( buf, ud->ItemName.c_str() );
    obj->ShortDescr = buf;

    strcat( buf, " was dropped here." );
    obj->Description = Capitalize( buf );

    obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];

    obj->Cost += ud->Cost;
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
    return wearLocation == Flag::Wear::Finger
        || wearLocation == Flag::Wear::Neck
        || wearLocation == Flag::Wear::Head
        || wearLocation == Flag::Wear::Wrist
        || wearLocation == Flag::Wear::Ears;
}
