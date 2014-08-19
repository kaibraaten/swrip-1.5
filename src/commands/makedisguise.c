#include <string.h>
#include "mud.h"
#include "character.h"
#include "craft.h"

struct UserData
{
  int Race;
  int Sex;
  char *Name;
};

static void InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *args );
static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *args );
static void AbortHandler( void *userData, AbortCraftingEventArgs *args );
static void FreeUserData( struct UserData *ud );
static CraftRecipe *MakeCraftRecipe( void );

void do_makedisguise( Character *ch, char *argument )
{
  struct UserData *data = NULL;
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );

  AllocateMemory( data, struct UserData, 1 );

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

  if( !StrCmp( sexName, "male" ) )
    {
      sex = SEX_MALE;
    }
  else if( !StrCmp( sexName, "female" ) )
    {
      sex = SEX_FEMALE;
    }
  else if( !StrCmp( sexName, "neutral" ) )
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
  argument = OneArgument( argument, sex );
  argument = OneArgument( argument, race );

  if ( argument[0] == '\0' || sex[0] == '\0' || race[0] == '\0' )
    {
      ChPrintf( ch, "&RUsage: Makedisguise <sex> <race> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->Sex = GetSexFromName( sex );

  if( ud->Sex < 0 )
    {
      ChPrintf( ch, "Sex must be male, female or neutral.&w\r\n" );
      args->AbortSession = true;
      return;
    }

  ud->Race = GetRaceFromName( race );

  if( ud->Race < 0 )
    {
      ChPrintf( ch, "&R'%s' is not a valid race.&w\r\n", race );
      args->AbortSession = true;
      return;
    }

  ud->Name = CopyString( argument );
}

static void SetObjectStatsHandler( void *userData, SetObjectStatsEventArgs *args )
{
  struct UserData *ud = (struct UserData*) userData;
  char buf[MAX_STRING_LENGTH];
  Object *disguise = args->Object;

  SetBit( disguise->wear_flags, ITEM_DISGUISE );
  SetBit( disguise->wear_flags, ITEM_TAKE );

  FreeMemory( disguise->name );
  strcpy( buf, ud->Name );
  strcat( buf, " disguise");
  disguise->name = CopyString( buf );

  strcpy( buf, ud->Name );
  FreeMemory( disguise->short_descr );
  disguise->short_descr = CopyString( buf );

  FreeMemory( disguise->description );
  disguise->description = CopyString( "" );

  disguise->value[OVAL_DISGUISE_MAX_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->value[OVAL_DISGUISE_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->value[OVAL_DISGUISE_RACE] = ud->Race;
  disguise->value[OVAL_DISGUISE_SEX] = ud->Sex;
  disguise->cost = 5000;
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
  if( ud->Name )
    {
      FreeMemory( ud->Name );
    }

  FreeMemory( ud );
}
