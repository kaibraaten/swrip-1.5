#include "mud.h"

static void showspaceobject( CHAR_DATA *ch , SPACE_DATA *spaceobject )
{
  ch_printf( ch, "Space object: %s\r\n", spaceobject->name);
  ch_printf( ch, "Filename:     %s\r\n", spaceobject->filename);
  ch_printf( ch, "Trainer:      %s\r\n", spaceobject->trainer ? "Yes" : "No");
  ch_printf( ch, "Type:         %s (%d)\r\n", capitalize(get_spaceobj_type(spaceobject->type)), spaceobject->type);

  ch_printf( ch, "Coordinates:  %.0f %0.f %.0f\r\n",
             spaceobject->pos.x, spaceobject->pos.y, spaceobject->pos.z);
  ch_printf( ch, "Gravity:      %d\r\n", spaceobject->gravity);
  ch_printf( ch, "     doca: %5d (%s)\r\n",
             spaceobject->doca, spaceobject->locationa);
  ch_printf( ch, "     docb: %5d (%s)\r\n",
             spaceobject->docb, spaceobject->locationb);
  ch_printf( ch, "     docc: %5d (%s)\r\n",
             spaceobject->docc, spaceobject->locationc);
}

void do_showspaceobject( CHAR_DATA *ch, char *argument )
{
  SPACE_DATA *spaceobject = spaceobject_from_name( argument );

  if ( spaceobject == NULL )
    send_to_char("&RNo such spaceobject.\r\n",ch);
  else
    showspaceobject(ch , spaceobject);
}
