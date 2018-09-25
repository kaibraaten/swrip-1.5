#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

struct UserData
{
  int Charge = 0;
  bool HasStaff = false;
  std::string ItemName;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );

void do_makeblade( Character *ch, std::string argument )
{
  static const struct CraftingMaterial materials[] =
    {
     { ITEM_TOOLKIT,    {} },
     { ITEM_OVEN,       {} },
     { ITEM_DURASTEEL,  { Flag::Crafting::Extract } },
     { ITEM_BATTERY,    { Flag::Crafting::Extract } },
     { ITEM_STAFF,      { Flag::Crafting::Extract, Flag::Crafting::Optional } },
     { ITEM_NONE,       {} }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_makeblade, materials,
                                             25, GetProtoObject( OBJ_VNUM_CRAFTING_BLADE ),
					     { Flag::Crafting::NeedsWorkshop } );
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

  if ( !args->CommandArguments.empty() )
    {
      ud->ItemName = args->CommandArguments;
    }
  else
    {
      ch->Echo("&RUsage: Makeblade <name>\r\n&w" );
      args->AbortSession = true;
    }
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
  char buf[MAX_STRING_LENGTH] = {'\0'};
  Object *weapon = args->Object;

  weapon->ItemType = ITEM_WEAPON;
  SetBit( weapon->WearFlags, ITEM_WIELD );
  SetBit( weapon->WearFlags, ITEM_TAKE );
  weapon->Weight = 3;

  strcpy( buf, ud->ItemName.c_str() );

  if (!ud->HasStaff )
    {
      strcat( buf, " vibro-blade blade" );
    }
  else
    {
      strcat( buf, " force pike" );
    }

  weapon->Name = buf;
  weapon->ShortDescr = ud->ItemName;
  weapon->Description = Capitalize( weapon->ShortDescr + " was left here." );

  Affect *backstab = new Affect();
  backstab->Type               = -1;
  backstab->Duration           = -1;
  backstab->Location           = GetAffectType( "backstab" );
  backstab->Modifier           = weapon->Level / 3;
  weapon->Add(backstab);
  ++top_affect;

  if ( !ud->HasStaff )
    {
      Affect *hitroll = new Affect();
      hitroll->Type               = -1;
      hitroll->Duration           = -1;
      hitroll->Location           = GetAffectType( "hitroll" );
      hitroll->Modifier           = -2;
      weapon->Add(hitroll);
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
  delete ud;
}
