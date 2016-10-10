#include "shops.h"
#include "mud.h"
#include "character.h"

void do_placevendor (Character *ch, char *argument)
{
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;
  Character *vendor;
  ProtoMobile *temp;
  Object *obj;
  char vnum1[MAX_INPUT_LENGTH];
  char buf [MAX_INPUT_LENGTH];

  if (  FindKeeperQ (ch, false) )
    {
      SendToCharacter ("A vendor is already here!\r\n",ch);
      return;
    }

  if ( IsNpc(ch) )
    return;



  /* better way to do this? what if they have another object called deed?*/
  if ( ( obj = GetCarriedObject( ch, "deed" ) ) == NULL )
    {
      SendToCharacter( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (obj->Prototype->vnum != OBJ_VNUM_DEED)
    {
      SendToCharacter( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (!IsBitSet(ch->in_room->Flags, ROOM_PLR_SHOP) )
    {
      SendToCharacter( "You need to find a free shop.\r\n", ch);
      return;
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      SendToCharacter( "You already have a shop!\r\n", ch);
      return;
    }



  if ( (temp = GetProtoMobile (MOB_VNUM_VENDOR) ) == NULL )
    {
      LogPrintf("do_placevendor: no vendor vnum");
      return;
    }

  CharacterToRoom( CreateMobile( temp ), ch->in_room );
  vendor = GetCharacterInRoom(ch, temp->name);

  sprintf (buf, vendor->long_descr, ch->name);
  vendor->long_descr =  CopyString( buf );

  sprintf (buf, "%s", ch->name);

  vendor->owner = CopyString(buf);
  vendor->home = ch->in_room;

  SaveVendor (vendor);

  SeparateOneObjectFromGroup( obj );
  ExtractObject( obj );

  Act( AT_ACTION, "$n appears in a swirl of smoke.\n", vendor, NULL, NULL, TO_ROOM );

  sprintf(vnum1,"%ld", vendor->Prototype->vnum);
  do_makeshop (vendor, vnum1 ); /*makes the vendor a shop.. there has to be a
                                  better way to do it but hell if i know what it is!*/
}
