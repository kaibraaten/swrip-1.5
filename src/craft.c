#include "mud.h"
#include "craft.h"
#include "constants.h"

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
      bug( "%s/%s/%d: Bad SKILLTYPE %d", __FILE__, __FUNCTION__, __LINE__, recipe->Skill );
    }

  if( !get_obj_index( recipe->Prototype ) )
    {
      bug( "%s/%s/%d: Bad ProtoObject %d", __FILE__, __FUNCTION__, __LINE__, recipe->Prototype );
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

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  FreeCraftRecipe( session->Recipe );
  DISPOSE( session->FoundMaterials );
  DISPOSE( session );
}
