#include "mud.h"
#include "spaceobject.h"

static void showspaceobject( Character *ch , Spaceobject *spaceobject )
{
  Echo( ch, "Space object: %s\r\n", spaceobject->Name);
  Echo( ch, "Filename:     %s\r\n", spaceobject->Filename);
  Echo( ch, "Is simulator: %s\r\n", spaceobject->IsSimulator ? "Yes" : "No");
  Echo( ch, "Type:         %s (%d)\r\n",
	Capitalize(SpaceobjectTypeName[spaceobject->Type]), spaceobject->Type);

  Echo( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
	spaceobject->Position.x, spaceobject->Position.y, spaceobject->Position.z);
  Echo( ch, "Gravity:      %d\r\n", spaceobject->Gravity);
  Echo( ch, "     doca: %5d (%s)\r\n",
	spaceobject->LandingSites.DocA, spaceobject->LandingSites.LocationAName);
  Echo( ch, "     docb: %5d (%s)\r\n",
	spaceobject->LandingSites.DocB, spaceobject->LandingSites.LocationBName);
  Echo( ch, "     docc: %5d (%s)\r\n",
	spaceobject->LandingSites.DocC, spaceobject->LandingSites.LocationCName);
}

void do_showspaceobject( Character *ch, char *argument )
{
  Spaceobject *spaceobject = GetSpaceobjectFromName( argument );

  if ( spaceobject == NULL )
    SendToCharacter("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);
}
