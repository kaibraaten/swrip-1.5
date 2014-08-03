#include "mud.h"
#include "craft.h"
#include "constants.h"
#include "character.h"

struct CraftRecipe
{
  int Skill;
  const CraftingMaterial *Materials;
  int Duration;
  vnum_t Prototype;
};

struct FoundMaterial
{
  CraftingMaterial Material;
  OBJ_DATA *Object;
};

struct CraftingSessionImpl
{
  Character *Engineer;
  CraftRecipe *Recipe;
  struct FoundMaterial *FoundMaterials;
  char **Arguments;
  size_t NumberOfArguments;
  char *OriginalArgument;
};

struct FinishedCraftingUserData
{
  CraftRecipe *Recipe;
};

static void FinishedStage( CraftingSession *session );
static void OnAbort( CraftingSession *session );
static bool FindMaterials( CraftingSession *session, bool extract );
static size_t CountCraftingMaterials( const CraftingMaterial *material );
static struct FoundMaterial *AllocateFoundMaterials( const CraftingMaterial *recipeMaterials );
static bool CheckSkill( const CraftingSession *session );
static const char *GetItemTypeName( int itemType, int extraInfo );

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
  CraftRecipe *recipe = session->_pImpl->Recipe;
  Character *ch = session->_pImpl->Engineer;
  int the_chance = ch->pcdata->learned[recipe->Skill];
  bool hasMaterials = FindMaterials( session, true );
  int level = ch->pcdata->learned[recipe->Skill];
  OBJ_DATA *object = NULL;
  OBJ_INDEX_DATA *proto = get_obj_index( recipe->Prototype );
  const char *itemType = GetItemTypeName( proto->item_type, proto->value[3] );
  SetObjectStatsEventArgs eventArgs;
  FinishedCraftingEventArgs finishedCraftingEventArgs;

  ch->substate = SUB_NONE;

  if ( number_percent() > the_chance*2  || !hasMaterials )
    {
      ch_printf( ch, "&RYou hold up your newly created %s.\r\n", itemType );
      ch_printf( ch, "&RIt suddenly dawns upon you that you have created the most useless\r\n" );
      ch_printf( ch, "&R%s you've ever seen. You quickly hide your mistake...&w\r\n", itemType);
      learn_from_failure( ch, recipe->Skill );
      FreeCraftingSession( session );
      return;
    }

  object = create_object( proto, level );

  eventArgs.CraftingSession = session;
  eventArgs.Object = object;

  RaiseEvent( session->OnSetObjectStats, &eventArgs );

  object = obj_to_char( object, ch );

  finishedCraftingEventArgs.CraftingSession = session;
  finishedCraftingEventArgs.Object = object;
  RaiseEvent( session->OnFinishedCrafting, &finishedCraftingEventArgs );

  FreeCraftingSession( session );
}

static void FinishedCraftingHandler( void *userData, void *args )
{
  FinishedCraftingEventArgs *eventArgs = (FinishedCraftingEventArgs*) args;
  CraftingSession *session = eventArgs->CraftingSession;
  struct FinishedCraftingUserData *data = (struct FinishedCraftingUserData*) userData;
  Character *ch = GetEngineer( session );
  const char *itemType = GetItemTypeName( eventArgs->Object->item_type, eventArgs->Object->value[3] );
  char actBuf[MAX_STRING_LENGTH];
  long xpgain = 0;
  SKILLTYPE *skill = get_skilltype( data->Recipe->Skill );

  ch_printf( ch, "&GYou finish your work and hold up your newly created %s.&w\r\n", itemType);
  sprintf( actBuf, "$n finishes making $s new %s.", itemType );
  act( AT_PLAIN, actBuf, ch, NULL, NULL, TO_ROOM );

  xpgain = UMIN( eventArgs->Object->cost * 100,
                 exp_level(get_level(ch, skill->guild ) + 1)
                 - exp_level(get_level(ch, skill->guild ) ) );
  gain_exp(ch, skill->guild, xpgain );
  ch_printf( ch , "You gain %d %s experience.", xpgain, ability_name[skill->guild] );

  learn_from_success( ch, data->Recipe->Skill );

  DISPOSE( data );
}

static void OnAbort( CraftingSession *session )
{
  Character *ch = session->_pImpl->Engineer;
  AbortEventArgs abortEventArgs;

  ch->substate = SUB_NONE;
  abortEventArgs.CraftingSession = session;

  ch_printf( ch, "&RYou are interrupted and fail to finish your work.&w\r\n");

  RaiseEvent( session->OnAbort, &abortEventArgs );

  /*************************************************/
  FreeCraftingSession( session );
}

Character *GetEngineer( const CraftingSession *session )
{
  return session->_pImpl->Engineer;
}

CraftRecipe *AllocateCraftRecipe( int sn, const CraftingMaterial *materialList, int duration, vnum_t prototypeObject )
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
					  char *commandArgument )
{
  CraftingSession *session = NULL;
  struct FinishedCraftingUserData *finishedCraftingUserData = NULL;

  CREATE( session, CraftingSession, 1 );
  session->OnInterpretArguments = CreateEvent();
  session->OnCheckRequirements = CreateEvent();
  session->OnMaterialFound = CreateEvent();
  session->OnSetObjectStats = CreateEvent();
  session->OnFinishedCrafting = CreateEvent();
  session->OnAbort = CreateEvent();

  CREATE( finishedCraftingUserData, struct FinishedCraftingUserData, 1 );
  finishedCraftingUserData->Recipe = recipe;
  AddEventHandler( session->OnFinishedCrafting, finishedCraftingUserData, FinishedCraftingHandler );

  CREATE( session->_pImpl, struct CraftingSessionImpl, 1 );

  session->_pImpl->Engineer = engineer;
  session->_pImpl->Recipe = recipe;
  session->_pImpl->FoundMaterials = AllocateFoundMaterials( recipe->Materials );
  session->_pImpl->OriginalArgument = str_dup( commandArgument );

  engineer->pcdata->CraftingSession = session;

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  DestroyEvent( session->OnInterpretArguments );
  DestroyEvent( session->OnCheckRequirements );
  DestroyEvent( session->OnMaterialFound );
  DestroyEvent( session->OnSetObjectStats );
  DestroyEvent( session->OnFinishedCrafting );
  DestroyEvent( session->OnAbort );

  if( session->_pImpl->NumberOfArguments > 0 )
    {
      size_t i = 0;

      for( i = 0; i < session->_pImpl->NumberOfArguments; ++i )
	{
	  DISPOSE( session->_pImpl->Arguments[i] );
	}

      DISPOSE( session->_pImpl->Arguments );
    }

  FreeCraftRecipe( session->_pImpl->Recipe );
  DISPOSE( session->_pImpl->FoundMaterials );
  DISPOSE( session->_pImpl->OriginalArgument );

  if( session->_pImpl->Engineer )
    {
      session->_pImpl->Engineer->pcdata->CraftingSession = NULL;
    }

  DISPOSE( session->_pImpl );
  DISPOSE( session );
}

void AddCraftingArgument( CraftingSession *session, const char *argument )
{
  ++session->_pImpl->NumberOfArguments;
  RECREATE( session->_pImpl->Arguments, char*, session->_pImpl->NumberOfArguments );

  session->_pImpl->Arguments[session->_pImpl->NumberOfArguments - 1] = str_dup( argument );
}

const char *GetCraftingArgument( const CraftingSession *session, size_t argumentNumber )
{
  if( session->_pImpl->NumberOfArguments == 0
      || argumentNumber > session->_pImpl->NumberOfArguments - 1 )
    {
      bug( "%s:%d %s(): Requested argument is %d, but session has %d arguments",
           __FILE__, __LINE__, __FUNCTION__,
	   argumentNumber, session->_pImpl->NumberOfArguments );
      return "";
    }

  return session->_pImpl->Arguments[argumentNumber];
}

static bool CheckSkill( const CraftingSession *session )
{
  Character *ch = session->_pImpl->Engineer;
  int the_chance = is_npc(ch) ? ch->top_level : (int) (ch->pcdata->learned[session->_pImpl->Recipe->Skill]);

  if( number_percent() >= the_chance )
    {
      ch_printf( ch, "&RYou can't figure out what to do.\r\n" );
      learn_from_failure( ch, session->_pImpl->Recipe->Skill );
      return false;
    }

  return true;
}

void StartCrafting( CraftingSession *session )
{
  Character *ch = session->_pImpl->Engineer;
  OBJ_INDEX_DATA *obj = NULL;
  InterpretArgumentsEventArgs interpretArgumentsEventArgs;
  CheckRequirementsEventArgs checkRequirementsEventArgs;

  interpretArgumentsEventArgs.CraftingSession = session;
  interpretArgumentsEventArgs.CommandArguments = session->_pImpl->OriginalArgument;
  interpretArgumentsEventArgs.AbortSession = false;

  checkRequirementsEventArgs.CraftingSession = session;
  checkRequirementsEventArgs.AbortSession = false;

  RaiseEvent( session->OnInterpretArguments, &interpretArgumentsEventArgs );

  if( !interpretArgumentsEventArgs.AbortSession )
    {
      RaiseEvent( session->OnCheckRequirements, &checkRequirementsEventArgs );
    }

  if( interpretArgumentsEventArgs.AbortSession
      || checkRequirementsEventArgs.AbortSession
      || !FindMaterials( session, false )
      || !CheckSkill( session ) )
    {
      AbortEventArgs abortEventArgs;
      abortEventArgs.CraftingSession = session;

      RaiseEvent( session->OnAbort, &abortEventArgs );
      FreeCraftingSession( session );
      return;
    }

  obj = get_obj_index( session->_pImpl->Recipe->Prototype );

  ch_printf( ch, "&GYou begin the long process of creating %s.\r\n",
	     aoran( GetItemTypeName( obj->item_type, obj->value[3] ) ) );

  act( AT_PLAIN, "$n takes $s tools and some material and begins to work.",
       ch, NULL, NULL, TO_ROOM );
  add_timer( ch, TIMER_DO_FUN, session->_pImpl->Recipe->Duration, do_craftingengine, SUB_PAUSE );
}

static bool FindMaterials( CraftingSession *session, bool extract )
{
  return true;
}

static const char *GetItemTypeName( int itemType, int extraInfo )
{
  const char *type = NULL;

  if( itemType == ITEM_WEAPON )
    {
      type = get_weapontype_name( extraInfo );
    }
  else
    {
      type = object_types[itemType];
    }

  return type;
}
