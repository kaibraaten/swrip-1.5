#include "mud.hpp"
#include "spaceobject.hpp"
#include "character.hpp"

static void showspaceobject( Character *ch , const Spaceobject *spaceobject )
{
  size_t siteNum = 0;
  ch->Echo("Space object: %s\r\n", spaceobject->Name);
  ch->Echo("Is simulator: %s\r\n", spaceobject->IsSimulator ? "Yes" : "No");
  ch->Echo("Type:         %s (%d)\r\n",
	Capitalize(SpaceobjectTypeName[spaceobject->Type]), spaceobject->Type);

  ch->Echo("Coordinates:  %.0f %0.f %.0f\r\n",
	spaceobject->Position.x, spaceobject->Position.y, spaceobject->Position.z);
  ch->Echo("Gravity:      %d\r\n", spaceobject->Gravity);
  ch->Echo("Landing sites:\r\n" );

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobject->LandingSites[siteNum];
      ch->Echo("    %cDock %d: %5d (%s)\r\n",
	    site->IsSecret ? '-' : ' ', siteNum, site->Dock, site->LocationName );
    }
}

void do_showspaceobject( Character *ch, char *argument )
{
  const Spaceobject *spaceobject = GetSpaceobject( argument );

  if ( spaceobject == NULL )
    ch->Echo("&RNo such spaceobject.\r\n");
  else
    showspaceobject(ch , spaceobject);
}

