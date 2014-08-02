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
  void (*SetObjectStats)( CraftingSession*, OBJ_DATA* );
};

static void FinishedStage( CraftingSession *session );
static void OnAbort( CraftingSession *session );
static bool FindMaterials( CraftingSession *session, bool extract );

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
  int the_chance = ch->pcdata->learned[session->Recipe->Skill];
  bool hasMaterials = FindMaterials( session, true );
  int level = ch->pcdata->learned[session->Recipe->Skill];
  OBJ_DATA *container = NULL;
  OBJ_INDEX_DATA *proto = get_obj_index( session->Recipe->Prototype );
  long xpgain = 0;
  SKILLTYPE *skill = get_skilltype( session->Recipe->Skill );
  const char *itemType = object_types[proto->item_type];
  char actBuf[MAX_STRING_LENGTH];

  ch->substate = SUB_NONE;

  if ( number_percent() > the_chance*2  || !hasMaterials )
    {
      ch_printf( ch, "&RYou hold up your newly created %s.\r\n", itemType );
      ch_printf( ch, "&RIt suddenly dawns upon you that you have created the most useless\r\n" );
      ch_printf( ch, "&R%s you've ever seen. You quickly hide your mistake...&w\r\n", itemType);
      learn_from_failure( ch, session->Recipe->Skill );
      FreeCraftingSession( session );
      return;
    }

  container = create_object( proto, level );

  session->SetObjectStats( session, container );

  container = obj_to_char( container, ch );

  ch_printf( ch, "&GYou finish your work and hold up your newly created %s.&w\r\n", itemType);
  sprintf( actBuf, "$n finishes making $s new %s.", itemType );
  act( AT_PLAIN, actBuf, ch, NULL, NULL, TO_ROOM );

  xpgain = UMIN( container->cost * 100,
		 exp_level(get_level(ch, skill->guild ) + 1)
		 - exp_level(get_level(ch, skill->guild ) ) );
  gain_exp(ch, skill->guild, xpgain );
  ch_printf( ch , "You gain %d %s experience.", xpgain, ability_name[skill->guild] );

  learn_from_success( ch, session->Recipe->Skill );
  /*************************************************/
  FreeCraftingSession( session );
}

static void OnAbort( CraftingSession *session )
{
  Character *ch = session->Engineer;
  ch->substate = SUB_NONE;

  ch_printf( ch, "&RYou are interrupted and fail to finish your work.&w\r\n");

  /*************************************************/
  FreeCraftingSession( session );
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
					  bool (*InterpretArguments)( CraftingSession*, char* ),
					  void (*SetObjectStats)( CraftingSession*, OBJ_DATA* ) )
{
  CraftingSession *session = NULL;
  
  CREATE( session, CraftingSession, 1 );

  session->Engineer = engineer;
  session->Recipe = recipe;
  session->FoundMaterials = AllocateFoundMaterials( recipe->Materials );
  session->OriginalArgument = str_dup( commandArgument );
  session->InterpretArguments = InterpretArguments;
  session->SetObjectStats = SetObjectStats;

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

const char *GetCraftingArgument( const CraftingSession *session, size_t argumentNumber )
{
  if( session->NumberOfArguments == 0
      || argumentNumber > session->NumberOfArguments - 1 )
    {
      bug( "%s:%d %s(): Requested argument is %d, but session has %d arguments",
           __FILE__, __LINE__, __FUNCTION__,
	   argumentNumber, session->NumberOfArguments );
      return "";
    }

  return session->Arguments[argumentNumber];
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

  if( !session->InterpretArguments( session, session->OriginalArgument )
      || !FindMaterials( session, false )
      || !CheckSkill( session ) )
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

static bool FindMaterials( CraftingSession *session, bool extract )
{
  return true;
}
