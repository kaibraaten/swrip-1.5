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
      send_to_char ("A vendor is already here!\r\n",ch);
      return;
    }

  if ( IsNpc(ch) )
    return;



  /* better way to do this? what if they have another object called deed?*/
  if ( ( obj = GetCarriedObject( ch, "deed" ) ) == NULL )
    {
      send_to_char( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (obj->pIndexData->vnum != OBJ_VNUM_DEED)
    {
      send_to_char( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (!IsBitSet(ch->in_room->room_flags, ROOM_PLR_SHOP) )
    {
      send_to_char( "You need to find a free shop.\r\n", ch);
      return;
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      send_to_char( "You already have a shop!\r\n", ch);
      return;
    }



  if ( (temp = get_mob_index (MOB_VNUM_VENDOR) ) == NULL )
    {
      log_string ("do_placevendor: no vendor vnum");
      return;
    }

  char_to_room( create_mobile( temp ), ch->in_room );
  vendor = get_char_room(ch, temp->player_name);

  sprintf (buf, vendor->long_descr, ch->name);
  vendor->long_descr =  CopyString( buf );

  sprintf (buf, "%s", ch->name);

  vendor->owner = CopyString(buf);
  vendor->home = ch->in_room;

  SaveVendor (vendor);

  separate_obj( obj );
  extract_obj( obj );

  act( AT_ACTION, "$n appears in a swirl of smoke.\n", vendor, NULL, NULL, TO_ROOM );

  sprintf(vnum1,"%ld", vendor->pIndexData->vnum);
  do_makeshop (vendor, vnum1 ); /*makes the vendor a shop.. there has to be a
                                  better way to do it but hell if i know what it is!*/
}
