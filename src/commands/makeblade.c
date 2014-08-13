#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );
static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );

struct UserData
{
  int Charge;
  bool HasStaff;
};

void do_makeblade( Character *ch, char *argument )
{
  struct UserData *data = NULL;
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
                                             25, OBJ_VNUM_CRAFTING_BLADE );
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

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if ( args->CommandArguments[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makeblade <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  AddCraftingArgument( args->CraftingSession, args->CommandArguments );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if( !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
    {
      ch_printf( ch, "&RYou need to be in a factory or workshop to do that.\r\n" );
      args->AbortSession = true;
      return;
    }
}

static void MaterialFoundHandler( void *userData, MaterialFoundEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( args->Object->item_type == ITEM_STAFF )
    {
      ud->HasStaff = true;
    }

  if( args->Object->item_type == ITEM_BATTERY )
    {
      ud->Charge = args->Object->value[OVAL_BATTERY_CHARGE];
    }
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  const char *itemName = GetCraftingArgument( args->CraftingSession, 0 );
  char buf[MAX_STRING_LENGTH];
  Affect *paf = NULL;
  OBJ_DATA *weapon = args->Object;

  weapon->item_type = ITEM_WEAPON;
  SET_BIT( weapon->wear_flags, ITEM_WIELD );
  SET_BIT( weapon->wear_flags, ITEM_TAKE );
  weapon->weight = 3;

  STRFREE( weapon->name );
  strcpy( buf, itemName );

  if (!ud->HasStaff )
    {
      strcat( buf, " vibro-blade blade" );
    }
  else
    {
      strcat( buf, " force pike" );
    }

  weapon->name = STRALLOC( buf );

  strcpy( buf, itemName );
  STRFREE( weapon->short_descr );
  weapon->short_descr = STRALLOC( buf );

  STRFREE( weapon->description );
  strcat( buf, " was left here." );
  weapon->description = STRALLOC( capitalize( buf ) );

  CREATE( paf, Affect, 1 );
  paf->type               = -1;
  paf->duration           = -1;
  paf->location           = get_affecttype( "backstab" );
  paf->modifier           = weapon->level / 3;
  paf->bitvector          = 0;
  paf->next               = NULL;
  LINK( paf, weapon->first_affect, weapon->last_affect, next, prev );
  ++top_affect;

  if ( !ud->HasStaff )
    {
      Affect *hitroll = NULL;

      CREATE( hitroll, Affect, 1 );
      hitroll->type               = -1;
      hitroll->duration           = -1;
      hitroll->location           = get_affecttype( "hitroll" );
      hitroll->modifier           = -2;
      hitroll->bitvector          = 0;
      hitroll->next               = NULL;
      LINK( hitroll, weapon->first_affect, weapon->last_affect, next, prev );
      ++top_affect;
    }

  weapon->value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;

  if( !ud->HasStaff )
    {
      weapon->value[OVAL_WEAPON_TYPE] = WEAPON_VIBRO_BLADE;
    }
  else
    {
      weapon->value[OVAL_WEAPON_TYPE] = WEAPON_FORCE_PIKE;
    }

  weapon->value[OVAL_WEAPON_NUM_DAM_DIE] = (int) (weapon->level / 20 + 8 + weapon->value[OVAL_WEAPON_TYPE]);
  weapon->value[OVAL_WEAPON_SIZE_DAM_DIE] = (int) (weapon->level / 10 + 18 + weapon->value[OVAL_WEAPON_TYPE]);

  weapon->value[OVAL_WEAPON_CHARGE] = ud->Charge;
  weapon->value[OVAL_WEAPON_MAX_CHARGE] = ud->Charge;
  weapon->cost = weapon->value[OVAL_WEAPON_SIZE_DAM_DIE]*10;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  DISPOSE( ud );
}
