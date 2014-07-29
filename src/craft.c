#include "mud.h"
#include "craft.h"
#include "constants.h"

typedef struct CraftRecipe CraftRecipe;

struct CraftRecipe
{
  int XpAbility;
  int Skill;
};

struct CraftingSession
{
  Character *Engineer;
  CraftRecipe *Recipe;
};

static CraftRecipe *AllocateCraftRecipe( void )
{
  CraftRecipe *recipe = NULL;
  CREATE( recipe, CraftRecipe, 1 );

  recipe->XpAbility = ABILITY_NONE;
  recipe->Skill = 0;

  return recipe;
}

static void FreeCraftRecipe( CraftRecipe *recipe )
{
  DISPOSE( recipe );
}

CraftingSession *AllocateCraftingSession( void )
{
  CraftingSession *session = NULL;

  CREATE( session, CraftingSession, 1 );

  session->Engineer = NULL;
  session->Recipe = AllocateCraftRecipe();

  return session;
}

void FreeCraftingSession( CraftingSession *session )
{
  FreeCraftRecipe( session->Recipe );
  DISPOSE( session );
}

void SetCraftRecipeXpAbility( CraftingSession *session, int ability )
{
  if( ability > ABILITY_NONE && ability < MAX_ABILITY )
    {
      session->Recipe->XpAbility = ability;
    }
  else
    {
      bug( "%s/%s/%d: invalid ability %d", __FILE__, __FUNCTION__, __LINE__, ability );
    }
}

void SetCraftRecipeSkill( CraftingSession *session, int sn )
{
  if( get_skilltype( sn ) )
    {
      session->Recipe->Skill = sn;
    }
  else
    {
      bug( "%s/%s/%d: invalid skill number %d", __FILE__, __FUNCTION__, __LINE__, sn );
    }
}
