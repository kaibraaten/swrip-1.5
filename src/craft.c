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

CraftingSession *AllocateCraftingSession( CraftRecipe *recipe, Character *engineer )
{
  CraftingSession *session = NULL;
  
  CREATE( session, CraftingSession, 1 );

  session->Engineer = engineer;
  session->Recipe = recipe;
  session->FoundMaterials = AllocateFoundMaterials( recipe->Materials );

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  FreeCraftRecipe( session->Recipe );
  DISPOSE( session->FoundMaterials );
  DISPOSE( session );
}
