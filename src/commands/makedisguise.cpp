#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "craft.hpp"
#include "skill.hpp"
#include "object.hpp"

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
  CraftRecipe *recipe = MakeCraftRecipe();
  CraftingSession *session = AllocateCraftingSession( recipe, ch, argument );
  UserData *data = new UserData();

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

  if ( IsNullOrEmpty( argument ) || IsNullOrEmpty( sex ) || IsNullOrEmpty( race ) )
    {
      ch->Echo("&RUsage: Makedisguise <sex> <race> <name>\r\n&w" );
      args->AbortSession = true;
      return;
    }

  ud->Sex = GetSexFromName( sex );

  if( ud->Sex < 0 )
    {
      ch->Echo("Sex must be male, female or neutral.&w\r\n" );
      args->AbortSession = true;
      return;
    }

  ud->Race = GetRaceFromName( race );

  if( ud->Race < 0 )
    {
      ch->Echo("&R'%s' is not a valid race.&w\r\n", race );
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

  SetBit( disguise->WearFlags, ITEM_DISGUISE );
  SetBit( disguise->WearFlags, ITEM_TAKE );

  FreeMemory( disguise->Name );
  strcpy( buf, ud->Name );
  strcat( buf, " disguise");
  disguise->Name = CopyString( buf );

  strcpy( buf, ud->Name );
  FreeMemory( disguise->ShortDescr );
  disguise->ShortDescr = CopyString( buf );

  FreeMemory( disguise->Description );
  disguise->Description = CopyString( "" );

  disguise->Value[OVAL_DISGUISE_MAX_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->Value[OVAL_DISGUISE_CONDITION] = INIT_WEAPON_CONDITION;
  disguise->Value[OVAL_DISGUISE_RACE] = ud->Race;
  disguise->Value[OVAL_DISGUISE_SEX] = ud->Sex;
  disguise->Cost = 5000;
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

  delete ud;
}


