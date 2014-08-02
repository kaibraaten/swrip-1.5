#include "mud.h"
#include "craft.h"
#include "constants.h"
#include "character.h"

struct CraftRecipe
{
  int Skill;
  CraftingMaterial *Materials;
  int Duration;
  vnum_t Prototype;
};

struct FoundMaterial
{
  CraftingMaterial Material;
  OBJ_DATA *Object;
};

struct CraftingSession
{
  Character *Engineer;
  CraftRecipe *Recipe;
  struct FoundMaterial *FoundMaterials;
  char **Arguments;
  size_t NumberOfArguments;
  char *OriginalArgument;
  bool (*InterpretArguments)( CraftingSession*, char* );
};

static void FinishedStage( CraftingSession *session );
static void OnAbort( CraftingSession *session );
static bool FindMaterials( CraftingSession *session );

void do_craftingengine( Character *ch, char *argument )
{
  CraftingSession *session = NULL;

  if( is_npc( ch ) )
    {
      bug( "%s:%d %s(): IsNPC(\"%s\") == true",
           __FILE__, __LINE__, __FUNCTION__, ch->name );
      return;
    }

  session = ch->pcdata->CraftingSession;

  if( !session )
    {
      bug( "%s:%d %s(): %s->pcdata->CraftingSession == NULL",
	   __FILE__, __LINE__, __FUNCTION__, ch->name );
      return;
    }

  switch( ch->substate )
    {
    default:
      bug( "%s:%d %s(): %s invalid substate %d",
	   __FILE__, __LINE__, __FUNCTION__, ch->name, ch->substate );
      break;

    case SUB_PAUSE:
      FinishedStage( session );
      break;

    case SUB_TIMER_DO_ABORT:
      OnAbort( session );
      break;
    }
}

static void FinishedStage( CraftingSession *session )
{
  Character *ch = session->Engineer;
  ch->substate = SUB_NONE;

  ch_printf( ch, "Hello from %s()\r\n", __FUNCTION__ );





  /*************************************************/
  FreeCraftingSession( ch->pcdata->CraftingSession );
}

static void OnAbort( CraftingSession *session )
{
  Character *ch = session->Engineer;
  ch->substate = SUB_NONE;

  ch_printf( ch, "&RYou are interrupted and fail to finish your work.&w\r\n");

  /*************************************************/
  FreeCraftingSession( ch->pcdata->CraftingSession );
}

Character *GetEngineer( CraftingSession *session )
{
  return session->Engineer;
}

CraftRecipe *AllocateCraftRecipe( int sn, CraftingMaterial *materialList, int duration, vnum_t prototypeObject )
{
  CraftRecipe *recipe = NULL;
  CREATE( recipe, CraftRecipe, 1 );

  recipe->Skill = sn;
  recipe->Materials = materialList;
  recipe->Duration = duration;
  recipe->Prototype = prototypeObject;

  if( !get_skilltype( recipe->Skill ) )
    {
      bug( "%s:%d %s(): Bad SKILLTYPE %d", __FILE__, __LINE__, __FUNCTION__, recipe->Skill );
    }

  if( !get_obj_index( recipe->Prototype ) )
    {
      bug( "%s:%d %s(): Bad ProtoObject %d", __FILE__, __LINE__, __FUNCTION__, recipe->Prototype );
    }

  return recipe;
}

void FreeCraftRecipe( CraftRecipe *recipe )
{
  DISPOSE( recipe );
}

static size_t CountCraftingMaterials( const CraftingMaterial *material )
{
  size_t numberOfElements = 0;

  while( material->ItemType != ITEM_NONE )
    {
      ++numberOfElements;
      ++material;
    }

  ++numberOfElements; /* include ITEM_NONE */

  return numberOfElements;
}

static struct FoundMaterial *AllocateFoundMaterials( const CraftingMaterial *recipeMaterials )
{
  size_t numberOfElements = CountCraftingMaterials( recipeMaterials );
  size_t i = 0;
  struct FoundMaterial *foundMaterials = NULL;

  CREATE( foundMaterials, struct FoundMaterial, numberOfElements );

  for( i = 0; i < numberOfElements; ++i )
    {
      foundMaterials[i].Material = recipeMaterials[i];
      foundMaterials[i].Material.Count = 0;
      foundMaterials[i].Object = NULL;
    }

  return foundMaterials;
}

CraftingSession *AllocateCraftingSession( CraftRecipe *recipe, Character *engineer,
					  char *commandArgument,
					  bool (*InterpretArguments)( CraftingSession*, char* ) )
{
  CraftingSession *session = NULL;
  
  CREATE( session, CraftingSession, 1 );

  session->Engineer = engineer;
  session->Recipe = recipe;
  session->FoundMaterials = AllocateFoundMaterials( recipe->Materials );
  session->OriginalArgument = str_dup( commandArgument );
  session->InterpretArguments = InterpretArguments;

  engineer->pcdata->CraftingSession = session;

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  if( session->NumberOfArguments > 0 )
    {
      size_t i = 0;

      for( i = 0; i < session->NumberOfArguments; ++i )
	{
	  DISPOSE( session->Arguments[i] );
	}

      DISPOSE( session->Arguments );
    }

  FreeCraftRecipe( session->Recipe );
  DISPOSE( session->FoundMaterials );
  DISPOSE( session->OriginalArgument );

  if( session->Engineer )
    {
      session->Engineer->pcdata->CraftingSession = NULL;
    }

  DISPOSE( session );
}

void AddCraftingArgument( CraftingSession *session, char *argument )
{
  ++session->NumberOfArguments;
  RECREATE( session->Arguments, char*, session->NumberOfArguments );

  session->Arguments[session->NumberOfArguments - 1] = str_dup( argument );
}

static bool CheckSkill( const CraftingSession *session )
{
  Character *ch = session->Engineer;
  int the_chance = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[session->Recipe->Skill]);

  if( number_percent() >= the_chance )
    {
      ch_printf( ch, "&RYou can't figure out what to do.\r\n" );
      learn_from_failure( ch, session->Recipe->Skill );
      return false;
    }

  return true;
}

void StartCrafting( CraftingSession *session )
{
  Character *ch = session->Engineer;
  OBJ_INDEX_DATA *obj = NULL;

  if( !session->InterpretArguments( session, session->OriginalArgument ) )
    {
      FreeCraftingSession( session );
      return;
    }

  if( !FindMaterials( session ) )
    {
      FreeCraftingSession( session );
      return;
    }

  if( !CheckSkill( session ) )
    {
      FreeCraftingSession( session );
      return;
    }

  obj = get_obj_index( session->Recipe->Prototype );

  ch_printf( ch, "&GYou begin the long process of creating %s.\r\n",
	     aoran( object_types[obj->item_type] ) );

  act( AT_PLAIN, "$n takes $s tools and some material and begins to work.",
       ch, NULL, NULL, TO_ROOM );
  add_timer( ch, TIMER_DO_FUN, session->Recipe->Duration, do_craftingengine, SUB_PAUSE );
}

static bool FindMaterials( CraftingSession *session )
{
  return true;
}
