#include "mud.h"
#include "spaceobject.h"

static void showspaceobject( Character *ch , const Spaceobject *spaceobject )
{
  size_t siteNum = 0;
  Echo( ch, "Space object: %s\r\n", spaceobject->Name);
  Echo( ch, "Filename:     %s\r\n", spaceobject->Filename);
  Echo( ch, "Is simulator: %s\r\n", spaceobject->IsSimulator ? "Yes" : "No");
  Echo( ch, "Type:         %s (%d)\r\n",
	Capitalize(SpaceobjectTypeName[spaceobject->Type]), spaceobject->Type);

  Echo( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
	spaceobject->Position.x, spaceobject->Position.y, spaceobject->Position.z);
  Echo( ch, "Gravity:      %d\r\n", spaceobject->Gravity);
  Echo( ch, "Landing sites:\r\n" );

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobject->LandingSites[siteNum];
      Echo( ch, "    %cDock %d: %5d (%s)\r\n",
	    site->IsSecret ? '-' : ' ', siteNum, site->Dock, site->LocationName );
    }
}

void do_showspaceobject( Character *ch, char *argument )
{
  const Spaceobject *spaceobject = GetSpaceobjectFromName( argument );

  if ( spaceobject == NULL )
    SendToCharacter("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);
}
