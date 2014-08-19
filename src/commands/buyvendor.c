#include "character.h"
#include "shops.h"
#include "mud.h"

void do_buyvendor (Character *ch, char *argument)
{
  Character *keeper;
  Object *deed;
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
      SendToCharacter( "You already have a shop!\r\n", ch);
      SendToCharacter( "If you want to buy one anyway, type buyvendor yes.\r\n", ch);
      SendToCharacter( "Your old one will be deleted.\r\n", ch);
      return;
    }


  if (  (keeper = FindKeeperQ( ch, false ) )  == NULL  )
    {
      SendToCharacter ("There is no one to buy that from!\r\n", ch);
      return;
    }

  if ( ch->gold < COST_BUY_VENDOR )
    {
      sprintf(buf1, "%s says, You are too poor!\r\n", keeper->name);
      SendToCharacter (buf1, ch);
      return;
    }

  if ( (ch->top_level) < LEVEL_BUY_VENDOR )
    {
      sprintf (buf1, "you must be at least %d level.\r\n", LEVEL_BUY_VENDOR);
      SendToCharacter (buf1, ch);
      return;
    }

  if ( (get_obj_index (OBJ_VNUM_DEED) ) == NULL )
    {
      bug ("BUYVENDOR: Deed is missing!");
      return;
    }

  deed = CreateObject ( get_obj_index(OBJ_VNUM_DEED), 0);
  obj_to_char (deed, ch);
  SendToCharacter("&bVery well, you may have a contract for a vendor.\r\n", ch);
  ch->gold = ch->gold - COST_BUY_VENDOR;
}
