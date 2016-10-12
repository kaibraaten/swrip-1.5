#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"
#include "skill.h"

struct UserData
{
  char *ItemName;
  int SpiceType;
  int SpiceGrade;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );
static void FreeUserData( struct UserData *ud );

void do_makespice( Character *ch, char *argument )
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
      { ITEM_RAWSPICE, CRAFTFLAG_EXTRACT },
      { ITEM_NONE,      CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_spice_refining, materials,
					     10, OBJ_VNUM_CRAFTING_SPICE,
					     CRAFTFLAG_NEED_REFINERY );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );

  if ( IsNullOrEmpty( args->CommandArguments ) )
    {
      Echo( ch, "&RUsage: Makespice <name>\r\n&w" );
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

  if( args->Object->item_type == ITEM_RAWSPICE )
    {
      ud->SpiceType = args->Object->value[OVAL_RAWSPICE_TYPE];
      ud->SpiceGrade = args->Object->value[OVAL_RAWSPICE_GRADE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *spice = args->Object;
  Character *ch = GetEngineer( args->CraftingSession );

  spice->value[OVAL_SPICE_GRADE] = urange(10, ud->SpiceGrade, ( IsNpc(ch) ? ch->TopLevel : (int) (ch->PCData->learned[gsn_spice_refining]) ) + 10);

  strcpy( buf, ud->ItemName );
  FreeMemory( spice->Name );
  strcat( buf, " drug spice " );
  strcat( buf, GetSpiceTypeName( ud->SpiceType ) );
  spice->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( spice->ShortDescr );
  spice->ShortDescr = CopyString( buf );

  strcat( buf, " was foolishly left lying around here." );
  FreeMemory( spice->Description );
  spice->Description = CopyString( Capitalize( buf ) );

  spice->item_type = ITEM_SPICE;
  spice->value[OVAL_SPICE_TYPE] = ud->SpiceType;
  spice->value[OVAL_SPICE_GRADE] = ud->SpiceGrade;

  SendToCharacter( "&GYou finish your work.\r\n", ch);
  Act( AT_PLAIN, "$n finishes $s work.", ch, NULL, NULL, TO_ROOM );

  spice->cost  = 500;
  spice->cost += spice->value[OVAL_SPICE_GRADE] * 10;
  spice->cost *= 2;
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
