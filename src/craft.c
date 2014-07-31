#include "mud.h"
#include "craft.h"
#include "constants.h"

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
};


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

CraftingSession *AllocateCraftingSession( CraftRecipe *recipe, Character *engineer )
{
  CraftingSession *session = NULL;
  size_t numberOfElements = 0;
  size_t i = 0;
  CraftingMaterial *currentMaterial = NULL;
  
  CREATE( session, CraftingSession, 1 );

  session->Engineer = engineer;
  session->Recipe = recipe;

  currentMaterial = recipe->Materials;

  while( currentMaterial->ItemType != ITEM_NONE )
    {
      ++numberOfElements;
      ++currentMaterial;
    }

  ++numberOfElements; /* include ITEM_NONE */

  CREATE( session->FoundMaterials, struct FoundMaterial, numberOfElements );

  for( i = 0; i < numberOfElements; ++i )
    {
      session->FoundMaterials[i].Material = recipe->Materials[i];
      session->FoundMaterials[i].Material.Count = 0;
      session->FoundMaterials[i].Object = NULL;
    }

  /* Debug stuff */
  {
    /*
    ch_printf(engineer, "------------------\r\nrecipe->Materials: %d\r\n------------------\r\n", numberOfElements);

    for( i = 0; i < numberOfElements; ++i )
      {
	ch_printf( engineer, "%d x %s (%sextract)\r\n",
		   recipe->Materials[i].Count,
		   object_types[recipe->Materials[i].ItemType],
		   recipe->Materials[i].Extract ? "" : "don't " );
      }

    ch_printf(engineer, "\r\n------------------\r\nsession->FoundMaterials: %d\r\n------------------\r\n", numberOfElements);

    for( i = 0; i < numberOfElements; ++i )
      {
	ch_printf( engineer, "%d x %s (%sextract)\r\n",
		   session->FoundMaterials[i].Material.Count,
		   object_types[session->FoundMaterials[i].Material.ItemType],
		   session->FoundMaterials[i].Material.Extract ? "" : "don't " );
		   }*/
  }

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  FreeCraftRecipe( session->Recipe );
  DISPOSE( session->FoundMaterials );
  DISPOSE( session );
}
