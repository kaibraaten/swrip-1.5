#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int Ammo = 0;
  bool Scope = false;
  int Lens = 0;
  int Power = 0;
  char *ItemName = nullptr;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makeblaster( Character *ch, char *argument )
{
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
  UserData *data = new UserData();

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

  if ( IsNullOrEmpty( args->CommandArguments ) )
    {
      ch->Echo("&RUsage: Makeblaster <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_AMMO )
    {
      ud->Ammo = args->Object->Value[OVAL_AMMO_CHARGE];
    }

  if( args->Object->ItemType == ITEM_SCOPE )
    {
      ud->Scope = true;
    }

  if( args->Object->ItemType == ITEM_SUPERCONDUCTOR && ud->Power < 2 )
    {
      ++ud->Power;
      args->KeepFinding = ud->Power < 2;
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *blaster = args->Object;

  if( ud->Scope )
    {
      ud->Power = 0;
    }

  SetBit( blaster->WearFlags, ITEM_WIELD );
  SetBit( blaster->WearFlags, ITEM_TAKE );
  blaster->Weight = 2 + blaster->Level / 10;

  FreeMemory( blaster->Name );
  strcpy( buf, ud->ItemName );
  strcat( buf, " blaster");
  blaster->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( blaster->ShortDescr );
  blaster->ShortDescr = CopyString( buf );

  FreeMemory( blaster->Description );
  strcat( buf, " was carelessly misplaced here." );
  blaster->Description = CopyString( Capitalize( buf ) );

  Affect *hitroll = new Affect();
  hitroll->Type       = -1;
  hitroll->Duration   = -1;
  hitroll->Location   = GetAffectType( "hitroll" );
  hitroll->Modifier   = urange( 0, 1 + ud->Scope, blaster->Level / 30 );
  blaster->Add(hitroll);
  ++top_affect;

  Affect *damroll = new Affect();
  damroll->Type      = -1;
  damroll->Duration  = -1;
  damroll->Location  = GetAffectType( "damroll" );
  damroll->Modifier  = urange( 0, ud->Power, blaster->Level / 30);
  blaster->Add(damroll);
  ++top_affect;

  if ( ud->Scope == true )
    {
      Affect *snipe = new Affect();
      snipe->Type      = -1;
      snipe->Duration  = -1;
      snipe->Location  = GetAffectType( "snipe" );
      snipe->Modifier  = urange( 0, 30, blaster->Level / 3);
      blaster->Add(snipe);
    }

  ++top_affect;
  blaster->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
  blaster->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (blaster->Level / 10 + 15);
  blaster->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (blaster->Level / 5 + 25);
  blaster->Value[OVAL_WEAPON_TYPE] = WEAPON_BLASTER;
  blaster->Value[OVAL_WEAPON_CHARGE] = ud->Ammo;
  blaster->Value[OVAL_WEAPON_MAX_CHARGE] = 2000;

  blaster->Cost = blaster->Value[OVAL_WEAPON_SIZE_DAM_DIE] * 50;
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

  delete ud;
}


