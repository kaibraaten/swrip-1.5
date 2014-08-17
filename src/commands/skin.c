#include "character.h"
#include "mud.h"

void do_skin( Character *ch, char *argument)
{
  OBJ_DATA *korps;
  OBJ_DATA *corpse;
  OBJ_DATA *obj;
  OBJ_DATA *skin;
  char *name;
  char buf[MAX_STRING_LENGTH];

  if ( argument[0] == '\0' )
    {
      send_to_char( "Whose corpse do you wish to skin?\r\n", ch );
      return;
    }
  if ( (corpse=get_obj_here(ch, argument)) == NULL )
    {
      send_to_char( "You cannot find that here.\r\n", ch );
      return;
    }
  if ( (obj=GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL )
    {
      send_to_char( "You have no weapon with which to perform this deed.\r\n", ch );
      return;
    }
  if ( corpse->item_type != ITEM_CORPSE_PC )
    {
      send_to_char( "You can only skin bodies.\r\n", ch);
      return;
    }

  if ( corpse->value[1] == 1 )
    {
      send_to_char( "This corpse has already been skinned.\r\n", ch );
      return;
    }


  if ( obj->value[3] != 1
       &&   obj->value[3] != 2
       &&   obj->value[3] != 3
       &&   obj->value[3] != 11 )
    {
      send_to_char( "There is nothing you can do with this corpse.\r\n", ch );
      return;
    }
  if ( get_obj_index( OBJ_VNUM_SKIN ) == NULL )
    {
      bug( "Vnum 23 (OBJ_VNUM_SKIN) not found for do_skin!", 0);
      return;
    }

  learn_from_success( ch, gsn_punch );

  act( AT_BLOOD, "$n strips the skin from $p.", ch, corpse, NULL, TO_ROOM);
  act( AT_BLOOD, "You strip the skin from $p.", ch, corpse, NULL, TO_CHAR);
  korps = corpse;
  skin                = create_object( get_obj_index(OBJ_VNUM_SKIN), 0 );
  name                = IsNpc(ch) ? korps->short_descr : corpse->short_descr;
  sprintf( buf, skin->short_descr, name );
  DISPOSE( skin->short_descr );
  skin->short_descr = str_dup( buf );
  sprintf( buf, skin->description, name );
  DISPOSE( skin->description );
  skin->description = str_dup( buf );

  sprintf( buf, "The skinned bones of %s", name );
  DISPOSE( corpse->name );
  corpse->name = str_dup( buf );
  sprintf( buf, "The skinned bones of %s", name );
  DISPOSE( corpse->description );
  corpse->description = str_dup( buf );
  sprintf( buf, "The skinned bones of %s", name );
  DISPOSE( corpse->short_descr );
  corpse->short_descr = str_dup( buf );
  corpse->value[1] = 1;
  corpse->value[2] = -1;
  corpse->timer = -1;

  obj_to_char( skin, ch );
}
