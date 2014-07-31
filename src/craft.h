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

CraftRecipe *AllocateCraftRecipe( int sn, CraftingMaterial*, int duration, vnum_t protoObject);
void FreeCraftRecipe( CraftRecipe *recipe );
CraftingSession *AllocateCraftingSession( CraftRecipe *recipe, Character *engineer );
void FreeCraftingSession( CraftingSession *session );

#endif /* include guard */
