#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
    int Race = 0;
    int Sex = 0;
    std::string Name;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static CraftRecipe *MakeCraftRecipe( void );

void do_makedisguise( Character *ch, std::string argument )
{
    CraftRecipe *recipe = MakeCraftRecipe();
    CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
    UserData *data = new UserData();

    AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
    AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
    AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
    AddAbortCraftingHandler( session, data, AbortHandler );

    StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
    static const CraftingMaterial materials[] =
        {
            { ITEM_THREAD,      {} },
            { ITEM_DIS_FABRIC,  { Flag::Crafting::Extract } },
            { ITEM_HAIR,        { Flag::Crafting::Extract } },
            { ITEM_NONE,        {} }
        };
    CraftRecipe *recipe = AllocateCraftRecipe( gsn_disguise, materials,
                                               25, GetProtoObject( OBJ_VNUM_CRAFTING_DISGUISE ),
                                               { Flag::Crafting::NeedsWorkshop } );

    return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    Character *ch = GetEngineer( args->CraftingSession );
    std::string argument = args->CommandArguments;
    std::string sex;
    std::string race;

    argument = OneArgument( argument, sex );
    argument = OneArgument( argument, race );

    if ( argument.empty() || sex.empty() || race.empty() )
    {
        ch->Echo("&RUsage: Makedisguise <sex> <race> <name>\r\n&w" );
        args->AbortSession = true;
        return;
    }

    ud->Sex = GetSex( sex );

    if(ud->Sex == -1)
    {
        ch->Echo("Sex must be male, female or neutral.&w\r\n" );
        args->AbortSession = true;
        return;
    }

    ud->Race = GetRaceFromName( race );

    if( ud->Race < 0 )
    {
        ch->Echo("&R'%s' is not a valid race.&w\r\n", race.c_str() );
        args->AbortSession = true;
        return;
    }

    ud->Name = argument;
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
    struct UserData *ud = (struct UserData*) userData;
    char buf[MAX_STRING_LENGTH];
    Object *disguise = args->Object;

    disguise->WearFlags.set(Flag::Wear::Disguise);
    disguise->WearFlags.set(Flag::Wear::Take);

    strcpy( buf, ud->Name.c_str() );
    strcat( buf, " disguise");
    disguise->Name = buf;

    strcpy( buf, ud->Name.c_str() );
    disguise->ShortDescr = buf;

    disguise->Description.erase();

    disguise->Value[OVAL_DISGUISE_MAX_CONDITION] = INIT_WEAPON_CONDITION;
    disguise->Value[OVAL_DISGUISE_CONDITION] = INIT_WEAPON_CONDITION;
    disguise->Value[OVAL_DISGUISE_RACE] = ud->Race;
    disguise->Value[OVAL_DISGUISE_SEX] = ud->Sex;
    disguise->Cost = 5000;
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
