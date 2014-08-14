#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static CraftRecipe *MakeCraftRecipe( void );

struct UserData
{
  int Race;
  int Sex;
  char *Name;
};

void do_makedisguise( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  CREATE( data, struct UserData, 1 );

  AddInterpretArgumentsCraftingHandler( session, data, InterpretArgumentsHandler );
  AddSetObjectStatsCraftingHandler( session, data, SetObjectStatsHandler );
  AddFinishedCraftingHandler( session, data, FinishedCraftingHandler );
  AddAbortCraftingHandler( session, data, AbortHandler );

  StartCrafting( session );
}

static CraftRecipe *MakeCraftRecipe( void )
{
  static const struct CraftingMaterial materials[] =
    {
      { ITEM_THREAD,      CRAFTFLAG_NONE },
      { ITEM_DIS_FABRIC,  CRAFTFLAG_EXTRACT },
      { ITEM_HAIR,        CRAFTFLAG_EXTRACT },
      { ITEM_NONE,        CRAFTFLAG_NONE }
    };
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_disguise, materials,
					     25, OBJ_VNUM_CRAFTING_DISGUISE,
					     CRAFTFLAG_NEED_WORKSHOP );

  return recipe;
}

static int GetSexFromName( const char *sexName )
{
  int sex = -1;

  if( !str_cmp( sexName, "male" ) )
    {
      sex = SEX_MALE;
    }
  else if( !str_cmp( sexName, "female" ) )
    {
      sex = SEX_FEMALE;
    }
  else if( !str_cmp( sexName, "neutral" ) )
    {
      sex = SEX_NEUTRAL;
    }

  return sex;
}

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  Character *ch = GetEngineer( args->CraftingSession );
  char argumentBuf[MAX_INPUT_LENGTH];
  char *argument = argumentBuf;
  char sex[MAX_INPUT_LENGTH];
  char race[MAX_INPUT_LENGTH];

  strcpy( argumentBuf, args->CommandArguments );
  argument = one_argument( argument, sex );
  argument = one_argument( argument, race );

  if ( argument[0] == '\0' || sex[0] == '\0' || race[0] == '\0' )
    {
      ch_printf( ch, "&RUsage: Makedisguise <sex> <race> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->Sex = GetSexFromName( sex );

  if( ud->Sex < 0 )
    {
      ch_printf( ch, "Sex must be male, female or neutral.&w\r\n" );
      args->AbortSession = true;
      return;
    }

  ud->Race = get_race_from_name( race );

  if( ud->Race < 0 )
    {
      ch_printf( ch, "&R'%s' is not a valid race.&w\r\n", race );
      args->AbortSession = true;
      return;
    }

  ud->Name = str_dup( argument );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *disguise = args->Object;

  SET_BIT( disguise->wear_flags, ITEM_DISGUISE );
  SET_BIT( disguise->wear_flags, ITEM_TAKE );

  STRFREE( disguise->name );
  strcpy( buf, ud->Name );
  strcat( buf, " disguise");
  disguise->name = STRALLOC( buf );

  strcpy( buf, ud->Name );
  STRFREE( disguise->short_descr );
  disguise->short_descr = STRALLOC( buf );

  STRFREE( disguise->description );
  disguise->description = STRALLOC( "" );

  disguise->value[OVAL_DISGUISE_MAX_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->value[OVAL_DISGUISE_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->value[OVAL_DISGUISE_RACE] = ud->Race;
  disguise->value[OVAL_DISGUISE_SEX] = ud->Sex;
  disguise->cost = 5000;
}

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( ud->Name )
    {
      DISPOSE( ud->Name );
    }

  DISPOSE( ud );
}

static void AbortHandler( void *userData, AbortCraftingEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;

  if( ud->Name )
    {
      DISPOSE( ud->Name );
    }

  DISPOSE( ud );
}
