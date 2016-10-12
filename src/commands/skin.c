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

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Whose corpse do you wish to skin?\r\n", ch );
      return;
    }

  if ( (corpse = GetObjectHere(ch, argument)) == NULL )
    {
      SendToCharacter( "You cannot find that here.\r\n", ch );
      return;
    }

  if ( (obj = GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL )
    {
      SendToCharacter( "You have no weapon with which to perform this deed.\r\n", ch );
      return;
    }

  if ( corpse->item_type != ITEM_CORPSE_PC )
    {
      SendToCharacter( "You can only skin bodies.\r\n", ch);
      return;
    }

  if ( corpse->value[OVAL_CORPSE_SKINNED] == 1 )
    {
      SendToCharacter( "This corpse has already been skinned.\r\n", ch );
      return;
    }


  if ( obj->value[OVAL_CORPSE_3] != 1
       && obj->value[OVAL_CORPSE_3] != 2
       && obj->value[OVAL_CORPSE_3] != 3
       && obj->value[OVAL_CORPSE_3] != 11 )
    {
      SendToCharacter( "There is nothing you can do with this corpse.\r\n", ch );
      return;
    }

  if ( GetProtoObject( OBJ_VNUM_SKIN ) == NULL )
    {
      Bug( "Vnum %d (OBJ_VNUM_SKIN) not found for do_skin!", OBJ_VNUM_SKIN);
      return;
    }

  LearnFromSuccess( ch, gsn_punch );

  Act( AT_BLOOD, "$n strips the skin from $p.", ch, corpse, NULL, TO_ROOM);
  Act( AT_BLOOD, "You strip the skin from $p.", ch, corpse, NULL, TO_CHAR);
  korps = corpse;
  skin = CreateObject( GetProtoObject(OBJ_VNUM_SKIN), 0 );
  name = IsNpc(ch) ? korps->ShortDescr : corpse->ShortDescr;
  sprintf( buf, skin->ShortDescr, name );
  FreeMemory( skin->ShortDescr );
  skin->ShortDescr = CopyString( buf );
  sprintf( buf, skin->description, name );
  FreeMemory( skin->Description );
  skin->Description = CopyString( buf );

  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->Name );
  corpse->Name = CopyString( buf );
  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->Description );
  corpse->Description = CopyString( buf );
  sprintf( buf, "The skinned bones of %s", name );
  FreeMemory( corpse->ShortDescr );
  corpse->ShortDescr = CopyString( buf );
  corpse->value[OVAL_CORPSE_SKINNED] = 1;
  corpse->value[OVAL_CORPSE_DECAY] = -1;
  corpse->timer = -1;

  ObjectToCharacter( skin, ch );
}
