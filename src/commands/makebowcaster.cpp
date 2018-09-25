#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int Ammo = 0;
  int Tinder = 0;
  int Lenses = 0;
  std::string ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *CreateMakeBowcasterCraftRecipe();
static void FreeUserData( UserData *ud );

void do_makebowcaster( Character *ch, std::string argument )
{
  CraftRecipe *recipe = CreateMakeBowcasterCraftRecipe();
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
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makebowcaster, materials,
					     25, GetProtoObject( OBJ_VNUM_CRAFTING_BOWCASTER ),
					     { Flag::Crafting::NeedsWorkshop } );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );
  UserData *ud = static_cast<UserData*>( userData );

  if ( args->CommandArguments.empty() )
    {
      ch->Echo("&RUsage: Makebowcaster <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = args->CommandArguments;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if( ch->Race != RACE_WOOKIEE && !IsImmortal( ch ) )
    {
      ch->Echo("&ROnly wookiees have the knowledge to craft bowcasters.\r\n&w" );
      args->AbortSession = true;
    }
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_BOLT )
    {
      ud->Ammo = args->Object->Value[OVAL_BOLT_CHARGE];
    }

  if( args->Object->ItemType == ITEM_LENS && ud->Lenses < 2 )
    {
      ++ud->Lenses;
      args->KeepFinding = ud->Lenses < 2;
    }

  if( args->Object->ItemType == ITEM_TINDER && ud->Tinder < 4 )
    {
      ++ud->Tinder;
      args->KeepFinding = ud->Tinder < 4;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  UserData *ud = static_cast<UserData*>(userData);
  char buf[MAX_STRING_LENGTH];
  Object *obj = args->Object;

  obj->ItemType = ITEM_WEAPON;
  SetBit( obj->WearFlags, ITEM_WIELD );
  SetBit( obj->WearFlags, ITEM_TAKE );
  obj->Weight = 2 + obj->Level / 7;

  strcpy( buf, ud->ItemName.c_str() );
  strcat( buf, " bowcaster");
  obj->Name = buf;

  strcpy( buf, ud->ItemName.c_str() );
  obj->ShortDescr = buf;

  strcat( buf, " was carefully placed here." );
  obj->Description = Capitalize( buf );

  Affect *hitroll = new Affect();
  hitroll->Type      = -1;
  hitroll->Duration  = -1;
  hitroll->Location  = GetAffectType( "hitroll" );
  hitroll->Modifier  = urange( 0, 1 + ud->Lenses, obj->Level / 30 );
  obj->Add(hitroll);
  ++top_affect;

  Affect *damroll = new Affect();
  damroll->Type      = -1;
  damroll->Duration  = -1;
  damroll->Location  = GetAffectType( "damroll" );
  damroll->Modifier  = urange( 0, ud->Tinder, obj->Level / 30);
  obj->Add(damroll);
  ++top_affect;

  obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (obj->Level / 10 + 25);
  obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (obj->Level / 5 + 25);
  obj->Value[OVAL_WEAPON_TYPE] = WEAPON_BOWCASTER;
  obj->Value[OVAL_WEAPON_CHARGE] = ud->Ammo;
  obj->Value[OVAL_WEAPON_MAX_CHARGE] = 250;
  obj->Cost = obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
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
