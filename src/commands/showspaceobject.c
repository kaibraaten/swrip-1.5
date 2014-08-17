#include "mud.h"

static void showspaceobject( Character *ch , Spaceobject *spaceobject )
{
  ch_printf( ch, "Space object: %s\r\n", spaceobject->name);
  ch_printf( ch, "Filename:     %s\r\n", spaceobject->filename);
  ch_printf( ch, "Trainer:      %s\r\n", spaceobject->trainer ? "Yes" : "No");
  ch_printf( ch, "Type:         %s (%d)\r\n", capitalize(get_spaceobj_type(spaceobject->type)), spaceobject->type);

  ch_printf( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
             spaceobject->pos.x, spaceobject->pos.y, spaceobject->pos.z);
  ch_printf( ch, "Gravity:      %d\r\n", spaceobject->gravity);
  ch_printf( ch, "     doca: %5d (%s)\r\n",
             spaceobject->landing_site.doca, spaceobject->landing_site.locationa);
  ch_printf( ch, "     docb: %5d (%s)\r\n",
             spaceobject->landing_site.docb, spaceobject->landing_site.locationb);
  ch_printf( ch, "     docc: %5d (%s)\r\n",
             spaceobject->landing_site.docc, spaceobject->landing_site.locationc);
}

void do_showspaceobject( Character *ch, char *argument )
{
  Spaceobject *spaceobject = spaceobject_from_name( argument );

  if ( spaceobject == NULL )
    send_to_char("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);
}
