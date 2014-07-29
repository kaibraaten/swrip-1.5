#include "mud.h"
#include "craft.h"
#include "constants.h"

struct Craft
{
  int XpAbility;
  int Skill;
  Character *Engineer;
};

Craft *AllocateCraft( void )
{
  Craft *craft = NULL;

  CREATE( craft, Craft, 1 );

  craft->XpAbility = ABILITY_NONE;
  craft->Skill = 0;
  craft->Engineer = NULL;

  return craft;
}

void FreeCraft( Craft *craft )
{
  DISPOSE( craft );
}

void SetCraftXpAbility( Craft *craft, int ability )
{
  if( ability > ABILITY_NONE && ability < MAX_ABILITY )
    {
      craft->XpAbility = ability;
    }
  else
    {
      bug( "%s/%s/%d: invalid ability %d", __FILE__, __FUNCTION__, __LINE__, ability );
    }
}

void SetCraftSkill( Craft *craft, int sn )
{
  if( get_skilltype( sn ) )
    {
      craft->Skill = sn;
    }
  else
    {
      bug( "%s/%s/%d: invalid skill number %d", __FILE__, __FUNCTION__, __LINE__, sn );
    }
}
