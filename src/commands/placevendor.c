#include "shops.h"
#include "mud.h"
#include "character.h"

void do_placevendor (Character *ch, char *argument)
{
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;
  Character *vendor;
  MOB_INDEX_DATA *temp;
  OBJ_DATA *obj;
  char vnum1[MAX_INPUT_LENGTH];
  char buf [MAX_INPUT_LENGTH];

  if (  find_keeper_q (ch, FALSE) )
    {
      send_to_char ("A vendor is already here!\r\n",ch);
      return;
    }

  if ( IsNpc(ch) )
    return;



  /* better way to do this? what if they have another object called deed?*/
  if ( ( obj = get_obj_carry( ch, "deed" ) ) == NULL )
    {
      send_to_char( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (obj->pIndexData->vnum != OBJ_VNUM_DEED)
    {
      send_to_char( "You do not have a deed!.\r\n", ch );
      return;
    }

  if (!IS_SET(ch->in_room->room_flags, ROOM_PLR_SHOP) )
    {
      send_to_char( "You need to find a free shop.\r\n", ch);
      return;
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, capitalize( ch->name ) );

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
  vendor->long_descr =  STRALLOC( buf );

  sprintf (buf, "%s", ch->name);

  vendor->owner = STRALLOC(buf);
  vendor->home = ch->in_room;

  save_vendor (vendor);

  separate_obj( obj );
  extract_obj( obj );

  act( AT_ACTION, "$n appears in a swirl of smoke.\n", vendor, NULL, NULL, TO_ROOM );

  sprintf(vnum1,"%d", vendor->pIndexData->vnum);
  do_makeshop (vendor, vnum1 ); /*makes the vendor a shop.. there has to be a
                                  better way to do it but hell if i know what it is!*/
}
