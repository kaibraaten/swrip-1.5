#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

struct UserData
{
  int Ammo;
  bool Scope;
  int Lens;
  int Power;
  char *ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makeblaster( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,         CRAFTFLAG_NONE },
      { ITEM_OVEN,            CRAFTFLAG_NONE },
      { ITEM_DURAPLAST,       CRAFTFLAG_EXTRACT },
      { ITEM_BATTERY,         CRAFTFLAG_EXTRACT },
      { ITEM_SUPERCONDUCTOR,  CRAFTFLAG_EXTRACT },
      { ITEM_CIRCUIT,         CRAFTFLAG_EXTRACT },
      { ITEM_AMMO,            CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_SCOPE,           CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_LENS,            CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_NONE,            CRAFTFLAG_NONE },
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeblaster, materials,
                                             25, OBJ_VNUM_CRAFTING_BLASTER,
					     CRAFTFLAG_NEED_WORKSHOP );
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddMaterialFoundCraftingHandler( session, data, MaterialFoundHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );
  struct UserData *ud = (struct UserData*) userData;

  if ( args->CommandArguments[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makeblaster <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->item_type == ITEM_AMMO )
    {
      ud->Ammo = args->Object->value[OVAL_AMMO_CHARGE];
    }

  if( args->Object->item_type == ITEM_SCOPE )
    {
      ud->Scope = true;
    }

  if( args->Object->item_type == ITEM_SUPERCONDUCTOR && ud->Power < 2 )
    {
      ++ud->Power;
      args->KeepFinding = ud->Power < 2;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Affect *hitroll = NULL;
  Affect *damroll = NULL;
  OBJ_DATA *blaster = args->Object;

  if( ud->Scope )
    {
      ud->Power = 0;
    }

  SetBit( blaster->wear_flags, ITEM_WIELD );
  SetBit( blaster->wear_flags, ITEM_TAKE );
  blaster->weight = 2 + blaster->level / 10;

  FreeMemory( blaster->name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " blaster");
  blaster->name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( blaster->short_descr );
  blaster->short_descr = CopyString( buf );

  FreeMemory( blaster->description );
  strcat( buf, " was carelessly misplaced here." );
  blaster->description = CopyString( Capitalize( buf ) );

  AllocateMemory( hitroll, Affect, 1 );
  hitroll->type       = -1;
  hitroll->duration   = -1;
  hitroll->location   = get_affecttype( "hitroll" );
  hitroll->modifier   = urange( 0, 1 + ud->Scope, blaster->level / 30 );
  LINK( hitroll, blaster->first_affect, blaster->last_affect, next, prev );
  ++top_affect;

  AllocateMemory( damroll, Affect, 1 );
  damroll->type      = -1;
  damroll->duration  = -1;
  damroll->location  = get_affecttype( "damroll" );
  damroll->modifier  = urange( 0, ud->Power, blaster->level / 30);
  LINK( damroll, blaster->first_affect, blaster->last_affect, next, prev );
  ++top_affect;

  if ( ud->Scope == true )
    {
      Affect *snipe = NULL;

      AllocateMemory( snipe, Affect, 1 );
      snipe->type      = -1;
      snipe->duration  = -1;
      snipe->location  = get_affecttype( "snipe" );
      snipe->modifier  = urange( 0, 30, blaster->level / 3);
      LINK( snipe, blaster->first_affect, blaster->last_affect, next, prev );
    }

  ++top_affect;
  blaster->value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  blaster->value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (blaster->level / 10 + 15);
  blaster->value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (blaster->level / 5 + 25);
  blaster->value[OVAL_WEAPON_TYPE] = WEAPON_BLASTER;
  blaster->value[OVAL_WEAPON_CHARGE] = ud->Ammo;
  blaster->value[OVAL_WEAPON_MAX_CHARGE] = 2000;

  blaster->cost = blaster->value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
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
