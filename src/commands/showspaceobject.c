#include "mud.h"

static void showspaceobject( Character *ch , Spaceobject *spaceobject )
{
  ChPrintf( ch, "Space object: %s\r\n", spaceobject->name);
  ChPrintf( ch, "Filename:     %s\r\n", spaceobject->filename);
  ChPrintf( ch, "Trainer:      %s\r\n", spaceobject->trainer ? "Yes" : "No");
  ChPrintf( ch, "Type:         %s (%d)\r\n", Capitalize(GetSpaceobjectTypeName(spaceobject->type)), spaceobject->type);

  ChPrintf( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
             spaceobject->pos.x, spaceobject->pos.y, spaceobject->pos.z);
  ChPrintf( ch, "Gravity:      %d\r\n", spaceobject->gravity);
  ChPrintf( ch, "     doca: %5d (%s)\r\n",
             spaceobject->landing_site.doca, spaceobject->landing_site.locationa);
  ChPrintf( ch, "     docb: %5d (%s)\r\n",
             spaceobject->landing_site.docb, spaceobject->landing_site.locationb);
  ChPrintf( ch, "     docc: %5d (%s)\r\n",
             spaceobject->landing_site.docc, spaceobject->landing_site.locationc);
}

void do_showspaceobject( Character *ch, char *argument )
{
  Spaceobject *spaceobject = GetSpaceobjectFromName( argument );

  if ( spaceobject == NULL )
    SendToCharacter("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);
}
