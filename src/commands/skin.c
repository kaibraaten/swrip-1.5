#include "character.h"
#include "mud.h"
#include "skill.h"

void do_skin( Character *ch, char *argument)
{
  Object *korps;
  Object *corpse;
  Object *obj;
  Object *skin;
  char *name;
  char buf[MAX_STRING_LENGTH];

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Whose corpse do you wish to skin?\r\n", ch );
      return;
    }
  if ( (corpse=GetObjectHere(ch, argument)) == NULL )
    {
      SendToCharacter( "You cannot find that here.\r\n", ch );
      return;
    }
  if ( (obj=GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL )
    {
      SendToCharacter( "You have no weapon with which to perform this deed.\r\n", ch );
      return;
    }
  if ( corpse->item_type != ITEM_CORPSE_PC )
    {
      SendToCharacter( "You can only skin bodies.\r\n", ch);
      return;
    }

  if ( corpse->value[1] == 1 )
    {
      SendToCharacter( "This corpse has already been skinned.\r\n", ch );
      return;
    }


  if ( obj->value[3] != 1
       &&   obj->value[3] != 2
       &&   obj->value[3] != 3
       &&   obj->value[3] != 11 )
    {
      SendToCharacter( "There is nothing you can do with this corpse.\r\n", ch );
      return;
    }
  if ( GetProtoObject( OBJ_VNUM_SKIN ) == NULL )
    {
      Bug( "Vnum 23 (OBJ_VNUM_SKIN) not found for do_skin!", 0);
      return;
    }

  LearnFromSuccess( ch, gsn_punch );

  Act( AT_BLOOD, "$n strips the skin from $p.", ch, corpse, NULL, TO_ROOM);
  Act( AT_BLOOD, "You strip the skin from $p.", ch, corpse, NULL, TO_CHAR);
  korps = corpse;
  skin                = CreateObject( GetProtoObject(OBJ_VNUM_SKIN), 0 );
  name                = IsNpc(ch) ? korps->short_descr : corpse->short_descr;
  sprintf( buf, skin->short_descr, name );
  FreeMemory( skin->short_descr );
  skin->short_descr = CopyString( buf );
  sprintf( buf, skin->description, name );
  FreeMemory( skin->description );
  skin->description = CopyString( buf );

  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->name );
  corpse->name = CopyString( buf );
  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->description );
  corpse->description = CopyString( buf );
  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->short_descr );
  corpse->short_descr = CopyString( buf );
  corpse->value[1] = 1;
  corpse->value[2] = -1;
  corpse->timer = -1;

  ObjectToCharacter( skin, ch );
}
