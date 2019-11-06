#include "mud.hpp"
#include "spaceobject.hpp"
#include "character.hpp"

static void showspaceobject( Character *ch, std::shared_ptr<Spaceobject> spaceobject )
{
  ch->Echo("Space object: %s\r\n", spaceobject->Name.c_str());
  ch->Echo("Is simulator: %s\r\n", spaceobject->IsSimulator ? "Yes" : "No");
  ch->Echo("Type:         %s (%d)\r\n",
           Capitalize(SpaceobjectTypeName[spaceobject->Type]).c_str(),
           spaceobject->Type);

  ch->Echo("Coordinates:  %.0f %0.f %.0f\r\n",
           spaceobject->Position->x, spaceobject->Position->y, spaceobject->Position->z);
  ch->Echo("Gravity:      %d\r\n", spaceobject->Gravity);
  ch->Echo("Landing sites:\r\n" );

  for( size_t siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobject->LandingSites[siteNum];
      ch->Echo("    %cDock %lu: %5ld (%s)\r\n",
               site->IsSecret ? '-' : ' ', siteNum, site->Dock, site->LocationName.c_str() );
    }
}

void do_showspaceobject( Character *ch, std::string argument )
{
  std::shared_ptr<Spaceobject> spaceobject = GetSpaceobject( argument );

  if ( spaceobject == NULL )
    ch->Echo("&RNo such spaceobject.\r\n");
  else
    showspaceobject(ch , spaceobject);
}

