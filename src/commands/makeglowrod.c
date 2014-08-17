#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

struct UserData
{
  char *ItemName;
  int Charge;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );

void do_makeglowrod( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  CREATE( data, struct UserData, 1 );

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
      { ITEM_TOOLKIT,   CRAFTFLAG_NONE },
      { ITEM_BATTERY,   CRAFTFLAG_EXTRACT },
      { ITEM_CIRCUIT,   CRAFTFLAG_EXTRACT },
      { ITEM_CHEMICAL,  CRAFTFLAG_EXTRACT },
      { ITEM_LENS,      CRAFTFLAG_EXTRACT },
      { ITEM_NONE,      CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeglowrod, materials,
					     10, OBJ_VNUM_CRAFTING_GLOWROD,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );

  if ( args->CommandArguments[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makeglowrod <name>\r\n&w" );
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
      ud->Charge = args->Object->value[OVAL_BATTERY_CHARGE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *glowrod = args->Object;

  glowrod->item_type = ITEM_LIGHT;
  SetBit( glowrod->wear_flags, ITEM_TAKE );
  glowrod->weight = 3;

  DISPOSE( glowrod->name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " glowrod");
  glowrod->name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  DISPOSE( glowrod->short_descr );
  glowrod->short_descr = CopyString( buf );

  DISPOSE( glowrod->description );
  strcat( buf, " was carelessly misplaced here." );
  glowrod->description = CopyString( Capitalize( buf ) );

  glowrod->value[OVAL_LIGHT_POWER] = ud->Charge;
  glowrod->cost = glowrod->value[OVAL_LIGHT_POWER];
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
      DISPOSE( ud->ItemName );
    }

  DISPOSE( ud );
}
