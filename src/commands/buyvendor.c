#include "character.h"
#include "shops.h"
#include "mud.h"

void do_buyvendor (Character *ch, char *argument)
{
  Character *keeper;
  OBJ_DATA *deed;
  char buf[MAX_STRING_LENGTH];
  char buf1[MAX_STRING_LENGTH];
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;

  if (IsNpc(ch))
    return;

  if ( !StrCmp( argument, "yes" ) )
    {
      sprintf( buf, "%s/%s", VENDOR_DIR, Capitalize( ch->name ) );
      remove( buf );
    }

  sprintf( strsave, "%s/%s", VENDOR_DIR, Capitalize( ch->name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      send_to_char( "You already have a shop!\r\n", ch);
      send_to_char( "If you want to buy one anyway, type buyvendor yes.\r\n", ch);
      send_to_char( "Your old one will be deleted.\r\n", ch);
      return;
    }


  if (  (keeper = FindKeeperQ( ch, false ) )  == NULL  )
    {
      send_to_char ("There is no one to buy that from!\r\n", ch);
      return;
    }

  if ( ch->gold < COST_BUY_VENDOR )
    {
      sprintf(buf1, "%s says, You are too poor!\r\n", keeper->name);
      send_to_char (buf1, ch);
      return;
    }

  if ( (ch->top_level) < LEVEL_BUY_VENDOR )
    {
      sprintf (buf1, "you must be at least %d level.\r\n", LEVEL_BUY_VENDOR);
      send_to_char (buf1, ch);
      return;
    }

  if ( (get_obj_index (OBJ_VNUM_DEED) ) == NULL )
    {
      bug ("BUYVENDOR: Deed is missing!");
      return;
    }

  deed = create_object ( get_obj_index(OBJ_VNUM_DEED), 0);
  obj_to_char (deed, ch);
  send_to_char("&bVery well, you may have a contract for a vendor.\r\n", ch);
  ch->gold = ch->gold - COST_BUY_VENDOR;
}
