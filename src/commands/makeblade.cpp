#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int Charge;
  bool HasStaff;
  char *ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makeblade( Character *ch, char *argument )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_TOOLKIT,    CRAFTFLAG_NONE },
      { ITEM_OVEN,       CRAFTFLAG_NONE },
      { ITEM_DURASTEEL,  CRAFTFLAG_EXTRACT },
      { ITEM_BATTERY,    CRAFTFLAG_EXTRACT },
      { ITEM_STAFF,      CRAFTFLAG_EXTRACT | CRAFTFLAG_OPTIONAL },
      { ITEM_NONE,       CRAFTFLAG_NONE },
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeblade, materials,
                                             25, OBJ_VNUM_CRAFTING_BLADE,
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
      ch->Echo("&RUsage: Makeblade <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->ItemName = CopyString( args->CommandArguments );
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->ItemType == ITEM_STAFF )
    {
      ud->HasStaff = true;
    }

  if( args->Object->ItemType == ITEM_BATTERY )
    {
      ud->Charge = args->Object->Value[OVAL_BATTERY_CHARGE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *weapon = args->Object;

  weapon->ItemType = ITEM_WEAPON;
  SetBit( weapon->WearFlags, ITEM_WIELD );
  SetBit( weapon->WearFlags, ITEM_TAKE );
  weapon->Weight = 3;

  FreeMemory( weapon->Name );
  strcpy( buf, ud->ItemName );

  if (!ud->HasStaff )
    {
      strcat( buf, " vibro-blade blade" );
    }
  else
    {
      strcat( buf, " force pike" );
    }

  weapon->Name = CopyString( buf );

  strcpy( buf, ud->ItemName );
  FreeMemory( weapon->ShortDescr );
  weapon->ShortDescr = CopyString( buf );

  FreeMemory( weapon->Description );
  strcat( buf, " was left here." );
  weapon->Description = CopyString( Capitalize( buf ) );

  Affect *backstab = new Affect();
  backstab->Type               = -1;
  backstab->Duration           = -1;
  backstab->Location           = GetAffectType( "backstab" );
  backstab->Modifier           = weapon->Level / 3;
  backstab->AffectedBy         = 0;
  backstab->Next               = NULL;
  LINK( backstab, weapon->FirstAffect, weapon->LastAffect, Next, Previous );
  ++top_affect;

  if ( !ud->HasStaff )
    {
      Affect *hitroll = new Affect();

      hitroll->Type               = -1;
      hitroll->Duration           = -1;
      hitroll->Location           = GetAffectType( "hitroll" );
      hitroll->Modifier           = -2;
      hitroll->AffectedBy         = 0;
      hitroll->Next               = NULL;
      LINK( hitroll, weapon->FirstAffect, weapon->LastAffect, Next, Previous );
      ++top_affect;
    }

  weapon->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;

  if( !ud->HasStaff )
    {
      weapon->Value[OVAL_WEAPON_TYPE] = WEAPON_VIBRO_BLADE;
    }
  else
    {
      weapon->Value[OVAL_WEAPON_TYPE] = WEAPON_FORCE_PIKE;
    }

  weapon->Value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (weapon->Level / 20 + 8 + weapon->Value[OVAL_WEAPON_TYPE]);
  weapon->Value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (weapon->Level / 10 + 18 + weapon->Value[OVAL_WEAPON_TYPE]);

  weapon->Value[OVAL_WEAPON_CHARGE] = ud->Charge;
  weapon->Value[OVAL_WEAPON_MAX_CHARGE] = ud->Charge;
  weapon->Cost = weapon->Value[OVAL_WEAPON_SIZE_DAM_DIE]*10;
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


