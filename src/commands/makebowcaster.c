#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"
#include "skill.h"

struct UserData
{
  int Ammo;
  int Tinder;
  int Lenses;
  char *ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *CreateMakeBowcasterCraftRecipe( void );
static void FreeUserData( struct UserData *ud );

void do_makebowcaster( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = CreateMakeBowcasterCraftRecipe();
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

static CraftRecipe *CreateMakeBowcasterCraftRecipe( void )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,    CRAFTFLAG_NONE },
      { ITEM_OVEN,       CRAFTFLAG_NONE },
      { ITEM_DURAPLAST,  CRAFTFLAG_EXTRACT },
      { ITEM_OIL,        CRAFTFLAG_EXTRACT },
      { ITEM_TINDER,     CRAFTFLAG_EXTRACT },
      { ITEM_CROSSBOW,   CRAFTFLAG_EXTRACT },
      { ITEM_LENS,       CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_BOLT,       CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_NONE,       CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makebowcaster, materials,
					     25, OBJ_VNUM_CRAFTING_BOWCASTER,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );
  struct UserData *ud = (struct UserData*) userData;

  if ( IsNullOrEmpty( args->CommandArguments ) )
    {
      Echo( ch, "&RUsage: Makebowcaster <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if( ch->race != RACE_WOOKIEE && !IsImmortal( ch ) )
    {
      Echo( ch, "&ROnly wookiees have the knowledge to craft bowcasters.\r\n&w" );
      args->AbortSession = true;
    }
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->item_type == ITEM_BOLT )
    {
      ud->Ammo = args->Object->value[OVAL_BOLT_CHARGE];
    }

  if( args->Object->item_type == ITEM_LENS && ud->Lenses < 2 )
    {
      ++ud->Lenses;
      args->KeepFinding = ud->Lenses < 2;
    }

  if( args->Object->item_type == ITEM_TINDER && ud->Tinder < 4 )
    {
      ++ud->Tinder;
      args->KeepFinding = ud->Tinder < 4;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *obj = args->Object;
  Affect *hitroll = NULL;
  Affect *damroll = NULL;

  obj->item_type = ITEM_WEAPON;
  SetBit( obj->wear_flags, ITEM_WIELD );
  SetBit( obj->wear_flags, ITEM_TAKE );
  obj->weight = 2 + obj->level / 7;

  FreeMemory( obj->name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " bowcaster");
  obj->name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( obj->short_descr );
  obj->short_descr = CopyString( buf );

  FreeMemory( obj->description );
  strcat( buf, " was carefully placed here." );
  obj->description = CopyString( Capitalize( buf ) );

  AllocateMemory( hitroll, Affect, 1 );
  hitroll->Type      = -1;
  hitroll->Duration  = -1;
  hitroll->Location  = GetAffectType( "hitroll" );
  hitroll->Modifier  = urange( 0, 1 + ud->Lenses, obj->level / 30 );
  LINK( hitroll, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;

  AllocateMemory( damroll, Affect, 1 );
  damroll->Type      = -1;
  damroll->Duration  = -1;
  damroll->Location  = GetAffectType( "damroll" );
  damroll->Modifier  = urange( 0, ud->Tinder, obj->level / 30);
  LINK( damroll, obj->first_affect, obj->last_affect, next, prev );
  ++top_affect;

  obj->value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  obj->value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (obj->level / 10 + 25);
  obj->value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (obj->level / 5 + 25);
  obj->value[OVAL_WEAPON_TYPE] = WEAPON_BOWCASTER;
  obj->value[OVAL_WEAPON_CHARGE] = ud->Ammo;
  obj->value[OVAL_WEAPON_MAX_CHARGE] = 250;
  obj->cost = obj->value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
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
