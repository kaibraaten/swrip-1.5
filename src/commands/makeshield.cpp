#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  std::string ItemName;
  int Charge = 0;
  int GemType = 0;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );

void do_makeshield( Character *ch, std::string argument )
{
  CraftRecipe *recipe = MakeCraftRecipe();
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

static CraftRecipe *MakeCraftRecipe( void )
{
  static const CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,         {} },
     { ITEM_BATTERY,         { Flag::Crafting::Extract } },
     { ITEM_SUPERCONDUCTOR,  { Flag::Crafting::Extract } },
     { ITEM_CIRCUIT,         { Flag::Crafting::Extract } },
     { ITEM_CRYSTAL,         { Flag::Crafting::Extract } },
     { ITEM_NONE,            {} }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeshield, materials,
					     20, GetProtoObject( OBJ_VNUM_CRAFTING_SHIELD ),
					     { Flag::Crafting::NeedsWorkshop } );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );

  if ( args->CommandArguments.empty() )
    {
      ch->Echo("&RUsage: Makeshield <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = args->CommandArguments;
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{

}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_BATTERY )
    {
      ud->Charge = umin(args->Object->Value[OVAL_BATTERY_CHARGE], 10);
    }

  if( args->Object->ItemType == ITEM_CRYSTAL )
    {
      ud->GemType = args->Object->Value[OVAL_CRYSTAL_TYPE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Object *shield = args->Object;

  shield->ItemType = ITEM_ARMOR;
  SetBit( shield->WearFlags, ITEM_WIELD );
  SetBit( shield->WearFlags, ITEM_WEAR_SHIELD );
  shield->Weight = 2;

  shield->Name = ud->ItemName + " energy shield";
  shield->ShortDescr = ud->ItemName;
  shield->Description = Capitalize( ud->ItemName ) + " was carelessly misplaced here.";

  shield->Value[OVAL_ARMOR_CONDITION] = (int) (shield->Level / 10 + ud->GemType * 2);
  shield->Value[OVAL_ARMOR_AC] = (int) (shield->Level / 10 + ud->GemType * 2);
  shield->Value[OVAL_ARMOR_SHIELD_CHARGE] = ud->Charge;
  shield->Value[OVAL_ARMOR_SHIELD_MAX_CHARGE] = ud->Charge;
  shield->Cost = shield->Value[OVAL_ARMOR_AC] * 100;
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
