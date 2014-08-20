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

#include <event.h>
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
  char *CommandArgument;
};

struct FinishedCraftingUserData
{
  CraftRecipe *Recipe;
};

static void AfterDelay( CraftingSession *session );
static void AbortSession( CraftingSession *session );
static bool CheckMaterials( CraftingSession *session, bool extract );
static size_t CountCraftingMaterials( const CraftingMaterial *material );
static struct FoundMaterial *AllocateFoundMaterials( const CraftingMaterial *recipeMaterials );
static bool CheckSkillLevel( const CraftingSession *session );
static const char *GetItemTypeNameExtended( int itemType, int extraInfo );
static struct FoundMaterial *GetUnfoundMaterial( const CraftingSession *session, const Object *obj );
static void FinishedCraftingHandler( void *userData, FinishedCraftingEventArgs *eventArgs );
static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args );

void do_craftingengine( Character *ch, char *argument )
{
  CraftingSession *session = NULL;

  if( IsNpc( ch ) )
    {
      Bug( "%s:%d %s(): IsNpc(\"%s\") == true",
           __FILE__, __LINE__, __FUNCTION__, ch->name );
      return;
    }

  session = ch->pcdata->CraftingSession;

  if( !session )
    {
      Bug( "%s:%d %s(): %s->pcdata->CraftingSession == NULL",
	   __FILE__, __LINE__, __FUNCTION__, ch->name );
      return;
    }

  switch( ch->substate )
    {
    default:
      Bug( "%s:%d %s(): %s invalid substate %d",
	   __FILE__, __LINE__, __FUNCTION__, ch->name, ch->substate );
      break;

    case SUB_PAUSE:
      AfterDelay( session );
      break;

    case SUB_TIMER_DO_ABORT:
      AbortSession( session );
      break;
    }
}

static void AfterDelay( CraftingSession *session )
{
  CraftRecipe *recipe = session->Recipe;
  Character *ch = session->Engineer;
  int the_chance = ch->pcdata->learned[recipe->Skill];
  bool hasMaterials = CheckMaterials( session, true );
  int level = ch->pcdata->learned[recipe->Skill];
  Object *object = NULL;
  ProtoObject *proto = GetProtoObject( recipe->Prototype );
  const char *itemType = GetItemTypeNameExtended( proto->item_type, proto->value[OVAL_WEAPON_TYPE] );
  SetObjectStatsEventArgs eventArgs;
  FinishedCraftingEventArgs finishedCraftingEventArgs;

  ch->substate = SUB_NONE;

  if ( GetRandomPercent() > the_chance * 2  || !hasMaterials )
    {
      ChPrintf( ch, "&RYou hold up your newly created %s.\r\n", itemType );
      ChPrintf( ch, "&RIt suddenly dawns upon you that you have created the most useless\r\n" );
      ChPrintf( ch, "&R%s you've ever seen. You quickly hide your mistake...&w\r\n", itemType);
      LearnFromFailure( ch, recipe->Skill );
      FreeCraftingSession( session );
      return;
    }

  object = CreateObject( proto, level );

  eventArgs.CraftingSession = session;
  eventArgs.Object = object;
  RaiseEvent( session->OnSetObjectStats, &eventArgs );

  object = ObjectToCharacter( object, ch );

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
  const char *itemType = GetItemTypeNameExtended( eventArgs->Object->item_type, eventArgs->Object->value[OVAL_WEAPON_TYPE] );
  char actBuf[MAX_STRING_LENGTH];
  long xpgain = 0;
  Skill *skill = GetSkill( data->Recipe->Skill );

  ChPrintf( ch, "&GYou finish your work and hold up your newly created %s.&w\r\n", itemType);
  sprintf( actBuf, "$n finishes making $s new %s.", itemType );
  Act( AT_PLAIN, actBuf, ch, NULL, NULL, TO_ROOM );

  xpgain = umin( eventArgs->Object->cost * 100,
                 GetRequiredXpForLevel(GetAbilityLevel(ch, skill->guild ) + 1)
                 - GetRequiredXpForLevel(GetAbilityLevel(ch, skill->guild ) ) );
  GainXP(ch, skill->guild, xpgain );
  ChPrintf( ch , "You gain %d %s experience.", xpgain, ability_name[skill->guild] );

  LearnFromSuccess( ch, data->Recipe->Skill );

  FreeMemory( data );
}

static void CheckRequirementsHandler( void *userData, CheckRequirementsEventArgs *args )
{
  Character *ch = GetEngineer( args->CraftingSession );

  if( IsBitSet( args->CraftingSession->Recipe->Flags, CRAFTFLAG_NEED_WORKSHOP )
      && !IsBitSet( ch->in_room->room_flags, ROOM_FACTORY ) )
    {
      ChPrintf( ch, "&RYou need to be in a factory or workshop to do that.\r\n" );
      args->AbortSession = true;
    }

  if( IsBitSet( args->CraftingSession->Recipe->Flags, CRAFTFLAG_NEED_REFINERY )
      && !IsBitSet( ch->in_room->room_flags, ROOM_REFINERY ) )
    {
      ChPrintf( ch, "&RYou need to be in a refinery to do that.\r\n" );
      args->AbortSession = true;
    }
}

static void AbortSession( CraftingSession *session )
{
  Character *ch = session->Engineer;
  AbortCraftingEventArgs abortEventArgs;

  ch->substate = SUB_NONE;
  abortEventArgs.CraftingSession = session;

  ChPrintf( ch, "&RYou are interrupted and fail to finish your work.&w\r\n");

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
  AllocateMemory( recipe, CraftRecipe, 1 );

  recipe->Skill      = sn;
  recipe->Materials  = materialList;
  recipe->Duration   = duration;
  recipe->Prototype  = prototypeObject;
  recipe->Flags      = flags;

  if( !GetSkill( recipe->Skill ) )
    {
      Bug( "%s:%d %s(): Bad Skill %d", __FILE__, __LINE__, __FUNCTION__, recipe->Skill );
    }

  if( !GetProtoObject( recipe->Prototype ) )
    {
      Bug( "%s:%d %s(): Bad ProtoObject %d", __FILE__, __LINE__, __FUNCTION__, recipe->Prototype );
    }

  return recipe;
}

void FreeCraftRecipe( CraftRecipe *recipe )
{
  FreeMemory( recipe );
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

  AllocateMemory( foundMaterials, struct FoundMaterial, numberOfElements );

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

  AllocateMemory( session, CraftingSession, 1 );
  session->OnInterpretArguments = CreateEvent();
  session->OnCheckRequirements = CreateEvent();
  session->OnMaterialFound = CreateEvent();
  session->OnSetObjectStats = CreateEvent();
  session->OnFinishedCrafting = CreateEvent();
  session->OnAbort = CreateEvent();

  AllocateMemory( finishedCraftingUserData, struct FinishedCraftingUserData, 1 );
  finishedCraftingUserData->Recipe = recipe;
  AddFinishedCraftingHandler( session, finishedCraftingUserData, FinishedCraftingHandler );

  session->Engineer = engineer;
  session->Recipe = recipe;
  session->FoundMaterials = AllocateFoundMaterials( recipe->Materials );
  session->CommandArgument = CopyString( commandArgument );

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

  FreeCraftRecipe( session->Recipe );
  FreeMemory( session->FoundMaterials );
  FreeMemory( session->CommandArgument );

  if( session->Engineer )
    {
      session->Engineer->pcdata->CraftingSession = NULL;
    }

  FreeMemory( session );
}

static bool CheckSkillLevel( const CraftingSession *session )
{
  Character *ch = session->Engineer;
  int the_chance = IsNpc(ch) ? ch->top_level : (int) (ch->pcdata->learned[session->Recipe->Skill]);

  if( GetRandomPercent() >= the_chance )
    {
      ChPrintf( ch, "&RYou can't figure out what to do.\r\n" );
      LearnFromFailure( ch, session->Recipe->Skill );
      return false;
    }

  return true;
}

void StartCrafting( CraftingSession *session )
{
  Character *ch = session->Engineer;
  ProtoObject *obj = NULL;
  InterpretArgumentsEventArgs interpretArgumentsEventArgs;
  CheckRequirementsEventArgs checkRequirementsEventArgs;

  interpretArgumentsEventArgs.CraftingSession = session;
  interpretArgumentsEventArgs.CommandArguments = session->CommandArgument;
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
      || !CheckMaterials( session, false )
      || !CheckSkillLevel( session ) )
    {
      AbortCraftingEventArgs abortEventArgs;
      abortEventArgs.CraftingSession = session;

      RaiseEvent( session->OnAbort, &abortEventArgs );
      FreeCraftingSession( session );
      return;
    }

  obj = GetProtoObject( session->Recipe->Prototype );

  ChPrintf( ch, "&GYou begin the long process of creating %s.\r\n",
	     AOrAn( GetItemTypeNameExtended( obj->item_type, obj->value[OVAL_WEAPON_TYPE] ) ) );

  Act( AT_PLAIN, "$n takes $s tools and some material and begins to work.",
       ch, NULL, NULL, TO_ROOM );
  AddTimerToCharacter( ch, TIMER_DO_FUN, session->Recipe->Duration, do_craftingengine, SUB_PAUSE );
}

static bool CheckMaterials( CraftingSession *session, bool extract )
{
  Object *obj = NULL;
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

	  if( IsBitSet( material->Material.Flags, CRAFTFLAG_EXTRACT ) )
	    {
	      SeparateOneObjectFromGroup( obj );
	      ObjectFromCharacter( obj );
	      ExtractObject( obj );
	    }

	  RaiseEvent( session->OnMaterialFound, &args );
	  material->KeepFinding = args.KeepFinding;
	}
    }

  material = session->FoundMaterials;

  while( material->Material.ItemType != ITEM_NONE )
    {
      if( !material->Found
	  && !IsBitSet( material->Material.Flags, CRAFTFLAG_OPTIONAL ) )
	{
	  ProtoObject *proto = GetProtoObject( session->Recipe->Prototype );

	  foundAll = false;
	  ChPrintf( ch, "&RYou need %s to complete the %s.\r\n",
		     AOrAn( GetItemTypeNameExtended( material->Material.ItemType, 0 ) ),
		     GetItemTypeNameExtended( proto->item_type, proto->value[OVAL_WEAPON_TYPE] ) );
	}

      ++material;
    }

  FreeMemory( session->FoundMaterials );
  session->FoundMaterials = AllocateFoundMaterials( session->Recipe->Materials );

  return foundAll;
}

static struct FoundMaterial *GetUnfoundMaterial( const CraftingSession *session, const Object *obj )
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

static const char *GetItemTypeNameExtended( int itemType, int extraInfo )
{
  const char *type = NULL;

  if( itemType == ITEM_WEAPON )
    {
      type = GetWeaponTypeName( extraInfo );
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

