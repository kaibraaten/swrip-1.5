#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"

void do_placevendor (Character *ch, char *argument)
{
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;
  Character *vendor = nullptr;
  ProtoMobile *temp = nullptr;
  Object *obj = nullptr;
  char vnum1[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];

  if ( FindKeeperQ(ch, false) )
    {
      ch->Echo("A vendor is already here!\r\n");;
      return;
    }

  if ( IsNpc(ch) )
    {
      return;
    }

  /* better way to do this? what if they have another object called deed?*/
  if ( ( obj = GetCarriedObject( ch, "deed" ) ) == NULL )
    {
      ch->Echo("You do not have a deed!.\r\n");
      return;
    }

  if (obj->Prototype->Vnum != OBJ_VNUM_DEED)
    {
      ch->Echo("You do not have a deed!.\r\n");
      return;
    }

  if (!IsBitSet(ch->InRoom->Flags, ROOM_PLR_SHOP) )
    {
      ch->Echo("You need to find a free shop.\r\n");
      return;
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->Name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      ch->Echo("You already have a shop!\r\n");
      return;
    }



  if ( (temp = GetProtoMobile (MOB_VNUM_VENDOR) ) == NULL )
    {
      Log->Bug("do_placevendor: no vendor vnum");
      return;
    }

  CharacterToRoom( CreateMobile( temp ), ch->InRoom );
  vendor = GetCharacterInRoom(ch, temp->Name);

  sprintf (buf, vendor->LongDescr, ch->Name);
  vendor->LongDescr =  CopyString( buf );

  sprintf (buf, "%s", ch->Name);

  vendor->Owner = CopyString(buf);
  vendor->Home = ch->InRoom;

  SaveVendor (vendor);

  SeparateOneObjectFromGroup( obj );
  ExtractObject( obj );

  Act( AT_ACTION, "$n appears in a swirl of smoke.\n", vendor, NULL, NULL, TO_ROOM );

  sprintf(vnum1,"%ld", vendor->Prototype->Vnum);
  do_makeshop (vendor, vnum1 ); /*makes the vendor a shop.. there has to be a
                                  better way to do it but hell if i know what it is!*/
}

