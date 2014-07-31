#ifndef _SWRIP_CRAFT_H_
#define _SWRIP_CRAFT_H_

#include "types.h"

struct CraftingSession;
typedef struct CraftingSession CraftingSession;

struct CraftRecipe;
typedef struct CraftRecipe CraftRecipe;

struct CraftingMaterial;
typedef struct CraftingMaterial CraftingMaterial;

struct CraftingMaterial
{
  int ItemType;
  int Count;
  bool Consumable;
};

struct CraftRecipe
{
  int XpAbility;
  int Skill;
  CraftingMaterial *Materials;
  int Duration;
  vnum_t Prototype;
};

struct FoundMaterial
{
  CraftMaterial Material;
  OBJ_DATA *Object;
};

struct CraftingSession
{
  Character *Engineer;
  CraftRecipe *Recipe;
  CraftingMaterials *FoundMaterials;
};

CraftRecipe *AllocateCraftRecipe();
CraftingSession *AllocateCraftingSession( const CraftRecipe *recipe );
void FreeCraftingSession( CraftingSession *session );

#endif /* include guard */
