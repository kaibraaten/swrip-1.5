#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"
#include "skill.h"

struct UserData
{
  char *ItemName;
  int Charge;
  int GemType;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );

void do_makeshield( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );

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
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,         CRAFTFLAG_NONE },
      { ITEM_BATTERY,         CRAFTFLAG_EXTRACT },
      { ITEM_SUPERCONDUCTOR,  CRAFTFLAG_EXTRACT },
      { ITEM_CIRCUIT,         CRAFTFLAG_EXTRACT },
      { ITEM_CRYSTAL,         CRAFTFLAG_EXTRACT },
      { ITEM_NONE,            CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeshield, materials,
					     20, OBJ_VNUM_CRAFTING_SHIELD,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );

  if ( args->CommandArguments[0] == '\0' )
    {
      Echo( ch, "&RUsage: Makeshield <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{

}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->item_type == ITEM_BATTERY )
    {
      ud->Charge = umin(args->Object->value[OVAL_BATTERY_CHARGE], 10);
    }

  if( args->Object->item_type == ITEM_CRYSTAL )
    {
      ud->GemType = args->Object->value[OVAL_CRYSTAL_TYPE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *shield = args->Object;

  shield->item_type = ITEM_ARMOR;
  SetBit( shield->wear_flags, ITEM_WIELD );
  SetBit( shield->wear_flags, ITEM_WEAR_SHIELD );
  shield->weight = 2;

  FreeMemory( shield->name );
  shield->name = CopyString( "energy shield" );

  strcpy( buf, ud->ItemName );
  FreeMemory( shield->short_descr );
  shield->short_descr = CopyString( buf );

  FreeMemory( shield->description );
  strcat( buf, " was carelessly misplaced here." );
  shield->description = CopyString( Capitalize( buf ) );

  shield->value[OVAL_ARMOR_CONDITION] = (int) (shield->level / 10 + ud->GemType * 2);
  shield->value[OVAL_ARMOR_AC] = (int) (shield->level / 10 + ud->GemType * 2);
  shield->value[4] = ud->Charge;
  shield->value[5] = ud->Charge;
  shield->cost = shield->value[OVAL_ARMOR_AC] * 100;
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
  if( ud->ItemName )
    {
      FreeMemory( ud->ItemName );
    }

  FreeMemory( ud );
}
