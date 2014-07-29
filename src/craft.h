#ifndef _SWRIP_CRAFT_H_
#define _SWRIP_CRAFT_H_

#include "types.h"

CraftingSession *AllocateCraftingSession( void );
void FreeCraftingSession( CraftingSession *session );
void SetCraftRecipeXpAbility( CraftingSession *session, int ability );
void SetCraftRecipeSkill( CraftingSession *session, int sn );
void SetCraftRecipeEngineer( CraftingSession *session, Character *engineer );

#endif /* include guard */
