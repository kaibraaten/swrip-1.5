/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

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
  long Flags;
};

struct FoundMaterial
{
  CraftingMaterial Material;
  bool Found;
  bool KeepFinding;
};

struct CraftingSession
{
  event_t *OnInterpretArguments;
  event_t *OnCheckRequirements;
  event_t *OnMaterialFound;
  event_t *OnSetObjectStats;
  event_t *OnFinishedCrafting;
  event_t *OnAbort;

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
static struct FoundMaterial *GetUnfoundMaterial( const CraftingSession *session, const OBJ_DATA *obj );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *eventArgs );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );

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
  CraftRecipe *recipe = session->Recipe;
  Character *ch = session->Engineer;
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

static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *eventArgs )
{
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

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if( IS_SET( args->CraftingSession->Recipe->Flags, CRAFTFLAG_NEED_WORKSHOP )
      && !IS_SET( ch->in_room->room_flags, ROOM_FACTORY ) )
    {
      ch_printf( ch, "&RYou need to be in a factory or workshop to do that.\r\n" );
      args->AbortSession = true;
    }
}

static void OnAbort( CraftingSession *session )
{
  Character *ch = session->Engineer;
  AbortCraftingEventArgs abortEventArgs;

  ch->substate = SUB_NONE;
  abortEventArgs.CraftingSession = session;

  ch_printf( ch, "&RYou are interrupted and fail to finish your work.&w\r\n");

  RaiseEvent( session->OnAbort, &abortEventArgs );

  FreeCraftingSession( session );
}

Character *GetEngineer( const CraftingSession *session )
{
  return session->Engineer;
}

CraftRecipe *AllocateCraftRecipe( int sn, const CraftingMaterial *materialList, int duration,
				  vnum_t prototypeObject, long flags )
{
  CraftRecipe *recipe = NULL;
  CREATE( recipe, CraftRecipe, 1 );

  recipe->Skill = sn;
  recipe->Materials = materialList;
  recipe->Duration = duration;
  recipe->Prototype = prototypeObject;
  recipe->Flags = flags;

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
      foundMaterials[i].Found = false;
      foundMaterials[i].KeepFinding = false;
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
  AddFinishedCraftingHandler( session, finishedCraftingUserData, FinishedCraftingHandler );

  session->Engineer = engineer;
  session->Recipe = recipe;
  session->FoundMaterials = AllocateFoundMaterials( recipe->Materials );
  session->OriginalArgument = str_dup( commandArgument );

  engineer->pcdata->CraftingSession = session;

  AddCheckRequirementsCraftingHandler( session, NULL, CheckRequirementsHandler );

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

void AddCraftingArgument( CraftingSession *session, const char *argument )
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
  InterpretArgumentsEventArgs interpretArgumentsEventArgs;
  CheckRequirementsEventArgs checkRequirementsEventArgs;

  interpretArgumentsEventArgs.CraftingSession = session;
  interpretArgumentsEventArgs.CommandArguments = session->OriginalArgument;
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
      AbortCraftingEventArgs abortEventArgs;
      abortEventArgs.CraftingSession = session;

      RaiseEvent( session->OnAbort, &abortEventArgs );
      FreeCraftingSession( session );
      return;
    }

  obj = get_obj_index( session->Recipe->Prototype );

  ch_printf( ch, "&GYou begin the long process of creating %s.\r\n",
	     aoran( GetItemTypeName( obj->item_type, obj->value[3] ) ) );

  act( AT_PLAIN, "$n takes $s tools and some material and begins to work.",
       ch, NULL, NULL, TO_ROOM );
  add_timer( ch, TIMER_DO_FUN, session->Recipe->Duration, do_craftingengine, SUB_PAUSE );
}

static bool FindMaterials( CraftingSession *session, bool extract )
{
  OBJ_DATA *obj = NULL;
  Character *ch = GetEngineer( session );
  bool foundAll = true;
  struct FoundMaterial *material = NULL;

  for( obj = ch->first_carrying; obj; obj = obj->next_content )
    {
      material = GetUnfoundMaterial( session, obj );

      if( !material )
	{
	  continue;
	}

      material->Found = true;

      if( extract )
	{
	  MaterialFoundEventArgs args;
	  args.CraftingSession = session;
	  args.Object = obj;
	  args.KeepFinding = false;


	  if( IS_SET( material->Material.Flags, CRAFTFLAG_EXTRACT ) )
	    {
	      separate_obj( obj );
	      obj_from_char( obj );
	      extract_obj( obj );
	    }

	  RaiseEvent( session->OnMaterialFound, &args );
	  material->KeepFinding = args.KeepFinding;
	}
    }

  material = session->FoundMaterials;

  while( material->Material.ItemType != ITEM_NONE )
    {
      if( !material->Found
	  && !IS_SET( material->Material.Flags, CRAFTFLAG_OPTIONAL ) )
	{
	  OBJ_INDEX_DATA *proto = get_obj_index( session->Recipe->Prototype );

	  foundAll = false;
	  ch_printf( ch, "&RYou need %s to complete the %s.\r\n",
		     aoran( GetItemTypeName( material->Material.ItemType, 0 ) ),
		     GetItemTypeName( proto->item_type, proto->value[3] ) );
	}

      ++material;
    }

  DISPOSE( session->FoundMaterials );
  session->FoundMaterials = AllocateFoundMaterials( session->Recipe->Materials );

  return foundAll;
}

static struct FoundMaterial *GetUnfoundMaterial( const CraftingSession *session, const OBJ_DATA *obj )
{
  struct FoundMaterial *material = session->FoundMaterials;

  while( material->Material.ItemType != ITEM_NONE )
    {
      if( obj->item_type == material->Material.ItemType
	  && ( !material->Found || material->KeepFinding ) )
	{
	  return material;
	}

      ++material;
    }

  return NULL;
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

void AddInterpretArgumentsCraftingHandler( CraftingSession *session, void *userData,
                                           void (*handler)(void*, InterpretArgumentsEventArgs* ))
{
  AddEventHandler( session->OnInterpretArguments, userData, (EventHandlerCallback)handler );
}

void AddCheckRequirementsCraftingHandler( CraftingSession *session, void *userData,
                                          void (*handler)(void*, CheckRequirementsEventArgs* ))
{
  AddEventHandler( session->OnCheckRequirements, userData, (EventHandlerCallback)handler );
}

void AddMaterialFoundCraftingHandler( CraftingSession *session, void *userData,
                                      void (*handler)(void*, MaterialFoundEventArgs* ))
{
  AddEventHandler( session->OnMaterialFound, userData, (EventHandlerCallback)handler );
}

void AddSetObjectStatsCraftingHandler( CraftingSession *session, void *userData,
                                       void (*handler)(void*, SetObjectStatsEventArgs* ))
{
  AddEventHandler( session->OnSetObjectStats, userData, (EventHandlerCallback)handler );
}

void AddFinishedCraftingHandler( CraftingSession *session, void *userData,
                                 void (*handler)(void*, FinishedCraftingEventArgs* ))
{
  AddEventHandler( session->OnFinishedCrafting, userData, (EventHandlerCallback)handler );
}

void AddAbortCraftingHandler( CraftingSession *session, void *userData,
                              void (*handler)(void*, AbortCraftingEventArgs* ))
{
  AddEventHandler( session->OnAbort, userData, (EventHandlerCallback)handler );
}

